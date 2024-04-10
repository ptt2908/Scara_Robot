function UpdateValue_Robot(handles,myScara)
set(handles.Value_x,'String',num2str(myScara.pos(4,1)));
set(handles.Value_y,'String',num2str(myScara.pos(4,2)));
set(handles.Value_z,'String',num2str(myScara.pos(4,3)));
set(handles.Value_roll,'String',num2str(myScara.orien(4,1)*180/pi));
set(handles.Value_pitch,'String',num2str(myScara.orien(4,2)*180/pi));
set(handles.Value_yaw,'String',num2str(myScara.orien(4,3)*180/pi));
end