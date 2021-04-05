
clc;
clear all;

syms I1 I2 I3 s

C=solve(-15/s-3*s*I1-6*I2-7*s*I2==0,7*s*I2+6*I2-I3/(s*2*10^-7)-2*I3==0,I1==I2+I3,I1,I2,I3);

I1_S = C.I1;
I2_S = C.I2;
I3_S = C.I3;

I1_T = vpa(ilaplace(I1_S),4);
I2_T = vpa(ilaplace(I2_S),4);
I3_T = vpa(ilaplace(I3_S),4);

t=0:0.01:2;
A = subs(I1_T,'t',t);
B = subs(I2_T,'t',t);
C = subs(I3_T,'t',t);

subplot(311);
plot(t,A,'k-');
title("I1");
grid on
subplot(312);
plot(t,B,'k-');
title("I2");
grid on
subplot(313);
plot(t,C,'k-');
title("I3");
grid on