% CREATION DES SIGNAUX

taille = 1024;

S1 = MakeSignal('Piece-Regular', taille);       % Batman,
S1 = S1/norm(S1, 2);
%plot(S1)

S2 = MakeSignal('Blocks', taille);              % Town
S2 = S2/norm(S2, 2);
%figure;
%plot(S2);

S3 = MakeSignal('Piece-Polynomial', taille);    % Castle
S3 = S3/norm(S3, 2);
%figure; 
%plot(S3);

S4 = MakeSignal('HeaviSine', taille);           % Mountain
S4 = S4/norm(S4, 2);
%figure;
%plot(S4);

S5 = MakeSignal('Ramp', taille);                % Factory
S5 = S5/norm(S5, 2);
%figure;
%plot(S5);

% VISUALISATION DES ONDELETTES ET DES FONCTIONS D'ECHELLE

% HAAR
%qmf = MakeONFilter('Haar');
%plot_phipsi(qmf, 'Haar', taille);
%plot_phipsi_V0(qmf, 'Haar', taille);

qmf = MakeONFilter('Daubechies',4);
%plot_phipsi(qmf, 'Daubechies 4', taille);

%qmf = MakeONFilter('Coiflet', 1);
%plot_phipsi(qmf, 'Coiflet 1', taille);

%qmf = MakeONFilter('Daubechies', 8);
%plot_phipsi(qmf, 'Daubechies 8', taille);

%qmf = MakeONFilter('Coiflet', 2);
%plot_phipsi(qmf, 'Coiflet 2', taille);

% ETAPES TRANSFO ONDELETTES

S = S3;
TO = FWT_PO(S, 4, qmf);
%plot(TO,'.')

% TRANSFORMEE DE FOURIER DES ONDELETTES

S = S1; 
TF = abs(fft(S));
%plot(TF,'.')

qmf = MakeONFilter('Daubechies',4);
%plot_phipsi_fft(qmf, 'Daubechies 4', taille);

% APPROXIMATION LINEAIRE

S=S2;
j=7
TO=FWT_PO(S,j,qmf);

%projeter:
TOtemp=0*TO;
TOtemp(1:2^j)=TO(1:2^j);
Srec=IWT_PO(TOtemp,j,qmf);
figure; plot(S); hold on; plot(Srec,'r');
legend('S','Srec');
title('Projection');

%erreur = norm(S-Srec, 2)^2
erreur = sum((S-Srec).^2)

tab_erreur_ond=zeros(1,10);
for j=10: -1 : 1
    TO = FWT_PO(S,j-1,qmf);
    TOtemp = 0*TO;
    TOtemp(1:2^(j-1)) = TO(1:2^(j-1));
    Srec = IWT_PO(TOtemp,j-1,qmf);
    nb_pas_zeros_ond(j)=sum(1*(TOtemp~=0));
    tab_erreur_ond(j) = sum((S-Srec).^2);
end
%figure; plot(1:10, tab_erreur_ond);
%title('Erreur Projection sur V-j (abscisse : j+1)');

%%%

tab_erreur_fft = zeros(1,10);
for j=10: -1 : 1
    n = 2^(j-1);
    TF = fft(S); %fast fourier transform
    TF(n+1:taille-n+1) = 0; 
    Srec = real(ifft(TF)); %inverse fast fourier transorm
    nb_pas_zeros_fft(j)=sum(1*(TF~=0));
    tab_erreur_fft(j) = sum((S-Srec).^2);
end
figure; 
plot(1:10, tab_erreur_ond);
hold on;
plot(1:10, tab_erreur_fft);
title('Erreur Projections sur V-j et fft (abscisse : j+1)');
legend('V-j', 'fft');


