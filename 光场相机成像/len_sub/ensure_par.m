function error=ensure_par(v,N_line,d_m,object_num,d,d2)
%2012 12 20 by lichao
%����ȷ�ϲ�����Ϣ�Ƿ�׼ȷ
%�÷���error=ensure_par[v,N_line,d_m,object_num,d,d2]
%v             ΢͸��λ��
%N_line        ��͸��������
%d_m           �����Ŵ���
%object_num    ������
%d             ����1�ľ���
%d2            ����2�ľ���
error=0;
if nargin<=5
    error=1;
    disp('�������㹻�Ĳ�����')
    return;
end


par_menu=menu('ȷ�����������Ƿ���ȷ��',['΢͸�����룺v=',num2str(v)],['��������:object_num=',num2str(object_num)],...
    ['����1�ľ��룺d=',num2str(d)],['����2�ľ��룺d2=',num2str(d2)],['��͸�������ʣ�N_line=',num2str(N_line)],['�����Ŵ�����d_m=',num2str(d_m)],'��','��');
if par_menu<=7
    error=1;
    return;
else   
    disp(['�ɵ�����(΢͸��λ��):v=',num2str(v)]);
    disp(['�ɵ���������͸�������ʣ�:N_line=',num2str(N_line)]);
    disp(['�ɵ������������Ŵ�����:d_m=',num2str(d_m)]);
    disp(['�ɵ�����������1���룩:d=',num2str(d)]);
    disp(['�ɵ�����������2���룩:d2=',num2str(d2)]);
end