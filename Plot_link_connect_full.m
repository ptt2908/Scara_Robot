function Plot_link_connect_full(handles,x0,y0,z0,x1,y1,z1,r,h,colr)
% x0 y0 z0: toa do tam cua tru 0
% x1 y1 z1: toa do tam cua tru 1
% h: chieu cao
% r: ban kinh
% colr: mau
c1 = [x0, y0, z0];
c2 = [x1, y1, z1];

d = sqrt((c2(1)-c1(1))^2 + (c2(2)-c1(2))^2);
theta = atan2((c2(2)-c1(2)),(c2(1)-c1(1)));
if theta>pi/2
xBox = [c1(1)-r*sin(theta)+d*cos(-theta),c1(1)+r*sin(theta)+d*cos(-theta),c1(1)+r*sin(theta)+d*cos(-theta),c1(1)-r*sin(theta)+d*cos(-theta),c1(1)-r*sin(theta)+d*cos(-theta);
        c2(1)-r*sin(theta)-d*cos(-theta),c2(1)+r*sin(theta)-d*cos(-theta),c2(1)+r*sin(theta)-d*cos(-theta),c2(1)-r*sin(theta)-d*cos(-theta),c2(1)-r*sin(theta)-d*cos(-theta)];
yBox = [c1(2)+r*cos(-theta)+d*sin(theta),c1(2)-r*cos(-theta)+d*sin(theta),c1(2)-r*cos(-theta)+d*sin(theta),c1(2)+r*cos(-theta)+d*sin(theta),c1(2)+r*cos(-theta)+d*sin(theta);
        c2(2)+r*cos(-theta)-d*sin(theta),c2(2)-r*cos(-theta)-d*sin(theta),c2(2)-r*cos(-theta)-d*sin(theta),c2(2)+r*cos(-theta)-d*sin(theta),c2(2)+r*cos(-theta)-d*sin(theta)];
else
xBox = [c1(1)-r*sin(theta)+d*cos(theta),c1(1)+r*sin(theta)+d*cos(theta),c1(1)+r*sin(theta)+d*cos(theta),c1(1)-r*sin(theta)+d*cos(theta),c1(1)-r*sin(theta)+d*cos(theta);
        c2(1)-r*sin(theta)-d*cos(theta),c2(1)+r*sin(theta)-d*cos(theta),c2(1)+r*sin(theta)-d*cos(theta),c2(1)-r*sin(theta)-d*cos(theta),c2(1)-r*sin(theta)-d*cos(theta)];
yBox = [c1(2)+r*cos(theta)+d*sin(theta),c1(2)-r*cos(theta)+d*sin(theta),c1(2)-r*cos(theta)+d*sin(theta),c1(2)+r*cos(theta)+d*sin(theta),c1(2)+r*cos(theta)+d*sin(theta);
        c2(2)+r*cos(theta)-d*sin(theta),c2(2)-r*cos(theta)-d*sin(theta),c2(2)-r*cos(theta)-d*sin(theta),c2(2)+r*cos(theta)-d*sin(theta),c2(2)+r*cos(theta)-d*sin(theta)];

end
zBox = [c1(3),c1(3),c1(3)+h,c1(3)+h,c1(3);
        c2(3),c2(3),c2(3)+h,c2(3)+h,c2(3)];

surf(handles.robot_plot, xBox, yBox, zBox,'FaceColor', 'r');
hold on;
