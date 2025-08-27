%second_order_system
%CASE1
R1=2000;
R2=2000;
C1=0.5e-6;
C2=0.5e-6;
wn=1/(R1*C1);
zeta =((R1*C1)+(R1*C2)+(R2*C2))/(2*wn*(R1*R2*C1*C2));
