function J = Jacobian(a,alpha,d,theta)
A01 = Ma_Tran(a(1),alpha(1),d(1),theta(1));
A12 = Ma_Tran(a(2),alpha(2),d(2),theta(2));
A23 = Ma_Tran(a(3),alpha(3),d(3),theta(3));
A34 = Ma_Tran(a(4),alpha(4),d(4),theta(4));

A02 = A01*A12;
A03 = A02*A23;
A04 = A03*A34;

z0 = [0 0 1]'; z1 = A01(1:3,3); z2 = A02(1:3,3); z3 = A03(1:3,3); z4 = A04(1:3,3);
p0 = [0 0 0]'; p1 = A01(1:3,4); p2 = A02(1:3,4); p3 = A03(1:3,4); p4 = A04(1:3,4);

%% Khop 1 xoay, khop 2 xoay, khop 3 tinh tien, khop 4 xoay
JP1 = Multi_vector(z0,p4-p0);
JP2 = Multi_vector(z1,p4-p1);
JP3 = z2;
JP4 = Multi_vector(z3,p4-p3);
J = [JP1 JP2 JP3 JP4;
     z0 z1 [0;0;0] z3];