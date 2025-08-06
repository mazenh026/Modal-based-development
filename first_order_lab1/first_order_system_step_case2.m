K = 1;
R = 10e3;
C = 1e-7;
T = R * C;
num =[0 K];
den = [0.5 1];
G = tf(num,den);
step(G)
[y, t] = step(G);        
info = stepinfo(y, t);      
hold on
