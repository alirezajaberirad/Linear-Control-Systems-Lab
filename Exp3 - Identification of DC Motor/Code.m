close all; clear all; clc
%%
Tf=10;
dt=0.01;
t=0:dt:Tf;
%%
Va=5*heaviside(t-5);
Vm=MotorDC(Va,t);
%%
plot(t,Vm)
title('V_m')
xlabel('Time[s]')
ylabel('Voltage[v]')


%%
Va=3*heaviside(t-5);
Vm=MotorDC(Va,t);

figure;
plot(t,Vm)
title('V_m=3')
xlabel('Time[s]')
ylabel('Voltage[v]')
%%
Va=(3.000001)*heaviside(t-5);
Vm=MotorDC(Va,t);

figure;
plot(t,Vm)
title('V_m=3.000001')
xlabel('Time[s]')
ylabel('Voltage[v]')

%%
[u,t] = gensig('square',10,15,0.001);
u=4*u+4;

Vm=MotorDC(u,t);

figure;
plot(t,u)
hold on;
plot(t,Vm)
xlabel('Time[s]')
ylabel('Voltage[v]')

legend('input voltage','motor voltage')
hold off;
%%
figure;
s=tf('s');
K=1.35;
T=0.13;
motorTrFcn=K/(T*s+1);
step(motorTrFcn);
