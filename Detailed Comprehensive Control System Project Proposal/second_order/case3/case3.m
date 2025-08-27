%second_order_system
%CASE3
R1=3000;
R2=3000;
C1=0.3e-6;
C2=0.3e-6;
wn=1/(R1*C1);
zeta =((R1*C1)+(R1*C2)+(R2*C2))/(2*wn*(R1*R2*C1*C2));
