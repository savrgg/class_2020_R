--- 
title: "ITAM - Curso R"
author: "Salvador García"
site: bookdown::bookdown_site
documentclass: book
bibliography: [book.bib]
biblio-style: apalike
link-citations: yes
github-repo: ''
url: ''
description: "Notas para el curso de R para Estadística 2 - Primavera 2020"
---
# Introduccion

Este curso está diseñado como un curso introductorio al lenguaje de programación R. Se hace una exploración rápida de la filosofia detrás de R, así como paquetes más usados y use cases más comunes.

## El lenguaje de programación R

1. R es un lenguaje de programación con un enfoque al análisis estadístico. 

2. R es un software libre de código abierto. De esta manera se permite hacer *profiling* y *debugging* a profundidad. (¡E instalarlo y utilizarlo en cualquier lugar!)

3. R es un software **hecho a la medida**; es decir, el usuario instala la paquetería necesaria a sus necesidades. 

## Paquetes y librerias de R

La primer diferencia para entender R, es entender la diferencia entre paquete y libreria. Paquete es el grupo de codigos que descargamos de internet y libreria es un paquete que se encuentra instalado y listo para usar.  

1. La paquetería básica de R está basada en librerías en Fortran y C (lenguajes de programación low level), creando *wrappers* que hacen referencia a las funciones originales. Por ejemplo, al calcular distintas factorizaciones de matrices (LU, Chol, QR, SVD, Schur) son calculadas utilizando la librería de *LAPACK*.

2. Algunas paqueterías requieren que el software este instalado en el sistema. Por ejemplo:

  + la mayoría de paquetería para manipulación de imágenes (png, jpeg, svg). Esta paquetería está por default instalada en Windows y macOS

  + la paquetería para simular MCMC (R2Jags, Rstan, R2OpenBUGS), Se tiene que instalar explícitamente en Windows y macOS, así como añadir a las respectivas variables de entorno

## Paradigma de R
1. ¿Es R un Lenguage orientado a objetos? R es considerado un lenguaje multiparadigma. Es decir, puede ser orientado a objetos o no, puede ser funcional o no, puede ser imperativo o no. Esta flexibilidad nace de la necesidad y la diversidad de usuarios. Por ejemplo, R tiene 3 sistemas distintos de programación orientada a objetos (más los heredados de otros lenguajes).

2. ¿R vs Python?
R y python son ambos lenguajes de alto nivel. Mucho se habla que Python es más eficiente que R (con varios papers realizando benchmarks), pero en la realidad ambos lenguajes presentan un performance mucho más bajo que lenguajes low level como C o C++. En mi opinión, si solo se requiere analizar datos, escribir scripts de automatización y modelar datos, R es la herramienta adecuada. Si se quiere tener cosas en productivo, Python es una herramienta adecuada. 


## Proyectos de R y Paths

Un proyecto en Rstudio tiene amplias ventajas ya que permite dividir el trabajo en distintos contextos, cada uno con su propio directorio de trabajo, historial de ejecución y códigos. Para poder crear un proyecto se requiere tener instalado RStudio. Se pueden crear proyectos en un nuevo directorio, en un directorio existente o clonando un repositorio de Github.

Para crear un nuevo proyecto, basta con dar click en `Archivo -> Nuevo proyecto` y seguir las instrucciones que aparecen. Una vez creado, aparecerá en el directorio del proyecto un nuevo archivo con extensión *.Rproj*. Este archivo contiene distintas configuraciones del proyecto. Además de este archivo, se crea el directorio oculto *.Rproj.user* donde aparecen las configuraciones específicas del proyecto. Finalmente, en la parte superior derecha aparece el nombre del proyecto.

Antes de profundizar en los proyectos, se explicarán brevemente los archivos:

1. *.Rprofile*: Hace referencia a un archivo oculto que contiene código en R que se ejecuta justo al iniciar R.
2. *.Rdata*: Contiene datos guardados del proyecto.
3. *.Rhistory*: Contiene un historial de los comandos ejecutados.

Adicional a esto, es necesario explicar el término **directorio de trabajo**. Los *filesystem* de Windows y macOS permiten ubicar un archivo o directorio a través de una ruta. Por ejemplo, en Windows las rutas son de la forma:

`C:\Users\usuario1\proyectos\curso_r`

En cambio, en macOS, los directorios son de la forma:

`/Users/usuario1/proyectos/curso_r`

Para no tener que escribir la ruta completa de un archivo, se define el **directorio de trabajo**. Por default, el directorio de trabajo es el mismo que la carpeta *home* del usuario, pero siempre es conveniente modificarlo. Para obtener el *directorio de trabajo* actual se utiliza la función `getwd()`, mientras que para modificarlo se utiliza la función `setwd()`.

Una vez explicados estos términos, se puede profundizar un poco más acerca de las funcionalidades del proyecto. Una vez creado, se puede abrir y cerrar las veces que sea necesario, pero lo importante es que cada vez que se abra el proyecto, se llevarán a cabo los siguientes pasos:

1. Se iniciará una nueva sesión de R. Por lo tanto, se tienen que cargar de nuevo las librerías (con `library()`)
2. Se carga el código que se encuentra en el archivo *.Rprofile*
3. Se cargan los datos almacenados en *.Rdata*
4. Se carga la historia del código ejecutado obtenida del archivo *.Rhistory*
5. El directorio de trabajo es configurado en la carpeta del proyecto actual
6. Se abren los archivos que se estaban editando cuando se cerro el proyecto
7. Se cargan otras configuraciones particulares del proyecto

## Instalación de R

Al instalar [R](https://cran.r-project.org), se instala la consola que permite la ejecución de código y funciones. Adicionalmente, se instalan las librerías **core** que permiten el correcto funcionamiento de R. Al iniciar una sesión de R, un subconjunto de las librerías **core** son cargadas automáticamente:

Librería       | Descripción
-------------  | ---------------------------------------------------------------------------
base           | Contiene funciones básicas que permiten funcionar a R como un lenguaje de programación: funciones aritméticas, input/output, etc 
compiler       | Permite la compilación del Byte Code en R.
datasets       | Contiene una amplia variedad de datasets en R.
graphics       | Contiene funciones para los gráficos *base*.
grDevices      | Suplemento para el paquete graphics. Colores y fuentes.
grid           | Suplemento para el paquete graphics.
methods        | Permite definir métodos y clases para los objetos de R.
parallel       | Permite cómputo en paralelo en R.
splines        | Funciones y clases para splines.
stats          | Funciones para cálculos estadísticos y generación de números aleatorios.
stats4         | Funciones estadísticas usando las clases S4.
tcltk          | Permite el uso del lenguage para scripts TCL.
tools          | Contiene funciones para manipular paquetes de R y su documentación.
utils          | Contiene gran variedad de funciones utilitarias.

Mientras que el otro subconjunto de librerías **core** necesitan ser cargadas explícitamente con la función `library()`. Para obtener una lista con estas librerías de click en este [link](https://stat.ethz.ch/R-manual/R-devel/doc/html/packages.html).


## Instalación de Rstudio 

Para aumentar la productividad al programar en R, es muy recomendable instalar [RStudio](https://www.rstudio.com/products/rstudio/download/). Rstudio es un IDE (Integrated Development Environment) que facilita (entre otras funcionalidades):

1. Crear de scripts en un editor de texto
2. Visualizar variables en el entorno actual
3. Crear proyectos
4. Autocompletar código
5. Usar *shortcuts*
6. Usar fácilmente un control de versiones como *Git*.
7. Ver la historia de ejecución.


## Instalación de paquetes desde el CRAN.

Además de las librerías **core** de R, se pueden instalar nuevos paquetes desde el CRAN (Comprehensive R Archive Network) o bien, instalar paquetes en desarrollo desde *Github*. Cada paquete es una colección de funciones, datos y código compilado. Todas estas son agregados a la librería de funciones de R, pero no son cargadas en automático (de nuevo, se necesita usar la función `library()`). En resumen, se instala el paquete solamente una vez, pero se carga la librería cada vez que se abre una sesión nueva.

El CRAN es un repositorio central que contiene todos los paquetes disponibles en R. El CRAN está replicado a través de espejos (*mirrors*) en todo el mundo, esto con el fin de brindar disponibilidad y baja latencia al descargar los paquetes. Para instalar un paquete desde el CRAN se tiene que usar la función: `install_packages("nombre_paquete")`, usando comillas alrededor del nombre del paquete. Adicional al CRAN, hay usuarios que desarrollan paquetes y los hostean en *Github*, principalmente cuando son paquetes en desarrollo o versiones nuevas (algunas veces no estables). Para poder instalar paquetes desde github, se necesita la función `install_github("nombre_paquete")` de la librería devtools.

Una vez instalado el paquete, el conjunto de funciones, los datos y el código compilado son almacenados en una librería que no se carga automáticamente; por lo tanto, en caso de hacer referencia a una función del paquete se mostrará un error. Por esto, es muy importante que una vez instalado el paquete se utilice la función `library("nombre_paquete")` cada vez que se inicie una sesión. (Imaginen que tienen 1000 paquetes instalados, es poco practico siempre poder acceder a todas las funciones de cada uno de los paquetes en todo momento. Por esto, solamente es recomendable solo cargar las librerías que se ocuparán en el proyecto a desarrollar.)

## Ejercicios de practica


### Ejercicio 1.

**R Projects & Paths -----------------------------------------------**

Conceptos básicos:

**Directorio de trabajo (PATH)**: Es donde se guardan por default los archivos y donde se leen por default. 

**Path absoluto**: especifica la ruta desde el root del sistema (por ejemplo: C:\Users\salvador\projecto1\archivo1.csv)

**Path relativo** es relativo a la carpeta (por ejemplo: archivo1.csv)
Al inicializar un proyecto, todo se usa a través de un path relativo


```r
getwd() # obtiene el path absoluto por default
```

```
## [1] "/Users/sgarciago/Desktop/91_CORP_class/class_2020_R"
```


```r
setwd(".") # permite hacer overwrite del path por default
```
### Ejercicio 2.
**Installing & loading packages ------------------------------------**

Conceptos básicos:

**paquete y libreria** Para usar un paquete/libreria en R, son dos pasos: instalar el paquete y cargar libreria (install.packages() se corre solo una vez para instalar el paquete, library() se corre cada vez que se quiera usar la libreria)


```r
install.packages("broom", repo="http://cran.rstudio.com/")
```

```
## Installing package into '/usr/local/lib/R/3.6/site-library'
## (as 'lib' is unspecified)
```


```r
library(broom)
```

Para visualizar todos los paquetes se puede ocupar el panel derecho en la pestaña de packages o bien con la funcion: installed.packages()
  

```r
installed.packages()
```

```
##                   Package             LibPath                                  
## abind             "abind"             "/usr/local/lib/R/3.6/site-library"      
## AsioHeaders       "AsioHeaders"       "/usr/local/lib/R/3.6/site-library"      
## askpass           "askpass"           "/usr/local/lib/R/3.6/site-library"      
## assertthat        "assertthat"        "/usr/local/lib/R/3.6/site-library"      
## backports         "backports"         "/usr/local/lib/R/3.6/site-library"      
## base64enc         "base64enc"         "/usr/local/lib/R/3.6/site-library"      
## bayesplot         "bayesplot"         "/usr/local/lib/R/3.6/site-library"      
## BH                "BH"                "/usr/local/lib/R/3.6/site-library"      
## bit               "bit"               "/usr/local/lib/R/3.6/site-library"      
## bit64             "bit64"             "/usr/local/lib/R/3.6/site-library"      
## bitops            "bitops"            "/usr/local/lib/R/3.6/site-library"      
## blob              "blob"              "/usr/local/lib/R/3.6/site-library"      
## bookdown          "bookdown"          "/usr/local/lib/R/3.6/site-library"      
## broom             "broom"             "/usr/local/lib/R/3.6/site-library"      
## callr             "callr"             "/usr/local/lib/R/3.6/site-library"      
## car               "car"               "/usr/local/lib/R/3.6/site-library"      
## carData           "carData"           "/usr/local/lib/R/3.6/site-library"      
## cellranger        "cellranger"        "/usr/local/lib/R/3.6/site-library"      
## checkmate         "checkmate"         "/usr/local/lib/R/3.6/site-library"      
## cli               "cli"               "/usr/local/lib/R/3.6/site-library"      
## clipr             "clipr"             "/usr/local/lib/R/3.6/site-library"      
## colorspace        "colorspace"        "/usr/local/lib/R/3.6/site-library"      
## colourpicker      "colourpicker"      "/usr/local/lib/R/3.6/site-library"      
## cowplot           "cowplot"           "/usr/local/lib/R/3.6/site-library"      
## crayon            "crayon"            "/usr/local/lib/R/3.6/site-library"      
## crosstalk         "crosstalk"         "/usr/local/lib/R/3.6/site-library"      
## curl              "curl"              "/usr/local/lib/R/3.6/site-library"      
## data.table        "data.table"        "/usr/local/lib/R/3.6/site-library"      
## DBI               "DBI"               "/usr/local/lib/R/3.6/site-library"      
## dbplyr            "dbplyr"            "/usr/local/lib/R/3.6/site-library"      
## desc              "desc"              "/usr/local/lib/R/3.6/site-library"      
## DiagrammeR        "DiagrammeR"        "/usr/local/lib/R/3.6/site-library"      
## dials             "dials"             "/usr/local/lib/R/3.6/site-library"      
## DiceDesign        "DiceDesign"        "/usr/local/lib/R/3.6/site-library"      
## digest            "digest"            "/usr/local/lib/R/3.6/site-library"      
## downloader        "downloader"        "/usr/local/lib/R/3.6/site-library"      
## dplyr             "dplyr"             "/usr/local/lib/R/3.6/site-library"      
## DT                "DT"                "/usr/local/lib/R/3.6/site-library"      
## dygraphs          "dygraphs"          "/usr/local/lib/R/3.6/site-library"      
## ellipsis          "ellipsis"          "/usr/local/lib/R/3.6/site-library"      
## evaluate          "evaluate"          "/usr/local/lib/R/3.6/site-library"      
## fansi             "fansi"             "/usr/local/lib/R/3.6/site-library"      
## farver            "farver"            "/usr/local/lib/R/3.6/site-library"      
## fastmap           "fastmap"           "/usr/local/lib/R/3.6/site-library"      
## flextable         "flextable"         "/usr/local/lib/R/3.6/site-library"      
## forcats           "forcats"           "/usr/local/lib/R/3.6/site-library"      
## foreach           "foreach"           "/usr/local/lib/R/3.6/site-library"      
## fs                "fs"                "/usr/local/lib/R/3.6/site-library"      
## furrr             "furrr"             "/usr/local/lib/R/3.6/site-library"      
## future            "future"            "/usr/local/lib/R/3.6/site-library"      
## gdtools           "gdtools"           "/usr/local/lib/R/3.6/site-library"      
## generics          "generics"          "/usr/local/lib/R/3.6/site-library"      
## ggmap             "ggmap"             "/usr/local/lib/R/3.6/site-library"      
## ggplot2           "ggplot2"           "/usr/local/lib/R/3.6/site-library"      
## ggridges          "ggridges"          "/usr/local/lib/R/3.6/site-library"      
## ggvis             "ggvis"             "/usr/local/lib/R/3.6/site-library"      
## globals           "globals"           "/usr/local/lib/R/3.6/site-library"      
## glue              "glue"              "/usr/local/lib/R/3.6/site-library"      
## gower             "gower"             "/usr/local/lib/R/3.6/site-library"      
## GPfit             "GPfit"             "/usr/local/lib/R/3.6/site-library"      
## gridExtra         "gridExtra"         "/usr/local/lib/R/3.6/site-library"      
## gtable            "gtable"            "/usr/local/lib/R/3.6/site-library"      
## gtools            "gtools"            "/usr/local/lib/R/3.6/site-library"      
## hardhat           "hardhat"           "/usr/local/lib/R/3.6/site-library"      
## haven             "haven"             "/usr/local/lib/R/3.6/site-library"      
## highr             "highr"             "/usr/local/lib/R/3.6/site-library"      
## hms               "hms"               "/usr/local/lib/R/3.6/site-library"      
## htmltools         "htmltools"         "/usr/local/lib/R/3.6/site-library"      
## htmlwidgets       "htmlwidgets"       "/usr/local/lib/R/3.6/site-library"      
## httpuv            "httpuv"            "/usr/local/lib/R/3.6/site-library"      
## httr              "httr"              "/usr/local/lib/R/3.6/site-library"      
## hunspell          "hunspell"          "/usr/local/lib/R/3.6/site-library"      
## igraph            "igraph"            "/usr/local/lib/R/3.6/site-library"      
## infer             "infer"             "/usr/local/lib/R/3.6/site-library"      
## influenceR        "influenceR"        "/usr/local/lib/R/3.6/site-library"      
## inline            "inline"            "/usr/local/lib/R/3.6/site-library"      
## ipred             "ipred"             "/usr/local/lib/R/3.6/site-library"      
## ISOcodes          "ISOcodes"          "/usr/local/lib/R/3.6/site-library"      
## iterators         "iterators"         "/usr/local/lib/R/3.6/site-library"      
## janeaustenr       "janeaustenr"       "/usr/local/lib/R/3.6/site-library"      
## jpeg              "jpeg"              "/usr/local/lib/R/3.6/site-library"      
## jsonlite          "jsonlite"          "/usr/local/lib/R/3.6/site-library"      
## knitr             "knitr"             "/usr/local/lib/R/3.6/site-library"      
## labeling          "labeling"          "/usr/local/lib/R/3.6/site-library"      
## later             "later"             "/usr/local/lib/R/3.6/site-library"      
## lava              "lava"              "/usr/local/lib/R/3.6/site-library"      
## lazyeval          "lazyeval"          "/usr/local/lib/R/3.6/site-library"      
## leaflet           "leaflet"           "/usr/local/lib/R/3.6/site-library"      
## leaflet.providers "leaflet.providers" "/usr/local/lib/R/3.6/site-library"      
## lhs               "lhs"               "/usr/local/lib/R/3.6/site-library"      
## lifecycle         "lifecycle"         "/usr/local/lib/R/3.6/site-library"      
## listenv           "listenv"           "/usr/local/lib/R/3.6/site-library"      
## lme4              "lme4"              "/usr/local/lib/R/3.6/site-library"      
## loo               "loo"               "/usr/local/lib/R/3.6/site-library"      
## lubridate         "lubridate"         "/usr/local/lib/R/3.6/site-library"      
## magrittr          "magrittr"          "/usr/local/lib/R/3.6/site-library"      
## manipulateWidget  "manipulateWidget"  "/usr/local/lib/R/3.6/site-library"      
## maptools          "maptools"          "/usr/local/lib/R/3.6/site-library"      
## markdown          "markdown"          "/usr/local/lib/R/3.6/site-library"      
## MatrixModels      "MatrixModels"      "/usr/local/lib/R/3.6/site-library"      
## matrixStats       "matrixStats"       "/usr/local/lib/R/3.6/site-library"      
## mime              "mime"              "/usr/local/lib/R/3.6/site-library"      
## miniUI            "miniUI"            "/usr/local/lib/R/3.6/site-library"      
## minqa             "minqa"             "/usr/local/lib/R/3.6/site-library"      
## modelr            "modelr"            "/usr/local/lib/R/3.6/site-library"      
## munsell           "munsell"           "/usr/local/lib/R/3.6/site-library"      
## nloptr            "nloptr"            "/usr/local/lib/R/3.6/site-library"      
## numDeriv          "numDeriv"          "/usr/local/lib/R/3.6/site-library"      
## odbc              "odbc"              "/usr/local/lib/R/3.6/site-library"      
## officer           "officer"           "/usr/local/lib/R/3.6/site-library"      
## openssl           "openssl"           "/usr/local/lib/R/3.6/site-library"      
## openxlsx          "openxlsx"          "/usr/local/lib/R/3.6/site-library"      
## packrat           "packrat"           "/usr/local/lib/R/3.6/site-library"      
## pagedown          "pagedown"          "/usr/local/lib/R/3.6/site-library"      
## parsnip           "parsnip"           "/usr/local/lib/R/3.6/site-library"      
## pbkrtest          "pbkrtest"          "/usr/local/lib/R/3.6/site-library"      
## pillar            "pillar"            "/usr/local/lib/R/3.6/site-library"      
## pkgbuild          "pkgbuild"          "/usr/local/lib/R/3.6/site-library"      
## pkgconfig         "pkgconfig"         "/usr/local/lib/R/3.6/site-library"      
## plogr             "plogr"             "/usr/local/lib/R/3.6/site-library"      
## plyr              "plyr"              "/usr/local/lib/R/3.6/site-library"      
## png               "png"               "/usr/local/lib/R/3.6/site-library"      
## prettyunits       "prettyunits"       "/usr/local/lib/R/3.6/site-library"      
## pROC              "pROC"              "/usr/local/lib/R/3.6/site-library"      
## processx          "processx"          "/usr/local/lib/R/3.6/site-library"      
## prodlim           "prodlim"           "/usr/local/lib/R/3.6/site-library"      
## progress          "progress"          "/usr/local/lib/R/3.6/site-library"      
## promises          "promises"          "/usr/local/lib/R/3.6/site-library"      
## ps                "ps"                "/usr/local/lib/R/3.6/site-library"      
## purrr             "purrr"             "/usr/local/lib/R/3.6/site-library"      
## quantreg          "quantreg"          "/usr/local/lib/R/3.6/site-library"      
## R6                "R6"                "/usr/local/lib/R/3.6/site-library"      
## raster            "raster"            "/usr/local/lib/R/3.6/site-library"      
## RColorBrewer      "RColorBrewer"      "/usr/local/lib/R/3.6/site-library"      
## Rcpp              "Rcpp"              "/usr/local/lib/R/3.6/site-library"      
## RcppEigen         "RcppEigen"         "/usr/local/lib/R/3.6/site-library"      
## RcppParallel      "RcppParallel"      "/usr/local/lib/R/3.6/site-library"      
## RCurl             "RCurl"             "/usr/local/lib/R/3.6/site-library"      
## readr             "readr"             "/usr/local/lib/R/3.6/site-library"      
## readxl            "readxl"            "/usr/local/lib/R/3.6/site-library"      
## recipes           "recipes"           "/usr/local/lib/R/3.6/site-library"      
## rematch           "rematch"           "/usr/local/lib/R/3.6/site-library"      
## reprex            "reprex"            "/usr/local/lib/R/3.6/site-library"      
## reshape2          "reshape2"          "/usr/local/lib/R/3.6/site-library"      
## rgl               "rgl"               "/usr/local/lib/R/3.6/site-library"      
## RgoogleMaps       "RgoogleMaps"       "/usr/local/lib/R/3.6/site-library"      
## rio               "rio"               "/usr/local/lib/R/3.6/site-library"      
## rjson             "rjson"             "/usr/local/lib/R/3.6/site-library"      
## rlang             "rlang"             "/usr/local/lib/R/3.6/site-library"      
## rmarkdown         "rmarkdown"         "/usr/local/lib/R/3.6/site-library"      
## rprojroot         "rprojroot"         "/usr/local/lib/R/3.6/site-library"      
## rsample           "rsample"           "/usr/local/lib/R/3.6/site-library"      
## rsconnect         "rsconnect"         "/usr/local/lib/R/3.6/site-library"      
## rstan             "rstan"             "/usr/local/lib/R/3.6/site-library"      
## rstanarm          "rstanarm"          "/usr/local/lib/R/3.6/site-library"      
## rstantools        "rstantools"        "/usr/local/lib/R/3.6/site-library"      
## rstudioapi        "rstudioapi"        "/usr/local/lib/R/3.6/site-library"      
## rvest             "rvest"             "/usr/local/lib/R/3.6/site-library"      
## rvg               "rvg"               "/usr/local/lib/R/3.6/site-library"      
## scales            "scales"            "/usr/local/lib/R/3.6/site-library"      
## selectr           "selectr"           "/usr/local/lib/R/3.6/site-library"      
## servr             "servr"             "/usr/local/lib/R/3.6/site-library"      
## shiny             "shiny"             "/usr/local/lib/R/3.6/site-library"      
## shinyjs           "shinyjs"           "/usr/local/lib/R/3.6/site-library"      
## shinystan         "shinystan"         "/usr/local/lib/R/3.6/site-library"      
## shinythemes       "shinythemes"       "/usr/local/lib/R/3.6/site-library"      
## SnowballC         "SnowballC"         "/usr/local/lib/R/3.6/site-library"      
## sourcetools       "sourcetools"       "/usr/local/lib/R/3.6/site-library"      
## sp                "sp"                "/usr/local/lib/R/3.6/site-library"      
## SparseM           "SparseM"           "/usr/local/lib/R/3.6/site-library"      
## SQUAREM           "SQUAREM"           "/usr/local/lib/R/3.6/site-library"      
## StanHeaders       "StanHeaders"       "/usr/local/lib/R/3.6/site-library"      
## stopwords         "stopwords"         "/usr/local/lib/R/3.6/site-library"      
## stringi           "stringi"           "/usr/local/lib/R/3.6/site-library"      
## stringr           "stringr"           "/usr/local/lib/R/3.6/site-library"      
## svglite           "svglite"           "/usr/local/lib/R/3.6/site-library"      
## sys               "sys"               "/usr/local/lib/R/3.6/site-library"      
## systemfonts       "systemfonts"       "/usr/local/lib/R/3.6/site-library"      
## threejs           "threejs"           "/usr/local/lib/R/3.6/site-library"      
## tibble            "tibble"            "/usr/local/lib/R/3.6/site-library"      
## tidymodels        "tidymodels"        "/usr/local/lib/R/3.6/site-library"      
## tidyposterior     "tidyposterior"     "/usr/local/lib/R/3.6/site-library"      
## tidypredict       "tidypredict"       "/usr/local/lib/R/3.6/site-library"      
## tidyr             "tidyr"             "/usr/local/lib/R/3.6/site-library"      
## tidyselect        "tidyselect"        "/usr/local/lib/R/3.6/site-library"      
## tidytext          "tidytext"          "/usr/local/lib/R/3.6/site-library"      
## tidyverse         "tidyverse"         "/usr/local/lib/R/3.6/site-library"      
## timeDate          "timeDate"          "/usr/local/lib/R/3.6/site-library"      
## tinytex           "tinytex"           "/usr/local/lib/R/3.6/site-library"      
## tokenizers        "tokenizers"        "/usr/local/lib/R/3.6/site-library"      
## tune              "tune"              "/usr/local/lib/R/3.6/site-library"      
## utf8              "utf8"              "/usr/local/lib/R/3.6/site-library"      
## uuid              "uuid"              "/usr/local/lib/R/3.6/site-library"      
## vctrs             "vctrs"             "/usr/local/lib/R/3.6/site-library"      
## viridis           "viridis"           "/usr/local/lib/R/3.6/site-library"      
## viridisLite       "viridisLite"       "/usr/local/lib/R/3.6/site-library"      
## visNetwork        "visNetwork"        "/usr/local/lib/R/3.6/site-library"      
## webshot           "webshot"           "/usr/local/lib/R/3.6/site-library"      
## websocket         "websocket"         "/usr/local/lib/R/3.6/site-library"      
## whisker           "whisker"           "/usr/local/lib/R/3.6/site-library"      
## withr             "withr"             "/usr/local/lib/R/3.6/site-library"      
## workflows         "workflows"         "/usr/local/lib/R/3.6/site-library"      
## writexl           "writexl"           "/usr/local/lib/R/3.6/site-library"      
## xfun              "xfun"              "/usr/local/lib/R/3.6/site-library"      
## xml2              "xml2"              "/usr/local/lib/R/3.6/site-library"      
## xtable            "xtable"            "/usr/local/lib/R/3.6/site-library"      
## xts               "xts"               "/usr/local/lib/R/3.6/site-library"      
## yaml              "yaml"              "/usr/local/lib/R/3.6/site-library"      
## yardstick         "yardstick"         "/usr/local/lib/R/3.6/site-library"      
## zeallot           "zeallot"           "/usr/local/lib/R/3.6/site-library"      
## zip               "zip"               "/usr/local/lib/R/3.6/site-library"      
## zoo               "zoo"               "/usr/local/lib/R/3.6/site-library"      
## base              "base"              "/usr/local/Cellar/r/3.6.2/lib/R/library"
## boot              "boot"              "/usr/local/Cellar/r/3.6.2/lib/R/library"
## class             "class"             "/usr/local/Cellar/r/3.6.2/lib/R/library"
## cluster           "cluster"           "/usr/local/Cellar/r/3.6.2/lib/R/library"
## codetools         "codetools"         "/usr/local/Cellar/r/3.6.2/lib/R/library"
## compiler          "compiler"          "/usr/local/Cellar/r/3.6.2/lib/R/library"
## datasets          "datasets"          "/usr/local/Cellar/r/3.6.2/lib/R/library"
## foreign           "foreign"           "/usr/local/Cellar/r/3.6.2/lib/R/library"
## graphics          "graphics"          "/usr/local/Cellar/r/3.6.2/lib/R/library"
## grDevices         "grDevices"         "/usr/local/Cellar/r/3.6.2/lib/R/library"
## grid              "grid"              "/usr/local/Cellar/r/3.6.2/lib/R/library"
## KernSmooth        "KernSmooth"        "/usr/local/Cellar/r/3.6.2/lib/R/library"
## lattice           "lattice"           "/usr/local/Cellar/r/3.6.2/lib/R/library"
## MASS              "MASS"              "/usr/local/Cellar/r/3.6.2/lib/R/library"
## Matrix            "Matrix"            "/usr/local/Cellar/r/3.6.2/lib/R/library"
## methods           "methods"           "/usr/local/Cellar/r/3.6.2/lib/R/library"
## mgcv              "mgcv"              "/usr/local/Cellar/r/3.6.2/lib/R/library"
## nlme              "nlme"              "/usr/local/Cellar/r/3.6.2/lib/R/library"
## nnet              "nnet"              "/usr/local/Cellar/r/3.6.2/lib/R/library"
## parallel          "parallel"          "/usr/local/Cellar/r/3.6.2/lib/R/library"
## rpart             "rpart"             "/usr/local/Cellar/r/3.6.2/lib/R/library"
## spatial           "spatial"           "/usr/local/Cellar/r/3.6.2/lib/R/library"
## splines           "splines"           "/usr/local/Cellar/r/3.6.2/lib/R/library"
## stats             "stats"             "/usr/local/Cellar/r/3.6.2/lib/R/library"
## stats4            "stats4"            "/usr/local/Cellar/r/3.6.2/lib/R/library"
## survival          "survival"          "/usr/local/Cellar/r/3.6.2/lib/R/library"
## tcltk             "tcltk"             "/usr/local/Cellar/r/3.6.2/lib/R/library"
## tools             "tools"             "/usr/local/Cellar/r/3.6.2/lib/R/library"
## utils             "utils"             "/usr/local/Cellar/r/3.6.2/lib/R/library"
##                   Version      Priority     
## abind             "1.4-5"      NA           
## AsioHeaders       "1.12.1-1"   NA           
## askpass           "1.1"        NA           
## assertthat        "0.2.1"      NA           
## backports         "1.1.5"      NA           
## base64enc         "0.1-3"      NA           
## bayesplot         "1.7.1"      NA           
## BH                "1.72.0-3"   NA           
## bit               "1.1-15.2"   NA           
## bit64             "0.9-7"      NA           
## bitops            "1.0-6"      NA           
## blob              "1.2.1"      NA           
## bookdown          "0.17"       NA           
## broom             "0.5.5"      NA           
## callr             "3.4.0"      NA           
## car               "3.0-6"      NA           
## carData           "3.0-3"      NA           
## cellranger        "1.1.0"      NA           
## checkmate         "2.0.0"      NA           
## cli               "2.0.1"      NA           
## clipr             "0.7.0"      NA           
## colorspace        "1.4-1"      NA           
## colourpicker      "1.0"        NA           
## cowplot           "1.0.0"      NA           
## crayon            "1.3.4"      NA           
## crosstalk         "1.0.0"      NA           
## curl              "4.3"        NA           
## data.table        "1.12.8"     NA           
## DBI               "1.1.0"      NA           
## dbplyr            "1.4.2"      NA           
## desc              "1.2.0"      NA           
## DiagrammeR        "1.0.5"      NA           
## dials             "0.0.4"      NA           
## DiceDesign        "1.8-1"      NA           
## digest            "0.6.23"     NA           
## downloader        "0.4"        NA           
## dplyr             "0.8.4"      NA           
## DT                "0.12"       NA           
## dygraphs          "1.1.1.6"    NA           
## ellipsis          "0.3.0"      NA           
## evaluate          "0.14"       NA           
## fansi             "0.4.1"      NA           
## farver            "2.0.3"      NA           
## fastmap           "1.0.1"      NA           
## flextable         "0.5.6"      NA           
## forcats           "0.4.0"      NA           
## foreach           "1.4.8"      NA           
## fs                "1.3.1"      NA           
## furrr             "0.1.0"      NA           
## future            "1.16.0"     NA           
## gdtools           "0.2.1"      NA           
## generics          "0.0.2"      NA           
## ggmap             "3.0.0"      NA           
## ggplot2           "3.2.1"      NA           
## ggridges          "0.5.2"      NA           
## ggvis             "0.4.5"      NA           
## globals           "0.12.5"     NA           
## glue              "1.3.1"      NA           
## gower             "0.2.1"      NA           
## GPfit             "1.0-8"      NA           
## gridExtra         "2.3"        NA           
## gtable            "0.3.0"      NA           
## gtools            "3.8.1"      NA           
## hardhat           "0.1.1"      NA           
## haven             "2.2.0"      NA           
## highr             "0.8"        NA           
## hms               "0.5.3"      NA           
## htmltools         "0.4.0"      NA           
## htmlwidgets       "1.5.1"      NA           
## httpuv            "1.5.2"      NA           
## httr              "1.4.1"      NA           
## hunspell          "3.0"        NA           
## igraph            "1.2.4.2"    NA           
## infer             "0.5.1"      NA           
## influenceR        "0.1.0"      NA           
## inline            "0.3.15"     NA           
## ipred             "0.9-9"      NA           
## ISOcodes          "2019.12.22" NA           
## iterators         "1.0.12"     NA           
## janeaustenr       "0.1.5"      NA           
## jpeg              "0.1-8.1"    NA           
## jsonlite          "1.6"        NA           
## knitr             "1.27"       NA           
## labeling          "0.3"        NA           
## later             "1.0.0"      NA           
## lava              "1.6.6"      NA           
## lazyeval          "0.2.2"      NA           
## leaflet           "2.0.3"      NA           
## leaflet.providers "1.9.0"      NA           
## lhs               "1.0.1"      NA           
## lifecycle         "0.1.0"      NA           
## listenv           "0.8.0"      NA           
## lme4              "1.1-21"     NA           
## loo               "2.2.0"      NA           
## lubridate         "1.7.4"      NA           
## magrittr          "1.5"        NA           
## manipulateWidget  "0.10.0"     NA           
## maptools          "0.9-9"      NA           
## markdown          "1.1"        NA           
## MatrixModels      "0.4-1"      NA           
## matrixStats       "0.55.0"     NA           
## mime              "0.8"        NA           
## miniUI            "0.1.1.1"    NA           
## minqa             "1.2.4"      NA           
## modelr            "0.1.5"      NA           
## munsell           "0.5.0"      NA           
## nloptr            "1.2.1"      NA           
## numDeriv          "2016.8-1.1" NA           
## odbc              "1.2.2"      NA           
## officer           "0.3.6"      NA           
## openssl           "1.4.1"      NA           
## openxlsx          "4.1.4"      NA           
## packrat           "0.5.0"      NA           
## pagedown          "0.7"        NA           
## parsnip           "0.0.5"      NA           
## pbkrtest          "0.4-7"      NA           
## pillar            "1.4.3"      NA           
## pkgbuild          "1.0.6"      NA           
## pkgconfig         "2.0.3"      NA           
## plogr             "0.2.0"      NA           
## plyr              "1.8.5"      NA           
## png               "0.1-7"      NA           
## prettyunits       "1.1.0"      NA           
## pROC              "1.16.1"     NA           
## processx          "3.4.1"      NA           
## prodlim           "2019.11.13" NA           
## progress          "1.2.2"      NA           
## promises          "1.1.0"      NA           
## ps                "1.3.0"      NA           
## purrr             "0.3.3"      NA           
## quantreg          "5.54"       NA           
## R6                "2.4.1"      NA           
## raster            "3.0-12"     NA           
## RColorBrewer      "1.1-2"      NA           
## Rcpp              "1.0.3"      NA           
## RcppEigen         "0.3.3.7.0"  NA           
## RcppParallel      "4.4.4"      NA           
## RCurl             "1.98-1.1"   NA           
## readr             "1.3.1"      NA           
## readxl            "1.3.1"      NA           
## recipes           "0.1.9"      NA           
## rematch           "1.0.1"      NA           
## reprex            "0.3.0"      NA           
## reshape2          "1.4.3"      NA           
## rgl               "0.100.47"   NA           
## RgoogleMaps       "1.4.5.3"    NA           
## rio               "0.5.16"     NA           
## rjson             "0.2.20"     NA           
## rlang             "0.4.4"      NA           
## rmarkdown         "2.1"        NA           
## rprojroot         "1.3-2"      NA           
## rsample           "0.0.5"      NA           
## rsconnect         "0.8.16"     NA           
## rstan             "2.19.3"     NA           
## rstanarm          "2.19.3"     NA           
## rstantools        "2.0.0"      NA           
## rstudioapi        "0.11"       NA           
## rvest             "0.3.5"      NA           
## rvg               "0.2.2"      NA           
## scales            "1.1.0"      NA           
## selectr           "0.4-2"      NA           
## servr             "0.15"       NA           
## shiny             "1.4.0"      NA           
## shinyjs           "1.1"        NA           
## shinystan         "2.5.0"      NA           
## shinythemes       "1.1.2"      NA           
## SnowballC         "0.6.0"      NA           
## sourcetools       "0.1.7"      NA           
## sp                "1.3-2"      NA           
## SparseM           "1.78"       NA           
## SQUAREM           "2020.1"     NA           
## StanHeaders       "2.19.2"     NA           
## stopwords         "1.0"        NA           
## stringi           "1.4.5"      NA           
## stringr           "1.4.0"      NA           
## svglite           "1.2.3"      NA           
## sys               "3.3"        NA           
## systemfonts       "0.1.1"      NA           
## threejs           "0.3.3"      NA           
## tibble            "2.1.3"      NA           
## tidymodels        "0.1.0"      NA           
## tidyposterior     "0.0.2"      NA           
## tidypredict       "0.4.5"      NA           
## tidyr             "1.0.0"      NA           
## tidyselect        "0.2.5"      NA           
## tidytext          "0.2.2"      NA           
## tidyverse         "1.3.0"      NA           
## timeDate          "3043.102"   NA           
## tinytex           "0.19"       NA           
## tokenizers        "0.2.1"      NA           
## tune              "0.0.1"      NA           
## utf8              "1.1.4"      NA           
## uuid              "0.1-2"      NA           
## vctrs             "0.2.1"      NA           
## viridis           "0.5.1"      NA           
## viridisLite       "0.3.0"      NA           
## visNetwork        "2.0.9"      NA           
## webshot           "0.5.2"      NA           
## websocket         "1.1.0"      NA           
## whisker           "0.4"        NA           
## withr             "2.1.2"      NA           
## workflows         "0.1.0"      NA           
## writexl           "1.2"        NA           
## xfun              "0.12"       NA           
## xml2              "1.2.2"      NA           
## xtable            "1.8-4"      NA           
## xts               "0.12-0"     NA           
## yaml              "2.2.0"      NA           
## yardstick         "0.0.5"      NA           
## zeallot           "0.1.0"      NA           
## zip               "2.0.4"      NA           
## zoo               "1.8-7"      NA           
## base              "3.6.2"      "base"       
## boot              "1.3-23"     "recommended"
## class             "7.3-15"     "recommended"
## cluster           "2.1.0"      "recommended"
## codetools         "0.2-16"     "recommended"
## compiler          "3.6.2"      "base"       
## datasets          "3.6.2"      "base"       
## foreign           "0.8-72"     "recommended"
## graphics          "3.6.2"      "base"       
## grDevices         "3.6.2"      "base"       
## grid              "3.6.2"      "base"       
## KernSmooth        "2.23-16"    "recommended"
## lattice           "0.20-38"    "recommended"
## MASS              "7.3-51.4"   "recommended"
## Matrix            "1.2-18"     "recommended"
## methods           "3.6.2"      "base"       
## mgcv              "1.8-31"     "recommended"
## nlme              "3.1-142"    "recommended"
## nnet              "7.3-12"     "recommended"
## parallel          "3.6.2"      "base"       
## rpart             "4.1-15"     "recommended"
## spatial           "7.3-11"     "recommended"
## splines           "3.6.2"      "base"       
## stats             "3.6.2"      "base"       
## stats4            "3.6.2"      "base"       
## survival          "3.1-8"      "recommended"
## tcltk             "3.6.2"      "base"       
## tools             "3.6.2"      "base"       
## utils             "3.6.2"      "base"       
##                   Depends                                                   
## abind             "R (>= 1.5.0)"                                            
## AsioHeaders       NA                                                        
## askpass           NA                                                        
## assertthat        NA                                                        
## backports         "R (>= 3.0.0)"                                            
## base64enc         "R (>= 2.9.0)"                                            
## bayesplot         "R (>= 3.1.0)"                                            
## BH                NA                                                        
## bit               "R (>= 2.9.2)"                                            
## bit64             "R (>= 3.0.1), bit (>= 1.1-12), utils, methods, stats"    
## bitops            NA                                                        
## blob              NA                                                        
## bookdown          NA                                                        
## broom             "R (>= 3.1)"                                              
## callr             NA                                                        
## car               "R (>= 3.5.0), carData (>= 3.0-0)"                        
## carData           "R (>= 3.0)"                                              
## cellranger        "R (>= 3.0.0)"                                            
## checkmate         "R (>= 3.0.0)"                                            
## cli               "R (>= 2.10)"                                             
## clipr             NA                                                        
## colorspace        "R (>= 3.0.0), methods"                                   
## colourpicker      "R (>= 3.1.0)"                                            
## cowplot           "R (>= 3.5.0)"                                            
## crayon            NA                                                        
## crosstalk         NA                                                        
## curl              "R (>= 3.0.0)"                                            
## data.table        "R (>= 3.1.0)"                                            
## DBI               "methods, R (>= 3.0.0)"                                   
## dbplyr            "R (>= 3.1)"                                              
## desc              "R (>= 3.1.0)"                                            
## DiagrammeR        "R (>= 3.2.0)"                                            
## dials             "scales, R (>= 2.10)"                                     
## DiceDesign        "R (>= 2.10)"                                             
## digest            "R (>= 3.1.0)"                                            
## downloader        NA                                                        
## dplyr             "R (>= 3.2.0)"                                            
## DT                NA                                                        
## dygraphs          "R (>= 3.0)"                                              
## ellipsis          "R (>= 3.2)"                                              
## evaluate          "R (>= 3.0.2)"                                            
## fansi             "R (>= 3.1.0)"                                            
## farver            NA                                                        
## fastmap           NA                                                        
## flextable         NA                                                        
## forcats           "R (>= 3.1)"                                              
## foreach           "R (>= 2.5.0)"                                            
## fs                "R (>= 3.1)"                                              
## furrr             "R (>= 3.2.0), future (>= 1.6.2)"                         
## future            NA                                                        
## gdtools           NA                                                        
## generics          "R (>= 3.1)"                                              
## ggmap             "R (>= 3.1.0), ggplot2 (>= 2.2.0)"                        
## ggplot2           "R (>= 3.2)"                                              
## ggridges          "R (>= 3.2)"                                              
## ggvis             "R (>= 3.0)"                                              
## globals           "R (>= 3.1.2)"                                            
## glue              "R (>= 3.1)"                                              
## gower             NA                                                        
## GPfit             NA                                                        
## gridExtra         NA                                                        
## gtable            "R (>= 3.0)"                                              
## gtools            "methods, stats, utils"                                   
## hardhat           NA                                                        
## haven             "R (>= 3.2)"                                              
## highr             "R (>= 3.2.3)"                                            
## hms               NA                                                        
## htmltools         "R (>= 2.14.1)"                                           
## htmlwidgets       NA                                                        
## httpuv            "R (>= 2.15.1)"                                           
## httr              "R (>= 3.2)"                                              
## hunspell          "R (>= 3.0.2)"                                            
## igraph            "methods"                                                 
## infer             "R (>= 3.1.2)"                                            
## influenceR        "R (>= 3.2.0)"                                            
## inline            "R (>= 2.4.0)"                                            
## ipred             "R (>= 2.10)"                                             
## ISOcodes          "R (>= 3.5.0)"                                            
## iterators         "R (>= 2.5.0), utils"                                     
## janeaustenr       "R (>= 3.1.2)"                                            
## jpeg              "R (>= 2.9.0)"                                            
## jsonlite          "methods"                                                 
## knitr             "R (>= 3.2.3)"                                            
## labeling          NA                                                        
## later             NA                                                        
## lava              "R (>= 3.0)"                                              
## lazyeval          "R (>= 3.1.0)"                                            
## leaflet           "R (>= 3.1.0)"                                            
## leaflet.providers "R (>= 2.10)"                                             
## lhs               "R (>= 3.4.0)"                                            
## lifecycle         "R (>= 3.2)"                                              
## listenv           "R (>= 3.1.2)"                                            
## lme4              "R (>= 3.2.0), Matrix (>= 1.2-1), methods, stats"         
## loo               "R (>= 3.1.2)"                                            
## lubridate         "methods, R (>= 3.0.0)"                                   
## magrittr          NA                                                        
## manipulateWidget  NA                                                        
## maptools          "R (>= 2.10), sp (>= 1.0-11)"                             
## markdown          "R (>= 2.11.1)"                                           
## MatrixModels      "R (>= 3.0.1)"                                            
## matrixStats       "R (>= 2.12.0)"                                           
## mime              NA                                                        
## miniUI            NA                                                        
## minqa             NA                                                        
## modelr            "R (>= 3.2)"                                              
## munsell           NA                                                        
## nloptr            NA                                                        
## numDeriv          "R (>= 2.11.1)"                                           
## odbc              "R (>= 3.2.0)"                                            
## officer           NA                                                        
## openssl           NA                                                        
## openxlsx          "R (>= 3.3.0)"                                            
## packrat           "R (>= 3.0.0)"                                            
## pagedown          NA                                                        
## parsnip           "R (>= 2.10)"                                             
## pbkrtest          "R (>= 3.2.3), lme4 (>= 1.1.10)"                          
## pillar            NA                                                        
## pkgbuild          "R (>= 3.1)"                                              
## pkgconfig         NA                                                        
## plogr             NA                                                        
## plyr              "R (>= 3.1.0)"                                            
## png               "R (>= 2.9.0)"                                            
## prettyunits       NA                                                        
## pROC              "R (>= 2.14)"                                             
## processx          NA                                                        
## prodlim           "R (>= 2.9.0)"                                            
## progress          NA                                                        
## promises          NA                                                        
## ps                "R (>= 3.1)"                                              
## purrr             "R (>= 3.2)"                                              
## quantreg          "R (>= 2.6), stats, SparseM"                              
## R6                "R (>= 3.0)"                                              
## raster            "sp (>= 1.2-0), R (>= 3.0.0)"                             
## RColorBrewer      "R (>= 2.0.0)"                                            
## Rcpp              "R (>= 3.0.0)"                                            
## RcppEigen         "R (>= 2.15.1)"                                           
## RcppParallel      "R (>= 3.0.2)"                                            
## RCurl             "R (>= 3.4.0), methods"                                   
## readr             "R (>= 3.1)"                                              
## readxl            NA                                                        
## recipes           "R (>= 3.1), dplyr"                                       
## rematch           NA                                                        
## reprex            "R (>= 3.1)"                                              
## reshape2          "R (>= 3.1)"                                              
## rgl               "R (>= 3.2.0)"                                            
## RgoogleMaps       "R (>= 2.10)"                                             
## rio               "R (>= 2.15.0)"                                           
## rjson             "R (>= 3.1.0)"                                            
## rlang             "R (>= 3.2.0)"                                            
## rmarkdown         "R (>= 3.0)"                                              
## rprojroot         "R (>= 3.0.0)"                                            
## rsample           "R (>= 3.1), tidyr"                                       
## rsconnect         "R (>= 3.0.0)"                                            
## rstan             "R (>= 3.4.0), StanHeaders (> 2.18.1), ggplot2 (>= 2.0.0)"
## rstanarm          "R (>= 3.4.0), Rcpp (>= 0.12.0), methods"                 
## rstantools        NA                                                        
## rstudioapi        NA                                                        
## rvest             "R (>= 3.2), xml2"                                        
## rvg               "R (>= 3.0)"                                              
## scales            "R (>= 3.2)"                                              
## selectr           "R (>= 3.0)"                                              
## servr             "R (>= 3.0.0)"                                            
## shiny             "R (>= 3.0.2), methods"                                   
## shinyjs           "R (>= 3.1.0)"                                            
## shinystan         "R (>= 3.1.0), shiny (>= 1.0.3)"                          
## shinythemes       "R (>= 3.0.0)"                                            
## SnowballC         NA                                                        
## sourcetools       "R (>= 3.0.2)"                                            
## sp                "R (>= 3.0.0), methods"                                   
## SparseM           "R (>= 2.15), methods"                                    
## SQUAREM           "R (>= 3.0)"                                              
## StanHeaders       "R (>= 3.4.0)"                                            
## stopwords         "R (>= 2.10)"                                             
## stringi           "R (>= 2.14)"                                             
## stringr           "R (>= 3.1)"                                              
## svglite           "R (>= 3.0.0)"                                            
## sys               NA                                                        
## systemfonts       NA                                                        
## threejs           "R (>= 3.0.0), igraph (>= 1.0.0)"                         
## tibble            "R (>= 3.1.0)"                                            
## tidymodels        "R (>= 3.1)"                                              
## tidyposterior     "R (>= 2.10)"                                             
## tidypredict       "R (>= 3.1)"                                              
## tidyr             "R (>= 3.1)"                                              
## tidyselect        "R (>= 3.1)"                                              
## tidytext          "R (>= 2.10)"                                             
## tidyverse         "R (>= 3.2)"                                              
## timeDate          "R (>= 2.15.1), graphics, utils, stats, methods"          
## tinytex           NA                                                        
## tokenizers        "R (>= 3.1.3)"                                            
## tune              "R (>= 2.10)"                                             
## utf8              "R (>= 2.10)"                                             
## uuid              "R (>= 2.9.0)"                                            
## vctrs             "R (>= 3.2)"                                              
## viridis           "R (>= 2.10), viridisLite (>= 0.3.0)"                     
## viridisLite       "R (>= 2.10)"                                             
## visNetwork        "R (>= 3.0)"                                              
## webshot           "R (>= 3.0)"                                              
## websocket         NA                                                        
## whisker           NA                                                        
## withr             "R (>= 3.0.2)"                                            
## workflows         "R (>= 3.2)"                                              
## writexl           NA                                                        
## xfun              NA                                                        
## xml2              "R (>= 3.1.0)"                                            
## xtable            "R (>= 2.10.0)"                                           
## xts               "zoo (>= 1.7-12)"                                         
## yaml              NA                                                        
## yardstick         "R (>= 2.10)"                                             
## zeallot           NA                                                        
## zip               NA                                                        
## zoo               "R (>= 3.1.0), stats"                                     
## base              NA                                                        
## boot              "R (>= 3.0.0), graphics, stats"                           
## class             "R (>= 3.0.0), stats, utils"                              
## cluster           "R (>= 3.3.0)"                                            
## codetools         "R (>= 2.1)"                                              
## compiler          NA                                                        
## datasets          NA                                                        
## foreign           "R (>= 3.0.0)"                                            
## graphics          NA                                                        
## grDevices         NA                                                        
## grid              NA                                                        
## KernSmooth        "R (>= 2.5.0), stats"                                     
## lattice           "R (>= 3.0.0)"                                            
## MASS              "R (>= 3.1.0), grDevices, graphics, stats, utils"         
## Matrix            "R (>= 3.2.0)"                                            
## methods           NA                                                        
## mgcv              "R (>= 2.14.0), nlme (>= 3.1-64)"                         
## nlme              "R (>= 3.4.0)"                                            
## nnet              "R (>= 2.14.0), stats, utils"                             
## parallel          NA                                                        
## rpart             "R (>= 2.15.0), graphics, stats, grDevices"               
## spatial           "R (>= 3.0.0), graphics, stats, utils"                    
## splines           NA                                                        
## stats             NA                                                        
## stats4            NA                                                        
## survival          "R (>= 3.4.0)"                                            
## tcltk             NA                                                        
## tools             NA                                                        
## utils             NA                                                        
##                   Imports                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
## abind             "methods, utils"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
## AsioHeaders       NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## askpass           "sys (>= 2.1)"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
## assertthat        "tools"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
## backports         "utils"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
## base64enc         NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## bayesplot         "dplyr (>= 0.8.0), ggplot2 (>= 2.2.1), ggridges, glue,\nreshape2, rlang (>= 0.3.0), stats, tibble, tidyselect, utils"                                                                                                                                                                                                                                                                                                                                                                                       
## BH                NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## bit               NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## bit64             NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## bitops            NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## blob              "methods, rlang, vctrs (>= 0.2.1)"                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## bookdown          "htmltools (>= 0.3.6), knitr (>= 1.22), rmarkdown (>= 1.12),\nxfun (>= 0.6), tinytex (>= 0.12)"                                                                                                                                                                                                                                                                                                                                                                                                             
## broom             "backports, dplyr, generics (>= 0.0.2), methods, nlme, purrr,\nreshape2, stringr, tibble, tidyr"                                                                                                                                                                                                                                                                                                                                                                                                            
## callr             "processx (>= 3.4.0), R6, utils"                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
## car               "abind, MASS, mgcv, nnet, pbkrtest (>= 0.4-4), quantreg,\ngrDevices, utils, stats, graphics, maptools, rio, lme4, nlme"                                                                                                                                                                                                                                                                                                                                                                                     
## carData           NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## cellranger        "rematch, tibble"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
## checkmate         "backports (>= 1.1.0), utils"                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
## cli               "assertthat, crayon (>= 1.3.4), glue, methods, utils, fansi"                                                                                                                                                                                                                                                                                                                                                                                                                                                
## clipr             "utils"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
## colorspace        "graphics, grDevices, stats"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
## colourpicker      "ggplot2, htmltools, htmlwidgets (>= 0.7), jsonlite, miniUI (>=\n0.1.1), shiny (>= 0.11.1), shinyjs, utils"                                                                                                                                                                                                                                                                                                                                                                                                 
## cowplot           "ggplot2 (> 2.2.1), grid, gtable, grDevices, methods, rlang,\nscales, utils"                                                                                                                                                                                                                                                                                                                                                                                                                                
## crayon            "grDevices, methods, utils"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
## crosstalk         "htmltools (>= 0.3.5), jsonlite, lazyeval, R6, shiny (>= 0.11),\nggplot2"                                                                                                                                                                                                                                                                                                                                                                                                                                   
## curl              NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## data.table        "methods"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
## DBI               NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## dbplyr            "assertthat (>= 0.2.0), DBI (>= 1.0.0), dplyr (>= 0.8.0), glue\n(>= 1.2.0), methods, purrr (>= 0.2.5), R6 (>= 2.2.2), rlang (>=\n0.2.0), tibble (>= 1.4.2), tidyselect (>= 0.2.4), utils"                                                                                                                                                                                                                                                                                                                   
## desc              "assertthat, utils, R6, crayon, rprojroot"                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
## DiagrammeR        "dplyr (>= 0.7.6), downloader (>= 0.4), glue (>= 1.3.0),\nhtmltools (>= 0.3.6), htmlwidgets (>= 1.2), igraph (>= 1.2.2),\ninfluenceR (>= 0.1.0), magrittr (>= 1.5), purrr (>= 0.2.5),\nRColorBrewer (>= 1.1-2), readr (>= 1.1.1), rlang (>= 0.2.2),\nrstudioapi (>= 0.7), scales (>= 1.0.0), stringr (>= 1.3.1),\ntibble (>= 1.4.2), tidyr (>= 0.8.1), viridis (>= 0.5.1),\nvisNetwork (>= 2.0.4)"                                                                                                          
## dials             "glue, purrr, tibble, rlang, utils, withr, DiceDesign, dplyr"                                                                                                                                                                                                                                                                                                                                                                                                                                               
## DiceDesign        NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## digest            "utils"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
## downloader        "utils, digest"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
## dplyr             "ellipsis, assertthat (>= 0.2.0), glue (>= 1.3.0), magrittr (>=\n1.5), methods, pkgconfig, R6, Rcpp (>= 1.0.1), rlang (>=\n0.4.0), tibble (>= 2.0.0), tidyselect (>= 0.2.5), utils"                                                                                                                                                                                                                                                                                                                         
## DT                "htmltools (>= 0.3.6), htmlwidgets (>= 1.3), jsonlite (>=\n0.9.16), magrittr, crosstalk, promises"                                                                                                                                                                                                                                                                                                                                                                                                          
## dygraphs          "magrittr, htmlwidgets (>= 0.6), htmltools (>= 0.3.5), zoo (>=\n1.7-10), xts (>= 0.9-7)"                                                                                                                                                                                                                                                                                                                                                                                                                    
## ellipsis          "rlang (>= 0.3.0)"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## evaluate          "methods"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
## fansi             NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## farver            NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## fastmap           NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## flextable         "stats, utils, grDevices, graphics, officer (>= 0.2.0),\nrmarkdown, knitr, htmltools, xml2, data.table, gdtools (>=\n0.1.6), rlang, base64enc"                                                                                                                                                                                                                                                                                                                                                              
## forcats           "ellipsis, magrittr, rlang, tibble"                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
## foreach           "codetools, utils, iterators"                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
## fs                "methods, Rcpp"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
## furrr             "globals (>= 0.10.3), rlang (>= 0.2.0), purrr (>= 0.2.4)"                                                                                                                                                                                                                                                                                                                                                                                                                                                   
## future            "digest, globals (>= 0.12.5), listenv (>= 0.8.0), parallel,\nutils"                                                                                                                                                                                                                                                                                                                                                                                                                                         
## gdtools           "Rcpp (>= 0.12.12), systemfonts (>= 0.1.1)"                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
## generics          "methods"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
## ggmap             "RgoogleMaps, png, plyr, rjson, jpeg, digest, scales, dplyr,\nbitops, grid, glue, httr, stringr, purrr, magrittr, tibble,\ntidyr"                                                                                                                                                                                                                                                                                                                                                                           
## ggplot2           "digest, grDevices, grid, gtable (>= 0.1.1), lazyeval, MASS,\nmgcv, reshape2, rlang (>= 0.3.0), scales (>= 0.5.0), stats,\ntibble, viridisLite, withr (>= 2.0.0)"                                                                                                                                                                                                                                                                                                                                           
## ggridges          "ggplot2 (>= 3.0.0), grid (>= 3.0.0), plyr (>= 1.8.0), scales\n(>= 0.4.1), withr (>= 2.1.1)"                                                                                                                                                                                                                                                                                                                                                                                                                
## ggvis             "assertthat, jsonlite (>= 0.9.11), shiny (>= 0.11.1), magrittr,\ndplyr (>= 0.5.0), lazyeval, htmltools (>= 0.2.4), methods"                                                                                                                                                                                                                                                                                                                                                                                 
## globals           "codetools"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
## glue              "methods"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
## gower             NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## GPfit             "lhs (>= 0.5), lattice (>= 0.18-8)"                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
## gridExtra         "gtable, grid, grDevices, graphics, utils"                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
## gtable            "grid"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
## gtools            NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## hardhat           "glue, rlang (>= 0.4.1), tibble, vctrs (>= 0.2.0)"                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## haven             "forcats (>= 0.2.0), hms, Rcpp (>= 0.11.4), readr (>= 0.1.0),\nrlang (>= 0.4.0), tibble, tidyselect"                                                                                                                                                                                                                                                                                                                                                                                                        
## highr             NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## hms               "methods, pkgconfig, rlang, vctrs (>= 0.2.1)"                                                                                                                                                                                                                                                                                                                                                                                                                                                               
## htmltools         "utils, digest, Rcpp, rlang"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
## htmlwidgets       "grDevices, htmltools (>= 0.3), jsonlite (>= 0.9.16), yaml"                                                                                                                                                                                                                                                                                                                                                                                                                                                 
## httpuv            "Rcpp (>= 0.11.0), utils, R6, promises, later (>= 0.8.0)"                                                                                                                                                                                                                                                                                                                                                                                                                                                   
## httr              "curl (>= 3.0.0), jsonlite, mime, openssl (>= 0.8), R6"                                                                                                                                                                                                                                                                                                                                                                                                                                                     
## hunspell          "Rcpp, digest"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
## igraph            "graphics, grDevices, magrittr, Matrix, pkgconfig (>= 2.0.0),\nstats, utils"                                                                                                                                                                                                                                                                                                                                                                                                                                
## infer             "dplyr (>= 0.7.0), methods, tibble, rlang (>= 0.2.0), ggplot2,\nmagrittr, glue (>= 1.3.0), grDevices, purrr, lifecycle"                                                                                                                                                                                                                                                                                                                                                                                     
## influenceR        "igraph (>= 1.0.1), Matrix (>= 1.1-4), methods, utils"                                                                                                                                                                                                                                                                                                                                                                                                                                                      
## inline            "methods"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
## ipred             "rpart (>= 3.1-8), MASS, survival, nnet, class, prodlim"                                                                                                                                                                                                                                                                                                                                                                                                                                                    
## ISOcodes          NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## iterators         NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## janeaustenr       NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## jpeg              NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## jsonlite          NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## knitr             "evaluate (>= 0.10), highr, markdown, stringr (>= 0.6), yaml\n(>= 2.1.19), methods, xfun, tools"                                                                                                                                                                                                                                                                                                                                                                                                            
## labeling          NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## later             "Rcpp (>= 0.12.9), rlang"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
## lava              "grDevices, graphics, methods, numDeriv, stats, survival,\nSQUAREM, utils"                                                                                                                                                                                                                                                                                                                                                                                                                                  
## lazyeval          NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## leaflet           "base64enc, crosstalk, htmlwidgets, htmltools, magrittr,\nmarkdown, methods, png, RColorBrewer, raster, scales (>=\n1.0.0), sp, stats, viridis (>= 0.5.1), leaflet.providers (>=\n1.8.0)"                                                                                                                                                                                                                                                                                                                   
## leaflet.providers NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## lhs               "Rcpp"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
## lifecycle         "glue, rlang (>= 0.4.0)"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
## listenv           NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## lme4              "graphics, grid, splines, utils, parallel, MASS, lattice, boot,\nnlme (>= 3.1-123), minqa (>= 1.1.15), nloptr (>= 1.0.4)"                                                                                                                                                                                                                                                                                                                                                                                   
## loo               "checkmate, matrixStats (>= 0.52), parallel, stats"                                                                                                                                                                                                                                                                                                                                                                                                                                                         
## lubridate         "stringr, Rcpp (>= 0.12.13),"                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
## magrittr          NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## manipulateWidget  "shiny (>= 1.0.3), miniUI, htmltools, htmlwidgets, knitr,\nmethods, tools, base64enc, grDevices, codetools, webshot"                                                                                                                                                                                                                                                                                                                                                                                        
## maptools          "foreign (>= 0.8), methods, grid, lattice, stats, utils,\ngrDevices"                                                                                                                                                                                                                                                                                                                                                                                                                                        
## markdown          "utils, xfun, mime (>= 0.3)"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
## MatrixModels      "stats, methods, Matrix (>= 1.1-5)"                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
## matrixStats       NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## mime              "tools"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
## miniUI            "shiny (>= 0.13), htmltools (>= 0.3), utils"                                                                                                                                                                                                                                                                                                                                                                                                                                                                
## minqa             "Rcpp (>= 0.9.10)"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## modelr            "broom, dplyr, magrittr, purrr (>= 0.2.2), rlang (>= 0.2.0),\ntibble, tidyr (>= 0.8.0)"                                                                                                                                                                                                                                                                                                                                                                                                                     
## munsell           "colorspace, methods"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
## nloptr            NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## numDeriv          NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## odbc              "bit64, blob (>= 1.2.0), DBI (>= 1.0.0), hms, methods, rlang,\nRcpp (>= 0.12.11)"                                                                                                                                                                                                                                                                                                                                                                                                                           
## officer           "Rcpp (>= 0.12.12), R6, grDevices, base64enc, zip (>= 2.0.3),\ndigest,uuid,stats, magrittr,htmltools,rlang (>= 0.4.0), xml2\n(>= 1.1.0)"                                                                                                                                                                                                                                                                                                                                                                    
## openssl           "askpass"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
## openxlsx          "grDevices, methods, Rcpp, stats, utils, zip, stringi"                                                                                                                                                                                                                                                                                                                                                                                                                                                      
## packrat           "tools, utils"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
## pagedown          "rmarkdown (>= 1.16), bookdown (>= 0.8), htmltools, jsonlite,\nlater (>= 1.0.0), processx, servr (>= 0.13), httpuv, xfun,\nwebsocket"                                                                                                                                                                                                                                                                                                                                                                       
## parsnip           "dplyr (>= 0.8.0.1), rlang (>= 0.3.1), purrr, utils, tibble (>=\n2.1.1), generics, glue, magrittr, stats, tidyr, globals,\nprettyunits, vctrs (>= 0.2.0)"                                                                                                                                                                                                                                                                                                                                                   
## pbkrtest          "Matrix (>= 1.2.3), parallel, MASS, methods"                                                                                                                                                                                                                                                                                                                                                                                                                                                                
## pillar            "cli, crayon (>= 1.3.4), fansi, rlang (>= 0.3.0), utf8 (>=\n1.1.0), vctrs (>= 0.2.0)"                                                                                                                                                                                                                                                                                                                                                                                                                       
## pkgbuild          "callr (>= 3.2.0), cli, crayon, desc, prettyunits, R6,\nrprojroot, withr (>= 2.1.2)"                                                                                                                                                                                                                                                                                                                                                                                                                        
## pkgconfig         "utils"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
## plogr             NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## plyr              "Rcpp (>= 0.11.0)"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## png               NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## prettyunits       NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## pROC              "methods, plyr, Rcpp (>= 0.11.1)"                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
## processx          "ps (>= 1.2.0), R6, utils"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
## prodlim           "Rcpp (>= 0.11.5), stats, grDevices, graphics, survival,\nKernSmooth, lava"                                                                                                                                                                                                                                                                                                                                                                                                                                 
## progress          "hms, prettyunits, R6, crayon"                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
## promises          "R6, Rcpp, later, rlang, stats, magrittr"                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
## ps                "utils"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
## purrr             "magrittr (>= 1.5), rlang (>= 0.3.1)"                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
## quantreg          "methods, graphics, Matrix, MatrixModels"                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
## R6                NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## raster            "Rcpp, methods"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
## RColorBrewer      NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## Rcpp              "methods, utils"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
## RcppEigen         "Matrix (>= 1.1-0), Rcpp (>= 0.11.0), stats, utils"                                                                                                                                                                                                                                                                                                                                                                                                                                                         
## RcppParallel      NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## RCurl             "bitops"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
## readr             "Rcpp (>= 0.12.0.5), tibble, hms (>= 0.4.1), R6, clipr, crayon,\nmethods"                                                                                                                                                                                                                                                                                                                                                                                                                                   
## readxl            "cellranger, Rcpp (>= 0.12.18), tibble (>= 1.3.1), utils"                                                                                                                                                                                                                                                                                                                                                                                                                                                   
## recipes           "generics, glue, gower, ipred, lubridate, magrittr, Matrix,\npurrr (>= 0.2.3), rlang (>= 0.4.0), stats, tibble, tidyr (>=\n0.8.3), tidyselect (>= 0.2.5), timeDate, utils, withr"                                                                                                                                                                                                                                                                                                                           
## rematch           NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## reprex            "callr (>= 2.0.0), clipr (>= 0.4.0), fs, rlang, rmarkdown,\nutils, whisker, withr"                                                                                                                                                                                                                                                                                                                                                                                                                          
## reshape2          "plyr (>= 1.8.1), Rcpp, stringr"                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
## rgl               "graphics, grDevices, stats, utils, htmlwidgets, htmltools,\nknitr, jsonlite (>= 0.9.20), shiny, magrittr, crosstalk,\nmanipulateWidget (>= 0.9.0)"                                                                                                                                                                                                                                                                                                                                                         
## RgoogleMaps       "graphics, stats, utils, grDevices, methods, png,sp"                                                                                                                                                                                                                                                                                                                                                                                                                                                        
## rio               "tools, stats, utils, foreign, haven (>= 1.1.0), curl (>= 0.6),\ndata.table (>= 1.9.8), readxl (>= 0.1.1), openxlsx, tibble"                                                                                                                                                                                                                                                                                                                                                                                
## rjson             NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## rlang             NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## rmarkdown         "tools, utils, knitr (>= 1.22), yaml (>= 2.1.19), htmltools (>=\n0.3.5), evaluate (>= 0.13), base64enc, jsonlite, mime, tinytex\n(>= 0.11), xfun, methods, stringr (>= 1.2.0)"                                                                                                                                                                                                                                                                                                                              
## rprojroot         "backports"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
## rsample           "dplyr, purrr, tibble, rlang (>= 0.4.0), methods, generics,\nutils, tidyselect, furrr"                                                                                                                                                                                                                                                                                                                                                                                                                      
## rsconnect         "curl, digest, jsonlite, openssl, packrat (>= 0.4.8-1),\nrstudioapi (>= 0.5), yaml (>= 2.1.5)"                                                                                                                                                                                                                                                                                                                                                                                                              
## rstan             "methods, stats4, inline, gridExtra (>= 2.0.0), Rcpp (>=\n0.12.0), loo (>= 2.0.0), pkgbuild"                                                                                                                                                                                                                                                                                                                                                                                                                
## rstanarm          "bayesplot (>= 1.7.0), ggplot2 (>= 2.2.1), lme4 (>= 1.1-8), loo\n(>= 2.1.0), Matrix (>= 1.2-13), nlme (>= 3.1-124), rstan (>=\n2.19.1), rstantools (>= 2.0.0), shinystan (>= 2.3.0), stats,\nsurvival (>= 2.40.1), RcppParallel, utils"                                                                                                                                                                                                                                                                     
## rstantools        "stats, utils, Rcpp (>= 0.12.16), desc"                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
## rstudioapi        NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## rvest             "httr (>= 0.5), magrittr, selectr"                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## rvg               "grDevices, Rcpp (>= 0.12.12), officer (>= 0.3.6), gdtools (>=\n0.2.1), xml2 (>= 1.0.0), rlang"                                                                                                                                                                                                                                                                                                                                                                                                             
## scales            "farver (>= 2.0.0), labeling, munsell (>= 0.5), R6,\nRColorBrewer, viridisLite, lifecycle"                                                                                                                                                                                                                                                                                                                                                                                                                  
## selectr           "methods, stringr, R6"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
## servr             "mime (>= 0.2), httpuv (>= 1.4.0), xfun, jsonlite"                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## shiny             "utils, grDevices, httpuv (>= 1.5.2), mime (>= 0.3), jsonlite\n(>= 0.9.16), xtable, digest, htmltools (>= 0.4.0), R6 (>= 2.0),\nsourcetools, later (>= 1.0.0), promises (>= 1.1.0), tools,\ncrayon, rlang (>= 0.4.0), fastmap (>= 1.0.0)"                                                                                                                                                                                                                                                                   
## shinyjs           "digest (>= 0.6.8), htmltools (>= 0.2.9), jsonlite, shiny (>=\n1.0.0)"                                                                                                                                                                                                                                                                                                                                                                                                                                      
## shinystan         "bayesplot (>= 1.5.0), colourpicker, DT (>= 0.2), dygraphs (>=\n1.1.1.2), ggplot2 (>= 2.1.1), gridExtra, gtools, markdown (>=\n0.7.4), methods, reshape2, rsconnect (>= 0.4.2), rstan (>=\n2.17.1), stats, shinyjs (>= 0.6.0), shinythemes (>= 1.0.1),\nthreejs (>= 0.2.1), utils, xtable, xts (>= 0.9-7)"                                                                                                                                                                                                  
## shinythemes       "shiny (>= 0.11)"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
## SnowballC         NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## sourcetools       NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## sp                "utils, stats, graphics, grDevices, lattice, grid"                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## SparseM           "graphics, stats, utils"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
## SQUAREM           NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## StanHeaders       NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## stopwords         "ISOcodes"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
## stringi           "tools, utils, stats"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
## stringr           "glue (>= 1.2.0), magrittr, stringi (>= 1.1.7)"                                                                                                                                                                                                                                                                                                                                                                                                                                                             
## svglite           "Rcpp, gdtools (>= 0.1.6)"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
## sys               NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## systemfonts       NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## threejs           "htmlwidgets (>= 0.3.2), base64enc, crosstalk, methods, stats"                                                                                                                                                                                                                                                                                                                                                                                                                                              
## tibble            "cli, crayon (>= 1.3.4), fansi (>= 0.4.0), methods, pillar (>=\n1.3.1), pkgconfig, rlang (>= 0.3.0), utils"                                                                                                                                                                                                                                                                                                                                                                                                 
## tidymodels        "broom (>= 0.5.4), cli (>= 2.0.1), crayon (>= 1.3.4), dials (>=\n0.0.4), dplyr (>= 0.8.4), ggplot2 (>= 3.2.1), infer (>= 0.5.1),\nmagrittr (>= 1.5), parsnip (>= 0.0.5), pillar (>= 1.4.3), purrr\n(>= 0.3.3), recipes (>= 0.1.9), rlang (>= 0.4.4), rsample (>=\n0.0.5), rstudioapi (>= 0.11), tibble (>= 2.1.3), tidytext (>=\n0.2.2), tidypredict (>= 0.4.3), tidyposterior (>= 0.0.2), tune\n(>= 0.0.1), workflows (>= 0.1.0), yardstick (>= 0.0.4)"                                                    
## tidyposterior     "rsample (>= 0.0.2), tidyr (>= 0.7.1), dplyr, rstanarm (>=\n2.15.3), rlang, utils, purrr, tibble, generics, ggplot2,"                                                                                                                                                                                                                                                                                                                                                                                       
## tidypredict       "dplyr (>= 0.7), rlang, purrr, knitr, generics, tibble"                                                                                                                                                                                                                                                                                                                                                                                                                                                     
## tidyr             "dplyr (>= 0.8.2), ellipsis (>= 0.1.0), glue, magrittr, purrr,\nRcpp, rlang, stringi, tibble (>= 2.1.1), tidyselect (>= 0.2.5),\nutils, vctrs (>= 0.2.0), lifecycle"                                                                                                                                                                                                                                                                                                                                        
## tidyselect        "glue (>= 1.3.0), purrr, rlang (>= 0.2.2), Rcpp (>= 0.12.0)"                                                                                                                                                                                                                                                                                                                                                                                                                                                
## tidytext          "rlang, dplyr, stringr, hunspell, generics, Matrix, tokenizers,\njaneaustenr, purrr (>= 0.1.1), methods, stopwords"                                                                                                                                                                                                                                                                                                                                                                                         
## tidyverse         "broom (>= 0.5.2), cli (>= 1.1.0), crayon (>= 1.3.4), dbplyr\n(>= 1.4.2), dplyr (>= 0.8.3), forcats (>= 0.4.0), ggplot2 (>=\n3.2.1), haven (>= 2.2.0), hms (>= 0.5.2), httr (>= 1.4.1),\njsonlite (>= 1.6), lubridate (>= 1.7.4), magrittr (>= 1.5),\nmodelr (>= 0.1.5), pillar (>= 1.4.2), purrr (>= 0.3.3), readr\n(>= 1.3.1), readxl (>= 1.3.1), reprex (>= 0.3.0), rlang (>=\n0.4.1), rstudioapi (>= 0.10), rvest (>= 0.3.5), stringr (>=\n1.4.0), tibble (>= 2.1.3), tidyr (>= 1.0.0), xml2 (>= 1.2.2)"
## timeDate          NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## tinytex           "xfun (>= 0.5)"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
## tokenizers        "stringi (>= 1.0.1), Rcpp (>= 0.12.3), SnowballC (>= 0.5.1)"                                                                                                                                                                                                                                                                                                                                                                                                                                                
## tune              "dplyr (>= 0.8.3), rlang (>= 0.4.0), tibble (>= 2.1.3), purrr\n(>= 0.3.2), dials (>= 0.0.4), recipes (>= 0.1.9), utils,\nggplot2, glue, cli (>= 2.0.0), crayon, yardstick, rsample,\ntidyr, GPfit, foreach, parsnip (>= 0.0.4), workflows (>=\n0.1.0), hardhat (>= 0.1.0)"                                                                                                                                                                                                                                  
## utf8              NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## uuid              NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## vctrs             "backports, ellipsis (>= 0.2.0), digest, glue, rlang (>=\n0.4.0), zeallot"                                                                                                                                                                                                                                                                                                                                                                                                                                  
## viridis           "stats, ggplot2 (>= 1.0.1), gridExtra"                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
## viridisLite       NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## visNetwork        "htmlwidgets, htmltools, jsonlite, magrittr, utils, methods,\ngrDevices, stats"                                                                                                                                                                                                                                                                                                                                                                                                                             
## webshot           "magrittr, jsonlite, callr"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
## websocket         "Rcpp, R6, later"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
## whisker           NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## withr             "stats, graphics, grDevices"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
## workflows         "cli (>= 2.0.0), ellipsis (>= 0.2.0), generics, glue, hardhat,\nparsnip (>= 0.0.4), rlang (>= 0.4.1)"                                                                                                                                                                                                                                                                                                                                                                                                       
## writexl           NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## xfun              "stats, tools"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
## xml2              "Rcpp, methods"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
## xtable            "stats, utils"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
## xts               "methods"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
## yaml              NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## yardstick         "dplyr, utils, pROC (>= 1.15.0), rlang (>= 0.4.0), tidyselect,\nRcpp, generics"                                                                                                                                                                                                                                                                                                                                                                                                                             
## zeallot           NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## zip               NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## zoo               "utils, graphics, grDevices, lattice (>= 0.20-27)"                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## base              NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## boot              NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## class             "MASS"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
## cluster           "graphics, grDevices, stats, utils"                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
## codetools         NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## compiler          NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## datasets          NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## foreign           "methods, utils, stats"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
## graphics          "grDevices"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
## grDevices         NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## grid              "grDevices, utils"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## KernSmooth        NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## lattice           "grid, grDevices, graphics, stats, utils"                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
## MASS              "methods"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
## Matrix            "methods, graphics, grid, stats, utils, lattice"                                                                                                                                                                                                                                                                                                                                                                                                                                                            
## methods           "utils, stats"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
## mgcv              "methods, stats, graphics, Matrix, splines, utils"                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## nlme              "graphics, stats, utils, lattice"                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
## nnet              NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## parallel          "tools, compiler"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
## rpart             NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## spatial           NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## splines           "graphics, stats"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
## stats             "utils, grDevices, graphics"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
## stats4            "graphics, methods, stats"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
## survival          "graphics, Matrix, methods, splines, stats, utils"                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## tcltk             "utils"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
## tools             NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## utils             NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
##                   LinkingTo                                                                                                  
## abind             NA                                                                                                         
## AsioHeaders       NA                                                                                                         
## askpass           NA                                                                                                         
## assertthat        NA                                                                                                         
## backports         NA                                                                                                         
## base64enc         NA                                                                                                         
## bayesplot         NA                                                                                                         
## BH                NA                                                                                                         
## bit               NA                                                                                                         
## bit64             NA                                                                                                         
## bitops            NA                                                                                                         
## blob              NA                                                                                                         
## bookdown          NA                                                                                                         
## broom             NA                                                                                                         
## callr             NA                                                                                                         
## car               NA                                                                                                         
## carData           NA                                                                                                         
## cellranger        NA                                                                                                         
## checkmate         NA                                                                                                         
## cli               NA                                                                                                         
## clipr             NA                                                                                                         
## colorspace        NA                                                                                                         
## colourpicker      NA                                                                                                         
## cowplot           NA                                                                                                         
## crayon            NA                                                                                                         
## crosstalk         NA                                                                                                         
## curl              NA                                                                                                         
## data.table        NA                                                                                                         
## DBI               NA                                                                                                         
## dbplyr            NA                                                                                                         
## desc              NA                                                                                                         
## DiagrammeR        NA                                                                                                         
## dials             NA                                                                                                         
## DiceDesign        NA                                                                                                         
## digest            NA                                                                                                         
## downloader        NA                                                                                                         
## dplyr             "BH, plogr (>= 0.2.0), Rcpp (>= 1.0.1)"                                                                    
## DT                NA                                                                                                         
## dygraphs          NA                                                                                                         
## ellipsis          NA                                                                                                         
## evaluate          NA                                                                                                         
## fansi             NA                                                                                                         
## farver            NA                                                                                                         
## fastmap           NA                                                                                                         
## flextable         NA                                                                                                         
## forcats           NA                                                                                                         
## foreach           NA                                                                                                         
## fs                "Rcpp"                                                                                                     
## furrr             NA                                                                                                         
## future            NA                                                                                                         
## gdtools           "Rcpp"                                                                                                     
## generics          NA                                                                                                         
## ggmap             NA                                                                                                         
## ggplot2           NA                                                                                                         
## ggridges          NA                                                                                                         
## ggvis             NA                                                                                                         
## globals           NA                                                                                                         
## glue              NA                                                                                                         
## gower             NA                                                                                                         
## GPfit             NA                                                                                                         
## gridExtra         NA                                                                                                         
## gtable            NA                                                                                                         
## gtools            NA                                                                                                         
## hardhat           NA                                                                                                         
## haven             "Rcpp"                                                                                                     
## highr             NA                                                                                                         
## hms               NA                                                                                                         
## htmltools         "Rcpp"                                                                                                     
## htmlwidgets       NA                                                                                                         
## httpuv            "Rcpp, BH, later"                                                                                          
## httr              NA                                                                                                         
## hunspell          "Rcpp (>= 0.12.12)"                                                                                        
## igraph            NA                                                                                                         
## infer             NA                                                                                                         
## influenceR        NA                                                                                                         
## inline            NA                                                                                                         
## ipred             NA                                                                                                         
## ISOcodes          NA                                                                                                         
## iterators         NA                                                                                                         
## janeaustenr       NA                                                                                                         
## jpeg              NA                                                                                                         
## jsonlite          NA                                                                                                         
## knitr             NA                                                                                                         
## labeling          NA                                                                                                         
## later             "Rcpp, BH"                                                                                                 
## lava              NA                                                                                                         
## lazyeval          NA                                                                                                         
## leaflet           NA                                                                                                         
## leaflet.providers NA                                                                                                         
## lhs               "Rcpp"                                                                                                     
## lifecycle         NA                                                                                                         
## listenv           NA                                                                                                         
## lme4              "Rcpp (>= 0.10.5), RcppEigen"                                                                              
## loo               NA                                                                                                         
## lubridate         "Rcpp,"                                                                                                    
## magrittr          NA                                                                                                         
## manipulateWidget  NA                                                                                                         
## maptools          NA                                                                                                         
## markdown          NA                                                                                                         
## MatrixModels      NA                                                                                                         
## matrixStats       NA                                                                                                         
## mime              NA                                                                                                         
## miniUI            NA                                                                                                         
## minqa             "Rcpp"                                                                                                     
## modelr            NA                                                                                                         
## munsell           NA                                                                                                         
## nloptr            NA                                                                                                         
## numDeriv          NA                                                                                                         
## odbc              "BH, Rcpp"                                                                                                 
## officer           "Rcpp"                                                                                                     
## openssl           NA                                                                                                         
## openxlsx          "Rcpp"                                                                                                     
## packrat           NA                                                                                                         
## pagedown          NA                                                                                                         
## parsnip           NA                                                                                                         
## pbkrtest          NA                                                                                                         
## pillar            NA                                                                                                         
## pkgbuild          NA                                                                                                         
## pkgconfig         NA                                                                                                         
## plogr             NA                                                                                                         
## plyr              "Rcpp"                                                                                                     
## png               NA                                                                                                         
## prettyunits       NA                                                                                                         
## pROC              "Rcpp"                                                                                                     
## processx          NA                                                                                                         
## prodlim           "Rcpp"                                                                                                     
## progress          NA                                                                                                         
## promises          "later, Rcpp"                                                                                              
## ps                NA                                                                                                         
## purrr             NA                                                                                                         
## quantreg          NA                                                                                                         
## R6                NA                                                                                                         
## raster            "Rcpp"                                                                                                     
## RColorBrewer      NA                                                                                                         
## Rcpp              NA                                                                                                         
## RcppEigen         "Rcpp"                                                                                                     
## RcppParallel      NA                                                                                                         
## RCurl             NA                                                                                                         
## readr             "Rcpp, BH"                                                                                                 
## readxl            "progress, Rcpp"                                                                                           
## recipes           NA                                                                                                         
## rematch           NA                                                                                                         
## reprex            NA                                                                                                         
## reshape2          "Rcpp"                                                                                                     
## rgl               NA                                                                                                         
## RgoogleMaps       NA                                                                                                         
## rio               NA                                                                                                         
## rjson             NA                                                                                                         
## rlang             NA                                                                                                         
## rmarkdown         NA                                                                                                         
## rprojroot         NA                                                                                                         
## rsample           NA                                                                                                         
## rsconnect         NA                                                                                                         
## rstan             "Rcpp (>= 0.12.0), RcppEigen (>= 0.3.3.3.0), BH (>=\n1.72.0-2), StanHeaders (> 2.18.1)"                    
## rstanarm          "StanHeaders (>= 2.19.0), rstan (>= 2.19.1), BH (>=\n1.72.0-2), Rcpp (>= 0.12.0), RcppEigen (>= 0.3.3.3.0)"
## rstantools        NA                                                                                                         
## rstudioapi        NA                                                                                                         
## rvest             NA                                                                                                         
## rvg               "Rcpp, gdtools"                                                                                            
## scales            NA                                                                                                         
## selectr           NA                                                                                                         
## servr             NA                                                                                                         
## shiny             NA                                                                                                         
## shinyjs           NA                                                                                                         
## shinystan         NA                                                                                                         
## shinythemes       NA                                                                                                         
## SnowballC         NA                                                                                                         
## sourcetools       NA                                                                                                         
## sp                NA                                                                                                         
## SparseM           NA                                                                                                         
## SQUAREM           NA                                                                                                         
## StanHeaders       NA                                                                                                         
## stopwords         NA                                                                                                         
## stringi           NA                                                                                                         
## stringr           NA                                                                                                         
## svglite           "Rcpp, gdtools, BH"                                                                                        
## sys               NA                                                                                                         
## systemfonts       NA                                                                                                         
## threejs           NA                                                                                                         
## tibble            NA                                                                                                         
## tidymodels        NA                                                                                                         
## tidyposterior     NA                                                                                                         
## tidypredict       NA                                                                                                         
## tidyr             "Rcpp"                                                                                                     
## tidyselect        "Rcpp (>= 0.12.0),"                                                                                        
## tidytext          NA                                                                                                         
## tidyverse         NA                                                                                                         
## timeDate          NA                                                                                                         
## tinytex           NA                                                                                                         
## tokenizers        "Rcpp"                                                                                                     
## tune              NA                                                                                                         
## utf8              NA                                                                                                         
## uuid              NA                                                                                                         
## vctrs             NA                                                                                                         
## viridis           NA                                                                                                         
## viridisLite       NA                                                                                                         
## visNetwork        NA                                                                                                         
## webshot           NA                                                                                                         
## websocket         "Rcpp, BH, AsioHeaders"                                                                                    
## whisker           NA                                                                                                         
## withr             NA                                                                                                         
## workflows         NA                                                                                                         
## writexl           NA                                                                                                         
## xfun              NA                                                                                                         
## xml2              "Rcpp (>= 0.12.12)"                                                                                        
## xtable            NA                                                                                                         
## xts               "zoo"                                                                                                      
## yaml              NA                                                                                                         
## yardstick         "Rcpp"                                                                                                     
## zeallot           NA                                                                                                         
## zip               NA                                                                                                         
## zoo               NA                                                                                                         
## base              NA                                                                                                         
## boot              NA                                                                                                         
## class             NA                                                                                                         
## cluster           NA                                                                                                         
## codetools         NA                                                                                                         
## compiler          NA                                                                                                         
## datasets          NA                                                                                                         
## foreign           NA                                                                                                         
## graphics          NA                                                                                                         
## grDevices         NA                                                                                                         
## grid              NA                                                                                                         
## KernSmooth        NA                                                                                                         
## lattice           NA                                                                                                         
## MASS              NA                                                                                                         
## Matrix            NA                                                                                                         
## methods           NA                                                                                                         
## mgcv              NA                                                                                                         
## nlme              NA                                                                                                         
## nnet              NA                                                                                                         
## parallel          NA                                                                                                         
## rpart             NA                                                                                                         
## spatial           NA                                                                                                         
## splines           NA                                                                                                         
## stats             NA                                                                                                         
## stats4            NA                                                                                                         
## survival          NA                                                                                                         
## tcltk             NA                                                                                                         
## tools             NA                                                                                                         
## utils             NA                                                                                                         
##                   Suggests                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
## abind             NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
## AsioHeaders       NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
## askpass           "testthat"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
## assertthat        "testthat, covr"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
## backports         NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
## base64enc         NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
## bayesplot         "gridExtra (>= 2.2.1), hexbin, knitr (>= 1.16), loo (>=\n2.0.0), RColorBrewer, rmarkdown (>= 1.0.0), rstan (>= 2.17.1),\nrstanarm (>= 2.17.4), rstantools (>= 1.5.0), scales, shinystan\n(>= 2.3.0), testthat (>= 2.0.0), vdiffr"                                                                                                                                                                                                                                                                                                                                      
## BH                NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
## bit               NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
## bit64             NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
## bitops            NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
## blob              "covr, crayon, pillar (>= 1.2.1), testthat"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
## bookdown          "htmlwidgets, rstudioapi, miniUI, rsconnect (>= 0.4.3), servr\n(>= 0.13), shiny, testit (>= 0.9), tufte, webshot"                                                                                                                                                                                                                                                                                                                                                                                                                                                      
## broom             "AER, akima, AUC, bbmle, betareg, biglm, binGroup, boot, brms,\nbtergm, car, caret, coda, covr, e1071, emmeans, ergm, gam (>=\n1.15), gamlss, gamlss.data, gamlss.dist, geepack, ggplot2,\nglmnet, gmm, Hmisc, irlba, Kendall, knitr, ks, Lahman, lavaan,\nlfe, lme4, lmodel2, lmtest, lsmeans, maps, maptools, MASS,\nMatrix, mclust, mgcv, muhaz, multcomp, network, nnet, orcutt\n(>= 2.2), ordinal, plm, plyr, poLCA, psych, quantreg, rgeos,\nrmarkdown, rsample, rstan, rstanarm, sp, speedglm,\nstatnet.common, survey, survival, testthat, tseries, xergm, zoo"
## callr             "cliapp, covr, crayon, fansi, knitr, pingr, ps, rmarkdown,\nrprojroot, spelling, testthat, tibble, withr"                                                                                                                                                                                                                                                                                                                                                                                                                                                              
## car               "alr4, boot, coxme, leaps, lmtest, Matrix, MatrixModels, rgl\n(>= 0.93.960), sandwich, SparseM, survival, survey"                                                                                                                                                                                                                                                                                                                                                                                                                                                      
## carData           NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
## cellranger        "covr, testthat (>= 1.0.0), knitr, rmarkdown"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## checkmate         "R6, fastmatch, data.table (>= 1.9.8), devtools, ggplot2,\nknitr, magrittr, microbenchmark, rmarkdown, testthat (>=\n0.11.0), tinytest (>= 1.1.0), tibble"                                                                                                                                                                                                                                                                                                                                                                                                             
## cli               "callr, covr, htmlwidgets, knitr, mockery, rmarkdown,\nrstudioapi, prettycode (>= 1.1.0), testthat, withr"                                                                                                                                                                                                                                                                                                                                                                                                                                                             
## clipr             "covr, knitr, rmarkdown, rstudioapi (>= 0.5), testthat (>=\n2.0.0)"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
## colorspace        "datasets, utils, KernSmooth, MASS, kernlab, mvtnorm, vcd,\ntcltk, shiny, shinyjs, ggplot2, dplyr, scales, grid, png, jpeg,\nknitr, rmarkdown, RColorBrewer, rcartocolor, scico, viridis,\nwesanderson"                                                                                                                                                                                                                                                                                                                                                                
## colourpicker      "knitr (>= 1.7), rmarkdown, rstudioapi (>= 0.5)"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
## cowplot           "Cairo, covr, dplyr, forcats, gridGraphics (>= 0.4-0), knitr,\nlattice, magick, maps, PASWR, rmarkdown, testthat (>= 1.0.0),\ntidyr, vdiffr (>= 0.3.0), VennDiagram"                                                                                                                                                                                                                                                                                                                                                                                                   
## crayon            "mockery, rstudioapi, testthat, withr"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
## crosstalk         NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
## curl              "spelling, testthat (>= 1.0.0), knitr, jsonlite, rmarkdown,\nmagrittr, httpuv (>= 1.4.4), webutils"                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
## data.table        "bit64, curl, R.utils, knitr, xts, nanotime, zoo, yaml"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
## DBI               "blob, covr, hms, knitr, magrittr, rmarkdown, rprojroot,\nRSQLite (>= 1.1-2), testthat, xml2"                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## dbplyr            "bit64, covr, knitr, Lahman, nycflights13, RMariaDB (>=\n1.0.2), rmarkdown, RMySQL (>= 0.10.11), RPostgreSQL (>= 0.4.1),\nRSQLite (>= 2.1.0), testthat (>= 2.0.0), withr (>= 2.1.2)"                                                                                                                                                                                                                                                                                                                                                                                   
## desc              "covr, testthat, whoami, withr"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
## DiagrammeR        "covr, DiagrammeRsvg, rsvg, knitr, testthat, rmarkdown"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
## dials             "testthat, knitr, rpart, covr, kernlab, xml2"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## DiceDesign        "rgl, randtoolbox, lattice"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
## digest            "tinytest, knitr, rmarkdown"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
## downloader        "testthat"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
## dplyr             "bit64, callr, covr, crayon (>= 1.3.4), DBI, dbplyr, dtplyr,\nggplot2, hms, knitr, Lahman, lubridate, MASS, mgcv,\nmicrobenchmark, nycflights13, rmarkdown, RMySQL, RPostgreSQL,\nRSQLite, testthat, withr, broom, purrr, readr"                                                                                                                                                                                                                                                                                                                                       
## DT                "knitr (>= 1.8), rmarkdown, shiny (>= 1.2.0)"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## dygraphs          "testthat"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
## ellipsis          "covr, testthat"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
## evaluate          "testthat, lattice, ggplot2"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
## fansi             "unitizer, knitr, rmarkdown"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
## farver            "testthat (>= 2.1.0), covr"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
## fastmap           "testthat (>= 2.1.1)"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
## flextable         "testthat, xtable, magrittr, webshot, magick, ggplot2"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
## forcats           "covr, ggplot2, testthat, readr, knitr, rmarkdown, dplyr"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
## foreach           "randomForest, doMC, doParallel, testthat, knitr, rmarkdown"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
## fs                "testthat, covr, pillar (>= 1.0.0), crayon, rmarkdown, knitr,\nwithr, spelling"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
## furrr             "listenv (>= 0.6.0), dplyr (>= 0.7.4), testthat"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
## future            "RhpcBLASctl, R.rsp, markdown"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
## gdtools           "htmltools, testthat, fontquiver (>= 0.2.0), curl"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
## generics          "covr, pkgload, testthat, tibble"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
## ggmap             "MASS, hexbin, testthat"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
## ggplot2           "covr, dplyr, ggplot2movies, hexbin, Hmisc, knitr, lattice,\nmapproj, maps, maptools, multcomp, munsell, nlme, profvis,\nquantreg, rgeos, rmarkdown, rpart, sf (>= 0.7-3), svglite (>=\n1.2.0.9001), testthat (>= 0.11.0), vdiffr (>= 0.3.0)"                                                                                                                                                                                                                                                                                                                          
## ggridges          "covr, dplyr, patchwork, ggplot2movies, forcats, knitr,\nrmarkdown, testthat, vdiffr"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
## ggvis             "MASS, mgcv, lubridate, testthat (>= 0.8.1), knitr (>= 1.6),\nrmarkdown"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
## globals           NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
## glue              "testthat, covr, magrittr, crayon, knitr, rmarkdown, DBI,\nRSQLite, R.utils, forcats, microbenchmark, rprintf, stringr,\nggplot2, dplyr, withr"                                                                                                                                                                                                                                                                                                                                                                                                                        
## gower             "tinytest (>= 0.9.3),"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
## GPfit             "testthat"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
## gridExtra         "ggplot2, egg, lattice, knitr, testthat"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
## gtable            "covr, testthat, knitr, rmarkdown, ggplot2, profvis"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
## gtools            NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
## hardhat           "recipes (>= 0.1.8), testthat (>= 2.1.0), covr, knitr,\nrmarkdown, usethis, roxygen2, devtools"                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
## haven             "covr, fs, knitr, rmarkdown, testthat, pillar (>= 1.4.0), cli,\ncrayon"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
## highr             "knitr, testit"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
## hms               "crayon, lubridate, pillar (>= 1.1.0), testthat"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
## htmltools         "markdown, testthat, withr"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
## htmlwidgets       "knitr (>= 1.8)"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
## httpuv            "testthat, callr, curl, websocket"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
## httr              "covr, httpuv, jpeg, knitr, png, readr, rmarkdown, testthat\n(>= 0.8.0), xml2"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
## hunspell          "spelling, testthat, pdftools, janeaustenr, wordcloud2, knitr,\nstopwords, rmarkdown"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
## igraph            "ape, digest, graph, igraphdata, rgl, scales, stats4, tcltk,\ntestthat"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
## infer             "broom, devtools (>= 1.12.0), knitr, rmarkdown, nycflights13,\nstringr, testthat, covr, vdiffr"                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
## influenceR        "testthat"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
## inline            "Rcpp (>= 0.11.0)"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
## ipred             "mvtnorm, mlbench, TH.data"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
## ISOcodes          NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
## iterators         "RUnit, foreach"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
## janeaustenr       "dplyr, testthat"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
## jpeg              NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
## jsonlite          "httr, curl, plyr, testthat, knitr, rmarkdown, R.rsp, sp"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
## knitr             "formatR, testit, digest, rgl (>= 0.95.1201), codetools,\nrmarkdown, htmlwidgets (>= 0.7), webshot, tikzDevice (>= 0.10),\ntinytex, reticulate (>= 1.4), JuliaCall (>= 0.11.1), magick,\npng, jpeg, gifski, xml2 (>= 1.2.0), httr, DBI (>= 0.4-1),\nshowtext, tibble, sass, styler (>= 1.2.0)"                                                                                                                                                                                                                                                                         
## labeling          NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
## later             "knitr, rmarkdown, testthat"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
## lava              "KernSmooth, Matrix, Rgraphviz, data.table, ellipse, fields,\nforeach, geepack, gof (>= 0.9), graph, igraph (>= 0.6),\nlava.tobit (>= 0.4.7), lme4, mets (>= 1.1), nlme, optimx,\npolycor, quantreg, rgl, testthat (>= 0.11), visNetwork, zoo"                                                                                                                                                                                                                                                                                                                         
## lazyeval          "knitr, rmarkdown (>= 0.2.65), testthat, covr"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
## leaflet           "knitr, maps, sf, shiny, rgdal, rgeos, R6, RJSONIO, purrr,\ntestthat"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
## leaflet.providers "V8, jsonlite, testthat (>= 2.1.0)"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
## lhs               "testthat, DoE.base, knitr, rmarkdown, covr"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
## lifecycle         "covr, crayon, knitr, rmarkdown, testthat (>= 2.1.0)"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
## listenv           "R.utils, R.rsp, markdown"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
## lme4              "knitr, rmarkdown, PKPDmodels, MEMSS, testthat (>= 0.8.1),\nggplot2, mlmRev, optimx (>= 2013.8.6), gamm4, pbkrtest, HSAUR2,\nnumDeriv, car, dfoptim"                                                                                                                                                                                                                                                                                                                                                                                                                   
## loo               "bayesplot (>= 1.7.0), brms (>= 2.10.0), ggplot2, graphics,\nknitr, rmarkdown, rstan, rstanarm (>= 2.19.0), rstantools,\nspdep, testthat (>= 2.1.0)"                                                                                                                                                                                                                                                                                                                                                                                                                   
## lubridate         "testthat, knitr, covr"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
## magrittr          "testthat, knitr"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
## manipulateWidget  "dygraphs, leaflet, plotly, xts, rmarkdown, testthat, covr"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
## maptools          "rgeos (>= 0.1-8), spatstat (>= 1.60), PBSmapping, maps,\nRColorBrewer, raster, polyclip, spatstat.utils"                                                                                                                                                                                                                                                                                                                                                                                                                                                              
## markdown          "knitr, RCurl"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
## MatrixModels      NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
## matrixStats       "base64enc, ggplot2, knitr, microbenchmark, R.devices, R.rsp"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## mime              NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
## miniUI            NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
## minqa             NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
## modelr            "compiler, covr, ggplot2, testthat"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
## munsell           "ggplot2, testthat"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
## nloptr            "testthat (>= 0.8.1), knitr, rmarkdown, inline (>= 0.3.14)"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
## numDeriv          NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
## odbc              "covr, DBItest, magrittr, RSQLite, testthat, tibble"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
## officer           "testthat, devEMF,tibble,ggplot2, rmarkdown, knitr, rsvg"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
## openssl           "testthat, digest, knitr, rmarkdown, jsonlite, jose, sodium"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
## openxlsx          "knitr, testthat, roxygen2"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
## packrat           "testthat (>= 0.7), devtools, httr, knitr, rmarkdown"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
## pagedown          "promises, testit, xaringan, pdftools, revealjs"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
## parsnip           "testthat, knitr, rmarkdown, survival, keras, xgboost, covr,\nC50, sparklyr (>= 1.0.0), earth, kernlab, kknn, randomForest,\nranger, rpart, MASS, nlme, modeldata"                                                                                                                                                                                                                                                                                                                                                                                                     
## pbkrtest          NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
## pillar            "knitr, lubridate, testthat (>= 2.0.0), withr"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
## pkgbuild          "Rcpp, testthat, covr"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
## pkgconfig         "covr, testthat, disposables (>= 1.0.3)"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
## plogr             "Rcpp"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
## plyr              "abind, covr, doParallel, foreach, iterators, itertools,\ntcltk, testthat"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
## png               NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
## prettyunits       "codetools, covr, testthat"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
## pROC              "microbenchmark, tcltk, MASS, logcondens, doParallel,\ntestthat, vdiffr, ggplot2"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
## processx          "callr (>= 3.2.0), codetools, covr, crayon, curl, debugme,\nparallel, testthat, withr"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
## prodlim           NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
## progress          "Rcpp, testthat, withr"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
## promises          "testthat, future, knitr, rmarkdown"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
## ps                "callr, covr, curl, pingr, processx (>= 3.1.0), R6, rlang,\ntestthat, tibble"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## purrr             "covr, crayon, dplyr (>= 0.7.8), knitr, rmarkdown, testthat,\ntibble, tidyselect"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
## quantreg          "tripack, akima, MASS, survival, rgl, logspline, nor1mix,\nFormula, zoo, R.rsp"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
## R6                "knitr, microbenchmark, pryr, testthat, ggplot2, scales"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
## raster            "rgdal (>= 0.9-1), rgeos (>= 0.3-8), ncdf4, igraph, tcltk,\nparallel, rasterVis, MASS, sf, testthat"                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
## RColorBrewer      NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
## Rcpp              "RUnit, inline, rbenchmark, knitr, rmarkdown, pinp, pkgKitten\n(>= 0.1.2)"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
## RcppEigen         "inline, tinytest, pkgKitten, microbenchmark"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## RcppParallel      "Rcpp, RUnit, knitr, rmarkdown"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
## RCurl             "XML"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
## readr             "curl, testthat, knitr, rmarkdown, stringi, covr, spelling"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
## readxl            "covr, knitr, rmarkdown, rprojroot (>= 1.1), testthat"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
## recipes           "covr, ddalpha, dimRed (>= 0.2.2), fastICA, ggplot2, igraph,\nkernlab, knitr, modeldata, pls, RANN, RcppRoll, rmarkdown,\nrpart, rsample, RSpectra, testthat (>= 2.1.0), xml2"                                                                                                                                                                                                                                                                                                                                                                                         
## rematch           "covr, testthat"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
## reprex            "covr, devtools, fortunes, knitr, miniUI, rprojroot,\nrstudioapi, shiny, styler (>= 1.0.2), testthat (>= 2.0.0)"                                                                                                                                                                                                                                                                                                                                                                                                                                                       
## reshape2          "covr, lattice, testthat (>= 0.8.0)"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
## rgl               "MASS, rmarkdown, deldir, orientlib, lattice, misc3d,\nrstudioapi, magick, plotrix (>= 3.7-3), tripack, interp,\nalphashape3d, tcltk"                                                                                                                                                                                                                                                                                                                                                                                                                                  
## RgoogleMaps       "PBSmapping, maptools, loa, RColorBrewer, leaflet,jpeg, RCurl"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
## rio               "datasets, bit64, testthat, knitr, magrittr, clipr, csvy,\nfeather, fst, hexView, jsonlite, readODS (>= 1.6.4), readr,\nrmatio, xml2 (>= 1.2.0), yaml"                                                                                                                                                                                                                                                                                                                                                                                                                 
## rjson             NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
## rlang             "cli, covr, crayon, glue, magrittr, methods, pillar,\nrmarkdown, testthat (>= 2.3.0)"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
## rmarkdown         "shiny (>= 0.11), tufte, testthat, digest, dygraphs, tibble,\nfs, pkgdown, callr (>= 2.0.0)"                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
## rprojroot         "testthat, mockr, knitr, withr, rmarkdown"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
## rsample           "ggplot2, testthat, rmarkdown, knitr, AmesHousing, recipes (>=\n0.1.4), broom"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
## rsconnect         "RCurl, callr, httpuv, knitr, plumber (>= 0.3.2), reticulate,\nrmarkdown (>= 1.1), shiny, sourcetools, testthat, xtable"                                                                                                                                                                                                                                                                                                                                                                                                                                               
## rstan             "RUnit, RcppEigen (>= 0.3.3.3.0), BH (>= 1.72.0-2), parallel,\nKernSmooth, shinystan (>= 2.3.0), bayesplot (>= 1.5.0),\nrmarkdown, rstantools, rstudioapi, Matrix, knitr (>= 1.15.1)"                                                                                                                                                                                                                                                                                                                                                                                  
## rstanarm          "betareg, data.table (>= 1.10.0), digest, gridExtra, HSAUR3,\nknitr (>= 1.15.1), MASS, mgcv (>= 1.8-13), rmarkdown, roxygen2,\ntestthat (>= 1.0.2)"                                                                                                                                                                                                                                                                                                                                                                                                                    
## rstantools        "rstan (>= 2.17.2), usethis (>= 1.5.1), testthat (>= 2.0.0),\nknitr, pkgbuild, pkgload, roxygen2 (>= 6.0.1), rmarkdown,\nrstudioapi"                                                                                                                                                                                                                                                                                                                                                                                                                                   
## rstudioapi        "testthat, knitr, rmarkdown, clipr"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
## rvest             "covr, knitr, png, rmarkdown, spelling, stringi (>= 0.3.1),\ntestthat"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
## rvg               "htmltools, testthat, covr, grid, knitr"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
## scales            "bit64, covr, dichromat, hms, testthat (>= 2.1.0), ggplot2"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
## selectr           "testthat, XML, xml2"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
## servr             "tools, later, rstudioapi, knitr (>= 1.9), rmarkdown"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
## shiny             "datasets, Cairo (>= 1.5-5), testthat (>= 2.1.1), knitr (>=\n1.6), markdown, rmarkdown, ggplot2, reactlog (>= 1.0.0),\nmagrittr, yaml"                                                                                                                                                                                                                                                                                                                                                                                                                                 
## shinyjs           "knitr (>= 1.7), rmarkdown, shinyAce, testthat (>= 0.9.1), V8\n(>= 0.6)"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
## shinystan         "coda, knitr (>= 1.9), rmarkdown (>= 0.8.1), rstanarm (>=\n2.17.4), testthat"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## shinythemes       NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
## SnowballC         NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
## sourcetools       "testthat"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
## sp                "RColorBrewer, rgdal (>= 0.8-7), rgeos (>= 0.3-13), gstat,\nmaptools, deldir"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## SparseM           NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
## SQUAREM           "setRNG"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
## StanHeaders       "Rcpp, RcppEigen, BH, knitr (>= 1.15.1), rmarkdown, Matrix,\nmethods, rstan"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
## stopwords         "covr, lintr, quanteda, spelling, testthat"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
## stringi           NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
## stringr           "covr, htmltools, htmlwidgets, knitr, rmarkdown, testthat"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
## svglite           "htmltools, testthat, xml2 (>= 1.0.0), covr, fontquiver (>=\n0.2.0), knitr, rmarkdown"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
## sys               "unix (>= 1.4), spelling, testthat"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
## systemfonts       "testthat (>= 2.1.0), covr, knitr, rmarkdown, tools"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
## threejs           "maps"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
## tibble            "bench, covr, dplyr, htmltools, import, knitr, mockr,\nnycflights13, rmarkdown, testthat, withr"                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
## tidymodels        "covr, knitr, modeldata (>= 0.0.1), rmarkdown, testthat, xml2"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
## tidyposterior     "knitr, testthat, covr"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
## tidypredict       "dbplyr, testthat (>= 2.1.0), randomForest, ranger, earth,\nrmarkdown, nycflights13, RSQLite, methods, DBI, covr, xgboost,\nCubist, mlbench, partykit, yaml, parsnip"                                                                                                                                                                                                                                                                                                                                                                                                  
## tidyr             "covr, jsonlite, knitr, repurrrsive (>= 1.0.0), rmarkdown,\nreadr, testthat (>= 2.1.0)"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
## tidyselect        "covr, dplyr, testthat"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
## tidytext          "readr, tidyr, XML, tm, quanteda, knitr, rmarkdown, ggplot2,\nreshape2, wordcloud, topicmodels, NLP, scales, gutenbergr,\ntestthat, vdiffr, mallet, stm, data.table, broom, textdata"                                                                                                                                                                                                                                                                                                                                                                                  
## tidyverse         "covr, feather, glue, knitr, rmarkdown, testthat"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
## timeDate          "date, RUnit"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## tinytex           "testit, rstudioapi"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
## tokenizers        "covr, knitr, rmarkdown, stopwords (>= 0.9.0), testthat"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
## tune              "testthat, knitr, covr, kernlab, xml2, spelling"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
## utf8              "knitr, rmarkdown, testthat"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
## uuid              NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
## vctrs             "bit64, covr, crayon, generics, knitr, pillar (>= 1.4.1),\npkgdown, rmarkdown, testthat, tibble"                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
## viridis           "hexbin (>= 1.27.0), scales, MASS, knitr, dichromat,\ncolorspace, rasterVis, httr, mapproj, vdiffr, svglite (>=\n1.2.0), testthat, covr, rmarkdown, rgdal"                                                                                                                                                                                                                                                                                                                                                                                                             
## viridisLite       "hexbin (>= 1.27.0), ggplot2 (>= 1.0.1), testthat, covr"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
## visNetwork        "knitr, rmarkdown, webshot, igraph, rpart, shiny,\nshinyWidgets, colourpicker, sparkline, ggraph, tidygraph,\nflashClust"                                                                                                                                                                                                                                                                                                                                                                                                                                              
## webshot           "httpuv, knitr, rmarkdown, shiny"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
## websocket         "testthat, knitr, rmarkdown"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
## whisker           "markdown"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
## withr             "testthat, covr, lattice, DBI, RSQLite, methods, knitr,\nrmarkdown"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
## workflows         "covr, knitr, recipes, rmarkdown, testthat (>= 2.3.0)"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
## writexl           "spelling, readxl, nycflights13, testthat, bit64"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
## xfun              "testit, parallel, rstudioapi, tinytex, mime, markdown, knitr,\nhtmltools, base64enc, remotes, rmarkdown"                                                                                                                                                                                                                                                                                                                                                                                                                                                              
## xml2              "covr, curl, httr, knitr, magrittr, mockery, rmarkdown,\ntestthat (>= 2.1.0)"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## xtable            "knitr, plm, zoo, survival"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
## xts               "timeSeries, timeDate, tseries, chron, fts, tis, RUnit"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
## yaml              "RUnit"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
## yardstick         "testthat, covr, purrr, tidyr, ggplot2, knitr, kableExtra,\nrmarkdown"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
## zeallot           "testthat, knitr, rmarkdown, purrr, magrittr"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## zip               "covr, processx, R6, testthat, withr"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
## zoo               "AER, coda, chron, fts, ggplot2 (>= 3.0.0), mondate, scales,\nstrucchange, timeDate, timeSeries, tis, tseries, xts"                                                                                                                                                                                                                                                                                                                                                                                                                                                    
## base              "methods"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
## boot              "MASS, survival"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
## class             NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
## cluster           "MASS, Matrix"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
## codetools         NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
## compiler          NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
## datasets          NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
## foreign           NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
## graphics          NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
## grDevices         "KernSmooth"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
## grid              "lattice"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
## KernSmooth        "MASS"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
## lattice           "KernSmooth, MASS, latticeExtra"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
## MASS              "lattice, nlme, nnet, survival"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
## Matrix            "expm, MASS"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
## methods           "codetools"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
## mgcv              "parallel, survival, MASS"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
## nlme              "Hmisc, MASS"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## nnet              "MASS"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
## parallel          "methods"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
## rpart             "survival"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
## spatial           "MASS"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
## splines           "Matrix, methods"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
## stats             "MASS, Matrix, SuppDists, methods, stats4"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
## stats4            NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
## survival          NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
## tcltk             NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
## tools             "codetools, methods, xml2, curl, commonmark"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
## utils             "methods, xml2, commonmark"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
##                   Enhances                                                  
## abind             NA                                                        
## AsioHeaders       NA                                                        
## askpass           NA                                                        
## assertthat        NA                                                        
## backports         NA                                                        
## base64enc         "png"                                                     
## bayesplot         NA                                                        
## BH                NA                                                        
## bit               NA                                                        
## bit64             NA                                                        
## bitops            NA                                                        
## blob              NA                                                        
## bookdown          NA                                                        
## broom             NA                                                        
## callr             NA                                                        
## car               NA                                                        
## carData           NA                                                        
## cellranger        NA                                                        
## checkmate         NA                                                        
## cli               NA                                                        
## clipr             NA                                                        
## colorspace        NA                                                        
## colourpicker      NA                                                        
## cowplot           NA                                                        
## crayon            NA                                                        
## crosstalk         NA                                                        
## curl              NA                                                        
## data.table        NA                                                        
## DBI               NA                                                        
## dbplyr            NA                                                        
## desc              NA                                                        
## DiagrammeR        NA                                                        
## dials             NA                                                        
## DiceDesign        NA                                                        
## digest            NA                                                        
## downloader        NA                                                        
## dplyr             NA                                                        
## DT                NA                                                        
## dygraphs          "rmarkdown (>= 0.3.3), shiny (>= 0.10.2.1)"               
## ellipsis          NA                                                        
## evaluate          NA                                                        
## fansi             NA                                                        
## farver            NA                                                        
## fastmap           NA                                                        
## flextable         NA                                                        
## forcats           NA                                                        
## foreach           NA                                                        
## fs                NA                                                        
## furrr             NA                                                        
## future            NA                                                        
## gdtools           NA                                                        
## generics          NA                                                        
## ggmap             NA                                                        
## ggplot2           "sp"                                                      
## ggridges          NA                                                        
## ggvis             NA                                                        
## globals           NA                                                        
## glue              NA                                                        
## gower             NA                                                        
## GPfit             NA                                                        
## gridExtra         NA                                                        
## gtable            NA                                                        
## gtools            NA                                                        
## hardhat           NA                                                        
## haven             NA                                                        
## highr             NA                                                        
## hms               NA                                                        
## htmltools         "knitr"                                                   
## htmlwidgets       "shiny (>= 1.1)"                                          
## httpuv            NA                                                        
## httr              NA                                                        
## hunspell          NA                                                        
## igraph            NA                                                        
## infer             NA                                                        
## influenceR        NA                                                        
## inline            NA                                                        
## ipred             NA                                                        
## ISOcodes          NA                                                        
## iterators         NA                                                        
## janeaustenr       NA                                                        
## jpeg              NA                                                        
## jsonlite          NA                                                        
## knitr             NA                                                        
## labeling          NA                                                        
## later             NA                                                        
## lava              NA                                                        
## lazyeval          NA                                                        
## leaflet           NA                                                        
## leaflet.providers NA                                                        
## lhs               NA                                                        
## lifecycle         NA                                                        
## listenv           NA                                                        
## lme4              NA                                                        
## loo               NA                                                        
## lubridate         "chron, fts, timeSeries, timeDate, tis, tseries, xts, zoo"
## magrittr          NA                                                        
## manipulateWidget  NA                                                        
## maptools          "gpclib, RArcInfo"                                        
## markdown          NA                                                        
## MatrixModels      NA                                                        
## matrixStats       NA                                                        
## mime              NA                                                        
## miniUI            NA                                                        
## minqa             NA                                                        
## modelr            NA                                                        
## munsell           NA                                                        
## nloptr            NA                                                        
## numDeriv          NA                                                        
## odbc              NA                                                        
## officer           NA                                                        
## openssl           NA                                                        
## openxlsx          NA                                                        
## packrat           NA                                                        
## pagedown          NA                                                        
## parsnip           NA                                                        
## pbkrtest          NA                                                        
## pillar            NA                                                        
## pkgbuild          NA                                                        
## pkgconfig         NA                                                        
## plogr             NA                                                        
## plyr              NA                                                        
## png               NA                                                        
## prettyunits       NA                                                        
## pROC              NA                                                        
## processx          NA                                                        
## prodlim           NA                                                        
## progress          NA                                                        
## promises          NA                                                        
## ps                NA                                                        
## purrr             NA                                                        
## quantreg          NA                                                        
## R6                NA                                                        
## raster            NA                                                        
## RColorBrewer      NA                                                        
## Rcpp              NA                                                        
## RcppEigen         NA                                                        
## RcppParallel      NA                                                        
## RCurl             NA                                                        
## readr             NA                                                        
## readxl            NA                                                        
## recipes           NA                                                        
## rematch           NA                                                        
## reprex            NA                                                        
## reshape2          NA                                                        
## rgl               NA                                                        
## RgoogleMaps       NA                                                        
## rio               NA                                                        
## rjson             NA                                                        
## rlang             NA                                                        
## rmarkdown         NA                                                        
## rprojroot         NA                                                        
## rsample           NA                                                        
## rsconnect         NA                                                        
## rstan             NA                                                        
## rstanarm          NA                                                        
## rstantools        NA                                                        
## rstudioapi        NA                                                        
## rvest             NA                                                        
## rvg               NA                                                        
## scales            NA                                                        
## selectr           NA                                                        
## servr             NA                                                        
## shiny             NA                                                        
## shinyjs           NA                                                        
## shinystan         NA                                                        
## shinythemes       NA                                                        
## SnowballC         NA                                                        
## sourcetools       NA                                                        
## sp                NA                                                        
## SparseM           NA                                                        
## SQUAREM           NA                                                        
## StanHeaders       NA                                                        
## stopwords         NA                                                        
## stringi           NA                                                        
## stringr           NA                                                        
## svglite           NA                                                        
## sys               NA                                                        
## systemfonts       NA                                                        
## threejs           "knitr, shiny"                                            
## tibble            NA                                                        
## tidymodels        NA                                                        
## tidyposterior     NA                                                        
## tidypredict       NA                                                        
## tidyr             NA                                                        
## tidyselect        NA                                                        
## tidytext          NA                                                        
## tidyverse         NA                                                        
## timeDate          NA                                                        
## tinytex           NA                                                        
## tokenizers        NA                                                        
## tune              NA                                                        
## utf8              NA                                                        
## uuid              NA                                                        
## vctrs             NA                                                        
## viridis           NA                                                        
## viridisLite       NA                                                        
## visNetwork        NA                                                        
## webshot           NA                                                        
## websocket         NA                                                        
## whisker           NA                                                        
## withr             NA                                                        
## workflows         NA                                                        
## writexl           NA                                                        
## xfun              NA                                                        
## xml2              NA                                                        
## xtable            NA                                                        
## xts               NA                                                        
## yaml              NA                                                        
## yardstick         NA                                                        
## zeallot           NA                                                        
## zip               NA                                                        
## zoo               NA                                                        
## base              NA                                                        
## boot              NA                                                        
## class             NA                                                        
## cluster           NA                                                        
## codetools         NA                                                        
## compiler          NA                                                        
## datasets          NA                                                        
## foreign           NA                                                        
## graphics          NA                                                        
## grDevices         NA                                                        
## grid              NA                                                        
## KernSmooth        NA                                                        
## lattice           "chron"                                                   
## MASS              NA                                                        
## Matrix            "MatrixModels, graph, SparseM, sfsmisc"                   
## methods           NA                                                        
## mgcv              NA                                                        
## nlme              NA                                                        
## nnet              NA                                                        
## parallel          "snow, nws, Rmpi"                                         
## rpart             NA                                                        
## spatial           NA                                                        
## splines           NA                                                        
## stats             NA                                                        
## stats4            NA                                                        
## survival          NA                                                        
## tcltk             NA                                                        
## tools             NA                                                        
## utils             NA                                                        
##                   License                                  License_is_FOSS
## abind             "LGPL (>= 2)"                            NA             
## AsioHeaders       "BSL-1.0"                                NA             
## askpass           "MIT + file LICENSE"                     NA             
## assertthat        "GPL-3"                                  NA             
## backports         "GPL-2 | GPL-3"                          NA             
## base64enc         "GPL-2 | GPL-3"                          NA             
## bayesplot         "GPL (>= 3)"                             NA             
## BH                "BSL-1.0"                                NA             
## bit               "GPL-2"                                  NA             
## bit64             "GPL-2"                                  NA             
## bitops            "GPL (>= 2)"                             NA             
## blob              "GPL-3"                                  NA             
## bookdown          "GPL-3"                                  NA             
## broom             "MIT + file LICENSE"                     NA             
## callr             "MIT + file LICENSE"                     NA             
## car               "GPL (>= 2)"                             NA             
## carData           "GPL (>= 2)"                             NA             
## cellranger        "MIT + file LICENSE"                     NA             
## checkmate         "BSD_3_clause + file LICENSE"            NA             
## cli               "MIT + file LICENSE"                     NA             
## clipr             "GPL-3"                                  NA             
## colorspace        "BSD_3_clause + file LICENSE"            NA             
## colourpicker      "MIT + file LICENSE"                     NA             
## cowplot           "GPL-2"                                  NA             
## crayon            "MIT + file LICENSE"                     NA             
## crosstalk         "MIT + file LICENSE"                     NA             
## curl              "MIT + file LICENSE"                     NA             
## data.table        "MPL-2.0 | file LICENSE"                 NA             
## DBI               "LGPL (>= 2.1)"                          NA             
## dbplyr            "MIT + file LICENSE"                     NA             
## desc              "MIT + file LICENSE"                     NA             
## DiagrammeR        "MIT + file LICENSE"                     NA             
## dials             "GPL-2"                                  NA             
## DiceDesign        "GPL-3"                                  NA             
## digest            "GPL (>= 2)"                             NA             
## downloader        "GPL-2"                                  NA             
## dplyr             "MIT + file LICENSE"                     NA             
## DT                "GPL-3 | file LICENSE"                   NA             
## dygraphs          "MIT + file LICENSE"                     NA             
## ellipsis          "GPL-3"                                  NA             
## evaluate          "MIT + file LICENSE"                     NA             
## fansi             "GPL (>= 2)"                             NA             
## farver            "MIT + file LICENSE"                     NA             
## fastmap           "MIT + file LICENSE"                     NA             
## flextable         "GPL-3"                                  NA             
## forcats           "GPL-3"                                  NA             
## foreach           "Apache License (== 2.0)"                NA             
## fs                "GPL-3"                                  NA             
## furrr             "LGPL (>= 2.1)"                          NA             
## future            "LGPL (>= 2.1)"                          NA             
## gdtools           "GPL-3 | file LICENSE"                   NA             
## generics          "GPL-2"                                  NA             
## ggmap             "GPL-2"                                  NA             
## ggplot2           "GPL-2 | file LICENSE"                   NA             
## ggridges          "GPL-2 | file LICENSE"                   NA             
## ggvis             "GPL-2 | file LICENSE"                   NA             
## globals           "LGPL (>= 2.1)"                          NA             
## glue              "MIT + file LICENSE"                     NA             
## gower             "GPL-3"                                  NA             
## GPfit             "GPL-2"                                  NA             
## gridExtra         "GPL (>= 2)"                             NA             
## gtable            "GPL-2"                                  NA             
## gtools            "GPL-2"                                  NA             
## hardhat           "MIT + file LICENSE"                     NA             
## haven             "MIT + file LICENSE"                     NA             
## highr             "GPL"                                    NA             
## hms               "GPL-3"                                  NA             
## htmltools         "GPL (>= 2)"                             NA             
## htmlwidgets       "MIT + file LICENSE"                     NA             
## httpuv            "GPL (>= 2) | file LICENSE"              NA             
## httr              "MIT + file LICENSE"                     NA             
## hunspell          "GPL-2 | LGPL-2.1 | MPL-1.1"             NA             
## igraph            "GPL (>= 2)"                             NA             
## infer             "CC0"                                    NA             
## influenceR        "GPL-2"                                  NA             
## inline            "LGPL"                                   NA             
## ipred             "GPL (>= 2)"                             NA             
## ISOcodes          "GPL-2"                                  NA             
## iterators         "Apache License (== 2.0)"                NA             
## janeaustenr       "MIT + file LICENSE"                     NA             
## jpeg              "GPL-2 | GPL-3"                          NA             
## jsonlite          "MIT + file LICENSE"                     NA             
## knitr             "GPL"                                    NA             
## labeling          "MIT + file LICENSE | Unlimited"         NA             
## later             "GPL (>= 2)"                             NA             
## lava              "GPL-3"                                  NA             
## lazyeval          "GPL-3"                                  NA             
## leaflet           "GPL-3"                                  NA             
## leaflet.providers "BSD_2_clause + file LICENSE"            NA             
## lhs               "GPL-3"                                  NA             
## lifecycle         "GPL-3"                                  NA             
## listenv           "LGPL (>= 2.1)"                          NA             
## lme4              "GPL (>= 2)"                             NA             
## loo               "GPL (>= 3)"                             NA             
## lubridate         "GPL (>= 2)"                             NA             
## magrittr          "MIT + file LICENSE"                     NA             
## manipulateWidget  "GPL (>= 2) | file LICENSE"              NA             
## maptools          "GPL (>= 2)"                             NA             
## markdown          "GPL-2"                                  NA             
## MatrixModels      "GPL (>= 2)"                             NA             
## matrixStats       "Artistic-2.0"                           NA             
## mime              "GPL"                                    NA             
## miniUI            "GPL-3"                                  NA             
## minqa             "GPL-2"                                  NA             
## modelr            "GPL-3"                                  NA             
## munsell           "MIT + file LICENSE"                     NA             
## nloptr            "LGPL-3"                                 NA             
## numDeriv          "GPL-2"                                  NA             
## odbc              "MIT + file LICENSE"                     NA             
## officer           "GPL-3"                                  NA             
## openssl           "MIT + file LICENSE"                     NA             
## openxlsx          "MIT + file LICENSE"                     NA             
## packrat           "GPL-2"                                  NA             
## pagedown          "MIT + file LICENSE"                     NA             
## parsnip           "GPL-2"                                  NA             
## pbkrtest          "GPL (>= 2)"                             NA             
## pillar            "GPL-3"                                  NA             
## pkgbuild          "GPL-3"                                  NA             
## pkgconfig         "MIT + file LICENSE"                     NA             
## plogr             "MIT + file LICENSE"                     NA             
## plyr              "MIT + file LICENSE"                     NA             
## png               "GPL-2 | GPL-3"                          NA             
## prettyunits       "MIT + file LICENSE"                     NA             
## pROC              "GPL (>= 3)"                             NA             
## processx          "MIT + file LICENSE"                     NA             
## prodlim           "GPL (>= 2)"                             NA             
## progress          "MIT + file LICENSE"                     NA             
## promises          "MIT + file LICENSE"                     NA             
## ps                "BSD_3_clause + file LICENSE"            NA             
## purrr             "GPL-3 | file LICENSE"                   NA             
## quantreg          "GPL (>= 2)"                             NA             
## R6                "MIT + file LICENSE"                     NA             
## raster            "GPL (>= 3)"                             NA             
## RColorBrewer      "Apache License 2.0"                     NA             
## Rcpp              "GPL (>= 2)"                             NA             
## RcppEigen         "GPL (>= 2) | file LICENSE"              NA             
## RcppParallel      "GPL-2"                                  NA             
## RCurl             "BSD_3_clause + file LICENSE"            NA             
## readr             "GPL (>= 2) | file LICENSE"              NA             
## readxl            "GPL-3"                                  NA             
## recipes           "GPL-2"                                  NA             
## rematch           "MIT + file LICENSE"                     NA             
## reprex            "MIT + file LICENSE"                     NA             
## reshape2          "MIT + file LICENSE"                     NA             
## rgl               "GPL"                                    NA             
## RgoogleMaps       "GPL"                                    NA             
## rio               "GPL-2"                                  NA             
## rjson             "GPL-2"                                  NA             
## rlang             "GPL-3"                                  NA             
## rmarkdown         "GPL-3"                                  NA             
## rprojroot         "GPL-3"                                  NA             
## rsample           "GPL-2"                                  NA             
## rsconnect         "GPL-2"                                  NA             
## rstan             "GPL (>= 3)"                             NA             
## rstanarm          "GPL (>= 3)"                             NA             
## rstantools        "GPL (>= 3)"                             NA             
## rstudioapi        "MIT + file LICENSE"                     NA             
## rvest             "GPL-3"                                  NA             
## rvg               "GPL-3"                                  NA             
## scales            "MIT + file LICENSE"                     NA             
## selectr           "BSD_3_clause + file LICENCE"            NA             
## servr             "GPL"                                    NA             
## shiny             "GPL-3 | file LICENSE"                   NA             
## shinyjs           "AGPL-3"                                 NA             
## shinystan         "GPL (>= 3)"                             NA             
## shinythemes       "GPL-3 | file LICENSE"                   NA             
## SnowballC         "BSD_3_clause + file LICENSE"            NA             
## sourcetools       "MIT + file LICENSE"                     NA             
## sp                "GPL (>= 2)"                             NA             
## SparseM           "GPL (>= 2)"                             NA             
## SQUAREM           "GPL (>= 2)"                             NA             
## StanHeaders       "BSD_3_clause + file LICENSE"            NA             
## stopwords         "MIT + file LICENSE"                     NA             
## stringi           "file LICENSE"                           "yes"          
## stringr           "GPL-2 | file LICENSE"                   NA             
## svglite           "GPL (>= 2)"                             NA             
## sys               "MIT + file LICENSE"                     NA             
## systemfonts       "MIT + file LICENSE"                     NA             
## threejs           "MIT + file LICENSE"                     NA             
## tibble            "MIT + file LICENSE"                     NA             
## tidymodels        "GPL-3 | file LICENSE"                   NA             
## tidyposterior     "GPL-2"                                  NA             
## tidypredict       "GPL-3"                                  NA             
## tidyr             "MIT + file LICENSE"                     NA             
## tidyselect        "GPL-3"                                  NA             
## tidytext          "MIT + file LICENSE"                     NA             
## tidyverse         "GPL-3 | file LICENSE"                   NA             
## timeDate          "GPL (>= 2)"                             NA             
## tinytex           "MIT + file LICENSE"                     NA             
## tokenizers        "MIT + file LICENSE"                     NA             
## tune              "MIT + file LICENSE"                     NA             
## utf8              "Apache License (== 2.0) | file LICENSE" NA             
## uuid              "MIT + file LICENSE"                     NA             
## vctrs             "GPL-3"                                  NA             
## viridis           "MIT + file LICENSE"                     NA             
## viridisLite       "MIT + file LICENSE"                     NA             
## visNetwork        "MIT + file LICENSE"                     NA             
## webshot           "GPL-2"                                  NA             
## websocket         "GPL-2"                                  NA             
## whisker           "GPL-3"                                  NA             
## withr             "GPL (>= 2)"                             NA             
## workflows         "MIT + file LICENSE"                     NA             
## writexl           "BSD_2_clause + file LICENSE"            NA             
## xfun              "MIT + file LICENSE"                     NA             
## xml2              "GPL (>= 2)"                             NA             
## xtable            "GPL (>= 2)"                             NA             
## xts               "GPL (>= 2)"                             NA             
## yaml              "BSD_3_clause + file LICENSE"            NA             
## yardstick         "GPL-2"                                  NA             
## zeallot           "MIT + file LICENSE"                     NA             
## zip               "CC0"                                    NA             
## zoo               "GPL-2 | GPL-3"                          NA             
## base              "Part of R 3.6.2"                        NA             
## boot              "Unlimited"                              NA             
## class             "GPL-2 | GPL-3"                          NA             
## cluster           "GPL (>= 2)"                             NA             
## codetools         "GPL"                                    NA             
## compiler          "Part of R 3.6.2"                        NA             
## datasets          "Part of R 3.6.2"                        NA             
## foreign           "GPL (>= 2)"                             NA             
## graphics          "Part of R 3.6.2"                        NA             
## grDevices         "Part of R 3.6.2"                        NA             
## grid              "Part of R 3.6.2"                        NA             
## KernSmooth        "Unlimited"                              NA             
## lattice           "GPL (>= 2)"                             NA             
## MASS              "GPL-2 | GPL-3"                          NA             
## Matrix            "GPL (>= 2) | file LICENCE"              NA             
## methods           "Part of R 3.6.2"                        NA             
## mgcv              "GPL (>= 2)"                             NA             
## nlme              "GPL (>= 2) | file LICENCE"              NA             
## nnet              "GPL-2 | GPL-3"                          NA             
## parallel          "Part of R 3.6.2"                        NA             
## rpart             "GPL-2 | GPL-3"                          NA             
## spatial           "GPL-2 | GPL-3"                          NA             
## splines           "Part of R 3.6.2"                        NA             
## stats             "Part of R 3.6.2"                        NA             
## stats4            "Part of R 3.6.2"                        NA             
## survival          "LGPL (>= 2)"                            NA             
## tcltk             "Part of R 3.6.2"                        NA             
## tools             "Part of R 3.6.2"                        NA             
## utils             "Part of R 3.6.2"                        NA             
##                   License_restricts_use OS_type MD5sum NeedsCompilation Built  
## abind             NA                    NA      NA     "no"             "3.6.2"
## AsioHeaders       NA                    NA      NA     "no"             "3.6.2"
## askpass           NA                    NA      NA     "yes"            "3.6.2"
## assertthat        NA                    NA      NA     "no"             "3.6.2"
## backports         NA                    NA      NA     "yes"            "3.6.2"
## base64enc         NA                    NA      NA     "yes"            "3.6.2"
## bayesplot         NA                    NA      NA     "no"             "3.6.2"
## BH                NA                    NA      NA     "no"             "3.6.2"
## bit               NA                    NA      NA     "yes"            "3.6.2"
## bit64             NA                    NA      NA     "yes"            "3.6.2"
## bitops            NA                    NA      NA     "yes"            "3.6.2"
## blob              NA                    NA      NA     "no"             "3.6.2"
## bookdown          NA                    NA      NA     "no"             "3.6.2"
## broom             NA                    NA      NA     "no"             "3.6.2"
## callr             NA                    NA      NA     "no"             "3.6.2"
## car               NA                    NA      NA     "no"             "3.6.2"
## carData           NA                    NA      NA     "no"             "3.6.2"
## cellranger        NA                    NA      NA     "no"             "3.6.2"
## checkmate         NA                    NA      NA     "yes"            "3.6.2"
## cli               NA                    NA      NA     "no"             "3.6.2"
## clipr             NA                    NA      NA     "no"             "3.6.2"
## colorspace        NA                    NA      NA     "yes"            "3.6.2"
## colourpicker      NA                    NA      NA     "no"             "3.6.2"
## cowplot           NA                    NA      NA     "no"             "3.6.2"
## crayon            NA                    NA      NA     "no"             "3.6.2"
## crosstalk         NA                    NA      NA     "no"             "3.6.2"
## curl              NA                    NA      NA     "yes"            "3.6.2"
## data.table        NA                    NA      NA     "yes"            "3.6.2"
## DBI               NA                    NA      NA     "no"             "3.6.2"
## dbplyr            NA                    NA      NA     "no"             "3.6.2"
## desc              NA                    NA      NA     "no"             "3.6.2"
## DiagrammeR        NA                    NA      NA     "no"             "3.6.2"
## dials             NA                    NA      NA     "no"             "3.6.2"
## DiceDesign        NA                    NA      NA     "yes"            "3.6.2"
## digest            NA                    NA      NA     "yes"            "3.6.2"
## downloader        NA                    NA      NA     "no"             "3.6.2"
## dplyr             NA                    NA      NA     "yes"            "3.6.2"
## DT                NA                    NA      NA     "no"             "3.6.2"
## dygraphs          NA                    NA      NA     "no"             "3.6.2"
## ellipsis          NA                    NA      NA     "yes"            "3.6.2"
## evaluate          NA                    NA      NA     "no"             "3.6.2"
## fansi             NA                    NA      NA     "yes"            "3.6.2"
## farver            NA                    NA      NA     "yes"            "3.6.2"
## fastmap           NA                    NA      NA     "yes"            "3.6.2"
## flextable         NA                    NA      NA     "no"             "3.6.2"
## forcats           NA                    NA      NA     "no"             "3.6.2"
## foreach           NA                    NA      NA     "no"             "3.6.2"
## fs                NA                    NA      NA     "yes"            "3.6.2"
## furrr             NA                    NA      NA     "no"             "3.6.2"
## future            NA                    NA      NA     "no"             "3.6.2"
## gdtools           NA                    NA      NA     "yes"            "3.6.2"
## generics          NA                    NA      NA     "no"             "3.6.2"
## ggmap             NA                    NA      NA     "no"             "3.6.2"
## ggplot2           NA                    NA      NA     "no"             "3.6.2"
## ggridges          NA                    NA      NA     "no"             "3.6.2"
## ggvis             NA                    NA      NA     "no"             "3.6.2"
## globals           NA                    NA      NA     "no"             "3.6.2"
## glue              NA                    NA      NA     "yes"            "3.6.2"
## gower             NA                    NA      NA     "yes"            "3.6.2"
## GPfit             NA                    NA      NA     "no"             "3.6.2"
## gridExtra         NA                    NA      NA     "no"             "3.6.2"
## gtable            NA                    NA      NA     "no"             "3.6.2"
## gtools            NA                    NA      NA     "yes"            "3.6.2"
## hardhat           NA                    NA      NA     "no"             "3.6.2"
## haven             NA                    NA      NA     "yes"            "3.6.2"
## highr             NA                    NA      NA     "no"             "3.6.2"
## hms               NA                    NA      NA     "no"             "3.6.2"
## htmltools         NA                    NA      NA     "yes"            "3.6.2"
## htmlwidgets       NA                    NA      NA     "no"             "3.6.2"
## httpuv            NA                    NA      NA     "yes"            "3.6.2"
## httr              NA                    NA      NA     "no"             "3.6.2"
## hunspell          NA                    NA      NA     "yes"            "3.6.2"
## igraph            NA                    NA      NA     "yes"            "3.6.2"
## infer             NA                    NA      NA     "no"             "3.6.2"
## influenceR        NA                    NA      NA     "yes"            "3.6.2"
## inline            NA                    NA      NA     "no"             "3.6.2"
## ipred             NA                    NA      NA     "yes"            "3.6.2"
## ISOcodes          NA                    NA      NA     "no"             "3.6.2"
## iterators         NA                    NA      NA     "no"             "3.6.2"
## janeaustenr       NA                    NA      NA     "no"             "3.6.2"
## jpeg              NA                    NA      NA     "yes"            "3.6.2"
## jsonlite          NA                    NA      NA     "yes"            "3.6.2"
## knitr             NA                    NA      NA     "no"             "3.6.2"
## labeling          NA                    NA      NA     "no"             "3.6.2"
## later             NA                    NA      NA     "yes"            "3.6.2"
## lava              NA                    NA      NA     "no"             "3.6.2"
## lazyeval          NA                    NA      NA     "yes"            "3.6.2"
## leaflet           NA                    NA      NA     "no"             "3.6.2"
## leaflet.providers NA                    NA      NA     "no"             "3.6.2"
## lhs               NA                    NA      NA     "yes"            "3.6.2"
## lifecycle         NA                    NA      NA     "no"             "3.6.2"
## listenv           NA                    NA      NA     "no"             "3.6.2"
## lme4              NA                    NA      NA     "yes"            "3.6.2"
## loo               NA                    NA      NA     "no"             "3.6.2"
## lubridate         NA                    NA      NA     "yes"            "3.6.2"
## magrittr          NA                    NA      NA     "no"             "3.6.2"
## manipulateWidget  NA                    NA      NA     "no"             "3.6.2"
## maptools          NA                    NA      NA     "yes"            "3.6.2"
## markdown          NA                    NA      NA     "yes"            "3.6.2"
## MatrixModels      NA                    NA      NA     "no"             "3.6.2"
## matrixStats       NA                    NA      NA     "yes"            "3.6.2"
## mime              NA                    NA      NA     "yes"            "3.6.2"
## miniUI            NA                    NA      NA     "no"             "3.6.2"
## minqa             NA                    NA      NA     "yes"            "3.6.2"
## modelr            NA                    NA      NA     "no"             "3.6.2"
## munsell           NA                    NA      NA     "no"             "3.6.2"
## nloptr            NA                    NA      NA     "yes"            "3.6.2"
## numDeriv          NA                    NA      NA     "no"             "3.6.2"
## odbc              NA                    NA      NA     "yes"            "3.6.2"
## officer           NA                    NA      NA     "yes"            "3.6.2"
## openssl           NA                    NA      NA     "yes"            "3.6.2"
## openxlsx          NA                    NA      NA     "yes"            "3.6.2"
## packrat           NA                    NA      NA     "no"             "3.6.2"
## pagedown          NA                    NA      NA     "no"             "3.6.2"
## parsnip           NA                    NA      NA     "no"             "3.6.2"
## pbkrtest          NA                    NA      NA     "no"             "3.6.2"
## pillar            NA                    NA      NA     "no"             "3.6.2"
## pkgbuild          NA                    NA      NA     "no"             "3.6.2"
## pkgconfig         NA                    NA      NA     "no"             "3.6.2"
## plogr             NA                    NA      NA     "no"             "3.6.2"
## plyr              NA                    NA      NA     "yes"            "3.6.2"
## png               NA                    NA      NA     "yes"            "3.6.2"
## prettyunits       NA                    NA      NA     "no"             "3.6.2"
## pROC              NA                    NA      NA     "yes"            "3.6.2"
## processx          NA                    NA      NA     "yes"            "3.6.2"
## prodlim           NA                    NA      NA     "yes"            "3.6.2"
## progress          NA                    NA      NA     "no"             "3.6.2"
## promises          NA                    NA      NA     "yes"            "3.6.2"
## ps                NA                    NA      NA     "yes"            "3.6.2"
## purrr             NA                    NA      NA     "yes"            "3.6.2"
## quantreg          NA                    NA      NA     "yes"            "3.6.2"
## R6                NA                    NA      NA     "no"             "3.6.2"
## raster            NA                    NA      NA     "yes"            "3.6.2"
## RColorBrewer      NA                    NA      NA     "no"             "3.6.2"
## Rcpp              NA                    NA      NA     "yes"            "3.6.2"
## RcppEigen         NA                    NA      NA     "yes"            "3.6.2"
## RcppParallel      NA                    NA      NA     "yes"            "3.6.2"
## RCurl             NA                    NA      NA     "yes"            "3.6.2"
## readr             NA                    NA      NA     "yes"            "3.6.2"
## readxl            NA                    NA      NA     "yes"            "3.6.2"
## recipes           NA                    NA      NA     "no"             "3.6.2"
## rematch           NA                    NA      NA     "no"             "3.6.2"
## reprex            NA                    NA      NA     "no"             "3.6.2"
## reshape2          NA                    NA      NA     "yes"            "3.6.2"
## rgl               NA                    NA      NA     "yes"            "3.6.2"
## RgoogleMaps       NA                    NA      NA     "no"             "3.6.2"
## rio               NA                    NA      NA     "no"             "3.6.2"
## rjson             NA                    NA      NA     "yes"            "3.6.2"
## rlang             NA                    NA      NA     "yes"            "3.6.2"
## rmarkdown         NA                    NA      NA     "no"             "3.6.2"
## rprojroot         NA                    NA      NA     "no"             "3.6.2"
## rsample           NA                    NA      NA     "no"             "3.6.2"
## rsconnect         NA                    NA      NA     "no"             "3.6.2"
## rstan             NA                    NA      NA     "yes"            "3.6.2"
## rstanarm          NA                    NA      NA     "yes"            "3.6.2"
## rstantools        NA                    NA      NA     "no"             "3.6.2"
## rstudioapi        NA                    NA      NA     "no"             "3.6.2"
## rvest             NA                    NA      NA     "no"             "3.6.2"
## rvg               NA                    NA      NA     "yes"            "3.6.2"
## scales            NA                    NA      NA     "no"             "3.6.2"
## selectr           NA                    NA      NA     "no"             "3.6.2"
## servr             NA                    NA      NA     "no"             "3.6.2"
## shiny             NA                    NA      NA     "no"             "3.6.2"
## shinyjs           NA                    NA      NA     "no"             "3.6.2"
## shinystan         NA                    NA      NA     "no"             "3.6.2"
## shinythemes       NA                    NA      NA     "no"             "3.6.2"
## SnowballC         NA                    NA      NA     "yes"            "3.6.2"
## sourcetools       NA                    NA      NA     "yes"            "3.6.2"
## sp                NA                    NA      NA     "yes"            "3.6.2"
## SparseM           NA                    NA      NA     "yes"            "3.6.2"
## SQUAREM           NA                    NA      NA     "no"             "3.6.2"
## StanHeaders       NA                    NA      NA     "yes"            "3.6.2"
## stopwords         NA                    NA      NA     "no"             "3.6.2"
## stringi           NA                    NA      NA     "yes"            "3.6.2"
## stringr           NA                    NA      NA     "no"             "3.6.2"
## svglite           NA                    NA      NA     "yes"            "3.6.2"
## sys               NA                    NA      NA     "yes"            "3.6.2"
## systemfonts       NA                    NA      NA     "yes"            "3.6.2"
## threejs           NA                    NA      NA     "no"             "3.6.2"
## tibble            NA                    NA      NA     "yes"            "3.6.2"
## tidymodels        NA                    NA      NA     "no"             "3.6.2"
## tidyposterior     NA                    NA      NA     "no"             "3.6.2"
## tidypredict       NA                    NA      NA     "no"             "3.6.2"
## tidyr             NA                    NA      NA     "yes"            "3.6.2"
## tidyselect        NA                    NA      NA     "yes"            "3.6.2"
## tidytext          NA                    NA      NA     "no"             "3.6.2"
## tidyverse         NA                    NA      NA     "no"             "3.6.2"
## timeDate          NA                    NA      NA     "no"             "3.6.2"
## tinytex           NA                    NA      NA     "no"             "3.6.2"
## tokenizers        NA                    NA      NA     "yes"            "3.6.2"
## tune              NA                    NA      NA     "no"             "3.6.2"
## utf8              NA                    NA      NA     "yes"            "3.6.2"
## uuid              NA                    NA      NA     "yes"            "3.6.2"
## vctrs             NA                    NA      NA     "yes"            "3.6.2"
## viridis           NA                    NA      NA     "no"             "3.6.2"
## viridisLite       NA                    NA      NA     "no"             "3.6.2"
## visNetwork        NA                    NA      NA     "no"             "3.6.2"
## webshot           NA                    NA      NA     "no"             "3.6.2"
## websocket         NA                    NA      NA     "yes"            "3.6.2"
## whisker           NA                    NA      NA     "no"             "3.6.2"
## withr             NA                    NA      NA     "no"             "3.6.2"
## workflows         NA                    NA      NA     "no"             "3.6.2"
## writexl           NA                    NA      NA     "yes"            "3.6.2"
## xfun              NA                    NA      NA     "no"             "3.6.2"
## xml2              NA                    NA      NA     "yes"            "3.6.2"
## xtable            NA                    NA      NA     "no"             "3.6.2"
## xts               NA                    NA      NA     "yes"            "3.6.2"
## yaml              NA                    NA      NA     "yes"            "3.6.2"
## yardstick         NA                    NA      NA     "yes"            "3.6.2"
## zeallot           NA                    NA      NA     "no"             "3.6.2"
## zip               NA                    NA      NA     "yes"            "3.6.2"
## zoo               NA                    NA      NA     "yes"            "3.6.2"
## base              NA                    NA      NA     NA               "3.6.2"
## boot              NA                    NA      NA     "no"             "3.6.2"
## class             NA                    NA      NA     "yes"            "3.6.2"
## cluster           NA                    NA      NA     "yes"            "3.6.2"
## codetools         NA                    NA      NA     "no"             "3.6.2"
## compiler          NA                    NA      NA     NA               "3.6.2"
## datasets          NA                    NA      NA     NA               "3.6.2"
## foreign           NA                    NA      NA     "yes"            "3.6.2"
## graphics          NA                    NA      NA     "yes"            "3.6.2"
## grDevices         NA                    NA      NA     "yes"            "3.6.2"
## grid              NA                    NA      NA     "yes"            "3.6.2"
## KernSmooth        NA                    NA      NA     "yes"            "3.6.2"
## lattice           NA                    NA      NA     "yes"            "3.6.2"
## MASS              NA                    NA      NA     "yes"            "3.6.2"
## Matrix            NA                    NA      NA     "yes"            "3.6.2"
## methods           NA                    NA      NA     "yes"            "3.6.2"
## mgcv              NA                    NA      NA     "yes"            "3.6.2"
## nlme              NA                    NA      NA     "yes"            "3.6.2"
## nnet              NA                    NA      NA     "yes"            "3.6.2"
## parallel          NA                    NA      NA     "yes"            "3.6.2"
## rpart             NA                    NA      NA     "yes"            "3.6.2"
## spatial           NA                    NA      NA     "yes"            "3.6.2"
## splines           NA                    NA      NA     "yes"            "3.6.2"
## stats             NA                    NA      NA     "yes"            "3.6.2"
## stats4            NA                    NA      NA     NA               "3.6.2"
## survival          NA                    NA      NA     "yes"            "3.6.2"
## tcltk             NA                    NA      NA     "yes"            "3.6.2"
## tools             NA                    NA      NA     "yes"            "3.6.2"
## utils             NA                    NA      NA     "yes"            "3.6.2"
```


