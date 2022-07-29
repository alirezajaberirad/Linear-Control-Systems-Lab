close all

s=tf('s');
G1=2/(s+16);
G2=2/(s-16);
G3=2/(s^2+16);
P1=pole(G1)
P2=pole(G2)
P3=pole(G3)

figure; step(G1);
figure; step(G2);
figure; step(G3);

t = 0:0.01:20;
u1 = 2*sin(4*t);
figure; lsim(G1,u1,t);
figure; lsim(G2,u1,t);
figure; lsim(G3,u1,t);

u2 = 2*sin(5*t);
figure; lsim(G3,u2,t);

