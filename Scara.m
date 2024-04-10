classdef Scara
    properties
        a;
        d;
        alpha; % deg
        theta; % deg
        pos;
        orien;  % (rad)
    end
    methods(Static)
        function obj = Scara(handles, theta1, theta2, d3, theta4)
            obj.a = [0.2; 0.3; 0; 0];
            obj.d = [0.179; 0; 0; 0];
            obj.alpha = [0.00; 0.00; 0.00; 180];
            obj.theta = [0.00; 90.00; 0.00; 0.00];
            obj.d(3)=d3;
            obj.theta(1)=theta1;
            obj.theta(2)=theta2;
            obj.theta(4)=theta4;
            [obj.pos,obj.orien] = obj.ForwardKinematic(obj);  
        end
        %% Ham tinh dong hoc thuan
        function [p_robot,o_robot] = ForwardKinematic(self)
            a = self.a;
            alpha = self.alpha*pi/180;
            d = self.d;
            theta = self.theta*pi/180;
            % Input: DH Parameter
            % Output: joint position p1 p2 p3 p4     (x y z)
            %         joint orientation o1 o2 o3 o4  (roll pitch yaw)
            % Ma tran Denavit_Hartenberg
            A0_1 = Ma_Tran(a(1),alpha(1),d(1),theta(1)) ;
            A1_2 = Ma_Tran(a(2),alpha(2),d(2),theta(2)) ;
            A2_3 = Ma_Tran(a(3),alpha(3),d(3),theta(3)) ;
            A3_4 = Ma_Tran(a(4),alpha(4),d(4),theta(4)) ;

            A0_2=A0_1*A1_2;
            A0_3=A0_1*A1_2*A2_3;
            A0_4=A0_1*A1_2*A2_3*A3_4;

            p0 = [0;0;0];
            [p1, o1] = Posi_Orien(A0_1,p0);           %Joint1: p1 = [a1*cos(theta1); a1*sin(theta1); d1]
            [p2, o2] = Posi_Orien(A0_2,p0);           %Joint2: p2 = [a2*cos(theta2); a2*sin(theta2); d2]
            [p3, o3] = Posi_Orien(A0_3,p0);           %Joint3: p3 = [a3*cos(theta3); a3*sin(theta3); d3]
            [p4, o4] = Posi_Orien(A0_4,p0);           %Joint4: p4 = [a4*cos(theta4); a4*sin(theta4); d4]

            p_robot = [p1 p2 p3 p4]';
            o_robot = [o1; o2; o3; o4];
        end
        
        %% Ham tinh dong hoc nguoc
        function [the1,the2,d3,the4] = InverseKinematic(obj,x,y,z,yaw)
            % Input: x y z yaw
            % Output: theta1 theta2 d3 theta4
            a = obj.a;
            d = obj.d;
            theta1_max = 125;
            theta2_max = 145;
            d3_max = 0.3;

            c2 = (x^2 + y^2 - a(1)^2 - a(2)^2)/(2*a(1)*a(2));
            if (abs(c2)<=1)
                s2 = sqrt(1-c2^2);
                theta21 = atan2(s2,c2);
                theta22 = atan2(-s2,c2);               
                if abs(theta21 - pi/2) < pi
                    theta2 = theta21;
                else
                    theta2 = theta22;
                    s2 = -s2;
                end
                t1 = [a(1)+a(2)*c2 -a(2)*s2;a(2)*s2 a(1)+a(2)*c2]^(-1)*[x;y];
                c1 = t1(1);
                s1 = t1(2);
                theta1 = atan2(s1,c1);
                d33 = z - d(1);
                theta4 = yaw - ( theta1 + theta2 );
                
                if (abs(theta1*180/pi)>theta1_max)||(abs(theta2*180/pi)>theta2_max)||(d33<-d3_max)
                    h=questdlg('Ngoai vung workspace','Warning','OK','OK');
                    return
                else
                    the1 = theta1*180/pi;
                    the2 = theta2*180/pi;
                    d3 = d33;
                    the4 = theta4*180/pi;
                end
            else
                return
            end
        end
        
        %% Kinematic Singularity
         function Singu = KinematicSingularity(a,alpha,d,theta)            
            J = Jacobian(a,alpha,d,theta);
            %% Kiem tra singularity
            J = J(1:3,1:3);
            if abs(det(J)) <= 10e-4
               Singu = 1;
            else
               Singu = 0;
            end
         end
    end
end