function Srec = Mystere2 ( S,n )

FS=fft(S); %fast fourier transform

[FSsort,I]=sort(FS,'descend'); %tri dans ordre décroissant

FStronc=0*FS;
FStronc2=FS.*(FS>FSsort(n+1)); %concerver les n plus grands éléments
FStronc(I(1:n))=FS(I(1:n));

Srec=real(ifft(FStronc)); %inverse fast fourier transorm
Srec2=real(ifft(FStronc));

%PLOTS:
close all;
plot(S);hold on;plot(Srec,'r');
title('Mystere2');legend('S','Srec');
hold off;
end

