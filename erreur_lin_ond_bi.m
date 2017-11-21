function [ tab_erreur_ond_bi ] = erreur_lin_ond_bi( S, qmf, dqmf )
%erreur_lin_ond retourne tableau erreur d'
% approx lin en fonction de j.

tab_erreur_ond_bi=zeros(1,10);
for j=10: -1 : 1
    TO = FWT_PB(S,j-1,qmf,dqmf);
    TOtronc = 0*TO;
    TOtronc(1:2^(j-1)) = TO(1:2^(j-1));
    Srec = IWT_PB(TOtronc,j-1,qmf,dqmf);
    tab_erreur_ond_bi(j) = sum((S-Srec).^2);
end

end

