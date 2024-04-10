function [theta1,theta2,d3,theta4] = Get_Value_Forward(handles)
theta1 = get(handles.Slider_Theta1,'value');
theta2 = get(handles.Slider_Theta2,'value');
d3 = get(handles.Slider_d3,'value');
theta4 = get(handles.Slider_Theta4,'value');
end