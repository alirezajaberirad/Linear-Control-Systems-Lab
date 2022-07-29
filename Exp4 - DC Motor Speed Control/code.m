clc; close all;
%% checking PID parameters effects
s=tf('s');
P=1.3/(0.15*s+1);
Kp=1;
Ki=3;
Kd=3;
Gc=Kp+Ki/s+Kd*s;
step(feedback(P*Gc,1));
title('PID parameters analysis');

%% analysing system response while existance of different control systems
%part one
Kp=4.7; Ki=0; Kd=0;
Gc=Kp+Ki/s+Kd*s;
syms t;
figure;
fplot(heaviside(t), 'r');
hold on;
step(feedback(P,1),'k');
step(1-feedback(P,1),'c');

G1=P*Gc;
step(feedback(G1,1));
step(1-feedback(G1,1),'g');
ylim([-0.1,1.1]);
xlim([-0.1,10]);
legend('Input','Regular system output','Regular system error','Controlled system output','Controlled system error')
title('Part 1')
hold off;

%part two
Gc=(s+4.7)/(s+1);
figure;
fplot(heaviside(t), 'r');
hold on;
step(feedback(P,1),'k');
step(1-feedback(P,1),'c');

G2=P*Gc;
step(feedback(G2,1));
step(1-feedback(G2,1),'g');
ylim([-0.1,1.1]);
xlim([-0.1,10]);
legend('Input','Regular system output','Regular system error','Controlled system output','Controlled system error')
title('Part 2')
hold off;

%part three
Gc=1+4.7/s;
figure;
fplot(heaviside(t), 'r');
hold on;
step(feedback(P,1),'k');
step(1-feedback(P,1),'c');

G3=P*Gc;
step(feedback(G3,1));
step(1-feedback(G3,1),'g');
ylim([-0.1,1.1]);
xlim([-0.1,10]);
legend('Input','Regular system output','Regular system error','Controlled system output','Controlled system error')
title('Part 3')
hold off;

%part four: system poles
initialSystemPole=pole(feedback(P,1))
G1pole=pole(feedback(G1,1))
G2poles=pole(feedback(G2,1))
G3poles=pole(feedback(G3,1))