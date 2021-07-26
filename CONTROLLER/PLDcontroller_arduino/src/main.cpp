#include <Arduino.h>

int s;
double pi = 3.1415;

//#include <EEPROM.h>

class toPLD
{
private:
  int CMD; //Содержит введенную команду
  int r;   //Разрядность шины
  int fp;  //Отвечает за номер первого пина на плате. Последующие пины - старшие разряды
  int rRD; //Hазрядность принимаемых данных
  int startRD = fp + (r + 1);
  int count;        //Количество отсчетов сигнала
  void toBIN(int x) //Метод, преобразующий введенную команду в код на управляющей шине
  {
    for (int i = r - 1; i >= 0; --i)
    {
      int f = ((int)((x >> i) & 1)); //преобразование куска числа в двоичный код, начиная со старшего разряда
      //Serial.println(f, DEC); //Строчка для дебага
      switch (f)
      {
      case 1:
        digitalWrite(i + fp, HIGH);
        //Serial.println('1');
        break;
      case 0:
        digitalWrite(i + fp, LOW);
        //Serial.println('0');
        break;
      }
      //Serial.println('_');
    }
    digitalWrite(r + fp, HIGH); //Стробирующий импульс READY, означает окончание формирования сигнала на шине
    delay(1000);
    digitalWrite(r + fp, LOW);
  }
  void setPins() //Инициализирует выходные пины в зависимости от разрядности шины
  {
    for (int i = fp; i <= r + fp; i++)
    {
      pinMode(i, OUTPUT);
    }
    for (int i = r + fp + 1; i <= r + fp + rRD; i++)
    {
      pinMode(i, INPUT);
    }
  }

  void fromPLD() //Принимает код с шины ПЛИС, преобразует в десятичное число, выводит в порт
  {
    String s = "";
    for (int i = fp + (r + 1); i <= fp + r + rRD; i++)
    {
      int c = digitalRead(i);
      s += (char)('0' + c);
    }
    int result = 0;
    for (int i = s.length() - 1, pos = 0; i >= 0; i--, ++pos)
      result += s[i] == '0' ? 0 : 1 << pos;
    Serial.println(result);
  }

public:
  void getSignal() //Получаем числа с шины данных и выводим в порт
  {
    for (int i = 0; i < count; i++)
    {
      digitalWrite(fp + r + rRD + 1, HIGH);
      fromPLD();
      digitalWrite(fp + r + rRD + 1, LOW);
    }
    Serial.println("END"); //Для завершения цикла записи в файл в Python
  }

  toPLD(int x, int y, int z, int j) //Конструктор класса
  {
    r = x;     //Разрядность шины управления
    fp = y;    //Первый пин. Порядок: пины управления -> пин RDY -> шина приема данных -> пин RDY для шины данных
    rRD = z;   //Разрядность шины данных
    count = j; //Количество отсчетов сигнала с плис
  }
  void updPins() //Задает управляющий сигнал на шине. Вызывать как метод экземпляра класса после setCMD
  {
    setPins();
    if (CMD != -1)
      toBIN(CMD);
  }

  int getCMD() //Просто так
  {
    return CMD;
  }

  void setCMD(int v) //Безопасный ввод управляющего кода в класс, вызывать после serial read
  {
    if ((v >= 0) && (v <= pow(2, r) - 1)) //Команд может оказаться меньше чем позволяет разрядность шины, стоит сделать исключение на ПЛИС
      CMD = v;
    else
    {
      Serial.println("Ардуинка не понимает такого обращения"); //Исключение, ничего не выполняется
      CMD = -1;                                                //Несуществующая команда чтобы не пройти проверку IF в updPins()
    }
  }
};

// int fromPLD(int r, int f)
// {
//   String s = "";
//   for (int i = f + r; i <= f + r + 8; i++)
//   {
//     int c = digitalRead(i);
//     s += (char)('0' + c);
//   }
//   int result = 0;
//   for (int i = s.length(), pos = 0; i >= 0; i--, ++pos)
//     result += s[i] == '0' ? 0 : 1 << pos;
//   return result;
// }

void setup()
{
  Serial.begin(9600);
}

void loop()
{
  toPLD arduino(2, 2, 6, 16384); //Разрядность упр. шины, первый пин, разрядность шины данных, количество отсчетов сигнала
  while (true)                 //Это кривое говно нужно чтобы не переопределять экземпляр каждую итерацию
  {
    if (Serial.available())
    {
      String ss = Serial.readStringUntil('\n');
      if (ss != "")
      {
        int s = atoi(ss.c_str());
        arduino.setCMD(s);
        arduino.updPins(); //Обновляем управляющий сигнал
        delay(500);

        pinMode(4, INPUT);
        pinMode(13, INPUT);

        while (digitalRead(4) != 1)
        {
          
        }

        arduino.getSignal(); //Получаем отсчеты сигнала с ПЛИС
        // for (int i = 0; i <= 360; i++)
        // {
        //   double a = 10 * cos(i * pi / 180);
        //   Serial.println(a / 10, DEC);
        // }
        // Serial.println("END");
      }
    }
  }
}