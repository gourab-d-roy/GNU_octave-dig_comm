clc
N=5;
m=randi([0 1],1,N);
i=1;
t=0:0.001:length(m);
for j=1:length(t)
    if m(i)==1
        mm(i)=1;
    else
        mm(i)=-1;
    end
        

    if t(j)<=i
       y(j)=mm(i);
        
    else
        y(j)=m(i);
        i=i+1;
      
    end
end
plot(t,y);
axis([0 N -2 2]);
grid on;
title('nrz-pol');