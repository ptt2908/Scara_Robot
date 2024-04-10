function Reset(handles)

set(handles.Slider_Theta1, 'value', 0);
set(handles.Slider_Theta2, 'value', 90);
set(handles.Slider_d3, 'value', 0);
set(handles.Slider_Theta4, 'value', 0);

set(handles.Value_Theta1,'String',0);
set(handles.Value_Theta2,'String',90);
set(handles.Value_d3,'String',0);
set(handles.Value_Theta4,'String',0);

set(handles.Value_x,'String',0.2);
set(handles.Value_y,'String',0.3);
set(handles.Value_z,'String',0.179);
set(handles.Value_roll,'String',180);
set(handles.Value_pitch,'String',0);
set(handles.Value_yaw,'String',90);

set(handles.Checkbox_Trapezoidal,'Value',0);
set(handles.Checkbox_5curve,'Value',0);