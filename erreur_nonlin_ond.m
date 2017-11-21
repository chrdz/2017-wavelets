function tab_erreur_ond = erreur_nonlin_ond (j, S, qmf, n_max)

TO = FWT_PO(S,j,qmf);
[bla,I]=sort(abs(TO),'descend'); %tri dans ordre décroissant

tab_erreur_ond=zeros(1,n_max);
for n=1:n_max
    TOtronc=0*TO;
    TOtronc(I(1:n))=TO(I(1:n));
    Srec = IWT_PO(TOtronc,j,qmf);
    tab_erreur_ond(n) = sum((S-Srec).^2);
end

end

