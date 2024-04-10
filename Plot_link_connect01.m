function Plot_link_connect01(handles,x0,y0,z0,x1,y1,z1,r,h,colr)
% x0 y0 z0: toa do tam cua tru 0
% x1 y1 z1: toa do tam cua tru 1
% h: chieu cao
% r: ban kinh
% colr: mau
c1 = [x0, y0, z0];
c2 = [x1, y1, z1];

xBox = [c1(1), c1(1),c1(1),c1(1),c1(1);
        c2(1), c2(1),c2(1),c2(1),c2(1)];
yBox = [c1(2)+r, c1(2)-r,c1(2)-r,c1(2)+r,c1(2)+r;
        c2(2)+r, c2(2)-r,c2(2)-r,c2(2)+r,c2(2)+r];
zBox = [c1(3), c1(3),c1(3)+h,c1(3)+h,c1(3) ;
        c2(3), c2(3),c2(3)+h,c2(3)+h,c2(3)];
surf(handles.robot_plot, xBox, yBox, zBox,'FaceColor', colr);
hold on;
