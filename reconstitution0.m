function Data = reconstitution0(data,N,m,tau)
%RECONSTITUTION0 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
M =N-(m-1)*tau;
Data = zeros(m,M);
for i=1:m
    Data(i,:)=data([((i-1)*tau+1):1:((i-1)*tau+M)]);
end
end

