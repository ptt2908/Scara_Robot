function Plot_Axes_theta_d(handles,select_axes,t,i,Theta_m,Theta_dot_m,Theta_2dot_m,clr)
% dt = t(2) - t(1);

if select_axes == 1
%% ve theta1
plot(handles.axes_theta1,t(1,1:i),Theta_m(1,1:i),clr,'LineWidth',1.5); 
plot(handles.axes_theta1_dot,t(1,1:i),Theta_dot_m(1,1:i),clr,'LineWidth',1.5);
plot(handles.axes_theta1_2dot,t(1,1:i),Theta_2dot_m(1,1:i),clr,'LineWidth',1.5);

elseif select_axes == 2
%% ve theta2
plot(handles.axes_theta2,t(1,1:i),Theta_m(1,1:i),clr,'LineWidth',1.5); 
plot(handles.axes_theta2_dot,t(1,1:i),Theta_dot_m(1,1:i),clr,'LineWidth',1.5);
plot(handles.axes_theta2_2dot,t(1,1:i),Theta_2dot_m(1,1:i),clr,'LineWidth',1.5);

elseif select_axes == 3
%% ve d3
plot(handles.axes_d3,t(1,1:i),Theta_m(1,1:i),clr,'LineWidth',1.5); 
plot(handles.axes_d3_dot,t(1,1:i),Theta_dot_m(1,1:i),clr,'LineWidth',1.5);
plot(handles.axes_d3_2dot,t(1,1:i),Theta_2dot_m(1,1:i),clr,'LineWidth',1.5);

elseif select_axes == 4
%% ve theta4
plot(handles.axes_theta4,t(1,1:i),Theta_m(1,1:i),clr,'LineWidth',1.5); 
plot(handles.axes_theta4_dot,t(1,1:i),Theta_dot_m(1,1:i),clr,'LineWidth',1.5);
plot(handles.axes_theta4_2dot,t(1,1:i),Theta_2dot_m(1,1:i),clr,'LineWidth',1.5);
end