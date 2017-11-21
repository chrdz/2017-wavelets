% SIGNAL, dans V-10, 2^10=1024
S=MakeSignal('Piece-Regular',1024);S=S/norm(S,2);

% FILTRE
qmf=MakeONFilter('Daubechies',4);

% V-9
d=9;

%%%%%%%

S=MakeSignal('Piece-Regular',1024);
qmf=MakeONFilter('Daubechies',4);
j=9;
T=FWT_PO(S,j,qmf);
T2=T;
T2(513:1024)=0;
S2=IWT_PO(T2,j,qmf);


%PROJECTION SUR V-5
S=MakeSignal('Piece-Regular',1024);
qmf=MakeONFilter('Daubechies',4);
j=5;
T=FWT_PO(S,j,qmf);
T2=T;
T2(33:1024)=0; %2^j + 1
S2=IWT_PO(T2,j,qmf);

%erreur
%er=sum((S-Sr).^2)
er=sum(T(2^j +1 : 1024).^2)