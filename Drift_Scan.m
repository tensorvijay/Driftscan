H=hours*60*60
M=minutes*60
S=seconds
V=voltage.*(5/1024)



%T=H+M+S
%T=double(T)



%plot(T,V)

%V1=V(1:1000)
%T1=T(1:1000)
%V2=V(2950:3000)
%T2=T(2950:3000)

%plot(T,V)

X=[1:size(V,1)]'

%plot(X,V)


%polynomialfit

M=bsxfun(@power,X,[4 3 2 1 0])

Vs=(M'*M)\(M'*V)

figure 
plot(X,polyval(Vs,X),X,V)


T1=polyval(Vs,X)

Res=V-T1
%%%%%%%%%%%%%%%%%%%%%%%%%%Duration based drift plot%%%%%%%%%%%%%%%%%%%%
A = duration(11,57,0);
B = duration(12,22,0);
C = linspace(A,B,size(V,1))'  %creating time intervals as per the data

plot(C,Res)

hold on

plot(C,T1)
xlabel('time')
ylabel('voltage')

hold on 

plot(C,V)

%%%%%%%%%Fourier spectrum for single side spectrum %%%%%%%%%%%%%%
Fs = 1;            % Sampling frequency                    
T = 1/Fs;             % Sampling period       
L = 1500;             % Length of signal
t = (0:L-1)*T;        % Time vector

Y = fft(Res);

P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);

f = Fs*(0:(L/2))/L;

figure
plot(f,P1) 
title('Single-Sided Amplitude Spectrum of X(t)')
xlabel('f (Hz)')
ylabel('|P1(f)|')

%figure
%image(f,C)               % Time vector



%TS.TimeInfo.Units='hours'

%figure
%plot(TS,V)
%figure
%plot(ts,V)


%t1 = datetime(2020,2,23,11,57,0);
%t2 = datetime(2020,2,23,12,22,0);
%t = t1:t2

 %t1 = datetime(2014,1:5,1)

 
 %%%code part done %%%%%%%%%%%%%%%%%%%%%%%%%