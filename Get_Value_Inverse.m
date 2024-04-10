function [x,y,z,yaw] = Get_Value_Inverse(handles)
x = str2double(get(handles.Value_x,'String'));
y = str2double(get(handles.Value_y,'String'));
z = str2double(get(handles.Value_z,'String'));
yaw = str2double(get(handles.Value_yaw,'String'));
end