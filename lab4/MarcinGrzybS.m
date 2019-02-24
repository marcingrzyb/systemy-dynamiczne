%Marcin Grzyb
%1
Ampli1=1;
Freq1=1;
sim('lab4m1');
figure('Name','Zadanie1');
hold on;
plot(tout,sout);
plot(tout,sinin);
grid on;
hold off;
%2
figure('Name','Zadanie2');
Gs = tf([1],[1 1 2]);
Gsp = tf([1 0],[1 -0.1 1]);
nyquist(Gs,Gsp);
%3
GD = tf([1],[4 1]);
GG = tf([0.4 0],[0.4 1]);
GP = tf([1 0], [1 2 1]);
G2 = tf([1], [1 0.1 1]);
filtry={'Filtr dolnoprzepustowy','Filtr górnoprzepustowy','Filtr pasmoprzepustowy','Filtr drugiego rzêdu'};
figure('Name','Zadanie3');
hold on
bode(GD,GG,GP,G2);
legend(filtry,'Location','southwest')
hold off
topl=[[0 0 1];[0 0.4 0];[0 1 0];[0 0 1]]; %lista licznikow
botl=[[0 4 1];[0 0.4 1];[1 2 1];[1 0.1 1]];%lista mianownikow
amplil=[2,3,1,2,4];
freql=[0.001,1,30,0.01,5];
phasel=[1,5,2,1,0];
for f=1:4
    top=topl(f,:);
    bot=botl(f,:);
    figure('Name','Zadanie3');
    sim('lab4m3');
    plot(suma);
    title(filtry(f));
    %figure;
    %sim('experiment');  potwierdza wniosek dot. sumy
    %plot(sumaa);
for i = 1:5
    figure('Name','Zadanie3');
    hold on;
    ampli=amplil(i);
    freq=freql(i);
    phase=phasel(i);   
    sim('lab4m2');
    plot(tout,sout);
    plot(tout,sinin);
    title([filtry(f),'Amplitude= ',ampli,'Frequency= ',freq,'Phase= ',phase]);
    hold off; 
    
end
end
%4
f=sqrt(11); %sqrt(len(imie+nazwisko))
fgr=(1/10)*f;
RC=1/(2*pi*fgr);
disp(RC);
