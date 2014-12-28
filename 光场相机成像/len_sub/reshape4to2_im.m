function  out_im=reshape4to2_im(d,v,N_line,micr_N,sen_N,im_max)
%2012 12 22 by lichao
%��R,G,B��ͨ����4D�ⳡ����2D�Ĵ�����ͼ��
%out_im=sum_4D_im(d,v,N_line,micr_N��sen_N)
%d        �������� ����load
%v        ΢͸������ ����load
%N_line   ��͸��������
%micr_N   ΢͸������
%sen_N    ΢͸������ͼ���С
%im       ��micr_N,micr_N,sen_N,sen_N��ǰ������ʾ΢͸��λ�ã���������ͼ������
out_im=zeros(micr_N*sen_N,micr_N*sen_N,3);
out_im=uint8(out_im);

im=[];
max_im=max(im_max);
for k=1:3
    load (sprintf('./dataRGB/im_d_%d_v_%d_Nline_%d_%d.mat',d,v,N_line,k),'im');
    im=uint8(im/max_im*255);
    for i=1:micr_N
        for j=1:micr_N
            out_im((i-1)*sen_N+1:i*sen_N,(j-1)*sen_N+1:j*sen_N,k)=im(i,j,:,:);
        end
    end
end

