%2012.11.25 by lichao
%��������͸������ģ������ֻ����µ���������Ϊ0�����
%im0 Ϊ͸�����ɵ�ͼ��
%im_fullΪ����0�У�0�е�ͼ��

function im_full=sub_revise_im(im)
disp('��������ͼ���0�С�0�У�');

%% ����
Nx=size(im,1);
Ny=size(im,2);

im0=[];
im_full=[];

%% ����0��
for i=1:Nx
    if sum(im(i,:))~=0
        im0=cat(1,im0,im(i,:));
    end
end

%% ����0��
for j=1:Ny
    if sum(im0(:,j))~=0
        im_full=cat(2,im_full,im0(:,j));
    end
end

%% ��ͼ
if 0
    figure
    subplot(1,3,1); imshow(im,[]);title('����ͼ��')
    subplot(1,3,2); imshow(im0,[]);title('����0�к�')    
    subplot(1,3,3); imshow(im_full,[]);title('����0��0�к�')
end