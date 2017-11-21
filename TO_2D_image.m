function [] = TO_2D_image(image, nom_image, qmf1,qmf2,titre1,titre2)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

figure('units','normalized','outerposition',[0 0 1 1])
im=imread(image);
im=im2double(im);
% imagesc(im);

ax1 = subplot(2,3,1);
TO= FWT2_PO(im,9,qmf1);
mesh(TO);
title(['transfo ondelettes de ',nom_image,' V-9, ',titre1]);

ax2 = subplot(2,3,2);
TO= FWT2_PO(im,8,qmf1);
mesh(TO);
title(['transfo ondelettes de ',nom_image,' V-8+W-8+... ',titre1]);

ax3 = subplot(2,3,3);
TO= FWT2_PO(im,7,qmf1);
mesh(TO);
title(['transfo ondelettes de ',nom_image,' V-7+W-7+... ',titre1]);

ax4 = subplot(2,3,4);
TO= FWT2_PO(im,9,qmf2);
mesh(TO);
title(['transfo ondelettes de ',nom_image,' V-9 ',titre2]);

ax5 = subplot(2,3,5);
TO= FWT2_PO(im,8,qmf2);
mesh(TO);
title(['transfo ondelettes de ',nom_image,' V-8+W-8+... ',titre2]);

ax6 = subplot(2,3,6);
TO= FWT2_PO(im,7,qmf2);
mesh(TO);
title(['transfo ondelettes de ',nom_image,' V-7+W-7+... ',titre2]);

end

