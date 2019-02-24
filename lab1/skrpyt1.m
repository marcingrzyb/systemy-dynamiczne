%Marcin Grzyb
WPC=5; %wartosc poczatkowa
R=10; %opor
C=0.1; %pojemnosc
K=1/(R*C);
steptime=5;
initval=3;
open('modelab1') 
sim('modelab1') %symulacja modelu
plot(tout,x,tout,x1) %tworzenie wykresu
grid on; %siatka
xlabel('czas[s]'); %podpis osi X
ylabel('Napiecie[v]'); %podpis osi Y
title('wykres sterowania i napiecia od czasu'); %tytul wykresu
