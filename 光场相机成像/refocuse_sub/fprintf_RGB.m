function fprintf_RGB(kk,varr)
%2012 12 20 by lichao
%�ֱ���ʾ�����RGB

if exist('varr','var')==0
    switch kk
        case 1
            fprintf('\nһ��R��:\n���ڶ�ͼ��R�������д���\n');
        case 2
            fprintf('\n����G����\n���ڶ�ͼ��G�������д���\n');
        case 3
            fprintf('\n����B����\n���ڶ�ͼ��B�������д���\n');
    end
else
    switch kk
        case 1
            disp('���ڶ�ͼ��R�������߽��е�����');
        case 2
            disp('���ڶ�ͼ��G�������߽��е�����');
        case 3
            disp('���ڶ�ͼ��B�������߽��е�����');
    end
end