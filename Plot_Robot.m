function Plot_Robot(robot,handles,Az,El)
% Az: dieu chinh huong quay xung quanh truc z
% El: dieu chinh huong quay xung quanh truc y

% set(handles.cb_show_coor,'Value',0);
set(handles.Checkbox_Workspace,'Value',0);
set(handles.Checkbox_Coordinate,'Value',0);
robot_plot = handles.robot_plot;
cla(robot_plot,'reset')
hold(robot_plot,'on')
grid(robot_plot,'on')

p0 = [0 0 0];
p1 = robot.pos(1,:);
p2 = robot.pos(2,:);
p3 = robot.pos(3,:);
p4 = robot.pos(4,:);
d = robot.d;
a = robot.a;
orien = robot.orien;

% define links
line1=[[p0(1) p1(1)];[p0(2) p1(2)];[p0(3) p1(3)]];
line2=[[p1(1) p2(1)];[p1(2) p2(2)];[p1(3) p2(3)]];
line3=[[p2(1) p3(1)];[p2(2) p3(2)];[p2(3) p3(3)]];
line4=[[p3(1) p4(1)];[p3(2) p4(2)];[p3(3) p4(3)]];

xlabel(robot_plot,'x');
ylabel(robot_plot,'y');
zlabel(robot_plot,'z');

%draw ground
% t = (1/16:1/32:1)'*2*pi;
% x = (a(1)+a(2))*cos(t);
% y = (a(1)+a(2))*sin(t);
% z = zeros(length(t),1);
% fill3(robot_plot,x,y,z,'g','FaceAlpha',0.1);
% view(robot_plot,Az,El)

% Ve base
% Plot_base_box(handles,[0,0,0],0.24,0.24,0.02,[0.9290 0.6940 0.1250])
Plot_base_hexagon(handles,[0 0 0],0.15,0.01,[0.9220 0.5290 0.1250]);
Plot_Cylinder(handles,0,0,0,0.075,0.8076*d(1),[0.4270 0.9290 0.1250]);
% 
% %link 1
% Plot_Cylinder(handles,line1(1,1),line1(2,1),0.7826*d(1),0.075,0.0185*d(1),[0.4270 0.9290 0.1250]);
% Plot_Cylinder(handles,line1(1,2),line1(2,2),0.7826*d(1),0.075,0.0185*d(1),[0.4270 0.9290 0.1250]);
Plot_Cylinder(handles,line1(1,2),line1(2,2),0.8076*d(1),0.075,0.08,[0.4270 0.9290 0.1250]);
Plot_Cylinder(handles,line1(1,1),line1(2,1),0.8076*d(1),0.075,0.08,[0.4270 0.9290 0.1250]);
Plot_link_connect_full(handles,line1(1,1),line1(2,1),0.8076*d(1),line1(1,2),line1(2,2),0.8076*d(1),0.075,0.08,[0.4270 0.9290 0.1250])

%link2
Plot_Cylinder(handles,line1(1,1),line1(2,1),0.9815*d(1),0.062,0.0185*d(1),[0.4270 0.9290 0.1250]);
Plot_Cylinder(handles,line1(1,2),line1(2,2),0.9815*d(1),0.062,0.0185*d(1),[0.4270 0.9290 0.1250]);
Plot_Cylinder(handles,line2(1,1),line2(2,1),0.9815*d(1),0.057,0.8391*d(1)+0.0185*d(1),[0.4270 0.9290 0.1250])
Plot_Cylinder(handles,line2(1,2),line2(2,2),d(1),0.057,0.1,[0.4270 0.9290 0.1250])
Plot_link_connect_full(handles,line2(1,1),line2(2,1),d(1),line2(1,2),line2(2,2),d(1),0.057,0.1,[0.4270 0.9290 0.1250])

% %Link3
% Plot_Cylinder(handles,p2(1),p2(2),d(1)-0.02,0.05,0.02,[0.9220 0.5290 0.1250])
% Plot_Cylinder(handles,p2(1),p2(2),d(1)-0.035,0.02,0.015,[0.9220 0.5290 0.1250])
Plot_Cylinder(handles,p3(1),p3(2),p3(3),0.02,1.75*d(1),[0 0 0]);
Plot_Cylinder(handles,p3(1),p3(2),p3(3)+1.75*d(1),0.035,0.005,[0 0 0]);

% %Link 4
Plot_Cylinder(handles,p4(1),p4(2),p4(3),0.02,0.003,[1 0 0.2]);
Plot_Cylinder(handles,p4(1),p4(2),p4(3)-0.004,0.04,0.003,[1 0 0.2]);

xlim(robot_plot,[-0.8 0.8]);
ylim(robot_plot,[-0.8 0.8]);
zlim(robot_plot,[-0.2 0.6]);
view(robot_plot,Az,El)
