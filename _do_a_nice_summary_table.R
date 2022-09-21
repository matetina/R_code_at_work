Jaaroverzicht_Schade <- Schadedata[,.(BulkSchadeGeleden=round(sum(GeledenIBNRBulk),0),
                                      ExcessSchadeGeleden=round(sum(GeledenIBNRExcess),0),
                                      GeledenSchade=round(sum(GeledenIBNR),0),
                                      GemiddeldSchadebedragCapped=round(mean(GeledenIBNRBulk),2)),by=c("Schadejaar","Dekking")]
setorder(Jaaroverzicht_Schade,"Dekking","Schadejaar")