%2012 12 1 by lichao
%�����������ݣ��Ա�΢͸������۲�

clc
clear all
close all

N=101;
d=30;

data_grad=zeros(N);

for i=1:N
    data_grad(i,:)=mod(i,d);
end

figure
imshow(data_grad,[])

save data_grad data_grad