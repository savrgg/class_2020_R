# Dataset transformation

## Formato largo y ancho de bases
En procesamiento de bases comunmente se utilizan dos tipos de layout (largo/long, ancho/wide). En el formato wide, se tiene un renglon por cada data point y multiples columnas que contienen los atributos. En el formato long, cada punto se repite n veces de acuerdo al nùmero de atributos. R viene con algunos databases integrados, mtcars es uno de ellos.

1. tidyr::gather() pasa de formato ancho a largo
2. tidyr::spread() pasa de formato largo a ancho

Ejemplo de formato ancho:

```r
library(tidyr)
wide_db <- 
  mtcars %>% 
  dplyr::mutate(car_type = row.names(.)) %>% 
  dplyr::filter(car_type == "Camaro Z28") 

wide_db
```

```
##    mpg cyl disp  hp drat   wt  qsec vs am gear carb   car_type
## 1 13.3   8  350 245 3.73 3.84 15.41  0  0    3    4 Camaro Z28
```


Ejemplo de formato largo:


```r
long_db <- 
  wide_db %>% 
  tidyr::gather(attribute, value, mpg:carb)
long_db
```

```
##      car_type attribute  value
## 1  Camaro Z28       mpg  13.30
## 2  Camaro Z28       cyl   8.00
## 3  Camaro Z28      disp 350.00
## 4  Camaro Z28        hp 245.00
## 5  Camaro Z28      drat   3.73
## 6  Camaro Z28        wt   3.84
## 7  Camaro Z28      qsec  15.41
## 8  Camaro Z28        vs   0.00
## 9  Camaro Z28        am   0.00
## 10 Camaro Z28      gear   3.00
## 11 Camaro Z28      carb   4.00
```

El formato que comunmente estamos acostumbrados es el ancho, pero para R y procesamiento de datos es más común y mejor práctica trabajar sobre formatos largos.
