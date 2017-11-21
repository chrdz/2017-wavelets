function [ ] = plot_phipsi( qmf, titre, taille)
% Plot fonction d'echelle et ondelette en fonction du filtre donne

%%%%%%% Fonction d'échelle V_-5 %%%%%%%%
figure;

D = zeros(taille, 1); 
D(22) = 1;
S = IWT_PO(D, 5, qmf); 
plot(S); hold on; 

D = zeros(taille,1); 
D(23) = 1;
S = IWT_PO(D,5,qmf); 
plot(S); 

D = zeros(taille, 1); 
D(24) = 1;
S = IWT_PO(D, 5, qmf); 
plot(S);

%%%%%%% Ondelettes V_-5 %%%%%%%%

D = zeros(taille, 1); 
D(40) = 1;
S = IWT_PO(D, 5, qmf); 
plot(S);
D = zeros(taille, 1); 
D(41) = 1;
S = IWT_PO(D, 5, qmf); 
plot(S);

D = zeros(taille, 1); 
D(42) = 1;
S = IWT_PO(D, 5, qmf); 
plot(S);

%%%%%%% Ondelettes V_-8 %%%%%%%%

D = zeros(taille, 1); 
D(300) = 1;
S = IWT_PO(D, 5, qmf); 
plot(S);

D = zeros(taille, 1); 
D(301) = 1;
S = IWT_PO(D, 5, qmf); 
plot(S);

legend('phi -5,22','phi -5,23','phi -5,24', 'psi -5,40','psi -5,41','psi -5,42' ,'psi -8,300','psi -8,301');
title(titre);

end

