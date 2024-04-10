function Plot_base_hexagon(handles,center,r,h,colr)
theta = linspace(0, 2*pi, 6 + 1);
for i=0:0.001:h
xBox = center(1)+r * cos(theta);
yBox = center(2)+r * sin(theta);
zBox = (center(3)+i)*ones(1,7);
patch(handles.robot_plot, xBox, yBox, zBox, colr);
hold on;
end