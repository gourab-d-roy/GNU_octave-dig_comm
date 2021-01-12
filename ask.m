﻿%ASK Modulation
clc;
clear all;
close all;
%GENERATE CARRIER SIGNAL
Tb=1; fc=10;
t=0:Tb/100:1;
c=sqrt(2/Tb)*sin(2*pi*fc*t);
%generate message signal
N=10; m=rand(1,N)
t1=0; t2=Tb;
for i=1:N
    t=[t1:.01:t2];
    if m(i)>0.5
        m(i)=1;
        m_s=ones(1,length(t));
    else
        m(i)=0;
        m_s=zeros(1,length(t));
end
message(i,:)=m_s;
%product of carrier and message
ask_sig(i,:)=c.*m_s;
t1=t1+(Tb);
t2=t2+(Tb);
%plot the message and ASK signal
subplot(5,1,1);axis([0 N -2 2]); plot(t,message(i,:),'r');
title('message signal'); xlabel('t--->'); ylabel('m(t)'); grid on
hold on
subplot(5,1,3); plot(t,ask_sig(i,:));
title('ASK signal'); xlabel('t--->'); ylabel('s(t)');grid on
hold on
%Plot the carrier signal and input binary data
subplot(5,1,2); plot(t,c); title('carrier signal');
xlabel('t--->'); ylabel('c(t)'); grid on
hold on 
end %for ends
%upto this modulation done

%demodulation part starts
t1=0; t2=Tb;
for i=1:N
t=[t1:.01:t2];
%correlator part defined
x(i)=sum(c.*ask_sig(i,:));
%decision part defined
if x(i)>0
        x(i)=1;
        x_s=ones(1,length(t));
    else
        x(i)=0;
        x_s=zeros(1,length(t));
end
xs(i,:)=x_s;
t1=t1+(Tb);
t2=t2+(Tb);
 subplot(5,1,4);axis([0 N -2 2]); plot(t,xs(i,:),'b');title('demod sig');
 xlabel('t--->'); ylabel('d(t)');grid on
 hold on
end
