%definindo parametros DH

syms theta1 theta2 

theta1 = theta1
theta2 = theta2

a1 = 4
a2 = 2

alpha1 = 0;
alpha2 = 0;

d1 = 0;
d2 = 0;

%transformação para saber a pos final 

A0_1 = [cos(theta1) -sin(theta1) 0 a1*cos(theta1); sin(theta1) cos(theta1) 0 a1*sin(theta1); 0 0 1 0; 0 0 0 1]
A1_2 = [cos(theta2) -sin(theta2) 0 a2*cos(theta2); sin(theta2) cos(theta2) 0 a2*sin(theta2); 0 0 1 0; 0 0 0 1]


T0_2 = A0_1*A1_2

%ponto x e y de origem

x0 = A0_1(1,4);
y0 = A0_1(2,4);

%ponto x e y efetuador final
x2 = T0_2(1,4);
y2 = T0_2(2,4);

%plotando o robo varias vezes

time = 0

xlim([0,6])
ylim([0,6])
grid on

while time < 1

   theta1 = cos(time)
   theta2 = sin(time)

   x0 = a1*cos(theta1)
   y0 = a1*sin(theta1)

   x2 = a1*cos(theta1) + a2*cos(theta1)*cos(theta2) - a2*sin(theta1)*sin(theta2)
   y2 = a1*sin(theta1) + a2*cos(theta1)*sin(theta2) + a2*cos(theta2)*sin(theta1)


    elo1 = line([0 x0],[0 y0],'linew',4)
    elo2 = line([x0 x2],[y0 y2],'linew',2)
   
    pause(0.01)

    delete(elo1)
    delete(elo2)

    time = time + 0.01
end
