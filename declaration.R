### to make a declariation of days traveled to a destination ###


#### First download declatation in CSV from myy ns
### SAave toi destination. If multiple files, run this code in shell
## cd destination
## ls > filename.csv


library(data.table)




#### IF single file from ns.nl ####
dir_reizen<-"H:/la titina/OV"
setwd(dir_reizen)
reizen <- fread("reistransacties.csv")


### IF  multiple files from  my ov.nl  ##
# 
# dir_reizen<-"H:/la titina/OV/my_ov"
# setwd(dir_reizen)
# 
# files<-fread("outputdos.csv",skip = 9,nrows = 11,  header = F, dec=",", sep = " ")
# 
# reizen<-fread(files[1,V5])
# 
# for (i in 2:nrow(files)) {
#   temp<-fread(files[i,V5])
#   reizen <- rbind(reizen,temp)
# }
# 




#### Start

str(reizen)
reizen[,summary(Datum)]
reizen[,Datum := as.Date(Datum, format = "%d-%m-%Y" )]
reizen[,table(month(Datum))]

#### Select days to Zoetermeer or centrum-West

reizen[Bestemming %like% "West",unique(Bestemming)]

reizen[Bestemming %like% "Zoe" | Bestemming %like% "West",.N]
reizen[Vertrek %like% "Zoe" | Vertrek %like% "West",.N]

datums_kantoor<-reizen[Bestemming %like% "Zoe" | Bestemming %like% "West",.(Datum)]
datums_kantoor<-rbind(datums_kantoor, reizen[Vertrek %like% "Zoe" | Vertrek %like% "West",.(Datum)])
datums_kantoor<-datums_kantoor[,.(Datum=unique(Datum))]
datums_kantoor[,.N] #27
datums_kantoor[,weekdag := weekdays.Date(Datum)]
datums_kantoor[,table(weekdag)]
datums_kantoor[,table(weekdag, month(Datum))]

fwrite(datums_kantoor,"datums-formulier.csv")


