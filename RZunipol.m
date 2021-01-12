clc;
clear all;
close all;
%generate message signal
N=5; m=randi([0 1],1,N)
t=0:.01:length(m);
a=0;b=0.5;i=1;
for j=1:length(t)
    if t(j)>=a && t(j)<=b
        y(j)=m(i);
    
    elseif t(j)>=b && t(j)<=i
        y(j)=0;
else
    i=i+1;
    a=a+1;
    b=b+1;
    end
end
  plot(t,y,'b'); axis([0 N -1 2]);grid on;