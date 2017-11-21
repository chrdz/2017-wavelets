%  CREATION D'UNE FONCTION COSINUS DANS LA BASE DES COSINUS
FS=zeros(1024,1); %initialisation d'un vecteur de taille 1024
FS(5)=3; %5 nombre de bosses du cosinus, 3 amplitude du cosinus

%  BASE COSINUS --> BASE CANONIQUE
S=idct(FS); %donne le cosinus dans la base canonique
plot(S);

%  AJOUTE DU BRUIT
Sb=S+0.1*randn(1024,1); %n pour normal : bruit gaussien
hold on; plot(Sb,'r');title('Sb');legend('S','Sb');

%  BASE CANONIQUE --> BASE COSINUS
FSb=dct(Sb); %dct changement de base
figure;plot(FSb);title('FSb');

%  GARDE COEFFICIENTS COMPRIS ENTRE -2 ET 2
FSd=FSb.*(abs(FSb)>2);
figure;plot(FSd);title('FSd');

%  BASE COSINUS --> BASE CANONIQUE
Sd=idct(FSd); %idct transformée inverse de dct

figure;plot(S);hold on;plot(Sd,'g');title('Sd');legend('S','Sd')