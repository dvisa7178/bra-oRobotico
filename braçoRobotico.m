%definindo parametros DH
%%%%%%%%% Dados de entrada %%%%%%%%%%%%%%%
theta1 = 0 %ângulo da junta1
theta2 = 0
h = 0.05 % passo do ângulo
a1 = 1 %tamanho do elo1
a2 = 0.5
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%Esta parte é feita para encontrar a posição do atuador final
% %%%%%%(convenção de Denhavit-Hartemberg)
% %%%%%% Necessita do matlab simbólico
% syms theta1 theta2 a1 a2
%%alpha1 = 0; %Só usaria em outro maniipulador, não neste
%%alpha2 = 0;
%%d1 = 0; %Só usaria em outro manipulador, não neste
%%d2 = 0;
% A0_1 = [cos(theta1) -sin(theta1) 0 a1*cos(theta1); sin(theta1) cos(theta1) 0 a1*sin(theta1); 0 0 1 0; 0 0 0 1]
% A1_2 = [cos(theta2) -sin(theta2) 0 a2*cos(theta2); sin(theta2) cos(theta2) 0 a2*sin(theta2); 0 0 1 0; 0 0 0 1]
% T0_2 = A0_1*A1_2
% ponto x e y de origem
% x0 = A0_1(1,4);
% y0 = A0_1(2,4);
% ponto x e y efetuador final
% x2 = T0_2(1,4)
% y2 = T0_2(2,4)
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% plotando o robo varias vezes
%Inicialização dos ângulos
time1 = 0
time2 = 0
%definindo a janela gráfica
xlim([0,2])
ylim([0,2])
grid on

% plotando o robo varias vezes
for i=1:pi/h

   theta1 = time1
   theta2 = time2

   x0 = a1*cos(theta1)
   y0 = a1*sin(theta1)

   x2 = a1*cos(theta1) + a2*cos(theta1)*cos(theta2) - a2*sin(theta1)*sin(theta2)
   y2 = a1*sin(theta1) + a2*cos(theta1)*sin(theta2) + a2*cos(theta2)*sin(theta1)

   x3(i) = a1*cos(theta1) + a2*cos(theta1)*cos(theta2) - a2*sin(theta1)*sin(theta2) %(i) guarda as coordenadas em um vetor 
   y3(i) = a1*sin(theta1) + a2*cos(theta1)*sin(theta2) + a2*cos(theta2)*sin(theta1)

    elo1 = line([0 x0],[0 y0],'linew',4)
    elo2 = line([x0 x2],[y0 y2],'linew',2)
    
    pause(0.01)

    delete(elo1)
    delete(elo2)

    time1 = time1 + 0.01
    time2 = time1/2


end

 %%%%%%% Plotagem da trajetória
 elo1 = line([0 x0],[0 y0],'linew',4)
 elo2 = line([x0 x2],[y0 y2],'linew',2)
 
 hold on %% segue na mesma janela
 plot(x3,y3,'k.')

