function out=micr_sen_center(D,micr_N,F,v)
%D=4;��͸��ֱ��
%micr_N=200;΢͸������
%lens_d=D/micr_N;΢͸��ֱ��
%sen_N=20;ÿ��΢͸��������ظ���
%sen_d=lens_d/sen_N;΢͸��ֱ��
%F=16; ����
%v=16; ΢͸��λ��

lens_d=D/micr_N;%΢͸��ֱ��

lens_v=F/D*lens_d;%΢͸���봫��������

sen_v=lens_v+v;%������λ��
out=zeros(micr_N,1);%���ڱ���ÿ��΢͸�������޺�����

%% ȷ��ÿ��΢͸������������
y=linspace(0,D/2,micr_N+1);
yy=reshape(y(1:micr_N),2,micr_N/2);
yy1=yy(2,:);

yy2=-fliplr(yy1);

y_axis=cat(2,yy2,yy1);

%% ȷ����͸������΢͸�����Ķ�Ӧ�Ĵ�����λ��
for i=1:micr_N    
    y3=get_Y([0,v],[0,y_axis(i)],sen_v);%ȷ������͸���ϱ�Ե��ĳ��΢͸�����ĵ�ֱ���ڴ������ϵ�������
    out(i,1)=y3;           %������������ 
end

out=out+D/2;%������������0��

