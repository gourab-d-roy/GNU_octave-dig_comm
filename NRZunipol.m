N=10;
m=randi([0 1],1,N+1);
t=0:.001:length(m);
i=1;
for j=1:length(t)
    if t(j)<=i
        y(j)=m(i);
        
    
    else
        y(j)=m(i);
        i=i+1;
end
end
plot(t,y,'r');
axis([0 N -1 2]);title("nrz unipol")
grid on;