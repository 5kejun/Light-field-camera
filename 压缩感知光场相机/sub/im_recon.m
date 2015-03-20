%2012 11 26 by lichao
%2D
%͸��+΢͸��
%�����ڽ����ѧ
%���ӳ����ܣ���΢͸���ɵ������ع�ԭʼͼ��
%2012 12 13 �޸�
%����˶�΢͸�����Ӧ��������У��

function im_out=im_recon(im_out1,D,lens_d,sen_d,sen_coor)
%D��Ӧ��͸��ֱ��
%lens_d ��Ӧ΢͸��ֱ��
%sen_d ��Ӧ������ֱ��
%sen_coor ÿ��΢͸����Ӧ�Ĵ���������
if nargin<5
   error('im_recon:NotEnoughInputs', 'Not enough input arguments.');
end  

disp('���ڽ�����ͷ�ͼ���ع���');


%% ������Ϣ
micr_N=fix(D/lens_d);%΢͸������
sen_N_total=fix(D/sen_d);%�������ܸ���

Nx=size(im_out1,1);
Ny=size(im_out1,2);
im_out=zeros(micr_N);

%% У������������
if Nx==sen_N_total
     im0=im_out1;
elseif Nx==sen_N_total+1;
    im0=im_out1(1:Nx-1,1:Ny-1);
else
    disp('��������΢͸��������ƥ��!');
    return;
end

%%  ΢͸�����
for i=2:micr_N-1
    for j=2:micr_N-1
        im_out(i-1,j-1)=sum(sum(im0(sen_coor(i,1):sen_coor(i,2),sen_coor(j,1):sen_coor(j,2))));
    end
end


