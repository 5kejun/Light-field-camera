function sen_coor=sen_adjust(D,micr_N,F,v,sen_N)
%D=4;��͸��ֱ��
%micr_N=200;΢͸������
%lens_d=D/micr_N;΢͸��ֱ��
%sen_N=20;ÿ��΢͸��������ظ���
%sen_d=lens_d/sen_N;΢͸��ֱ��
%F=16; ����
%v=16; ΢͸��λ��

lens_d=D/micr_N;%΢͸��ֱ��
sen_N_total=micr_N*sen_N;%�ܵĴ���������
sen_d=lens_d/sen_N;%������ֱ��

lens_v=F/D*lens_d;%΢͸���봫��������

sen_v=lens_v+v;%������λ��
y_edge=zeros(micr_N,2);%���ڱ���ÿ��΢͸�������޺�����

%% ȷ��ÿ��΢͸������������
y=linspace(0,D/2,micr_N+1);
yy=reshape(y(1:micr_N),2,micr_N/2);
yy1=yy(2,:);

yy2=-fliplr(yy1);

y_axis=cat(2,yy2,yy1);

%% ȷ��΢͸����Ӧ�Ĵ�������Ե
for i=1:micr_N    
    y3=get_Y([0,v],[2,y_axis(i)],sen_v);%ȷ������͸���ϱ�Ե��ĳ��΢͸�����ĵ�ֱ���ڴ������ϵ�������
    y_edge(i,1)=y3;           %������������ 
    y3=get_Y([0,v],[-2,y_axis(i)],sen_v);%ȷ������͸���±�Ե��ĳ��΢͸�����ĵ�ֱ���ڴ������ϵ�������
    y_edge(i,2)=y3;          %������������
end

%%  ����ÿ��΢͸�������Ӧ�Ĵ��������
y0=linspace(-D/2,D/2,micr_N+1);%΢͸����Ե

y_anis=zeros(micr_N,2);

for i=1:micr_N
    y_anis(i,1)=y0(i);
    y_anis(i,2)=y0(i+1);
end


y_error=y_anis-y_edge;%΢͸����Ե��ʵ�ʶ�Ӧ�Ĵ�������Ե���

y_sensor_error=y_error/sen_d;%ÿ��΢͸����Ӧ��������������

y_sen_error=round(y_sensor_error);%������ȡ��

sen_adjust=y_sen_error(:,1);%ÿ��΢͸������һ������


%%  ����ÿ��΢͸����Ӧ�Ĵ�������Χ
sen_co=linspace(0,sen_N_total,micr_N+1);
sen_coor=zeros(micr_N,2);
for i=1:micr_N
    sen_coor(i,1)=sen_co(i)+1+sen_adjust(micr_N-i+1);
    sen_coor(i,2)=sen_co(i+1)+sen_adjust(micr_N-i+1);
end