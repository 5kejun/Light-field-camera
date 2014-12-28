function im_re=refocuse_im(D,alpha,d,v,Nline,micr_N,sen_N)
%2012 12 20 by lichao
%��RGBͼ��ֱ�R��G��B��ͨ�������ؾ۽�
%�÷���im_rec=refocuse_im(D,micr_N,sen_N,sen_N_total,sen_coor)
%D              ��͸��ֱ��
%alpha          v_re/v�����ؾ۽�ϵ��
%d              �������룬����load
%v              ΢͸��λ��
%Nline          ��͸�����߲�����
%micr_N         ΢͸������
%sen_N          ÿ��΢͸���󴫸�������
%sen_N_total    �������ܸ���
%sen_coor       У�����ÿ��΢͸����Ӧ�Ĵ���������

disp('���ڽ��������ؾ۽���');

im=zeros(micr_N,micr_N,sen_N,sen_N);
im_re=zeros(micr_N,micr_N,3);
KK_num=3;

uv=linspace(0,D,sen_N);%��͸����ɢ����΢͸�������ض�Ӧ����͸��λ��

k=1:1:micr_N;
xy=(k-0.5)*D/micr_N;%͸����������

ijuv_xy=fliplr(uv);%����͸����ɢ�����������ã��Ա���΢͸�������ض�Ӧ
xy_re=zeros(sen_N,micr_N);%��¼�������x����y������
%rxy_re=zeros(sen_N,micr_N);%��¼������Ĺ��߶�Ӧ��΢͸������x����y��


%%%��͸����һ�����Ӧmicr_N��΢͸����������м��α任������λ��
%%%һ�����Ӧһ�У�һ���е�ĳ�����Ӧһ��΢͸��
for ijuv=1:sen_N
    xy_re(ijuv,:)=xy*alpha-(alpha-1)*ijuv_xy(ijuv);
end
rxy_re=ceil(xy_re*micr_N/D);


for kk=1:KK_num %R��G��B
    load (sprintf('./dataRGB/im_d_%d_v_%d_Nline_%d_%d.mat',d,v,Nline,kk),'im');%�ֱ�load R��G����
    fprintf_RGB(kk,2);
    
    for iu=1:sen_N %��͸����ɢ
        for jv=1:sen_N  %��͸����ɢ
            for i=1:micr_N  %��͸���ϵ�ÿ���㶼��Ӧ���е�΢͸��
                for j=1:micr_N
                    rxy_rea=rxy_re(iu,i);%һ���������ؾ۽����x����
                    rxy_reb=rxy_re(jv,j);%һ���������ؾ۽����y����
                    if(rxy_rea>0)&&(rxy_rea<=micr_N)&&(rxy_reb>0)&&(rxy_reb<=micr_N)
                        im_re(rxy_rea,rxy_reb,kk)=im_re(rxy_rea,rxy_reb,kk)+im(i,j,iu,jv);
                    end
                end
            end
        end
    end
end

