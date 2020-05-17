% �������ʱ������ Lyapunov ָ�� - Logistic ����

clc
clear
close all

%-----------------------------------------------------------------
% ���� Logistic ����ʱ������

lambda = 4;

k1 = 10000;             % ǰ��ĵ�������
k2 = 10000;             % ����ĵ�������
x0 = rand(1);

x = zeros(k1+k2,1);
for i = 1:k1+k2
    x0 = lambda*x0*(1-x0);
    x(i) = x0;
end
x = x(k1+1:end);

%-----------------------------------------------------------------
% Logistic ��ڲ���

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



