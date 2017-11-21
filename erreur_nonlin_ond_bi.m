function tab_erreur_ond = erreur_nonlin_ond_bi (j, S, qmf, dqmf, n_max)

TO = FWT_PB(S,j,qmf, dqmf);
[bla,I]=sort(abs(TO),'descend'); %tri dans ordre décroissant

tab_erreur_ond=zeros(1,n_max);
for n=1:n_max
    TOtronc=0*TO;
    TOtronc(I(1:n))=TO(I(1:n));
    Srec = IWT_PB(TOtronc,j,qmf,dqmf);
    tab_erreur_ond(n) = sum((S-Srec).^2);
end

end

