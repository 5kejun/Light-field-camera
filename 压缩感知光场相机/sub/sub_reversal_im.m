%2012.11.25 by lichao
%��ͼ�񰴶ԽǷ�ת

function im_out=sub_reversal_im(im)
disp('���ڽ���ͼ��ת��');

%% ����
Nx=size(im,1);
Ny=size(im,2);
im_out=zeros(Nx,Ny);

%% ��ת
for i=1:Nx
    for j=1:Ny
        im_out(Nx+1-i,Ny+1-j)=im(i,j);
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