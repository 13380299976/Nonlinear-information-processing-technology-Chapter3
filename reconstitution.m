function X=reconstitution(data,N,m,tau)
%�ع���ռ�
% X=reconstitution(data,N,m,tau)
% dataΪ����ʱ�����У�NΪʱ�����г��ȣ�mΪǶ��ռ�ά����tauΪʱ���ӳ٣�
% XΪ���,��m*nά����
M=N-(m-1)*tau;%��ռ��е�ĸ���
if M<0
    error('M<0!')
end
for j=1:M %��ռ��ع�
    for i=1:m
        X(i,j)=data((i-1)*tau+j);
    end
end