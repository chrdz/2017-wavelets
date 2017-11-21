function [ ] = plot_phipsi( qmf, titre, taille)
% Plot fonction d'echelle et ondelette en fonction du filtre donne

%%%%%%% Fonction d'échelle V_-5 %%%%%%%%
figure;

D = zeros(taille, 1); 
D(22) = 1;
S = IWT_PO(D, 5, qmf); 
TF = abs(fft(S));
plot(TF);
legend('phi -5,22');
title(titre);

figure;
D = zeros(taille,1); 
D(23) = 1;
S = IWT_PO(D,5,qmf); 
TF = abs(fft(S));
plot(TF);
legend('phi -5,23');
title(titre);

figure;
D = zeros(taille, 1); 
D(24) = 1;
S = IWT_PO(D, 5, qmf); 
TF = abs(fft(S));
plot(TF);
legend('phi -5,24');
title(titre);

%%%%%%% Ondelettes V_-5 %%%%%%%%
figure;
D = zeros(taille, 1); 
D(40) = 1;
S = IWT_PO(D, 5, qmf); 
TF = abs(fft(S));
plot(TF);
legend('psi -5,40');
title(titre);

D = zeros(taille, 1); 
D(41) = 1;
S = IWT_PO(D, 5, qmf); 
TF = abs(fft(S));
plot(TF);
legend('psi -5,41');
title(titre);

figure;
D = zeros(taille, 1); 
D(42) = 1;
S = IWT_PO(D, 5, qmf); 
TF = abs(fft(S));
plot(TF);
legend('psi -5,42');
title(titre);

%%%%%%% Ondelettes V_-8 %%%%%%%%

figure;
D = zeros(taille, 1); 
D(300) = 1;
S = IWT_PO(D, 5, qmf); 
TF = abs(fft(S));
plot(TF);
legend('psi -8,300');
title(titre);

figure;
D = zeros(taille, 1); 
D(301) = 1;
S = IWT_PO(D, 5, qmf); 
TF = abs(fft(S));
plot(TF);
legend('psi -8,301');
title(titre);

end

