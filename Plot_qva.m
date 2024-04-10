function Plot_qva(handles,q,v,a,t,clr)
%% Ve q
axes(handles.axes_q)
plot(t,q,clr,'LineWidth',1.5);

%% Ve v
axes(handles.axes_v)
plot(t,v,clr,'LineWidth',1.5);

%% Ve a
axes(handles.axes_a)
plot(t,a,clr,'LineWidth',1.5);