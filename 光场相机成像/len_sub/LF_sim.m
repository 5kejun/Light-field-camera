function im=LF_sim(obj,d,d_m,D,N_line,F,v,lens_d,lens_f,sen_N)
%2012 12 19 by lichao
%ģ�ⳡ��obj�ھ���d���Ĺⳡ����
%�÷���im=LF_sim(obj,d,d_m,D,N_line,F,v,lens_d,lens_f,sen_N)
%obj            ����
%d              ��������
%d_m            ��������͸���Ķ��ٱ�
%D              ��͸��ֱ��
%N_line         ��͸���Ϲ�ѧ������
%F              ��͸������
%v              ΢͸��λ��
%lens_d         ΢͸��ֱ��
%lens_f         ΢͸������
%sen_N_total    �ܵĴ���������
%sen_N          ÿ��΢͸���󴫸�������

disp('���ڶԳ������йⳡ����ģ�⣺');
sen_d=lens_d/sen_N;%������ֱ��

n=linspace(-fix(D/2),fix(D/2),N_line);%͸����ɢ��

M_len=[1 0;-1/F 1];%��͸������
T=[1 v;0 1];%��͸����΢͸��֮�䴫��
M_lens=[1 0;-1/lens_f,1];%΢͸���������
T_lens=[1,lens_f;0,1];%΢͸�����������Ĵ���
micr_N=fix(D/lens_d);%΢͸������
im=zeros(micr_N,micr_N,sen_N,sen_N);%��ά�ⳡ����

micr_sen=micr_sen_center(D,micr_N,F,v);%���΢͸����ͼ������

para_x=zeros(N_line,1);
para_rx=zeros(N_line,1);%�����ڴ�����������
para_th=zeros(N_line,1);%������΢͸���ļн�
para_Nx=zeros(N_line,1);%��ѧλ�ڵڼ���΢͸��

para_y=zeros(N_line,1);
para_ry=zeros(N_line,1);
para_be=zeros(N_line,1);
para_Ny=zeros(N_line,1);

%%%%%%%%%%%%%%%%-------������Ϣ--------------------%%%%%%%%%%%%%%%%%%%%%
Kx=size(obj,1);
Ky=size(obj,2);

nx=linspace(-d_m*D/2,d_m*D/2,Kx);
ny=linspace(-d_m*D/2,d_m*D/2,Ky);

%%%%%%%%%%%%%%%-------ģ��ⳡ����-obj-------------------%%%%%%%%%%%%%%%%%%%%%%
tic
k_num=0.1;
for ix=1:Kx
    for jy=1:Ky
        if obj(ix,jy)~=0
            dx=nx(ix);%ѡ������������崦��x����
            dy=ny(jy);%ѡ������������崦��y����
            In=obj(ix,jy)/(N_line^2);%ÿ�����ߵĹ�ǿ  �˴��н���
            for i=1:N_line
                x=n(i); %͸������ɢ����
                theta=atan((x-dx)/d);%�������͸���ĽǶ�
                
                pq1_x=T*M_len*[x;theta];%͸����ת�����ƶ�����v
                x1=pq1_x(1);
                %theta1=pq1_x(2);
                
                if x1>0                     %��Զ��0�ķ���ȡ��
                    lens_Nx=ceil(x1/lens_d);%�ڼ���΢͸��  0������
                    para_Nx(i)=lens_Nx+fix(micr_N/2);
                elseif x1<0
                    lens_Nx=floor(x1/lens_d);%�ڼ���΢͸�� 0������
                    para_Nx(i)=lens_Nx+micr_N/2+1;
                elseif x1==0
                    lens_Nx=0;
                    para_Nx(i)=0;
                end
                
                if lens_Nx>0
                    s=lens_d*lens_Nx-0.5*lens_d;
                elseif lens_Nx<0
                    s=lens_d*lens_Nx+0.5*lens_d;
                elseif lens_Nx==0;
                    s=0;
                end
                pq2_x=T_lens*(M_lens*pq1_x+[0;s/lens_f]);%΢͸����ת�����ü��ƶ�����f
                x2=pq2_x(1);
                para_th(i)=pq2_x(2); %theta2;
                if (para_Nx(i)<=micr_N)&&(para_Nx(i)>0)
                    para_x(i)=x2+D/2-micr_sen(para_Nx(i));      %��x���ĵ�����΢͸����ͼ�������
                    para_rx(i)=ceil((para_x(i)+sen_N/2*sen_d)/sen_d);%������΢͸����ͼ���ж�Ӧ������
                else
                    para_x(i)=0;
                    para_rx(i)=0;
                end
            end
            
            for j=1:N_line
                y=n(j);
                beta=atan((y-dy)/d);
                
                pq1_y=T*M_len*[y;beta];%͸����ת�����ƶ�����v
                y1=pq1_y(1);
                
                if y1>0              %��Զ��0�ķ���ȡ��
                    lens_Ny=ceil(y1/lens_d);%�ڼ���΢͸��
                    para_Ny(j)=lens_Ny+fix(micr_N/2);
                elseif y1<0
                    lens_Ny=floor(y1/lens_d);%�ڼ���΢͸��
                    para_Ny(j)=lens_Ny+micr_N/2+1;
                elseif y1==0
                    lens_Ny=0;
                    para_Ny(j)=0;
                end
                if lens_Ny>0
                    s=lens_d*lens_Ny-0.5*lens_d;
                elseif lens_Ny<0
                    s=lens_d*lens_Ny+0.5*lens_d;
                elseif lens_Ny==0;
                    s=0;
                end
                pq2_y=T_lens*(M_lens*pq1_y+[0;s/lens_f]);%΢͸����ת�����ü��ƶ�����f
                y2=pq2_y(1);
                para_be(j)=pq2_y(2); %,beta2;
                if (para_Ny(j)>0)&&(para_Ny(j)<=micr_N)
                    para_y(j)=y2+D/2-micr_sen(para_Ny(j)) ;      %�������y2
                    para_ry(j)=ceil((para_y(j)+sen_N/2*sen_d)/sen_d);
                else
                    para_y(j)=0;
                    para_ry(j)=0;
                end
            end
            
            %((n(i)^2+n(j)^2)<=(D/2)^2) ��͸��Բ��
            %(para_rx(i)<=sen_N_total)&&(para_ry(j)<=sen_N_total)&&(para_rx(i)>0)&&(para_ry(j)>0) �ڴ�������Χ��
            
            for i=1:N_line
                for j=1:N_line
                    rx=para_rx(i);
                    ry=para_ry(j);
                    len_x=para_Nx(i);
                    len_y=para_Ny(j);
                    if ((n(i)^2+n(j)^2)<=(D/2)^2)&&(rx<=sen_N)&&(ry<=sen_N)&&(rx>0)&&(ry>0)&&(len_x~=0)&&(len_y~=0)
                        midpara=im(len_x,len_y,rx,ry);
                        In1=midpara+In*sqrt(cos(para_th(i))^2+cos(para_be(j))^2);
                        im(len_x,len_y,rx,ry)=In1;
                    end
                end
            end
            
        end
    end
    if ix==fix(k_num*Kx)
        disp(['�����',num2str(k_num*100),'%']);
        k_num=k_num+0.1;
    end
end
