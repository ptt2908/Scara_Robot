function varargout = BTL(varargin)
% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @BTL_OpeningFcn, ...
                   'gui_OutputFcn',  @BTL_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT

% --- Executes just before BTL is made visible.
function BTL_OpeningFcn(hObject, eventdata, handles, varargin)
global myScara;
% SCARA(handles,theta1,theta2,d3,theta4) TOSHIBA THL500
myScara = Scara(handles,0, 90, 0, 0);
handles.output = hObject;
guidata(hObject, handles);
UpdateValue_Robot(handles,myScara);
Plot_Robot(myScara,handles,35,47);

% --- Outputs from this function are returned to the command line.
function varargout = BTL_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;

% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)

function Value_y_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function Value_y_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function Value_z_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function Value_z_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function Value_x_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function Value_x_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function Value_pitch_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function Value_pitch_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function Value_yaw_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function Value_yaw_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function Value_roll_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function Value_roll_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in Btn_Forward.
function Btn_Forward_Callback(hObject, eventdata, handles)
global myScara;
x = [];y = [];z = [];
[theta1_1,theta2_1,d3_1,theta4_1] = UpdateValueTheta(handles);
[theta1,theta2,d3,theta4] = Get_Value_Forward(handles);
a = myScara.a;
alpha = myScara.alpha;
theta = [theta1;theta2;myScara.theta(3);theta4];
d = [myScara.d(1);myScara.d(2);d3;myScara.d(4)];
Singu = myScara.KinematicSingularity(a,alpha,d,theta*pi/180);
if Singu == 1
   h=questdlg('Kinematic Singularity','Warning','OK','OK');
   return
end
dentaltheta1 = theta1-theta1_1;
dentaltheta2 = theta2-theta2_1;
dentald3 = d3-d3_1;
dentaltheta4 = theta4-theta4_1;
temp_Scara = myScara;
for i=1:1:30
temp_Scara = Scara(handles,theta1_1+dentaltheta1*i/30,theta2_1+dentaltheta2*i/30,d3_1+dentald3*i/30,theta4_1+dentaltheta4*i/30);
Plot_Robot(temp_Scara,handles,35,47);
UpdateValue_Robot(handles,temp_Scara);
x = [x,temp_Scara.pos(4,1)];
y = [y,temp_Scara.pos(4,2)];
z = [z,temp_Scara.pos(4,3)];
plot3(handles.robot_plot,x,y,z,'r','LineWidth',1.5);hold on;
pause(0.1);
end
 
% --- Executes on button press in Btn_Inverse.
function Btn_Inverse_Callback(hObject, eventdata, handles)
global myScara;
xx = [];yy = [];zz = [];
[x,y,z,yaw] = Get_Value_Inverse(handles);
[theta1_1,theta2_1,d3_1,theta4_1] = UpdateValueTheta(handles);
[theta1,theta2,d3,theta4] = myScara.InverseKinematic(myScara,x,y,z,yaw*pi/180);
a = myScara.a;
alpha = myScara.alpha;
theta = [theta1;theta2;myScara.theta(3);theta4];
d = [myScara.d(1);myScara.d(2);d3;myScara.d(4)];
Singu = myScara.KinematicSingularity(a,alpha,d,theta*pi/180);
if Singu == 1
   h=questdlg('Kinematic Singularity','Warning','OK','OK');
   return
end
dentaltheta1 = theta1-theta1_1;
dentaltheta2 = theta2-theta2_1;
dentald3 = d3-d3_1;
dentaltheta4 = theta4-theta4_1;
temp_Scara = myScara;
for i=1:1:30
 temp_Scara = Scara(handles,theta1_1+dentaltheta1*i/30,theta2_1+dentaltheta2*i/30,d3_1+dentald3*i/30,theta4_1+dentaltheta4*i/30);
 Plot_Robot(temp_Scara,handles,35,47);
 Set_Value_Theta(handles,theta1*i/30,theta2*i/30,d3*i/30,theta4*i/30);
 xx = [xx,temp_Scara.pos(4,1)];
 yy = [yy,temp_Scara.pos(4,2)];
 zz = [zz,temp_Scara.pos(4,3)];
 plot3(handles.robot_plot,xx,yy,zz,'r','LineWidth',1.5); hold on;
 pause(0.1);
end



% --- Executes on button press in Btn_Reset.
function Btn_Reset_Callback(hObject, eventdata, handles)
global myScara;
Reset(handles);
ClearTrajectoryPlot(handles);
myScara.theta(1) = 0;
myScara.theta(2) = 90;
myScara.d(3) = 0;
myScara.theta(4) = 0;
[myScara.pos,myScara.orien] = myScara.ForwardKinematic(myScara);
Plot_Robot(myScara,handles,35,47);

% --- Executes on slider movement.
function Slider_Theta1_Callback(hObject, eventdata, handles)
theta1 = get(handles.Slider_Theta1,'value');
set(handles.Value_Theta1,'string',num2str(theta1));
% --- Executes during object creation, after setting all properties.
function Slider_Theta1_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

% --- Executes on slider movement.
function Slider_Theta2_Callback(hObject, eventdata, handles)
theta(2) = get(handles.Slider_Theta2,'value');
set(handles.Value_Theta2,'string',num2str(theta(2)));

% --- Executes during object creation, after setting all properties.
function Slider_Theta2_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

% --- Executes on slider movement.
function Slider_d3_Callback(hObject, eventdata, handles)
d3 = get(handles.Slider_d3,'value');
set(handles.Value_d3,'string',num2str(d3));

% --- Executes during object creation, after setting all properties.
function Slider_d3_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

% --- Executes on slider movement.
function Slider_Theta4_Callback(hObject, eventdata, handles)
theta4 = get(handles.Slider_Theta4,'value');
set(handles.Value_Theta4,'string',num2str(theta4));

% --- Executes during object creation, after setting all properties.
function Slider_Theta4_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

function Value_Theta2_Callback(hObject, eventdata, handles)
theta(2) = str2double(get(handles.Value_Theta2,'String'));
set(handles.Slider_Theta2, 'value', theta(2));

% --- Executes during object creation, after setting all properties.
function Value_Theta2_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function Value_d3_Callback(hObject, eventdata, handles)
d(3) = str2double(get(handles.Value_d3,'String'));
set(handles.Slider_d3, 'value', d(3));

% --- Executes during object creation, after setting all properties.
function Value_d3_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function Value_Theta4_Callback(hObject, eventdata, handles)
theta4 = str2double(get(handles.Value_Thet4,'String'));
set(handles.Slider_Theta4, 'value', theta4);

% --- Executes during object creation, after setting all properties.
function Value_Theta4_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function Value_Theta1_Callback(hObject, eventdata, handles)
theta(1) = str2double(get(handles.Value_Theta1,'String'));
set(handles.Slider_Theta1, 'value', theta(1));

% --- Executes during object creation, after setting all properties.
function Value_Theta1_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in Checkbox_Workspace.
function Checkbox_Workspace_Callback(hObject, eventdata, handles)
global myScara
if get(hObject, 'Value')
    Plot_Workspace(myScara,handles);
else
    Plot_Robot(myScara,handles,35,47);  
end

% --- Executes on button press in Checkbox_Coordinate.
function Checkbox_Coordinate_Callback(hObject, eventdata, handles)
global myScara
axes(handles.robot_plot);
if get(hObject, 'Value')
    A0_1 = Ma_Tran(myScara.a(1),myScara.alpha(1)*pi/180,myScara.d(1),myScara.theta(1)*pi/180);
    A1_2 = Ma_Tran(myScara.a(2),myScara.alpha(2)*pi/180,myScara.d(2),myScara.theta(2)*pi/180);
    A2_3 = Ma_Tran(myScara.a(3),myScara.alpha(3)*pi/180,myScara.d(3),myScara.theta(3)*pi/180);
    A3_4 = Ma_Tran(myScara.a(4),myScara.alpha(4)*pi/180,myScara.d(4),myScara.theta(4)*pi/180);
    A0_0=[1 0 0 0; 0 1 0 0; 0 0 1 0; 0 0 0 1];
    A0_2=A0_1*A1_2;
    A0_3=A0_2*A2_3;
    A0_4=A0_3*A3_4;
    
    Plot_Coordinate(handles.robot_plot,0,0,0+myScara.d(1)*5/4,A0_0,'0');
    Plot_Coordinate(handles.robot_plot,myScara.pos(1,1),myScara.pos(1,2),myScara.pos(1,3)+myScara.d(1)*4/4,A0_1,'1');
    Plot_Coordinate(handles.robot_plot,myScara.pos(2,1),myScara.pos(2,2),myScara.pos(2,3)+myScara.d(1)*4/4,A0_2,'2');
    Plot_Coordinate(handles.robot_plot,myScara.pos(3,1),myScara.pos(3,2),myScara.pos(3,3)+myScara.d(1)*4/4,A0_3,'3');
    Plot_Coordinate(handles.robot_plot,myScara.pos(4,1),myScara.pos(4,2),myScara.pos(4,3)+myScara.d(1)*1/4,A0_4,'4');
else
    Plot_Robot(myScara,handles,35,47);  
end

% --- Executes on button press in Btn_Planning.
function Btn_Planning_Callback(hObject, eventdata, handles)
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

v_theta_max = str2double(get(handles.Value_v_theta_max,'String'));
a_theta_max = str2double(get(handles.Value_a_theta_max,'String'));

[theta1_max,theta2_max,d3_max,theta4_max] = myScara.InverseKinematic(myScara,xd,yd,zd,yawd/180*pi);
%% Trajectory Trapezoidal
if (get(handles.Checkbox_Trapezoidal, 'Value') == 1)
[Theta1_m,Theta1_dot_m,Theta1_2dot_m,t1] = Trapezoidal(theta1_max-myScara.theta(1),v_theta_max,a_theta_max);
[Theta2_m,Theta2_dot_m,Theta2_2dot_m,t2] = Trapezoidal(theta2_max-myScara.theta(2),v_theta_max,a_theta_max);
[d3_m,d3_dot_m,d3_2dot_m,t3] = Trapezoidal(d3_max-myScara.d(3),v_max/10,a_max/10);
[Theta4_m,Theta4_dot_m,Theta4_2dot_m,t4] = Trapezoidal(theta4_max-myScara.theta(4),v_theta_max,a_theta_max);
q_max = norm([xd-x0 yd-y0 zd-z0]);
[q,v,a,t] = Trapezoidal(q_max,v_max,a_max);
Plot_qva(handles,q,v,a,t,'r');
%% Trajectory 5-Curve
elseif (get(handles.Checkbox_5curve, 'Value') == 1)
[Theta1_m,Theta1_dot_m,Theta1_2dot_m,t1] = Trajectory_5curve(theta1_max-myScara.theta(1),v_theta_max,a_theta_max);
[Theta2_m,Theta2_dot_m,Theta2_2dot_m,t2] = Trajectory_5curve(theta2_max-myScara.theta(2),v_theta_max,a_theta_max);
[d3_m,d3_dot_m,d3_2dot_m,t3] = Trajectory_5curve(d3_max-myScara.d(3),v_max/10,a_max/10);
[Theta4_m,Theta4_dot_m,Theta4_2dot_m,t4] = Trajectory_5curve(theta4_max-myScara.theta(4),v_theta_max,a_theta_max);
q_max = norm([xd-x0 yd-y0 zd-z0]);
[q,v,a,t] = Trajectory_5curve(q_max,v_max,a_max);
Plot_qva(handles,q,v,a,t,'r');    
end
%% Chuyen dong robot
temp_Scara = myScara;
for i=1:1:length(t)
temp_Scara = Scara(handles,Theta1_m(i),Theta2_m(i)+myScara.theta(2),d3_m(i),Theta4_m(i));
Plot_Robot(temp_Scara,handles,35,47);
Set_Value_Theta(handles,Theta1_m(i),Theta2_m(i)+myScara.theta(2),d3_m(i),Theta4_m(i));
UpdateValue_Robot(handles,temp_Scara);
xx = [xx,temp_Scara.pos(4,1)];
yy = [yy,temp_Scara.pos(4,2)];
zz = [zz,temp_Scara.pos(4,3)];
plot3(handles.robot_plot,xx,yy,zz,'r','LineWidth',1.5);hold on; 
Plot_Axes_theta_d(handles,1,t1,i,Theta1_m,Theta1_dot_m,Theta1_2dot_m,'r')
Plot_Axes_theta_d(handles,2,t2,i,Theta2_m+myScara.theta(2),Theta2_dot_m,Theta2_2dot_m,'r')
Plot_Axes_theta_d(handles,3,t3,i,d3_m,d3_dot_m,d3_2dot_m,'r')
Plot_Axes_theta_d(handles,4,t4,i,Theta4_m,Theta4_dot_m,Theta4_2dot_m,'r')
pause(0.05);
end

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
function Value_yd_Callback(hObject, eventdata, handles)
% --- Executes during object creation, after setting all properties.
function Value_yd_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Value_zd_Callback(hObject, eventdata, handles)
% --- Executes during object creation, after setting all properties.
function Value_zd_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function Value_xd_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function Value_xd_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Value_yawd_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function Value_yawd_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function Value_a_max_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function Value_a_max_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function Value_v_max_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function Value_v_max_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in Pop_Select.
function Pop_Select_Callback(hObject, eventdata, handles)
contents = cellstr(get(hObject, 'String'));
selected_option = contents{get(hObject, 'Value')};
if(selected_option == "Profile")
    set(handles.Panel_profile,'Visible','On');
    set(handles.Panel_Jointspace,'Visible','On');
elseif (selected_option == "Jointspace")
    set(handles.Panel_profile,'Visible','Off');
    set(handles.Panel_Jointspace,'Visible','On'); 
end
% --- Executes during object creation, after setting all properties.
function Pop_Select_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Value_v_theta_max_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function Value_v_theta_max_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Value_a_theta_max_Callback(hObject, eventdata, handles)
% --- Executes during object creation, after setting all properties.
function Value_a_theta_max_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Checkbox_5curve.
function Checkbox_5curve_Callback(hObject, eventdata, handles)

% --- Executes on button press in Checkbox_Trapezoidal.
function Checkbox_Trapezoidal_Callback(hObject, eventdata, handles)
