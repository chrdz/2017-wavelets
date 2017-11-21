function [ ] = plot_phipsi_V0( qmf, titre, taille)
% Plot fonction d'echelle de V0

%%%%%%% Fonction d'échelle V_-5 %%%%%%%%
figure;

D = zeros(taille, 1); 
D(1) = 1;
S = IWT_PO(D, 0, qmf); 
plot(S); hold on; 

% D = zeros(taille,1); 
% D(2) = 1;
% S = IWT_PO(D,0,qmf); 
% plot(S); 
% 
% D = zeros(taille, 1); 
% D(3) = 1;
% S = IWT_PO(D, 0, qmf); 
% plot(S);

% D = zeros(taille, 1); 
% D(4) = 1;
% S = IWT_PO(D, 0, qmf); 
% plot(S); 
% 
% D = zeros(taille,1); 
% D(5) = 1;
% S = IWT_PO(D, 0, qmf); 
% plot(S); 
% 
% D = zeros(taille, 1); 
% D(6) = 1;
% S = IWT_PO(D, 0, qmf); 
% plot(S);
% 
% D = zeros(taille, 1); 
% D(7) = 1;
% S = IWT_PO(D, 0, qmf); 
% plot(S);
% 
% D = zeros(taille, 1); 
% D(8) = 1;
% S = IWT_PO(D, 0, qmf); 
% plot(S); 

legend('phi 0,0');
% legend('phi 0,0','phi 0,1','phi 0,2', 'phi 0,3','phi 0,4','phi 0,5' ,'phi 0,6','phi 0,7');
title(titre);

end

