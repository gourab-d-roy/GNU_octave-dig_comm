clc;
clear all;
close all;
%GENERATE CARRIER SIGNAL
Tb=1; f1=5; f2=2;
t=0:Tb/100:1;
c1=sqrt(2/Tb)*sin(2*pi*f1*t);
c2=sqrt(2/Tb)*sin(2*pi*f2*t);
%generate message signal
N=10; m=rand(1,N)
t1=0; t2=Tb;
for i=1:N
    t=[t1:.01:t2];
    if m(i)>0.5
        m(i)=1;
        m_s=ones(1,length(t));
        invm_s=zeros(1,length(t));
    else
        m(i)=0;
        m_s=zeros(1,length(t));
        invm_s=ones(1,length(t));
end
message(i,:)=m_s;
%product of carrier and message
fsk_sig1(i,:)=c1.*m_s;
fsk_sig2(i,:)=c2.*invm_s;
t1=t1+(Tb);
t2=t2+(Tb);
fsk_sig(i,:)=fsk_sig1(i,:)+fsk_sig2(i,:);
%plot the message and fSK signal
subplot(5,1,1);axis([0 N -2 2]); plot(t,message(i,:),'r');
title('message signal'); xlabel('t--->'); ylabel('m(t)'); grid on
hold on
subplot(5,1,4); plot(t,fsk_sig(i,:));
title('fSK signal'); xlabel('t--->'); ylabel('s(t)');grid on
hold on
subplot(5,1,2); plot(t,c1); title('carrier signal1');
xlabel('t--->'); ylabel('c1(t)'); grid on
hold on 
subplot(5,1,3); plot(t,c2); title('carrier signal2');
xlabel('t--->'); ylabel('c2(t)'); grid on
hold on 
end
%modulation part ends


%demodulation part starts
t1=0; t2=Tb;
for i=1:N
t=[t1:.01:t2];
%correlator part defined
x1(i)=sum(c1.*fsk_sig(i,:));
x2(i)=sum(c2.*fsk_sig(i,:));
x3(i)=x1(i)-x2(i);
if x3(i)>0
        x1(i)=1;
        x_s=ones(1,length(t));
    else
        x3(i)=0;
        x_s=zeros(1,length(t));
end
xs(i,:)=x_s;
t1=t1+(Tb);
t2=t2+(Tb);
 subplot(5,1,5);axis([0 N -2 2]); plot(t,xs(i,:),'b');title('demod sig');
 xlabel('t--->'); ylabel('d(t)');grid on
 hold on
end