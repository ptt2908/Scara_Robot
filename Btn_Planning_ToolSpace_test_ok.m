function Btn_Planning_ToolSpace_test_ok(hObject, eventdata, handles)
ClearTrajectoryPlot(handles);
xx = [];yy = [];zz = [];
global myScara
global t
x0 = myScara.pos(4,1);
y0 = myScara.pos(4,2);
z0 = myScara.pos(4,3);
yaw0 = myScara.orien(4,3)*180/pi;

xd = str2double(get(handles.Value_xd,'String'));
yd = str2double(get(handles.Value_yd,'String'));
zd = str2double(get(handles.Value_zd,'String'));
yawd = str2double(get(handles.Value_yawd,'String'));

v_max = str2double(get(handles.Value_v_max,'String'));
a_max = str2double(get(handles.Value_a_max,'String'));

joint_space = [myScara.theta(1) myScara.theta(2) myScara.d(3) myScara.theta(4)];

% q_max = norm([xd-x0 yd-y0 zd-z0]);
% [q,v,a,t] = Trapezoidal(q_max,v_max,a_max);
% theta = atan2(zd-z0,sqrt((yd-y0)^2+(xd-x0)^2));
% phi = atan2(yd-y0,xd-x0);

% x = x0 + q*cos(theta)*cos(phi);
% y = y0 + q*cos(theta)*sin(phi);
% z = z0 + q*sin(theta);
% yaw = yaw0 + q/q_max*(yawd-yaw0);

% Kiem tra cac diem di qua nam trong workspace hoac singularity hay khong
% myScara_temp = myScara;
% for i=1:1:length(t)
% [theta1,theta2,d3,theta4] = myScara_temp.InverseKinematic(myScara_temp,x(i),y(i),z(i),yaw(i)/180*pi);
% a_temp = myScara_temp.a;
% alpha = myScara_temp.alpha;
% theta_temp = [theta1;theta2;myScara_temp.theta(3);theta4];
% d_temp = [myScara_temp.d(1);myScara_temp.d(2);d3;myScara_temp.d(4)];
% Singu = myScara_temp.KinematicSingularity(a_temp,alpha,d_temp,theta_temp*pi/180);
% if Singu == 1
%    h=questdlg('Kinematic Singularity','Warning','OK','OK');
%    return
% end
% if i>1
%    joint_space = [joint_space; theta1 theta2 d3 theta4];
% end
% end

% Plot_qva(handles,q,v,a,t,joint_space,'r');
% for i=1:1:length(t)
%   [theta1,theta2,d3,theta4] = myScara.InverseKinematic(myScara,x(i),y(i),z(i),yaw(i)/180*pi);
%   [myScara.pos,myScara.orien] = myScara.ForwardKinematic(myScara);
%   myScara = Scara(handles,theta1,theta2,d3,theta4);
%   Plot_Robot(myScara,handles,35,47);
%   pause(0.05);
%   Set_Value_Theta(handles,theta1,theta2,d3,theta4);
%   UpdateValue_Robot(handles,myScara);
%   xx = [xx,myScara.pos(4,1)];
%   yy = [yy,myScara.pos(4,2)];
%   zz = [zz,myScara.pos(4,3)];
%   plot3(handles.robot_plot,xx,yy,zz,'r','LineWidth',1.5);
%   Plot_Axes_theta_d(handles,t,i,joint_space,'r');
%   hold on; 
% end