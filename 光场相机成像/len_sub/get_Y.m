function y3=get_Y(x,y,x3)
%�÷���y3=get_Y([x1,x2],[y1,y2],x3)
%(x1,y1)Ϊһ����
%(x2,y2)Ϊһ����
%���������ã�������������ֱ����x3����ֵ
if nargin<3
    disp('�������������������(x,y,x3)')
    return
end

p=polyfit([x(1) x(2)],[y(1) y(2)],1);
y3=p(1)*x3+p(2);