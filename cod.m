close all;
%sistema de primer orden inestable
G1 = tf(1,[2 1]); % sistema estable
G2 = tf(1,[2 -1]); %ssitema inestabel
subplot(1,2,1);
step(G1); 
title('Respuesta del escalon de un sistema de primer orden Sistema estable'); 
legend('Respuesta al escalon');
grid on;
subplot(1,2,2);step(G2);
title('Respuesta del escalon de un sistema de primer orden Ssitema inestable'); 
legend('Respuesta al escalon');
grid on;

%% sistema de segundo orden

w = 1;

z1 = 0;%sistema no amortiguado
z2 = 0.1; %sistema subamoriguado
G3 = tf([w^2],[1 2*z1*w w^2]);
G4 = tf([w^2],[1 2*z2*w w^2]);


subplot(2,2,1); step(G3); xlim([0 30]); title('Sistema inestable osilante Sistema no amoritugado');
subplot(2,2,2); step(G4); xlim([0 30]); title('Sistema inestable osilante Sistema subamortiguado');
subplot(2,2,3); pzmap(G3); ylim([-1.1 1.1]); title('Diagrama de polos y ceros');
subplot(2,2,4); pzmap(G4); ylim([-1.1 1.1]);xlim([-0.2 0.2]); title('Diagrama de polos y ceros');
%%
w = 1;

z3 = 1;%sistema criticamente amoritgado
z4 = 2.23; %sistema sobreamoritguado
G5 = tf([w^2],[1 2*z3*w w^2]);
G6 = tf([w^2],[1 2*z4*w w^2]);


subplot(2,2,1); step(G5); xlim([0 30]); ylim([0 1.5]);title('Sistema inestable osilante Criticamente amoritugado');
subplot(2,2,2); step(G6); xlim([0 30]); ylim([0 1.5]); title('Sistema inestable osilante Sobre amorituado');
subplot(2,2,3); pzmap(G5); ylim([-1.1 1.1]); title('Diagrama de polos y ceros');
subplot(2,2,4); pzmap(G6); ylim([-1.1 1.1]);xlim([-0.2 0.2]); title('Diagrama de polos y ceros');

%% sistemas inestables 
G7 = tf(1,[1 -0.5 4]);
G8 = tf(1,[25 -12.5 1]);

subplot(2,2,1); step(G7); xlim([0 30]);ylim([-400 400]); title('Sistema inestable osilante');
subplot(2,2,2); step(G8); xlim([0 30]); ylim([0 5e4]); title('Sistema inestable no osilante');
subplot(2,2,3); pzmap(G7); ylim([-2.1 2.1]); title('Diagrama de polos y ceros');
subplot(2,2,4); pzmap(G8); ylim([-1.1 1.1]);xlim([-0.2 0.2]); title('Diagrama de polos y ceros');

%% sistemas de lazo cerrado

G9 = tf(3,[1 0]);
G10 = tf(1,[1 0 1]);
H1 = 3;

G = series(G9,G10);
P = feedback(G,H1,-1);
step(P);
xlim([0 10]);
ylim([-3000 1000]);
