% function Plot_Box(handles,x0,y0,z0,a,b,h,colr)
% x0 y0 z0: toa do tam cua day
% h: chieu cao
% a, b: chieu dai, chieu rong
% colr: mau
% Thông so cua hình tru
r = 0.075;
h = 0.3;

% Toa do cua trung tâm hình tru 1 và 2
c1 = [0, 0, 0];
c2 = [0.2, 0, 0];

% Tao du lieu cho hình hop noi

xBox3 = [c1(1), c1(1),c1(1),c1(1),c1(1);
        c2(1), c2(1),c2(1),c2(1),c2(1)];
yBox3 = [c1(2)+r, c1(2)-r,c1(2)-r,c1(2)+r,c1(2)+r;
        c2(2)+r, c2(2)-r,c2(2)-r,c2(2)+r,c2(2)+r];
zBox3 = [c1(3), c1(3),c1(3)+h,c1(3)+h,c1(3) ;
        c2(3), c2(3),c2(3)+h,c2(3)+h,c2(3)];
    
% T?o hình h?p n?i
figure;
% patch(xBox, yBox, zBox, 'b', 'FaceAlpha', 0.5);   %ve hinh chu nhat
% hold on;
% surf(xBox, yBox, zBox,'FaceAlpha', 0.5, 'FaceColor', 'r');
% hold on;

% patch(xBox2, yBox2, zBox2, 'b', 'FaceAlpha', 0.5);
% hold on;
% surf(xBox2, yBox2, zBox2,'FaceAlpha', 0.5, 'FaceColor', 'r');
% hold on;

% patch(xBox3, yBox3, zBox3, 'b', 'FaceAlpha', 0.5);
% hold on;
surf(xBox3, yBox3, zBox3,'FaceAlpha', 0.5, 'FaceColor', 'r');
hold on;

% patch(xBox4, yBox4, zBox4, 'b', 'FaceAlpha', 0.5);
% hold on;
% surf(xBox4, yBox4, zBox4,'FaceAlpha', 0.5, 'FaceColor', 'r');
% hold on;
% Ve hình tru 1
[X1, Y1, Z1] = cylinder(r, 100);
Z1 = Z1 * h;
X1 = X1 + c1(1);
Y1 = Y1 + c1(2);
surf(X1, Y1, Z1, 'FaceAlpha', 0.5, 'FaceColor', 'r');

% V? hình tr? 2
[X2, Y2, Z2] = cylinder(r, 100);
Z2 = Z2 * h + c2(3);
X2 = X2 + c2(1);
Y2 = Y2 + c2(2);
surf(X2, Y2, Z2, 'FaceAlpha', 0.5, 'FaceColor', 'g');

axis equal;
xlabel('X');
ylabel('Y');
zlabel('Z');
title('Hình h?p n?i 2 hình tr?');
                             % Make Cube Appear Solid