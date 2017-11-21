function [ ] = plot_2D_phipsi( qmf, titre, taille )
% affiche des ondelettes et des fonction d'échelle

[X,Y] = meshgrid(1:1:taille,1:1:taille);

% figure;
figure('units','normalized','outerposition',[0 0 1 1])
ax1 = subplot(2,3,1);
D = zeros(taille, taille); 
D(1,1) = 1;
Ond_Syn= IWT2_PO(D,0,qmf);
mesh(X,Y,Ond_Syn);
title([titre,' fonction echelle V0']);

ax2 = subplot(2,3,2);
D = zeros(taille, taille); 
D(1,1) = 1;
Ond_Syn= IWT2_PO(D,1,qmf);
mesh(X,Y,Ond_Syn);
title([titre,' fonction échelle V-1']);

ax3 = subplot(2,3,3);
D = zeros(taille, taille); 
D(2,3) = 1;
Ond_Syn= IWT2_PO(D,1,qmf);
mesh(X,Y,Ond_Syn);
title([titre,' ondelette W-1']);

ax4 = subplot(2,3,4);
D = zeros(taille, taille); 
D(4,5) = 1;
Ond_Syn= IWT2_PO(D,2,qmf);
mesh(X,Y,Ond_Syn);
title([titre,' ondelette W-2']);

ax5 = subplot(2,3,5);
D = zeros(taille, taille); 
D(8,8) = 1;
Ond_Syn= IWT2_PO(D,4,qmf);
mesh(X,Y,Ond_Syn);
title([titre,' fonction echelle V-4']);

ax5 = subplot(2,3,6);
D = zeros(taille, taille); 
D(20,20) = 1;
Ond_Syn= IWT2_PO(D,4,qmf);
mesh(X,Y,Ond_Syn);
title([titre,' ondelette W-4']);
end

