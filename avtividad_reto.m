R = 5;
L = 0.1;
C = 220e-6;

num = 1/(L*C);
den = [1 R/L 1/(L*C)];
G = tf(num, den);

Kp = 58.54;
Ki = 2466.27;
Kd = 0.116;
N = 6.06e5;

Cpid = tf([Kd*N Kp*N Ki],[1 N 0]);

T = feedback(series(Cpid, G),1);

step(T);
grid on;
xlabel('Tiempo [s]');
ylabel('Voltaje [V]');
title('Respuesta del sistema PID-RLC');
legend('Entrada Escalón','Salida del Sistema');
