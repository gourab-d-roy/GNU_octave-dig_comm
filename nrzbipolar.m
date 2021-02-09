clc;
clear all;
close all;
%generate message signal
N=10; m=randi([0 1],1,N)
t=0:0.01:length(m);
f=1;
for n=1:length(m)
    if m(n)==1
        if f==1
            mm(n)=1;
            f=-1;
        else
            mm(n)=-1;
        f=1;
    end
end
end
i=1;

for j=1:length(t)
    if  t(j)<=i
        y(j)=mm(i);
    
else
    y(j)=mm(i);
    i=i+1;
    
    end
end
plot(t,y);
axis([0 N -2 2]);
grid on;
title('nrz bipol');