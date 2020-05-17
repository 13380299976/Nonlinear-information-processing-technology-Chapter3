% �������ʱ������ Lyapunov ָ�� - Henon ����
% ���� Henon ӳ�� x(n+1) = 1 - a * x(n)^2 + y(n); y(n+1) = b * x(n)

clc
clear
close all

%-----------------------------------------------------------------
% ���� Henon ����ʱ������

a = 1.4;
b = 0.3;

x0 = 0;
y0 = 0;

k1 = 10000;                % ǰ���������
k2 = 6000;                % �����������
x = zeros(k1+k2,1);
for i = 1:k1+k2
    x1 = 1 - a * x0^2 + y0;
    y1 = b * x0;
    x0 = x1;
    y0 = y1;
    x(i) = x1;
end
x = x(k1+1:end);

%-----------------------------------------------------------------
% Henon ��ڲ���

tau = 1;                % ʱ��
m = 2;                  % Ƕ��ά
taumax = 30;            % �����ɢ����ʱ��
P = 100;                % ����ƽ������
fs = 1;                 % ����Ƶ��

%-----------------------------------------------------------------

Y1 = Lyapunov_rosenstein_2(x,tau,m,taumax,P,fs);

figure
subplot(211); plot(Y1); grid; xlabel('i'); ylabel('y(i)'); title('Logistic')
subplot(212); plot(diff(Y1)); grid; xlabel('n'); ylabel('slope');

linear_zone = [1:7]';  % ��������
F1 = polyfit(linear_zone,Y1(linear_zone),1);

Lyapunov_2 = F1(1)                  % �� 2 Ϊ�׵�ָ��
Lyapunov_e = Lyapunov_2/1.4427      % �� e Ϊ�׵�ָ��

