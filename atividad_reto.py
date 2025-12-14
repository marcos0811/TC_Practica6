import control as ctrl
import matplotlib.pyplot as plt
import numpy as np
R = 5
L = 0.1
C = 220e-6

# funcion de transferencia 
num = [1/(L*C)]
den = [1, R/L, 1/(L*C)]
G = ctrl.TransferFunction(num, den)

# controlador PID
Kp = 58.54
Ki = 2466.27
Kd = 0.116
N = 6.06e5
Cpid = ctrl.tf([Kd*N, Kp*N, Ki], [1, N, 0])

# sistema en lazo cerrado
T = ctrl.feedback(ctrl.series(Cpid, G), 1)
# respuesta al escalon
t, y = ctrl.step_response(T)

# entrada escalon
u = np.ones_like(t)  

plt.figure()
plt.plot(t, u, 'k--', label='Entrada Escalón')  
plt.plot(t, y, 'b', label='Salida del Sistema')
plt.title('Respuesta del sistema PID-RLC')
plt.xlabel('Tiempo [s]')
plt.ylabel('Voltaje [V]')
plt.grid(True)
plt.legend()
plt.show()
