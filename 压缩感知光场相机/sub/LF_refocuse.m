function im1=LF_refocuse(obj,v_re,Cam,Sen)
%2013 7 29 by lichao
%���ܣ�ѹ����֪�ⳡ�ؾ۽�
%�÷���im1=LF_refocuse(obj,v_re,Cam��Sen)
%obj:               ����
%Cam.d:             ����������͸���ľ���
%Cam.D:             ��͸��ֱ��
%Cam.v:             ����λ�ã���������λ��
%Cam.N_line:        ��͸��������
%Sen.d:             ������ֱ��
%Sen.N:             ����������
%Sen.L              ÿ���������ع��Ĺ�����
%v_re               �ؾ۽�λ��

im1=zeros(Sen.N);
%%  ������Ϣ
Kx=size(obj,1);                                                            %��ά�ⳡ�ĵ�һά  ��Ӧ����������
Ky=size(obj,2);                                                            %��ά�ⳡ�ĵڶ�ά  ��Ӧ����������
sen_N_1=1/Sen.d;                                                           %��λ���봫��������

%% ����ؾ۽�����
mask_d=Cam.D/Sen.L;
n=linspace(-(Cam.D-mask_d)/2,(Cam.D-mask_d)/2,Sen.L);
%n=linspace(-fix(Cam.D/2),fix(Cam.D/2),Sen.L);
for ix=1:Kx
    for jy=1:Ky
        if sum(sum(obj(ix,jy,:,:)))~=0
            para_x=-Cam.D/2+(ix-0.5)*Sen.d ;                                   %�˴�������Ӧ��x����
            para_y=-Cam.D/2+(jy-0.5)*Sen.d ;                                   %�˴�������Ӧ��y����
            
            para_rx=(-n+para_x)/Cam.v*v_re+n;%������ؾ۽���Ӧ��x����
            prx=para_rx*sen_N_1+fix(Sen.N/2)+1;%������ؾ۽���Ӧ�Ĵ�����x����

            para_ry=(-n+para_y)/Cam.v*v_re+n;%������ؾ۽���Ӧ��y����
            pry=para_ry*sen_N_1+fix(Sen.N/2)+1;%������ؾ۽���Ӧ�Ĵ�����y����      
            
            for i=1:Sen.L
                for j=1:Sen.L
                    if ((n(i)^2+n(j)^2)<=(Cam.D/2)^2)&&(prx(i)<=Sen.N)&&(pry(j)<=Sen.N)&&(obj(ix,jy,i,j)>0)
                        rx=round(prx(i));
                        ry=round(pry(j));
                        midpara=im1(rx,ry);
                        im1(rx,ry)=midpara+obj(ix,jy,i,j);
                    end
                end
            end
            
        end
    end
end

