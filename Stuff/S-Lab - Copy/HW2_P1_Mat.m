clear all;
close all;
clc
%% Variables
J=0.01;
B=0.13;
K=52;
theta_0=0.175;
dt=0.01;

%% Run simulink and plot
subplot(2, 1, 1)
sim('PS2_P2_sim.slx')
plot(t,theta)
title('Theta vs Time')
ylabel('Deflection (rad)')
grid minor
subplot(2, 1, 2)
plot(t,omega)
title('Omega vs Time')
ylabel('Angular Velocity (rad/sec)')
xlabel('Time (sec)')
grid minor
