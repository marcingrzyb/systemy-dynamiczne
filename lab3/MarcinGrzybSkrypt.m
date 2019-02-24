%Marcin Grzyb
%zadanie 1.
WPC=0.5;
lambdas=[-1.5,-1,-0.5,0,0.5,1,1.5];
stime=0.1;
for i = 1:length(lambdas)
    figure;
    lambda=lambdas(i);
    hold on;
    sim('lab3m1');
    plot(tout,out);
    title(['Uklad dyskretny dla lambda = ' num2str(lambdas(i)) ' oraz WPC= ' num2str(WPC)]);
    grid on;
end;
hold off;

%zadanie 2.
stime=0.1;%okres probkowania
WPC=0.5;
syms x;
A=[0,1;-6,-5];
B=[0;1];
C=[1,0;0,1];
D=[0;0];
Apl=expm(stime*A); %A^+
Bpl=double(int(expm(x*A)*B,x,0,stime)); %B^+
Cpl=C; %C^+
sim('lab3m2');
figure;
hold on;
plot(tout,out2);
title('Uklad dyskretno ciagly');
grid on;
hold off;

%zadanie 3.
K0=10000; %kapital poczatkowy
r = 0.05;%nominalna stopa procentowa
figure;
hold on;
for i =[1,2,3,4,6,12]
    m=0 : i : 12;
    rm=r/(length(m)-1);
    val=[K0];
    for j = 1:(length(m)-1)
        val=[val K0*(1+rm)^(j)];
    end
    plot(m,val,'DisplayName',['Okresy kapitalizacji ' num2str(12/i)]);
    legend('Location','northwest');
    xlabel('Miesiace trwania lokaty') 
    ylabel('Saldo') 
    ylim([10450 10520]);
    xlim([11 12]);
end
hold off;

%zadanie 4.
i = 0;
x0 = -1;%punkt startowy
MaxIter = 100;
epsilon = 1e-10;%dokladnosc
syms x;
f(x) = x.^3-2*x.^2-11*x+12; %funkcja
df = diff(f);  %pochodna

while i <= MaxIter
    xx = x0 - (f(x0)/df(x0));          
    if abs(xx - x0) <= epsilon && abs(f(x0))<=epsilon                    
        fprintf('Rozwiazanie to: %f ', double(xx))
            return
    end
 i = i + 1;
 x0 = xx;
end


    




