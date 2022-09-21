
## ----measure---------------------------------------------------------------------------------------

### chiquillo
fit_sevchi <-  glm(GeledenIBNRBulk ~  GemeentegrootteBinsNewSev + BouwjaarBins,
                   data=Polis[TrainingTest=="Train" & GeledenIBNRBulk>1],
                   family = Gamma(link="log"))
summary(fit_sevchi)
coefCh<-data.table(summary(fit_sevchi)$coefficients)
coefCh[,b := round(exp(as.numeric(Estimate)),5)]


DataC<-Data[RecordID %in% c(2569554,9442052)]

predsevC<-as.data.table(predict(fit_sevchi, DataC, type = "response" ))
DataC<-cbind(DataC,predsevC)
setnames(Data, "V1", "pred_sev")

Data[,verwachte := pred_sev*N_schades]
