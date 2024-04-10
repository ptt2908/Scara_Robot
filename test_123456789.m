% Thông so cua hình tru
r1 = 0.075;
r2 = r1;
r = r1;
h = 0.3;

% Toa do cua trung tâm hình tru 1 và 2
c1 = [0, 0,0];
c2 = [0.2, 0,0];
% c1 = [0.2, 0.3,0];
% c2 = [0.4, -0.2,0];
% c1 = [-0.0769, -0.1846,0];
% c2 = [0.2, -0.3,0];
% c1 = [0.2, 0,0];
% c2 = [0.1, 0.2828,0];
% c1 = [0.2, 0,0];
% c2 = [0.1658, -0.298,0];
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
 
surf(xBox, yBox, zBox,'FaceColor', 'r');
hold on;
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

