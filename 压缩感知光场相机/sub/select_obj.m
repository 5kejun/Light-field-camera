function obj=select_obj()
%2012 12 24 by lichao
%���ܣ�ѡ����͸��ǰ����
%�÷���obj=select_obj()

obj_num=menu('��ѡ�񳡾���','hough','ʮ101','���','finger','����');
if obj_num>4
    obj=0;
end


%%%%%---------Img.jpg---------%%%%%%%%%%
if obj_num==1
    load hough_data hough_data
    obj=double(hough_data);
end
%%%%%---------Img.jpg---------%%%%%%%%%%


%%%%%---------"ʮ"---------%%%%%%%%%%
if obj_num==2
    load ten_data ten_data  %101*101
    obj=ten_data;
end
%%%%%---------"ʮ"---------%%%%%%%%%%


%%%%%---------���---------%%%%%%%%%%
if obj_num==3
    obj=zeros(101);
    obj(51,51)=100;
    obj(21,21)=100;
    obj(81,81)=100;
    obj(21,81)=100;
    obj(81,21)=100;
end
%%%%%---------���---------%%%%%%%%%%


%%%%%---------ָ��---------%%%%%%%%%%
if obj_num==4
    load finger_data finger_data
    obj=double(finger_data);
end
%%%%%---------ָ��---------%%%%%%%%%%


