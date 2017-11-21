
%%%%%%fonctions échelle%%%%%%%

qmf=MakeONFilter('Daubechies',4);
%figure;plot(qmf);title('qmf');

figure;

D=zeros(1024,1); 
D(23)=1;
S=IWT_PO(D,5,qmf); 
plot(S);hold on; 

D=zeros(1024,1); 
D(24)=1;
S=IWT_PO(D,5,qmf); 
plot(S);

D=zeros(1024,1); 
D(22)=1;
S=IWT_PO(D,5,qmf); 
plot(S); legend('phi -5,23','phi -5,24','phi -5,22');title('Daubechies fonctions d echellle');

%%%%%%%

qmf=MakeONFilter('Haar');
%figure;plot(qmf);title('qmf');

figure;

D=zeros(1024,1); 
D(23)=1;
S=IWT_PO(D,5,qmf); 
plot(S);hold on; 

D=zeros(1024,1); 
D(24)=1;
S=IWT_PO(D,5,qmf); 
plot(S);

D=zeros(1024,1); 
D(22)=1;
S=IWT_PO(D,5,qmf); 
plot(S); legend('phi -5,23','phi -5,24','phi -5,22');title('Haar fonctions d echellle');

%%%%%%%

qmf=MakeONFilter('Coiflet',2);
%figure;plot(qmf);title('qmf');

figure;

D=zeros(1024,1); 
D(23)=1;
S=IWT_PO(D,5,qmf); 
plot(S);hold on; 

D=zeros(1024,1); 
D(24)=1;
S=IWT_PO(D,5,qmf); 
plot(S);

D=zeros(1024,1); 
D(22)=1;
S=IWT_PO(D,5,qmf); 
plot(S); legend('phi -5,23','phi -5,24','phi -5,22');title('Coifflet fonctions d echellle');

%%%%%%%

%%%%%%%ondelettes-5%%%%%%%%

qmf=MakeONFilter('Haar');
%figure;plot(qmf);title('qmf');

figure;

D=zeros(1024,1); 
D(40)=1;
S=IWT_PO(D,5,qmf); 
plot(S);hold on; 

D=zeros(1024,1); 
D(41)=1;
S=IWT_PO(D,5,qmf); 
plot(S);

D=zeros(1024,1); 
D(42)=1;
S=IWT_PO(D,5,qmf); 
plot(S); legend('psi -5,40','psi -5,41','psi -5,42');title('Haar ondelettes');

%%%%%%%

qmf=MakeONFilter('Daubechies',4);
%figure;plot(qmf);title('qmf');

figure;

D=zeros(1024,1); 
D(40)=1;
S=IWT_PO(D,5,qmf); 
plot(S);hold on; 

D=zeros(1024,1); 
D(41)=1;
S=IWT_PO(D,5,qmf); 
plot(S);

D=zeros(1024,1); 
D(42)=1;
S=IWT_PO(D,5,qmf); 
plot(S); legend('psi -5,40','psi -5,41','psi -5,42');title('Daubechies ondelettes');

%%%%%%%

qmf=MakeONFilter('Coiflet',2);
%figure;plot(qmf);title('qmf');

figure;

D=zeros(1024,1); 
D(40)=1;
S=IWT_PO(D,5,qmf); 
plot(S);hold on; 

D=zeros(1024,1); 
D(41)=1;
S=IWT_PO(D,5,qmf); 
plot(S);

D=zeros(1024,1); 
D(42)=1;
S=IWT_PO(D,5,qmf); 
plot(S); legend('psi -5,40','psi -5,41','psi -5,42');title('Coiflet ondelettes');

%%%%%%%

%%%%%%%ondelettes-8%%%%%%%%
qmf=MakeONFilter('Haar');
%figure;plot(qmf);title('qmf');

figure;

D=zeros(1024,1); 
D(250)=1;
S=IWT_PO(D,5,qmf); 
plot(S);hold on; 

D=zeros(1024,1); 
D(251)=1;
S=IWT_PO(D,5,qmf); 
plot(S);

legend('psi -8,250','psi -8,250');title('Haar ondelettes');

%%%%%%%

qmf=MakeONFilter('Daubechies',4);
%figure;plot(qmf);title('qmf');

figure;

D=zeros(1024,1); 
D(250)=1;
S=IWT_PO(D,5,qmf); 
plot(S);hold on; 

D=zeros(1024,1); 
D(251)=1;
S=IWT_PO(D,5,qmf); 
plot(S);

legend('psi -8,250','psi -8,250');title('Daubechies ondelettes');

%%%%%%%

qmf=MakeONFilter('Coiflet',2);
%figure;plot(qmf);title('qmf');

figure;

D=zeros(1024,1); 
D(250)=1;
S=IWT_PO(D,5,qmf); 
plot(S);hold on; 

D=zeros(1024,1); 
D(251)=1;
S=IWT_PO(D,5,qmf); 
plot(S);

legend('psi -8,250','psi -8,250');title('Coiflet ondelettes');

%%%%%%%

% D=zeros(2^14,1);
% D(16)=1;
% S=IWT_PO(D,5,qmf);
% figure;plot(S);