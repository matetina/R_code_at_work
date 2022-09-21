##### OBJ_TYP
PBT11[,maxdatum := max(REG_DAT), by=OBJ_TYP]
PBT11<-PBT11[REG_DAT == maxdatum]
PBT11<-unique(PBT11, by=c("OBJ_TYP","OMS_RGL_NR"))  ### dcast werkt niet met gedupliceerde regels
PBT11<-dcast(PBT11, OBJ_TYP ~ OMS_RGL_NR, value.var =  "OBJ_OMS_TEKST")