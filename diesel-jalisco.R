#https://www.gob.mx/cre/articulos/precios-vigentes-de-gasolinas-y-diesel

library(tidyverse)
library(lubridate)
library(tseries)
library(lubridate)
library(tidyverse)
library(foreign)
library(lmtest)
library(mFilter)
library(nlme)
library(lmtest)
library(broom)
library(knitr)
library(MASS)
library(parallel)
library(dplyr)
library(tidyr)
library(forecast)
library(stats)
library(quantmod)
library(tseries)
diesel1 <- read.csv("C:\\Users\\Usuario\\Desktop\\diesel-jalisco.csv", header=TRUE)
View(diesel1)
attach(diesel1)
diesel1$Fecha <- ym(diesel1$Fecha)



class(diesel1$Fecha)
diesel=diesel1
diesel.ts=ts(diesel$Diesel, start=c(2017,01,01), frequency=12)
plot(diesel.ts)
#seasonplot(diesel.ts,col=rainbow(12),
#           year.labels=F,
#           year.labels.left = TRUE,
#           season.labels = TRUE,
#           labelgap = 10,
#)
series = ggseasonplot(diesel.ts, col=rainbow(12), year.labels=TRUE,
                      xlab = "Dia",
                      ylab = "Precio")
plot(series)
ndiffs(diesel.ts)
acf(diesel.ts)
Pacf(diesel.ts)

seriedif=diff(diesel.ts)
print(mean(seriedif))
print(var(abs(seriedif)))
plot(seriedif)
acf(seriedif)
ndiffs(seriedif)

dmes = diesel
dmes$Fecha <- as.Date(dmes$Fecha)
dmes$Meses <- months(dmes$Fecha)
dmes$Anio <- format(dmes$Fecha,format="%y")
dmes = aggregate( Diesel~Meses+Anio, dmes , mean )
dmes.ts=ts(dmes$Diesel,start=2017, frequency=12)
plot(dmes.ts)
series2 = ggseasonplot(dmes.ts, col=rainbow(12), year.labels=TRUE,
                       xlab = "Mes",
                       ylab = "Precio")
plot(series2)
ndiffs(dmes.ts)
#acf(dmes.ts)
#Pacf(dmes.ts)

seriediff=diff(dmes.ts)
boxplot(seriediff)
plot(seriediff)
#acf(seriediff)
#ndiffs(seriediff)
birthstimeseriescomponents <- decompose(dmes.ts)
plot(birthstimeseriescomponents)
#plot(seriediff)
#abline(h=var(1.5*abs(seriediff)))

library(tsoutliers)
outliers <- tso(seriediff) 
plot(outliers)
print(outliers)

plot(seriediff)
abline(h=var(1.5*abs(seriediff)))

#test <- t.test(x1,x2)
