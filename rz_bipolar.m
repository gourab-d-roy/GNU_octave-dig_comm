clc;
clear all;
close all;
%generate message signal
N=5; m=randi([0 1],1,N)
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
    else mm(n)=0;
end
end
t=0:.01:length(m);
a=0;b=0.5;i=1;
for j=1:length(t)
    if t(j)>=a && t(j)<=b
        y(j)=mm(i);
    
    elseif t(j)>=b && t(j)<=i
        y(j)=0;
    else
    i=i+1;
    a=a+1;
    b=b+1;
    end
end
plot(t,y,'r'); axis([0 N -2 2]);grid on;
title("rz bipol")