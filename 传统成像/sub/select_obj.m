function obj=select_obj()
%2012 12 24 by lichao
%���ܣ�ѡ����͸��ǰ����
%�÷���obj=select_obj()

obj_num=menu('��ѡ�񳡾���','lena140','17(843*1268)','lena512','ʮ101','leaves256','���','����','����');
if obj_num>7
    obj=0;
end
%%%%%---------lena---------%%%%%%%%%%
if obj_num==1
    load lena lena %140*140
    obj=double(lena);
end
%%%%%---------lena---------%%%%%%%%%%

%%%%%---------Img.jpg---------%%%%%%%%%%
if obj_num==2
    obj=imread('17.jpg'); %843*1268
    obj=rgb2gray(obj);
    obj=double(obj);
end
%%%%%---------Img.jpg---------%%%%%%%%%%

%%%%%---------lena---------%%%%%%%%%%
if obj_num==3
    load lena512 lena512  %512*512
    obj=double(lena512);
end
%%%%%---------lena---------%%%%%%%%%%

%%%%%---------"ʮ"---------%%%%%%%%%%
if obj_num==4
    load ten_data ten_data  %101*101
    obj=ten_data;
end
%%%%%---------"ʮ"---------%%%%%%%%%%

%%%%%---------leaves---------%%%%%%%%%%
if obj_num==5
    load leaves leaves %256*256
    obj=double(leaves);
end
%%%%%---------leaves---------%%%%%%%%%%

%%%%%---------���---------%%%%%%%%%%
if obj_num==6
    obj=zeros(101);
    obj(51,51)=100;
    obj(21,21)=100;
    obj(81,81)=100;
    obj(21,81)=100;
    obj(81,21)=100;
end
%%%%%---------���---------%%%%%%%%%%


%%%%%---------����---------%%%%%%%%%%
if obj_num==7
    load data_grad data_grad
    obj=data_grad;
end
%%%%%---------����---------%%%%%%%%%%


