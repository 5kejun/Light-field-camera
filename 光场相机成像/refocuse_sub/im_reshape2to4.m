%2012 11 26 by lichao
%2012 11 29 �޸�
%2012 11 30 �޸�
%2D����4D
%͸��+΢͸��
%�����ڽ����ѧ

%���ӳ����ܣ���΢͸���ɵ������ع���4D�ⳡ
%2012 12 13 �޸� �����΢͸���󴫸�����У��

function im_out=im_reshape2to4(im,micr_N,sen_N_total,sen_N,sen_coor)

if nargin<5
   error('im_recon:NotEnoughInputs', 'Not enough input arguments.');
end  

disp('���ڽ�2άת4ά��');


%% ������Ϣ
%sen_Nÿ��΢͸���󴫸�������
%micr_N΢͸������
%sen_N_total�������ܸ���

Nx=size(im,1);
Ny=size(im,2);
im_out=zeros(micr_N,micr_N,sen_N,sen_N);

%% У������������
if Nx==sen_N_total
     im0=im;
elseif Nx==sen_N_total+1;
    im0=im(1:Nx-1,1:Ny-1);
else
    disp('��������΢͸��������ƥ��!');
    return;
end

%%  ת��Ϊ4_D
for i=2:micr_N-1
    for j=2:micr_N-1
        im_out(i-1,j-1,:,:)=im0(sen_coor(i,1):sen_coor(i,2),sen_coor(j,1):sen_coor(j,2));
    end
end


