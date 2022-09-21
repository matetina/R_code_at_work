
##### Object type toevoegen #####

PBT11[,maxdatum := max(REG_DAT), by=OBJ_TYP]
 

PBT11<-PBT11[REG_DAT == maxdatum]

PBT11<-unique(PBT11, by=c("OBJ_TYP","OMS_RGL_NR"))  ### dcast werkt niet met gedupliceerde regels
 

PBT11<-data.table( dcast(PBT11, OBJ_TYP ~ OMS_RGL_NR, value.var =  "OBJ_OMS_TEKST"))
 

colnames(PBT11)<-c("ObjObjTyp", "C1","C2","C3","C4","C5","C6")
 

PBT11[,ObjTypOms:=  str_replace_all( str_squish( paste0(C1,C2,C3,C4,C5,C6)), "NA", "")]
 

Polis<-merge(Polis,PBT11[,.(ObjObjTyp,ObjTypOms)], by="ObjObjTyp", all.x = T)