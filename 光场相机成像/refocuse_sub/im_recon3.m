function im_out=im_recon3(D,d,v,N_line,lens_d)
%2012 11 26 by lichao
%2012 12 13 �޸�
%����˶�΢͸�����Ӧ��������У��
%2012 12 20 �޸�
%�ɻҶ�ͼ��RGBͼ��
%��RGB�͹ⳡԭʼͼ��R��G��B��ͨ���ֱ��������ع�
%�����ڽ����ѧ
%im_out=im_recon3(D,d,v,N_line,lens_d)
%D          ��Ӧ��͸��ֱ��
%d          �������룬����load
%v          ΢͸��λ��
%Nline      ��͸���Ϲ��߲�����
%lens_d     ��Ӧ΢͸��ֱ��


if nargin<5
   error('im_recon:NotEnoughInputs', 'Not enough input arguments.');
end  

fprintf('\n���ڶ�RGB�͹ⳡԭʼͼ�������ͷ��ع���\n');


%% ������Ϣ
micr_N=fix(D/lens_d);%΢͸������
im_out=zeros(micr_N,micr_N,3);
im=[];

%%  ΢͸�����
for k=1:3
    load (sprintf('./dataRGB/im_d_%d_v_%d_Nline_%d_%d.mat',d,v,N_line,k),'im');
    for i=1:micr_N
        for j=1:micr_N
            im_out(i,j,k)=sum(sum(im(i,j,:,:)));
        end
    end
end



