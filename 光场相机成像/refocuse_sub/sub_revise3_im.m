function im_full=sub_revise3_im(im)
%2012 12 20 by lichao
%��RGBͼ���Ե��0��0��ɾ��
%�÷���im_full=sub_revise3_im(im)
%im RGBͼ��

disp('��������ͼ���Ե��0�С�0�У�')
Nx=size(im,1);
Ny=size(im,2);

i=1;
i_up=1;%��ʼΪ1����ֹû�к�ɫ��Ե�ǲ�����i_up;
while(sum(im(i,:,1))==0)
    i_up=i+1;
    i=i+1;
end

i=Nx;
i_down=Nx;
while(sum(im(i,:,1))==0)
    i_down=i-1;
    i=i-1;
end

j=1;
j_left=1;
while(sum(im(:,j,1))==0)
    j_left=j+1;
    j=j+1;
end

j=Ny;
j_right=Ny;
while(sum(im(:,j,1))==0)
    j_right=j-1;
    j=j-1;
end

im_full=im(i_up:i_down,j_left:j_right,:);