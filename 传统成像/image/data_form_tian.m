%2012 12 9 by lichao
%�����ߴ�����Ҹ�������ͼ��Χ�����ͼ
%���������
clc
clear all
close all

N=401;

a=zeros(N);

a(1:10,:)=1;
a(392:401,:)=1;


a(196:205,:)=1;

a=a+a';

figure
imshow(a,[]);

data_tian=a;

save data_tian data_tian