% Thông s? c?a hình h?p
center = [0, 0, 0];
length = 0.24;
width = 0.24;
height = 0.08;
figure;
for i=0:0.001:height
xBox = [center(1)-length/2, center(1)+length/2, center(1)+length/2, center(1)-length/2;
        center(1)-length/2, center(1)+length/2, center(1)+length/2, center(1)-length/2];
yBox = [center(2)-width/2, center(2)-width/2, center(2)-width/2, center(2)-width/2;
        center(2)+width/2, center(2)+width/2, center(2)+width/2, center(2)+width/2];
zBox = [center(3)+i, center(3)+i, center(3)+i, center(3)+i;
        center(3)+i, center(3)+i, center(3)+i, center(3)+i];    
% V? hình h?p

patch(xBox, yBox, zBox, 'b', 'FaceAlpha', 0.5);
hold on;
surf(xBox, yBox, zBox,'FaceAlpha', 0.5, 'FaceColor', 'r');
hold on;
end
axis equal;
xlabel('X');
ylabel('Y');
zlabel('Z');
