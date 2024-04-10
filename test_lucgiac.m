% Thông s? c?a hình h?p
center = [0, 0, 0];
height = 0.08;
radius = 1;
figure;theta = linspace(0, 2*pi, 6 + 1);
for i=0:0.001:height

xBox = center(1)+radius * cos(theta);
yBox = center(2)+radius * sin(theta);
zBox = (center(3)+i)*ones(1,7);
patch(xBox, yBox, zBox, 'b', 'FaceAlpha', 0.5);
hold on;
end
axis equal;
xlabel('X');
ylabel('Y');
zlabel('Z');
