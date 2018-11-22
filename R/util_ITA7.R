#=================================================================
# Funzioni di utilità per la lettura dei file 
# prodotti da ARPAE attraverso il modello NINFA sul dominio ITA7
# 22/11/2018 R. Amorati @ ARPAE
#=================================================================

library(sp)
library(raster)
library(maps)

read.ITA7.mean<-function(file.name="ITA7.nc",poll="PM10",geo.info="ITA7.config"){
# lettura del file ncdf con info geografiche nel file geo.info: 
# lat lon regolare (epsg: 2346) dlon=0.09 dlat=0.06
# 9 livelli verticali
# 25 istanti temporali (ore)
  
  source(geo.info)
#leggo il primo livello dell'inquinante poll
  r<-brick(file.name,level=1,varname=poll)
  #leggo matrice di lat e lon
  la<-raster(fi,level=1,varname="lat") #questo è un raster dei valori di lat 
  lo<-raster(fi,level=1,varname="lon") #questo è un raster dei valori di lon 
  lat<-values(la)
  lon<-values(lo)
  #ricavo dimensione matrice dal raster
  nx<-dim(r)[2]
  ny<-dim(r)[1]  
  #definisco il sistema di riferimento che conosco a priori
  projection(r)<-CRS(crs.ITA7)
  
  #coordinate degli estremi (riferiti al bordo della cella e non al centro)
  extent(r)<-extent(min(lon)-dx/2,max(lon)+dx/2,min(lat)-dy/2,max(lat)+dy/2) 
  
  #media giornaliera sugli istanti da 0 a 23 (butto il 25esimo)
  m<-mean(dropLayer(r,25)) #media giornaliera
  return(m)
}

plot.ITA7<-function(m){
  #raster ottenuto con read.ITA7.mean()
  colori=c("green","yellow","orange","red","violet")
  breaks=c(0,25,50,75,100,1000)
  
  plot(m,
       col=colori,
       breaks=breaks,
       legend=FALSE, 
       main="model ITA7")
  map(regions="Italy",add=TRUE) #solo ita
  map(add=TRUE) #tutto
  
}

read.points.ITA7<-function(file.name="ITA7.nc",
                        poll="PM10",
                        geo.info="ITA7.config",
                        coords=coords){
  #coords: data.frame("Lon","Lat")
  m<-read.ITA7.mean(file.name=file.name,poll=poll,geo.info = geo.info)
  mod<-extract(m,coords)
  return(mod)
}
  