function [obj,obj2,d,d2,object_num,error]=select_object()
%2012 12 20 by lichao
%����ѡ�񳡾�
%�÷���[obj,obj1,d,d2,object_num,error]=select_object()
%obj        ����1
%obj2       ����2
%d          ����1����
%d2         ����2����
%object_num ��������
%error      ����ѡ��
error=0;
obj=[];
obj2=[];
d=0;
d2=0;
object_num=menu('��ѡ�����������','һ������','��������','����');

if object_num==1
    object=menu('��ѡ������棺','lena256','lena512','Baboon512','Peppers512','circle_card','lena101','һ��','����');
    if object<=7
        obj=select_obj(object);
        d=250;%���
    else
        error=1;
        return;

    end
elseif object_num==2
    object2=menu('��ѡ������棺','A��B','C��D','����');
    if object2<=2
        [obj,obj2]=select_2obj(object2);
        d=250;
        d2=400;
    else
        error=1;
        return;
    end
elseif object_num==3
    error=1;
    return;

end