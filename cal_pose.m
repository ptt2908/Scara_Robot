function [P,O] = Posi_Orien(A,p0)
%% Position - vi tri
    p_extended  = [p0;1];
    P_temp =  A*p_extended; % P_temp = [a*cos(theta); a*sin(theta); d; 1];
    P = P_temp(1:3);        % P      = [a*cos(theta); a*sin(theta); d];
%% Orientation -  huong
%Slide 3.5(More on representation of orientation)         %roll la theta
    O(2)  = atan2(-A(3,1),sqrt(A(3,2)^2+A(3,3)^2));       %pitch = 90deg?????
    O(1)  = atan2(A(3,2)/cos(O(2)),A(3,3)/cos(O(2)));     %roll  = atan2(r32/cos(theta),r33/cos(theta))
    O(3)  = atan2(A(2,1)/cos(O(2)),A(1,1)/cos(O(2)));     %yaw   = atan2(r21/cos(theta),r11/cos(theta)
    
end