K =1;
R = 10e3;
C = 1e-7;
T = R * C;
num =[0 K];
den = [0.5 1];
G = tf(num,den);
t=0:0.1:10;
u_parabolic = 0.01 * ((t.^2)*0.5)
[y,t]=lsim(G,u_parabolic,t);
plot(t,y);
info = stepinfo(y, t);      
hold on
