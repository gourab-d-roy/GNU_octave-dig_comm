﻿clc;
clear all;
close all;
N=5;
m=randi([0 1],1,N)
mmm=[];
t=0:0.01:length(m);
a=0.5;i=1;
for n=1:length(m)
    if m(n)==0
        mm=[-1 1];
    else
        mm=[1 -1];
    end
    mmm=[mmm mm];
end
for j=1:length(t)
    if t(j)<=a
        y(j)=mmm(i);
    else
        y(j)=mmm(i);
        i=i+1;
        a=a+0.5;
    end
end
plot(t,y,'r');axis([0 N -2 2]);title('manchester');
xlabel('t--->');ylabel('y(t)');grid on;