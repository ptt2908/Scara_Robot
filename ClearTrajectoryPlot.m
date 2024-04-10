function ClearTrajectoryPlot(handles)
% axes to plot q, v, a
axes(handles.axes_q)
cla
hold on
grid on
title('q', 'Interpreter','latex')

axes(handles.axes_v)
cla
hold on
grid on
title('v', 'Interpreter','latex')

axes(handles.axes_a)
cla
hold on
grid on
title('a', 'Interpreter','latex')
xlabel('Time (s)');

axes(handles.axes_theta1)
cla
hold on
grid on
title('${\theta_1}$ (deg)', 'Interpreter','latex')

axes(handles.axes_theta2)
cla
hold on
grid on
title('${\theta_2}$ (deg)', 'Interpreter','latex')

axes(handles.axes_d3)
cla
hold on
grid on
title('${d_3}$ (m)', 'Interpreter','latex')

axes(handles.axes_theta4)
cla
hold on
grid on
title('${\theta_4}$ (deg)', 'Interpreter','latex')

axes(handles.axes_theta1_dot)
cla
hold on
grid on
title('$\dot{\theta_1}$ (deg/s)', 'Interpreter','latex')

axes(handles.axes_theta2_dot)
cla
hold on
grid on
title('$\dot{\theta_2}$ (deg/s)', 'Interpreter','latex')

axes(handles.axes_d3_dot)
cla
hold on
grid on
title('$\dot{d_3}$ (m/s)', 'Interpreter','latex')

axes(handles.axes_theta4_dot)
cla
hold on
grid on
title('$\dot{\theta_4}$ (deg/s)', 'Interpreter','latex')

axes(handles.axes_theta1_2dot)
cla
hold on
grid on
title('$\stackrel{..}{\theta_1}$ (deg/s2)', 'Interpreter','latex')

axes(handles.axes_theta2_2dot)
cla
hold on
grid on
title('$\stackrel{..}{\theta_2}$ (deg/s2)', 'Interpreter','latex')

axes(handles.axes_d3_2dot)
cla
hold on
grid on
title('$\stackrel{..}{d_3}$ (m/s2)', 'Interpreter','latex')

axes(handles.axes_theta4_2dot)
cla
hold on
grid on
title('$\stackrel{..}{\theta_4}$ (deg/s2)', 'Interpreter','latex')