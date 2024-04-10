function Plot_linkii(handles,x0,y0,z0,x1,y1,z1,r,h,colr)
% x0 y0 z0: toa do tam cua tru 0
% x1 y1 z1: toa do tam cua tru 1
% h: chieu cao
% colr: mau
% Thông so cua hình tru
radius = r;
height = h;

% Toa do cua trung tâm hình tru 1 và 2
center1 = [x0, y0, z0];
center2 = [x1, y1, z1];

% Tao du lieu cho hình hop noi
xBox = [center1(1)-radius, center1(1)+radius, center1(1)+radius, center1(1)-radius;
        center2(1)-radius, center2(1)+radius, center2(1)+radius, center2(1)-radius];
yBox = [center1(2), center1(2), center1(2), center1(2);
        center2(2), center2(2), center2(2), center2(2)];
zBox = [center1(3), center1(3), center1(3), center1(3);
        center2(3), center2(3), center2(3), center2(3)];
    
xBox2 = [center1(1)-radius, center1(1)+radius, center1(1)+radius, center1(1)-radius;
        center2(1)-radius, center2(1)+radius, center2(1)+radius, center2(1)-radius];
yBox2 = [center1(2), center1(2), center1(2), center1(2);
        center2(2), center2(2), center2(2), center2(2)];
zBox2 = [center1(3)+ height, center1(3)+ height, center1(3)+ height, center1(3)+ height;
        center2(3)+ height, center2(3)+ height, center2(3)+ height, center2(3)+ height];

xBox3 = [center1(1)+radius, center1(1)+radius, center1(1)+radius, center1(1)+radius;
        center2(1)+radius, center2(1)+radius, center2(1)+radius, center2(1)+radius];
yBox3 = [center1(2), center1(2), center1(2), center1(2);
        center2(2), center2(2), center2(2), center2(2)];
zBox3 = [center1(3), center1(3)+ height, center1(3)+ height, center1(3);
        center2(3), center2(3)+ height, center2(3)+ height, center2(3)];
    
xBox4 = [center1(1)-radius, center1(1)-radius, center1(1)-radius, center1(1)-radius;
        center2(1)-radius, center2(1)-radius, center2(1)-radius, center2(1)-radius];
yBox4 = [center1(2), center1(2), center1(2), center1(2);
        center2(2), center2(2), center2(2), center2(2)];
zBox4 = [center1(3), center1(3)+ height, center1(3)+ height, center1(3);
        center2(3), center2(3)+ height, center2(3)+ height, center2(3)];
% Tao hình hop noi
% patch(handles.robot_plot, xBox, yBox, zBox, colr);
hold on;
surf(handles.robot_plot, xBox, yBox, zBox,'FaceColor', colr);
hold on;

% patch(handles.robot_plot, xBox2, yBox2, zBox2, colr);
hold on;
surf(handles.robot_plot, xBox2, yBox2, zBox2,'FaceColor', colr);
hold on;

% patch(handles.robot_plot, xBox3, yBox3, zBox3,colr);
hold on;
surf(handles.robot_plot, xBox3, yBox3, zBox3,'FaceColor', colr);
hold on;

% patch(handles.robot_plot, xBox4, yBox4, zBox4, colr);
hold on;
surf(handles.robot_plot, xBox4, yBox4, zBox4,'FaceColor', colr);
hold on;
