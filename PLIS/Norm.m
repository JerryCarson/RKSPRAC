clear
close all
clc

fs = 10^8;
n = 14;
tend = 0.02;
ts = 1/fs;
t = 0: ts: tend - ts;
phi = 0: (2*pi)/(2^n): 2*pi - 1/(2^n);

% ���������� ���� �����
v = menu('choose freq','5MHz','10MHz', '15MHz', '20MHz');
F = [5e6 10e6 15e6 20e6];
switch (v)
    case 1
        m = round(5*(2^n)/100);
    case 2
        m = round(10*(2^n)/100);
    case 3
        m = round(15*(2^n)/100);
    case 4
        m = round(20*(2^n)/100);
end

% ������� ��� ���������� ������� ���������:
cos_table = cos(phi);
a = cos(phi);
disp(a);
xlim([0, 2*pi])
plot(a)

s = 1;
for i = 1: length(t)
    y1(i) = a(s);
    s = m + s;
    
    % �������� �� ������������:
    if s > length(a)
        s = s - length(a);
    end
end
plot(t,y1)
title('��������� �� �������� ������� t = 0: ts: tend - ts');
xlabel('�����, �');
ylabel('���������');
xlim([0, 10^2*ts])

% ���������� �������
f = 0: fs/length(t): fs - fs/length(t);
S = abs(fft(y1).^2);
figure(2)
plot(f, S)
title('������ �� ��������� ������ f = 0: fs/length(t): fs - fs/length(t)');
xlabel('�������, ��');
ylabel('���������');

xlim([0, fs/2])