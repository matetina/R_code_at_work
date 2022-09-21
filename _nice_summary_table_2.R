x<-Schade[,.(n_claims=length(unique(Schadenummer)),Gemiddelde_geleden_Schade=mean(GeledenIBNR), Maximale_geleden_schade=max(GeledenIBNR) ),by=Schadegebeurtenis.omschrijving][order(-n_claims)]
x