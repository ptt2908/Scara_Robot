q_max = 0;
v_max = 20;
a_max = 20;
if q_max < 0 q_temp_max = -q_max;
else q_temp_max = q_max;
end

t1 = v_max/a_max;
q1 = 1/2*a_max*t1*t1;
t2 = q_temp_max/v_max;
q2 = q1 + v_max*(t2-t1);
t3 = t1+t2;

t = 0:t3/50:t3;
for i=1:length(t)
    if t(i)<= t1
        q(i)=1/2*a_max*t(i)^2;
        v(i) = a_max*t(i);
        a(i) = a_max;
    elseif t(i)<= t2
        q(i) = q1 + v_max*(t(i)-t1);
        v(i) = v_max;
        a(i) = 0;
    elseif t(i)<= t3
        q(i) = q2 - 1/2*a_max*((t(i)-t2))^2 + v_max*(t(i)-t2);
        v(i) = v_max - a_max*(t(i)-t2);
        a(i) = -a_max;
    end
end
if (q_max < 0) 
    q = -q;
elseif (q_max == 0) 
    q = zeros(1,length(t));
    v = zeros(1,length(t));
    a = zeros(1,length(t));
else
    q = q;
end

subplot(3,1,1)
hold on
grid on
title('q')
plot(t,q,'LineWidth',1.5);
subplot(3,1,2)
hold on
grid on
title('v')
plot(t,v,'LineWidth',1.5);
subplot(3,1,3)
hold on
grid on
title('a')
plot(t,a,'LineWidth',1.5);
xlabel('Time (s)')
