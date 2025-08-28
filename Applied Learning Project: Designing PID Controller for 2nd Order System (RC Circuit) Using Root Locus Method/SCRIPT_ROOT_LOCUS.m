R1 = 1e6;
R2 = 1e6;
C1 = 1e-7;
C2 = 1e-7;
num = [1/(R1*R2*C1*C2)];
den = [1 (R1*C1+R2*C2+R1*C2)/(R1*R2*C1*C2) (1/(R1*R2*C1*C2))];
G=tf(num,den)
rlocus(G)
