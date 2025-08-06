K = 0.5;
R = 10e3;
C = 1e-7;
T = R * C;
num =[0 K];
den = [T 1];
G = tf(num,den);
t=0:0.1:10;
u_ramp = 0.1 * t;
[y,t]=lsim(G,u_ramp,t);
plot(t,y);
info = stepinfo(y, t);      
hold on
