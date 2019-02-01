#==========================================================
# Esempio di lettura dei dati da file ncdf 
# prodotti dal modello NINFA su dominio ITA7
# 
# La matrice è latlon regolare (epsg:2346) 
# con passo di griglia dlon=0.09, dlat=0.06
# Il file contiene nove livelli in verticale, di cui viene 
# estratto il primo.
# Nel file ci sono 25 istanti temporali (ore)
#
# 22/11/2018 R. Amorati @ ARPAE
#===========================================================

#carico librerie
library(sp)

#imposto la dir della procedura aq-data-fusion
#setwd("/home/giggino/procdir/quelchele'")  

#carico funzioni di utilità
source("R/util_ITA7.R")

#definisco file di configurazione della matrice ITA7
geo.info<-"config/ITA7.config"

#definisco il nome del file nc ITA7
fi<-"data/test-case-20181013//out.2018101300_2018101400_PM10_ITA7.nc"

#leggo il raster e ne faccio la media giornaliera
m<-read.ITA7.mean(file.name = fi,poll="PM10",geo.info = geo.info)
#disegno la mappa
plot.ITA7(m)

#leggo un file di dati di test 
dati<-read.csv("data/test-case-20181013/asi-ispra-20181013_giornalieri.csv")

coords<-data.frame(dati$longitude,dati$latitude)
#so a priori che i dati hanno coordinate lat lon come il modello
obs<-SpatialPointsDataFrame(coords, data=data.frame("obs"=dati$value, row.names = NULL),proj4string=CRS(crs.ITA7), bbox = NULL)

#parametri per la grafica
colori=c("green","yellow","orange","red","violet")
breaks=c(0,25,50,75,100,1000)
#disegno i punti sopra la mappa
plot(obs,pch=21,col=1,bg=colori[cut(dati$value,breaks=c(0,25,50,75,100,1000))],add=TRUE)

#print(coords)
#estraggo il valore del modello sui punti coords
mod<-read.points.ITA7(file.name=fi,geo.info=geo.info,coords=coords)

#creo dataframe unico
dati<-cbind(dati,mod)
head(dati)
#statistica sui dati
plot(dati$mod,dati$Obs)
cor(dati$mod,dati$Obs, use="complete.obs")

#...


