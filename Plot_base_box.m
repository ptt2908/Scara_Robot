function Plot_base_box(handles,center, length, width, height,colr)
for i=0:0.001:height
xBox = [center(1)-length/2, center(1)+length/2, center(1)+length/2, center(1)-length/2;
        center(1)-length/2, center(1)+length/2, center(1)+length/2, center(1)-length/2];
yBox = [center(2)-width/2, center(2)-width/2, center(2)-width/2, center(2)-width/2;
        center(2)+width/2, center(2)+width/2, center(2)+width/2, center(2)+width/2];
zBox = [center(3)+i, center(3)+i, center(3)+i, center(3)+i;
        center(3)+i, center(3)+i, center(3)+i, center(3)+i];    
    % Ve hinh hop
patch(handles.robot_plot, xBox, yBox, zBox, colr);
hold on;
surf(handles.robot_plot, xBox, yBox, zBox,'FaceColor', colr);
hold on;
end

