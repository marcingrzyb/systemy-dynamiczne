%Marcin Grzyb
clear all;
%zadanie 1
t=0:0.01:1;
epsilon = 0.3;%wybor wartosci epsilon
%opcje=odeset('RelTol',epsilon,'AbsTol',epsilon*epsilon);

%przyklad1
figure('Name','zadanie1');
hold on;
axis([0 1 -4 4]);
title('Ilustracja stabilnosci punktow rownowagi dla 1 przyk³adu');
for x0=-2:0.5:2
        sol = ode45(@(t,x) funkcja1(x,epsilon,0),t,x0);%metoda Dormanda-Prince
        plot(sol.x, sol.y(1,:),'b');
        plot(0, 0, 'rx'); %sprawdzany punkt równowagi
        plot(0, 1/epsilon, 'rx'); %sprawdzany punkt równowagi
end
%przyklad 2
Tspan = [0, 10];
figure ('Name','zadanie1');
axis([-3 3 -1 3]);
hold on;
title('Portret fazowy dla 2 przyk³adu');
for i=-2:0.5:2
        for j=-2:0.2:2
            x0 = [i j]; %wektor WPC
            [~,y]= ode45(@(t,x) funkcja2(x,0), Tspan, x0);
            plot(y(:,1),y(:,2),'blue');
            ylabel('x2');
            xlabel('x1');           
        end
        plot(0,0,'r*'); %sprawdzany punkt równowagi
end 

%przyklad3
figure('Name','zadanie1'); 
axis([-3 3 -3 3]);
hold on;
title('Portret fazowy dla 3 przyk³adu');
for i=-3:0.5:3
        for j=-3:0.5:3
            x0 = [i,j]; %wektor WPC
            [~,y] = ode45(@(t,x) funkcja3(x,0), Tspan, x0);
            plot(y(:,1),y(:,2),'blue');
            ylabel('x2');
            xlabel('x1');           
        end
        plot(0,0,'r*');%sprawdzany punkt równowagi
        plot(-2/3,0,'r*');%sprawdzany punkt równowagi
end 
hold off;   
%zadanie 2
eps=0.3;%wartosc epsilon
for i=0:1
    figure('Name','zadanie2');
    hold on;
    for x0=-3:1:3
        if i==0
            sol = ode45(@(t,x) funkcja1(x,eps,0),t,x0);
            sol1 = ode45(@(t,x) funkcja1(x,eps,1),t,x0);
            plot(sol.x, sol.y,'b'); %system dok³adny
            plot(sol1.x, sol1.y,'r'); %system linearyzowany
        else
            sol = ode45(@(t,x) funkcja1(x,eps,0),t,x0);
            sol2 = ode45(@(t,x) funkcja1(x,eps,2),t,x0);
            plot(sol.x, sol.y,'b'); %system dok³adny
            plot(sol2.x, sol2.y,'r'); %system linearyzowany
        end
    end
end


%zadanie 3
for h=0:1
    figure('Name','zadanie3');
    hold on;
    for i=-3:0.5:3
        for j=0:0.2:2
            x0 = [i,j]; %wektor WPC
            if h==0
                [~,y] = ode45(@(t,x) funkcja2(x,0), Tspan, x0);
                plot(y(:,1), y(:,2),'b'); %system dok³adny
            else 
                [~,y] = ode45(@(t,x) funkcja2(x,1), Tspan, x0);
                plot(y(:,1),y(:,2),'r'); %system linearyzowany
            end
            ylabel('x2');
            xlabel('x1');
        end
        plot(0,0,'r*');%sprawdzany punkt równowagi
    end 
end
 %zadanie 4
 for h=0:1
     figure('Name','zadanie4');
     axis([-5 5 -5 5]);
     hold on;
        for i=-3:0.5:3
            for j=-3:0.5:3
                x0 = [i,j]; %wektor WPC
                if h==0
                [~,y] = ode45(@(~,x) funkcja3(x,0), Tspan, x0);
                plot(y(:,1), y(:,2),'b'); %system dok³adny
                [~,y1] = ode45(@(~,x) funkcja3(x,1), Tspan, x0);
                plot(y1(:,1), y1(:,2),'r'); %system linearyzowany
                else
                [~,y] = ode45(@(~,x) funkcja3(x,0), Tspan, x0);
                plot(y(:,1), y(:,2),'b'); %system dok³adny
                [~,y1] = ode45(@(~,x) funkcja3(x,2), Tspan, x0);
                plot(y1(:,1), y1(:,2),'r'); %system linearyzowany
                end
                ylabel('x2');
                xlabel('x1');
            end
            plot(0,0,'black*');
            plot(-2/3,0,'black*');%sprawdzany punkt równowagi
        end
 end
 
%funkcje
function [y] = funkcja1(x,epsilon,mode)
if (mode==0)
    y = -x+epsilon*x^2;
elseif(mode==1)
    y = -x;
else 
    y = x-1/epsilon;
end
end

function [y] = funkcja2(x,mode)
if(mode==0)
    y=[-x(1); -x(2)^2];
else 
    y = [-1 0; 0 0]*x;
end
end

function [y] = funkcja3(x,mode)
if (mode==0)
    y = zeros(2,1);
    y(1) = x(2);
    y(2) = -2*x(1) - 3*x(1)^2 - x(2);
elseif(mode==1)
    y = [0 1; -2 -1]*x;
else
    y = [0 1; 2 -1]*(x-[-2/3;0]);
end
end