
%%
clc
clear all
close all

addpath('.\image');
addpath('.\sub');
addpath('.\CS-Code');
%%  ����
Cam.D=4;                                                                        %ֱ��
Cam.F=16;                                                                       %����
d=400;                                                                      %���
d_m=6;  
v_re=Cam.F*d/(d-Cam.F);  %���
Cam.v=16;
Cam.N_line=11;                                                                  %����͸������ɢ����ÿ��������͸���ж��ٹ���
Sen.N=500;                                                                  %�������ܸ���
Sen.d=Cam.D/Sen.N;                                                              %������ֱ��

obj=select_obj();                                                          %ѡ������
if obj==0
    clearall
    disp('������ѡ�������');
    break;
end

%% ѹ����֪����
Sen.L=11;% ÿ���������ع���sen_L^2��ֱ��
CS.N=Sen.L^2;%ѹ����֪�۲�������
CS.M=fix(CS.N*0.5);%ѹ����֪�۲�������
rng('default')
CS.A=rand(CS.M,CS.N);


%% ģ��������
tic
im=LF_sim(obj,d_m,d,Cam,Sen,CS);
t=toc;
disp(['ģ�������̻���ʱ��Ϊ��t=',num2str(t),'s']);


%% ѹ����֪�ع�
tic
maxIters=10000;
im_2_to_4=zeros(size(im,1),size(im,2),Sen.L,Sen.L);
for i=1:size(im,1)
    for j=1:size(im,2)       
        if sum(im(i,j,:))~=0
            y=reshape(im(i,j,:),size(im,3),1);
            [sols, iters, activationHist] = SolveOMP(CS.A, y, CS.N, maxIters);
            %reshape(sols,Sen.L,Sen.L)'
            im_2_to_4(i,j,:,:)=reshape(sols,Sen.L,Sen.L)';
        end
    end
end
t=toc;
disp(['CS�ع�ʱ��Ϊ��t=',num2str(t),'s']);

%%  �ؾ۽�
tic
im_rec=LF_refocuse(im_2_to_4,v_re,Cam,Sen);
t=toc;
disp(['�ؾ۽�ʱ��Ϊ��t=',num2str(t),'s']);


%% ����0�С�0��
im_full=sub_revise_im(im_rec);

%% ͼ������
im_full_final=sub_reversal_im(im_full);

%% figure
figure
subplot(1,2,1),imshow(obj,[]);title('ԭʼͼ��');
subplot(1,2,2),imshow(abs(im_rec),[]);title('�ع�ͼ��')

figure
imshow(im(:,:,CS.M),[]);title('�۲�ͼ��')

figure
imshow(im_full,[]);title('����0��0�е�ͼ��');

figure
imshow(im_full_final,[]);title('����ͼ��');



