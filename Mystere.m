function Srec = Mystere ( S,n )
%Mystere Summary of this function goes here
%   Detailed explanation goes here

FS=fft(S); %fast fourier transform
N=length(S);

FS(n+1:N-n+1)=0; %on garde tout sauf les 40 1ers éléments et les 40 derniers éléments

Srec=real(ifft(FS)); %inverse fast fourier transorm

%PLOTS:
close all;
plot(S);hold on;plot(Srec,'r');
title('Mystere');legend('S','Srec');
hold off;

end

