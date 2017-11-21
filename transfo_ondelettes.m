S=MakeSignal('Piece-Regular',1024);
plot(S);
qmf=MakeONFilter('Haar'); %c'est le filtre h

TO=FWT_PO(S,7,qmf);
%changement de base orthog de V-10 vers la base de la decomposition de V-10
%union de bases V-9 W-9
%log base 2 de 1024 = 10

%hold on; plot(TO);

%projeter sur V-7:
TOtemp=0*TO;
TOtemp(1:2^7)=TO(1:2^7);
Srec=IWT_PO(TOtemp,7,qmf); %transfo ondelettes inverse
hold on; plot(Srec,'r')
legend('S','Srec')