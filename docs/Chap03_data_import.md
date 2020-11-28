# Importar datos
Una parte importante al usar R es importar datos desde un archivo externo de datos. Las extensiones más comunes de estos archivos son separados por coma: `*.csv`, archivos de excel `*.xlsx`, `*.xls`, archivos de SPSS `*.sav`, archivos de STATA `*.dta` o archivos de SAS `*.sas`

## Archivos **.csv**
Importar archivos desde csv con R se puede realizar de tres maneras: Con la función: `utils::read.csv()`, con la función `readr::read_csv()` y con la funcion `data.table::fread()`. 

La función más rápida es `fread()`del paquete `data.table`, seguida de la función `read_csv` y después la función `read.csv`. Las ventajas de la función `read_csv` es que el parsing de las columnas es más facil; es decir, detecta mejor si es una columna numérica, si tiene formato de fecha, de caracter, etc. Por otra parte la única ventaja de la función `read.csv` es que viene incluida en la paquetería **core** de R.

En mi opinión, si se tiene una cantidad moderada de datos y se quiere hacer análisis de datos, la función óptima es `read_csv`.

## Archivos **.xlsx y .xls**

Para leer archivos `xlsx` y `xls` también hay distintas opciones, entre ellas los paquetes `XLConnect`, `xlsx`, `gdata` y `readxl`. Cada uno de estos paquetes tiene distintas funcionalidades y provienen de diferentes paradigmas, pero la opción que les recomendaría es la función `read_excel()` del paquete `readxl`.

La instalación del paquete es muy rápida y tiene compatibilidad con otros paquetes de análisis de datos de R. Esta función trabaja de la siguiente manera:

readxl::read_excel()

## Otros formatos de archivos **.sav**, **.data**, **.sas**

Al igual que las dos subsecciones pasadas, hay distintos paquetes para leer archivos de SPSS, STATA y SAS, pero una de las mejores opciones es el paquete `haven`. Este paquete permite importar y exportar estos archivos facilmente:

haven::read_spss()

haven::read_stata()

haven::read_sas()

Una de los principales motivos de la selección de estos paquetes es que son compatibles con una colección de paquetes que se les llama el tidyverse, el cual fue diseñado por Hadley Wickham, el CEO de RStudio. Esta colección está diseñada bajo la misma gramática, filosofía y estructuras de datos. En estas notas hay una sección especial dedicada a esta colección de paquetes.


## Ejercicios de práctica
### Ejercicio 4

```r
library(readr)
readr::write_csv(mtcars, "data/mtcars/mtcars.csv")
file <- readr::read_csv("data/mtcars/mtcars.csv")
```

```
## 
## ── Column specification ────────────────────────────────────────────────────────
## cols(
##   mpg = col_double(),
##   cyl = col_double(),
##   disp = col_double(),
##   hp = col_double(),
##   drat = col_double(),
##   wt = col_double(),
##   qsec = col_double(),
##   vs = col_double(),
##   am = col_double(),
##   gear = col_double(),
##   carb = col_double()
## )
```

```r
readr::write_delim(mtcars, "data/mtcars/mtcars.txt", delim = "\t")
file <- readr::read_delim("data/mtcars/mtcars.txt", delim = "\t")
```

```
## 
## ── Column specification ────────────────────────────────────────────────────────
## cols(
##   mpg = col_double(),
##   cyl = col_double(),
##   disp = col_double(),
##   hp = col_double(),
##   drat = col_double(),
##   wt = col_double(),
##   qsec = col_double(),
##   vs = col_double(),
##   am = col_double(),
##   gear = col_double(),
##   carb = col_double()
## )
```

### Ejercicio 5

```r
library(readxl)
library(writexl)

writexl::write_xlsx(mtcars, "data/mtcars/mtcars.xlsx")
file <- readxl::read_excel("data/mtcars/mtcars.xlsx")
```

### Ejercicio 6

```r
library(haven)

haven::write_sas(mtcars, "data/mtcars/mtcars.sas7bdat")
file <- haven::read_sas("data/mtcars/mtcars.sas7bdat")
```
