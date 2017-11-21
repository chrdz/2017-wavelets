S=MakeSignal('Piece-Regular',1024);
plot(S);
qmf=MakeONFilter('Daubechies',4); %c'est le filtre h
TO=FWT_PO(S,7,qmf);

%projeter sur V-7: ie on garde juste les coeff de S dans la base de V-7
TOtemp=0*TO;
TOtemp(1:2^7)=TO(1:2^7);
Srec=IWT_PO(TOtemp,7,qmf); %transfo ondelettes inverse
hold on; plot(Srec,'r')