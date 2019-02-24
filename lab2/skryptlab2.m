%Marcin Grzyb
list = {'1.J=[0,0;0,0]',
  '2. J=[0,1;0,0]',
  '3. J=[0,0;0,-1]',
  '4. J=[-1,0;0,-2]',
  '5. J=[-1,0;0,-1]',
  '6. J=[-1,1;0,-1]',
  '7. J=[-1,0;0,1]',
  '8. J=[0,-1;1,0]',
  '9. J=[-1,-1;1,-1]'};
[indx,tf] = listdlg('ListString',list,'PromptString','Wybierz portret','SelectionMode','single');
switch indx
    case 1
        J=[0,0;0,0]; 
    case 2
        J=[0,1;0,0];
    case 3
        J=[0,0;0,-1];
    case 4
        J=[-1,0;0,-2];
    case 5 
        J=[-1,0;0,-1]; 
    case 6
        J=[-1,1;0,-1]; 
    case 7
        J=[-1,0;0,1]; 
    case 8 
        J=[0,-1;1,0];  
    case 9
        J=[-1,-1;1,-1];

end;
n=2;
P=eye(2)
%P=[2,0;0,1]
A=P*J*inv(P);
hold on;
norm1 = sqrt(P(1,1)^2+P(2,1)^2); %d³ugoœæ wektora w³asnego v1
norm2 = sqrt(P(1,2)^2+P(2,2)^2); %d³ugoœæ wektora w³asnego v2
quiver(0, 0, P(1,1)/norm1, P(2,1)/norm1); %rysowanie wykresu v1
quiver(0, 0, P(1,2)/norm2, P(2,2)/norm2); %rysowanie wykresu v2
%prosta dla wektora v1
V = [P(1,1) P(2,1)];  
factor = n;
p_start = V*factor;
p_end = -V*factor;
line([p_end(1), p_start(1)], [p_end(2), p_start(2)],'Color', 'r');   
%prosta dla wektora w2
V = [P(1,2) P(2,2)];
factor = n;
p_start = V*factor;
p_end = -V*factor;
line([p_end(1), p_start(1)], [p_end(2), p_start(2)],'Color', 'r');
for j = 0*pi:pi/10:2*pi
    WPC=[sin(j);cos(j)];
    %WPC=2*WPC;
    sim ('modelab2');
    plot(x(:,1),x(:,2),'g');
    p = max(abs(sin(j)),abs(cos(j)));
    WPC=[cos(j)/p;sin(j)/p]; 
    sim ('modelab2');
    plot(x(:,1),x(:,2),'c');
    if(indx==7) % przybli¿enie 
    xlim([-n n]);
    ylim([-n n]);
    end;
end;
xlabel('x1'); %opisy osi
ylabel('x2');
title(strcat('Portret fazowy'));
grid on;
hold off;

