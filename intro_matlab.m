clc
% x=[0:0.01:3];
% y=x.^3;
% plot(x,y,'r')

% [X,Y] = meshgrid(-13:1:13,-13:1:13);
% Z=X.^2 + Y.^2;
% surf(X,Y,Z,Z)

% s=0;
% for h=1:10
%     s=s+h;
% end
% s

X=rand(10,1)
[Y,I]=sort(X,'descend') %I = les indices des éléments rangés dans l'ordre décroissant
%Z=X(I); Z=X.*(X>Y(4));
Z1=0*X;Z1=X.*(X>Y(5+1)) %on garde les trois plus grands éléments de X
Z2=0*X;Z2(I(1:5))=X(I(1:5)) %on garde les cinq plus grands éléments

X=[1;5;8;10;3;2]
[Y,I]=sort(X,'descend') %I = les indices des éléments rangés dans l'ordre décroissant
%Z=X(I); Z=X.*(X>Y(4));
Z1=0*X;Z1=X.*(X>Y(3+1)) %on garde les trois plus grands éléments de X
Z2=0*X;Z2(I(1:3))=X(I(1:3)) %on garde les cinq plus grands éléments