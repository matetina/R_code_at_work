library(data.table)
library(ggplot2)

datos <- data.table(numero=runif(40)*100)
datos[1]
summary(datos)
datos[,minimo:=min(numero)]
datos[,maximo:=max(numero)]
datos[,numera:= numero - minimo]
datos[,denomina:=maximo - minimo]

datos[,summary(numero)]
datos[,summary(numera)]

datos[,sd(numero)]
datos[,sd(numera)]

plot(datos$numero)
points(datos$numera, col="blue")


datos[,numeronorm := numera/denomina]
plot(datos$numero)
plot(datos$numeronorm)


