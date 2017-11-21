function [ tab_erreur_ond ] = erreur_lin_ond( S, qmf )
%erreur_lin_ond retourne tableau erreur d'
% approx lin en fonction de j.

tab_erreur_ond=zeros(1,10);
for j=10: -1 : 1
    TO = FWT_PO(S,j-1,qmf);
    TOtronc = 0*TO;
    TOtronc(1:2^(j-1)) = TO(1:2^(j-1));
    Srec = IWT_PO(TOtronc,j-1,qmf);
    tab_erreur_ond(j) = sum((S-Srec).^2);
end

end

