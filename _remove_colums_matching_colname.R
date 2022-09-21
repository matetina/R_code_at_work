######verwijder Auto-gerelateerde kolommen

Vtgkol<-Polis[,which(colnames(.SD) %like% "Vtg" |  colnames(.SD) %like% "Bmt" )]
Vtgkol
Polis<-Polis[,!..Vtgkol]



### Verwijder mkb kolommen:
a<-Polis[,grep("OPS.", colnames(Polis))]
Polis<-Polis[,!(..a)]

