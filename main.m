clear all;
close all;

taille=1024;

% TRANSFO EN ONDELETTES BIORTHOGONALES :

% 1:

[qmf,dqmf] = MakeBSFilter('Villasenor',1);


% 2:

% afficher une ondelette de synthèse
%prendre un nombre supérieur strictement à 16
figure;
D = zeros(taille, 1); 
D(50) = 1;
Ond_Syn= IWT_PB(D,4,qmf,dqmf);
plot(Ond_Syn); hold on; legend('e50 - Psi W -5,k');title('ondelette de synthèse');

% afficher une ondelette d'analyse
%prendre un nombre supérieur strictement à 16
figure;
D = zeros(taille, 1); 
D(50) = 1;
Ond_Ana= IWT_PB(D,4,dqmf,qmf);
plot(Ond_Ana); hold on; legend('e50 - Psi W -5,k');title('ondelette d analyse');


% 3:
% produit scalaire L^2 entre polynomes et Ond
k=0;
t0=1:taille;t0=t0';
t=t0.^0;
%l'ondelette a forcément un moment d'ordre zero nul
while (k<=30) && (abs(sum(Ond_Ana.*t))<=10^(-8) == true)
    k=k+1;
    t=t0.^k;
end
disp(['Cette ondelette à ',num2str(k-1),' deux moments nuls']);
salut=Ond_Ana;

% 4:
S1 = MakeSignal('Piece-Regular', taille);S1 = S1/norm(S1, 2);
S2 = MakeSignal('Blocks', taille);S2 = S2/norm(S2, 2);
qmf_haar=MakeONFilter('Haar');
qmf_daub4 = MakeONFilter('Daubechies',4);

% j=5;
% TO = FWT_PB(S,j-1,qmf,dqmf);
% TOtronc = 0*TO;
% TOtronc(1:2^(j-1)) = TO(1:2^(j-1));
% Srec = IWT_PB(TOtronc,j-1,qmf,dqmf);
% err= sum((S-Srec).^2);
% figure;plot(S);hold on;plot(Srec);
% legend('signal original', 'signal projeté')
% title('Projection')

% APPROX LIN
% Piece Regular
tab_erreur_ond_bi = erreur_lin_ond_bi( S1, qmf, dqmf );
tab_erreur_ond_haar=erreur_lin_ond(S1,qmf_haar);
tab_erreur_ond_daub4=erreur_lin_ond(S1,qmf_daub4);


% affichage erreurs approx lin
figure('units','normalized','outerposition',[0 0 1 1])
ax1 = subplot(2,3,1);
plot(0:9, tab_erreur_ond_bi);hold on;
plot(0:9, tab_erreur_ond_haar);
plot(0:9, tab_erreur_ond_daub4);
legend('ondelettes biorthogonales', 'haar', 'daubechies 4');
xlabel('j');
title('Erreur Approx lin, proj sur V-j - Piece Regular');

% Blocks
tab_erreur_ond_bi = erreur_lin_ond_bi( S2, qmf, dqmf );
tab_erreur_ond_haar=erreur_lin_ond(S2,qmf_haar);
tab_erreur_ond_daub4=erreur_lin_ond(S2,qmf_daub4);

% affichage erreurs approx lin SUITE
ax2 = subplot(2,3,2);
plot(0:9, tab_erreur_ond_bi);hold on;
plot(0:9, tab_erreur_ond_haar);
plot(0:9, tab_erreur_ond_daub4);
legend('ondelettes biorthogonales', 'haar', 'daubechies 4');
xlabel('j');
title('Erreur Approx lin, proj sur V-j - Blocks');

% APPROX NON LIN
j=4;n_max=200;

% n=1024;
% TO = FWT_PO(S,j,qmf);
% [bla,I]=sort(TO,'descend');
% TOtronc=0*TO;
% TOtronc(I(1:n))=TO(I(1:n));
% Srec = IWT_PO(TOtronc,j,qmf);
% figure; plot(S); hold on; plot(Srec);

% Piece Regular
tab_erreur_ond_bi = erreur_nonlin_ond_bi (j, S1, qmf, dqmf, n_max);
tab_erreur_ond_haar = erreur_nonlin_ond (j, S1, qmf_haar, n_max);
tab_erreur_ond_daub4 = erreur_nonlin_ond (j, S1, qmf_daub4, n_max);

% affichage erreurs approx non lin
ax3 = subplot(2,3,3);
plot(1:n_max, tab_erreur_ond_bi); hold on;
plot(1:n_max, tab_erreur_ond_haar);
plot(1:n_max, tab_erreur_ond_daub4);
legend('ondelettes biorthogonales', 'haar', 'daubechies 4');
xlabel('j');
title('Erreur Approx non lin, garde n plus grands - Piece Reg');

% Blocks
tab_erreur_ond_bi = erreur_nonlin_ond_bi (j, S2, qmf, dqmf, n_max);
tab_erreur_ond_haar = erreur_nonlin_ond (j, S2, qmf_haar, n_max);
tab_erreur_ond_daub4 = erreur_nonlin_ond (j, S2, qmf_daub4, n_max);

% affichage erreurs approx non lin SUITE
ax4 = subplot(2,3,4);
plot(1:n_max, tab_erreur_ond_bi); hold on;
plot(1:n_max, tab_erreur_ond_haar);
plot(1:n_max, tab_erreur_ond_daub4);
legend('ondelettes biorthogonales', 'haar', 'daubechies 4');
xlabel('j');
title('Erreur Approx non lin, garde n plus grands - Blocks');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% TRANSFO EN ONDELETTES 2D:

% 5:
plot_2D_phipsi( qmf_haar, 'Haar', taille );
plot_2D_phipsi( qmf_daub4, 'Daubechies 4', taille );

% 6:
image='lenna.JPG';
TO_2D_image(image, 'lenna' ,qmf_haar,qmf_daub4, 'haar', 'daubechies 4');
image='cameraman.jpg';
TO_2D_image(image, 'cameraman',qmf_haar,qmf_daub4, 'haar', 'daubechies 4');
