%clear
close all
clc

fs = 10^4; % Частота плисины (частота дискретизации)
n = 8; % Порядок (2^n ячеек для 1 периода косинуса)
tend = 0.02; % Конечное время работы
ts = 1 / fs; % Шаг дискретизации времени
t = 0:ts:tend - ts; % Задали интервал по времени
phi = 0:(2 * pi) / (2^n):2 * pi - 1 / (2^n); % Задали интервал по фазе

% Диалоговое окно ввода
prompt = {'Enter the frequency code number:'};
dlgtitle = 'Input';
dims = 1;
definput = {''};
answer = inputdlg(prompt, dlgtitle, dims, definput);

k = str2double(answer{1});
disp(k);

% Функция для заполнения вектора косинусов:
cos_table = cos(phi);
a = cos(phi);
disp(a); % Выводит вектор косинуса
plot(phi, a); % Его график

f = 0:fs / length(t):fs - fs / length(t); % Задали интервал по частоте

s = 1;

for i = 1:length(t)
    %m = k(1);
    %k = 13;             % Тут мы с шагом n обращаемся к ячейкам вектора
    %y1 = a(1: n: end);
    y1(i) = a(s);
    s = k + s;

    % Проверка на переполнение:
    if s > length(a)
        s = s - length(a);
    end

end

S = abs(fft(y1).^2); % Спектр сигнала на выходе
plot(t, y1) % График выходного сигнала
figure(2) % Чтобы графики одновременно выводились
plot(f, S) % График спектра
xlim([0, fs / 2]) % Ограничили спектр от и до

%      k = input('k =:');
%      if (k == 1)
%         n = 13;
%         for t = 0: ts: tend - ts
%             y1 = a(1: n: end);
% %             disp(y1);
%
%         end
%     plot(t, y1);
%     elseif (k == 2)
%         n = 10*256/100;
%         y2 = a(1: n: end);
%         disp(n);
%         disp(y2);
%         plot(y2)
%     elseif (k == 3)
%         n = 15*256/100;
%         y3 = a(1: n: end);
%         disp(n);
%         disp(y3);
%         plot(y3)
%     elseif (k == 4)
%         n = 20*256/100;
%         y4 = a(1: n: end);
%         disp(n);
%         disp(y4);
%         plot(y4)
%
%     end
