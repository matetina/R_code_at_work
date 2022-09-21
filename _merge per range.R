Schade[,ClaimID_match := 1:nrow(Schade)]
Polis[,regel := 1:nrow(Polis)]

setnames(regio_tabel, c("Postcode van", "Postcode tot"), c("Pstart", "Pend"))
setkey(regio_tabel,"Pstart", "Pend")
PolisPC<-Polis[!is.na(PC4),.(Pstart = unique(PC4))]
PolisPC[,Pend := Pstart]

a<-foverlaps(PolisPC, regio_tabel, type="any", which=TRUE)


######################


# _ Postcode ######

setnames(regio_tabel, c("Postcode van", "Postcode tot"), c("Pstart", "Pend"))
setkey(regio_tabel,"Pstart", "Pend")

PClijst<- unique(Polis[!is.na(PC4),.(Pstart=PC4,  Pend = PC4)])
regio_lijst<-foverlaps(PClijst,regio_tabel)

regio_lijst<-unique(regio_lijst[,.(huidige_regio = Regio, PC4 = i.Pstart)])

Polis<-merge(Polis,regio_lijst, by="PC4")
