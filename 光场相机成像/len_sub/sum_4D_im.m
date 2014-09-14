function  out_im=sum_4D_im(d,v,N_line,micr_N)
%2012 12 22 by lichao
%��R,G,B��ͨ����4D�ⳡ��΢͸������ع�
%out_im=sum_4D_im(d,v,N_line,micr_N)
%d        �������� ����load
%v        ΢͸������ ����load
%N_line   ��͸��������
%micr_N   ΢͸������
%im       ��micr_N,micr_N,sen_N,sen_N��ǰ������ʾ΢͸��λ�ã���������ͼ������
out_im=zeros(micr_N,micr_N,3);

im=[];
for k=1:3
    load (sprintf('./dataRGB/im_d_%d_v_%d_Nline_%d_%d.mat',d,v,N_line,k),'im');
    for i=1:micr_N
        for j=1:micr_N
            out_im(i,j,k)=sum(sum(im(i,j,:,:)));
        end
    end
end