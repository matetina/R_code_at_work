

#####Maak een random subset van de  grote datasets voor toekomstige referenties, voorbeelden of tests####

library(readr)
setwd("G:/Acceptatie/Productbeheer/02-Producten/AVP/201907 AVP Resultatenanalyse/02_Data/05_Preprocessing")

PolisAVP<-fread("2019-11-07_Polisdata_AVP_bewerkt.csv",dec = ",")
SchadeAVP<-fread("2019-11-07_Schadedata_AVP_bewerkt.csv",dec = ",")
example_subset_polis_avp<-PolisAVP[sample(nrow(PolisAVP), 0.02*nrow(PolisAVP)), ]
example_subset_schade_avp<-SchadeAVP[sample(nrow(SchadeAVP), 0.02*nrow(SchadeAVP)), ]

#Uitschrijven 
CurrentDate <- Sys.Date()
fwrite(example_subset_polis_avp,paste0(CurrentDate,"_example_subset_polis_avp.csv"), sep=";", dec=",")
fwrite(example_subset_schade_avp,paste0(CurrentDate,"_example_subset_schade_avp.csv"), sep=";", dec=",")
