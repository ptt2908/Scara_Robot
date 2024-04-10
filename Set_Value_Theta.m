function Set_Value_Theta(handles,theta1,theta2,d3,theta4)
%% TextBox
 set(handles.Value_Theta1,'String',theta1);
 set(handles.Value_Theta2,'String',theta2);
 set(handles.Value_d3,'String',d3);
 set(handles.Value_Theta4,'String',theta4);
 %% Slider
 set(handles.Slider_Theta1, 'value', theta1);
 set(handles.Slider_Theta2, 'value', theta2);
 set(handles.Slider_d3, 'value', d3);
 set(handles.Slider_Theta4, 'value', theta4);
end