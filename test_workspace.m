view(-50,50)
theta1_max = 125*pi/180;    %Toshiba THL500
theta2_max = 145*pi/180;
% d = d;
d3_max = 0.3;
a = [0.2; 0.3; 0; 0];
d = [0.179; 0; 0; 0];
alpha = [0.00; 0.00; 0.00; 180];
theta = [0.00; 90.00; 0.00; 0.00];
theta1 = linspace(-theta1_max,theta1_max,181);

%% lenh patch dung de ve cac da giac trong mat phang
% giu nguyen a2, cho a1 xoay max range (a1 + a2)*cos,(a1 + a2)*sin
% theta2 = 0
patch([0, (a(1)+a(2))*cos(theta1)],[0, (a(1)+a(2))*sin(theta1)],d(1)*ones(1,182),'g','FaceAlpha',0.02);
hold on;
patch([0, (a(1)+a(2))*cos(theta1)],[0, (a(1)+a(2))*sin(theta1)],(d(1)-d3_max)*ones(1,182),'g','FaceAlpha',0.07);
hold on;

% theta1 = max, xoay theta2 nguoc kim dong ho
theta2 = linspace(0,theta2_max,181);
patch([a(1)*cos(theta1_max), a(1)*cos(theta1_max)+a(2)*cos(theta1_max+theta2)],[a(1)*sin(theta1_max), a(1)*sin(theta1_max)+a(2)*sin(theta1_max+theta2)],d(1)*ones(1,182),'r','FaceAlpha',0.02);
hold on;
patch([a(1)*cos(theta1_max), a(1)*cos(theta1_max)+a(2)*cos(theta1_max+theta2)],[a(1)*sin(theta1_max), a(1)*sin(theta1_max)+a(2)*sin(theta1_max+theta2)],(d(1)-d3_max)*ones(1,182),'r','FaceAlpha',0.07);
hold on;

% theta1 = max, xoay theta2 cung kim dong ho
theta2 = linspace(0,-theta2_max,181);
patch([a(1)*cos(-theta1_max), a(1)*cos(-theta1_max)+a(2)*cos(-theta1_max+theta2)],[a(1)*sin(-theta1_max), a(1)*sin(-theta1_max)+a(2)*sin(-theta1_max+theta2)],d(1)*ones(1,182),'r','FaceAlpha',0.02);
hold on;
patch([a(1)*cos(-theta1_max), a(1)*cos(-theta1_max)+a(2)*cos(-theta1_max+theta2)],[a(1)*sin(-theta1_max), a(1)*sin(-theta1_max)+a(2)*sin(-theta1_max+theta2)],(d(1)-d3_max)*ones(1,182),'r','FaceAlpha',0.07);
hold on;
%% Ve truc z
% lenh repmat (repeat matrix) tao ra 181 cot giong cot dau tien
x = [0, (a(1)+a(2))*cos(theta1)];
y = [0, (a(1)+a(2))*sin(theta1)];
z = [d(1); d(1)-d3_max];
plot3([x;x],[y;y],repmat(z,1,182),'y'); hold on;

% Theta2 nguoc chieu dong ho
theta2 = linspace(0,theta2_max,181);
x = [a(1)*cos(theta1_max), a(1)*cos(theta1_max)+a(2)*cos(theta1_max+theta2)];
y = [a(1)*sin(theta1_max), a(1)*sin(theta1_max)+a(2)*sin(theta1_max+theta2)];
z = [d(1); d(1)-d3_max];
plot3([x;x],[y;y],repmat(z,1,182),'y'); hold on;
% Theta2 cung chieu dong ho
theta2 = linspace(0,-theta2_max,181);
x = [a(1)*cos(-theta1_max), a(1)*cos(-theta1_max)+a(2)*cos(-theta1_max+theta2)];
y = [a(1)*sin(-theta1_max), a(1)*sin(-theta1_max)+a(2)*sin(-theta1_max+theta2)];
z = [d(1); d(1)-d3_max];
plot3([x;x],[y;y],repmat(z,1,182),'r'); hold on;


