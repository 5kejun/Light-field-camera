function im_out=sub_reversal3_im(im)
%2012.11.25 by lichao
%2012 12 20 �޸�
%��ͼ�񰴶ԽǷ�ת��������͸�������õ�ͼ��ת
disp('���ڽ���ͼ��ת��');

%% ����
Nx=size(im,1);
Ny=size(im,2);
im_out=zeros(Nx,Ny,3);

%% ��ת
for i=1:Nx
    for j=1:Ny
        im_out(Nx+1-i,Ny+1-j,:)=im(i,j,:);
    end
end

%% ��ͼ
if 0
    figure
    subplot(1,2,1),imshow(im,[]) 
    title('ʵ�ʳ���')
    subplot(1,2,2),imshow(im_out,[])  
    title('��ת���ͼ��')
end