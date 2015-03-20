function im=LF_sim(obj,d_m,d,Cam,Sen,CS)
%2013 12 24 by lichao
%���ܣ�ģ��ѹ����֪�������
%�÷���im=LF_sim(obj,D,F,v,N_line,sen_d,sen_N)
%obj:           ����
%d:             ����������͸���ľ���
%D:             ��͸��ֱ��
%F:             ��͸������
%v:             ����λ�ã���������λ��
%N_line:        ��͸��������
%sen_d:         ������ֱ��
%sen_N:         ����������
%sen_L:         ÿ���������ع���sen_L^2��ֱ��
%nx:            ����x����
%ny:            ����y����
%CS:          �������

im=zeros(Sen.N,Sen.N,CS.M);
%%  ������Ϣ
Kx=size(obj,1);
Ky=size(obj,2);
                                                                    
nx=linspace(-d_m*Cam.D/2,d_m*Cam.D/2,Kx);
ny=linspace(-d_m*Cam.D/2,d_m*Cam.D/2,Ky);
%% ����������
M_len=[1 0;-1/Cam.F 1];                                                         %��͸������
T=[1 Cam.v;0 1];                                                                %��͸����΢͸��֮�䴫��

sen_N_1=1/Sen.d;                                                            %��λ���봫��������

para_x=zeros(Cam.N_line,1);
para_rx=zeros(Cam.N_line,1);                                                    %�����ڴ�����������
para_th=zeros(Cam.N_line,1);                                                    %������΢͸���ļн�

para_y=zeros(Cam.N_line,1);
para_ry=zeros(Cam.N_line,1);
para_be=zeros(Cam.N_line,1);

n=linspace(-fix(Cam.D/2),fix(Cam.D/2),Cam.N_line);%͸����ɢ��
mask_n=fix((n+2)./(Cam.D/Sen.L))+1;
mask_n(Cam.N_line)=Sen.L;

for ix=1:Kx
    for jy=1:Ky
        if obj(ix,jy)~=0
            dx=nx(ix);                                                      %ѡ������������崦��x����
            dy=ny(jy);                                                      %ѡ������������崦��y����
            In=obj(ix,jy)/(Cam.N_line^2);                                       %ÿ�����ߵĹ�ǿ  �˴��н���
            for i=1:Cam.N_line
                x=n(i);                                                     %͸������ɢ����
                theta=atan((x-dx)/d);                                       %�������͸���ĽǶ�
                pq1_x=T*M_len*[x;theta];                                    %͸����ת�����ƶ�����v
                x1=pq1_x(1);
                para_th(i)=pq1_x(2);
                para_x(i)=sen_N_1*x1+fix(Sen.N/2)+1 ;                       %�������x2  1--4001
                para_rx(i)=round(para_x(i));                                %����������Ϊ����
            end
            for j=1:Cam.N_line
                y=n(j);
                beta=atan((y-dy)/d);
                pq1_y=T*M_len*[y;beta];                                     %͸����ת�����ƶ�����v
                y1=pq1_y(1);
                para_be(j)=pq1_y(2);
                para_y(j)=sen_N_1*y1+fix(Sen.N/2)+1 ;                       %�������y2
                para_ry(j)=round(para_y(j));                                %����������Ϊ����
            end
            for i=1:Cam.N_line
                for j=1:Cam.N_line
                    if ((n(i)^2+n(j)^2)<=(Cam.D/2)^2)&&(para_rx(i)<=Sen.N)&&(para_ry(j)<=Sen.N)&&(para_rx(i)>0)&&(para_ry(j)>0)
                        %((n(i)^2+n(j)^2)<=(D/2)^2)                                     ��͸��Բ��
                        %(para_rx(i)<=sen_N_total)&&(para_ry(j)<=sen_N_total)&&(para_rx(i)>0)&&(para_ry(j)>0) �ڴ�������Χ��
                        rx=para_rx(i);
                        ry=para_ry(j);
                        midpara=im(rx,ry,:);
                        a_cs=reshape(CS.A(:,(mask_n(i)-1)*Sen.L+mask_n(j)),1,1,CS.M);
                        In1=midpara+In*a_cs*sqrt(cos(para_th(i))^2+cos(para_be(j))^2);
                        %In*a_cs((i-1)*N_line+j) �Թ���ǿ�Ƚ��б���
                        im(rx,ry,:)=In1;
                    end
                end
            end
            
        end
        
    end
end