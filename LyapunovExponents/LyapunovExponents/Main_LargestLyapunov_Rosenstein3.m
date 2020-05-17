% �������ʱ������ Lyapunov ָ�� - Lorenz ������

clc
clear
close all

%-----------------------------------------------------------------
% ���� Lorenz ����ʱ������

sigma = 16;             % Lorenz ���̲��� a
b = 4;                  %                 b
r = 45.92;              %                 c            

y = [-1,0,1];           % ��ʼ�� (1 x 3 ��������)
h = 0.01;               % ����ʱ�䲽��

k1 = 30000;             % ǰ��ĵ�������
k2 = 6000;              % ����ĵ�������

z = LorenzData(y,h,k1+k2,sigma,r,b);
x = z(k1+1:end,1);      % ʱ������

%-----------------------------------------------------------------
% Lorenz ��ڲ���

tau = 10;               % ʱ��
m = 3;                  % Ƕ��ά
taumax = 300;           % �����ɢ����ʱ��
P = 100;                 % ����ƽ������
fs = 1/h;               % ����Ƶ��

%-----------------------------------------------------------------

Y1 = Lyapunov_rosenstein_2(x,tau,m,taumax,P,fs);

figure
subplot(211); plot(Y1); grid; xlabel('i'); ylabel('y(i)'); title('Logistic')
subplot(212); plot(diff(Y1)); grid; xlabel('n'); ylabel('slope');

linear_zone = [50:200]';  % ��������
F1 = polyfit(linear_zone,Y1(linear_zone),1);

Lyapunov_2 = F1(1)                  % �� 2 Ϊ�׵�ָ��
Lyapunov_e = Lyapunov_2/1.4427      % �� e Ϊ�׵�ָ��

