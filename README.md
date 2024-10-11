# dieselSerieTiempo
Analisis del cambio en el precio del diesel para el estado de Jalisco como serie de tiempo para determinar outliers

En este proyecto se pretende encontrar cambios anormales en la variación del precio al publico del diesel en el estado de jalisco, se tomaron los datos de https://www.gob.mx/cre/articulos/precios-vigentes-de-gasolinas-y-diesel de precio promedio de disel mensual para el estado de Jalisco.

Primero se importa la información y se pasa de un dataframe a una serie de tiempo, donde observamos el precio mensual historico promedio del diesel desde el año 2017 hasta septiembre de 2024
![Historico del precio del diesel para el estado de Jalisco](https://github.com/Cygnus000/dieselSerieTiempo/blob/main/historicoDiesel.png)

Observamos las variaciones anuales del precio del diesel

![Variación anual del precio del Diesel para el estado de Jalisco](https://github.com/Cygnus000/dieselSerieTiempo/blob/main/anualDiesel.png)

Descomponemos la serie de tiempo en sus componentes; Tendencia, estacionalidad y ruido aleatorio

![Descomposición de la serie de tiempo](https://github.com/Cygnus000/dieselSerieTiempo/blob/main/descomposicionDiesel.png)

Para poder analizar la serie de tiempo la diferenciamos para convertirla en una serie estaciónaria, ahora observamos la diferencia en el precio entre un mes y el mes anterior

![Diferenciación de la serie de tiempo](https://github.com/Cygnus000/dieselSerieTiempo/blob/main/difDiesel.png)

Realizamos una estadistica basica para detectar outliers

![Visualización de la existencia de outliers](https://github.com/Cygnus000/dieselSerieTiempo/blob/main/boxplotdiesel.png)

Ahora empleamos ARIMA para detectar los valores atipicos, obtenemos los siguientes resultados

Outliers:
  type ind    time coefhat  tstat
1   AO  12 2018:01    2.14  3.320
2   AO  15 2018:04   -2.90 -4.500
3   AO  36 2020:01   -2.20 -3.414
4   AO  39 2020:04    2.26  3.507
5   AO  48 2021:01    2.00  3.103

![Valores atipicos](https://github.com/Cygnus000/dieselSerieTiempo/blob/main/outliersArima.png)


