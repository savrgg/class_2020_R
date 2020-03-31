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
## [1] "/cloud/project/class_2020_R"
```


```r
setwd(".") # permite hacer overwrite del path por default
```
### Ejercicio 2.
**Installing & loading packages ------------------------------------**

Conceptos básicos:

**paquete y libreria** Para usar un paquete/libreria en R, son dos pasos: instalar el paquete y cargar libreria (install.packages() se corre solo una vez para instalar el paquete, library() se corre cada vez que se quiera usar la libreria)


```r
install.packages("crayon", repo="http://cran.rstudio.com/")
```

```
## Installing package into '/home/rstudio-user/R/x86_64-pc-linux-gnu-library/3.6'
## (as 'lib' is unspecified)
```


```r
library(crayon)
```

Para visualizar todos los paquetes se puede ocupar el panel derecho en la pestaña de packages o bien con la funcion: installed.packages()
  

```r
installed.packages()
```

```
##              Package       
## alluvial     "alluvial"    
## askpass      "askpass"     
## assertthat   "assertthat"  
## backports    "backports"   
## base64enc    "base64enc"   
## BH           "BH"          
## bookdown     "bookdown"    
## brew         "brew"        
## broom        "broom"       
## callr        "callr"       
## cellranger   "cellranger"  
## cli          "cli"         
## clipr        "clipr"       
## clisymbols   "clisymbols"  
## colorspace   "colorspace"  
## commonmark   "commonmark"  
## covr         "covr"        
## crayon       "crayon"      
## crosstalk    "crosstalk"   
## curl         "curl"        
## DBI          "DBI"         
## dbplyr       "dbplyr"      
## desc         "desc"        
## devtools     "devtools"    
## digest       "digest"      
## dplyr        "dplyr"       
## DT           "DT"          
## ellipsis     "ellipsis"    
## evaluate     "evaluate"    
## fansi        "fansi"       
## farver       "farver"      
## forcats      "forcats"     
## fs           "fs"          
## generics     "generics"    
## ggalluvial   "ggalluvial"  
## ggplot2      "ggplot2"     
## gh           "gh"          
## git2r        "git2r"       
## glue         "glue"        
## gtable       "gtable"      
## haven        "haven"       
## highr        "highr"       
## hms          "hms"         
## htmltools    "htmltools"   
## htmlwidgets  "htmlwidgets" 
## httr         "httr"        
## ini          "ini"         
## isoband      "isoband"     
## jsonlite     "jsonlite"    
## knitr        "knitr"       
## labeling     "labeling"    
## later        "later"       
## lazyeval     "lazyeval"    
## lifecycle    "lifecycle"   
## lubridate    "lubridate"   
## magrittr     "magrittr"    
## markdown     "markdown"    
## memoise      "memoise"     
## mime         "mime"        
## modelr       "modelr"      
## munsell      "munsell"     
## openssl      "openssl"     
## pillar       "pillar"      
## pkgbuild     "pkgbuild"    
## pkgconfig    "pkgconfig"   
## pkgload      "pkgload"     
## plogr        "plogr"       
## plyr         "plyr"        
## praise       "praise"      
## prettyunits  "prettyunits" 
## processx     "processx"    
## progress     "progress"    
## promises     "promises"    
## ps           "ps"          
## purrr        "purrr"       
## R6           "R6"          
## rcmdcheck    "rcmdcheck"   
## RColorBrewer "RColorBrewer"
## Rcpp         "Rcpp"        
## readr        "readr"       
## readxl       "readxl"      
## rematch      "rematch"     
## remotes      "remotes"     
## reprex       "reprex"      
## reshape2     "reshape2"    
## rex          "rex"         
## rlang        "rlang"       
## rmarkdown    "rmarkdown"   
## roxygen2     "roxygen2"    
## rprojroot    "rprojroot"   
## rstudioapi   "rstudioapi"  
## rversions    "rversions"   
## rvest        "rvest"       
## scales       "scales"      
## selectr      "selectr"     
## sessioninfo  "sessioninfo" 
## stringi      "stringi"     
## stringr      "stringr"     
## sys          "sys"         
## testthat     "testthat"    
## tibble       "tibble"      
## tidyr        "tidyr"       
## tidyselect   "tidyselect"  
## tidyverse    "tidyverse"   
## tinytex      "tinytex"     
## usethis      "usethis"     
## utf8         "utf8"        
## vctrs        "vctrs"       
## viridisLite  "viridisLite" 
## whisker      "whisker"     
## withr        "withr"       
## writexl      "writexl"     
## xfun         "xfun"        
## xml2         "xml2"        
## xopen        "xopen"       
## yaml         "yaml"        
## base         "base"        
## boot         "boot"        
## class        "class"       
## cluster      "cluster"     
## codetools    "codetools"   
## compiler     "compiler"    
## datasets     "datasets"    
## foreign      "foreign"     
## graphics     "graphics"    
## grDevices    "grDevices"   
## grid         "grid"        
## KernSmooth   "KernSmooth"  
## lattice      "lattice"     
## MASS         "MASS"        
## Matrix       "Matrix"      
## methods      "methods"     
## mgcv         "mgcv"        
## nlme         "nlme"        
## nnet         "nnet"        
## parallel     "parallel"    
## rpart        "rpart"       
## spatial      "spatial"     
## splines      "splines"     
## stats        "stats"       
## stats4       "stats4"      
## survival     "survival"    
## tcltk        "tcltk"       
## tools        "tools"       
## utils        "utils"       
##              LibPath                                               
## alluvial     "/home/rstudio-user/R/x86_64-pc-linux-gnu-library/3.6"
## askpass      "/home/rstudio-user/R/x86_64-pc-linux-gnu-library/3.6"
## assertthat   "/home/rstudio-user/R/x86_64-pc-linux-gnu-library/3.6"
## backports    "/home/rstudio-user/R/x86_64-pc-linux-gnu-library/3.6"
## base64enc    "/home/rstudio-user/R/x86_64-pc-linux-gnu-library/3.6"
## BH           "/home/rstudio-user/R/x86_64-pc-linux-gnu-library/3.6"
## bookdown     "/home/rstudio-user/R/x86_64-pc-linux-gnu-library/3.6"
## brew         "/home/rstudio-user/R/x86_64-pc-linux-gnu-library/3.6"
## broom        "/home/rstudio-user/R/x86_64-pc-linux-gnu-library/3.6"
## callr        "/home/rstudio-user/R/x86_64-pc-linux-gnu-library/3.6"
## cellranger   "/home/rstudio-user/R/x86_64-pc-linux-gnu-library/3.6"
## cli          "/home/rstudio-user/R/x86_64-pc-linux-gnu-library/3.6"
## clipr        "/home/rstudio-user/R/x86_64-pc-linux-gnu-library/3.6"
## clisymbols   "/home/rstudio-user/R/x86_64-pc-linux-gnu-library/3.6"
## colorspace   "/home/rstudio-user/R/x86_64-pc-linux-gnu-library/3.6"
## commonmark   "/home/rstudio-user/R/x86_64-pc-linux-gnu-library/3.6"
## covr         "/home/rstudio-user/R/x86_64-pc-linux-gnu-library/3.6"
## crayon       "/home/rstudio-user/R/x86_64-pc-linux-gnu-library/3.6"
## crosstalk    "/home/rstudio-user/R/x86_64-pc-linux-gnu-library/3.6"
## curl         "/home/rstudio-user/R/x86_64-pc-linux-gnu-library/3.6"
## DBI          "/home/rstudio-user/R/x86_64-pc-linux-gnu-library/3.6"
## dbplyr       "/home/rstudio-user/R/x86_64-pc-linux-gnu-library/3.6"
## desc         "/home/rstudio-user/R/x86_64-pc-linux-gnu-library/3.6"
## devtools     "/home/rstudio-user/R/x86_64-pc-linux-gnu-library/3.6"
## digest       "/home/rstudio-user/R/x86_64-pc-linux-gnu-library/3.6"
## dplyr        "/home/rstudio-user/R/x86_64-pc-linux-gnu-library/3.6"
## DT           "/home/rstudio-user/R/x86_64-pc-linux-gnu-library/3.6"
## ellipsis     "/home/rstudio-user/R/x86_64-pc-linux-gnu-library/3.6"
## evaluate     "/home/rstudio-user/R/x86_64-pc-linux-gnu-library/3.6"
## fansi        "/home/rstudio-user/R/x86_64-pc-linux-gnu-library/3.6"
## farver       "/home/rstudio-user/R/x86_64-pc-linux-gnu-library/3.6"
## forcats      "/home/rstudio-user/R/x86_64-pc-linux-gnu-library/3.6"
## fs           "/home/rstudio-user/R/x86_64-pc-linux-gnu-library/3.6"
## generics     "/home/rstudio-user/R/x86_64-pc-linux-gnu-library/3.6"
## ggalluvial   "/home/rstudio-user/R/x86_64-pc-linux-gnu-library/3.6"
## ggplot2      "/home/rstudio-user/R/x86_64-pc-linux-gnu-library/3.6"
## gh           "/home/rstudio-user/R/x86_64-pc-linux-gnu-library/3.6"
## git2r        "/home/rstudio-user/R/x86_64-pc-linux-gnu-library/3.6"
## glue         "/home/rstudio-user/R/x86_64-pc-linux-gnu-library/3.6"
## gtable       "/home/rstudio-user/R/x86_64-pc-linux-gnu-library/3.6"
## haven        "/home/rstudio-user/R/x86_64-pc-linux-gnu-library/3.6"
## highr        "/home/rstudio-user/R/x86_64-pc-linux-gnu-library/3.6"
## hms          "/home/rstudio-user/R/x86_64-pc-linux-gnu-library/3.6"
## htmltools    "/home/rstudio-user/R/x86_64-pc-linux-gnu-library/3.6"
## htmlwidgets  "/home/rstudio-user/R/x86_64-pc-linux-gnu-library/3.6"
## httr         "/home/rstudio-user/R/x86_64-pc-linux-gnu-library/3.6"
## ini          "/home/rstudio-user/R/x86_64-pc-linux-gnu-library/3.6"
## isoband      "/home/rstudio-user/R/x86_64-pc-linux-gnu-library/3.6"
## jsonlite     "/home/rstudio-user/R/x86_64-pc-linux-gnu-library/3.6"
## knitr        "/home/rstudio-user/R/x86_64-pc-linux-gnu-library/3.6"
## labeling     "/home/rstudio-user/R/x86_64-pc-linux-gnu-library/3.6"
## later        "/home/rstudio-user/R/x86_64-pc-linux-gnu-library/3.6"
## lazyeval     "/home/rstudio-user/R/x86_64-pc-linux-gnu-library/3.6"
## lifecycle    "/home/rstudio-user/R/x86_64-pc-linux-gnu-library/3.6"
## lubridate    "/home/rstudio-user/R/x86_64-pc-linux-gnu-library/3.6"
## magrittr     "/home/rstudio-user/R/x86_64-pc-linux-gnu-library/3.6"
## markdown     "/home/rstudio-user/R/x86_64-pc-linux-gnu-library/3.6"
## memoise      "/home/rstudio-user/R/x86_64-pc-linux-gnu-library/3.6"
## mime         "/home/rstudio-user/R/x86_64-pc-linux-gnu-library/3.6"
## modelr       "/home/rstudio-user/R/x86_64-pc-linux-gnu-library/3.6"
## munsell      "/home/rstudio-user/R/x86_64-pc-linux-gnu-library/3.6"
## openssl      "/home/rstudio-user/R/x86_64-pc-linux-gnu-library/3.6"
## pillar       "/home/rstudio-user/R/x86_64-pc-linux-gnu-library/3.6"
## pkgbuild     "/home/rstudio-user/R/x86_64-pc-linux-gnu-library/3.6"
## pkgconfig    "/home/rstudio-user/R/x86_64-pc-linux-gnu-library/3.6"
## pkgload      "/home/rstudio-user/R/x86_64-pc-linux-gnu-library/3.6"
## plogr        "/home/rstudio-user/R/x86_64-pc-linux-gnu-library/3.6"
## plyr         "/home/rstudio-user/R/x86_64-pc-linux-gnu-library/3.6"
## praise       "/home/rstudio-user/R/x86_64-pc-linux-gnu-library/3.6"
## prettyunits  "/home/rstudio-user/R/x86_64-pc-linux-gnu-library/3.6"
## processx     "/home/rstudio-user/R/x86_64-pc-linux-gnu-library/3.6"
## progress     "/home/rstudio-user/R/x86_64-pc-linux-gnu-library/3.6"
## promises     "/home/rstudio-user/R/x86_64-pc-linux-gnu-library/3.6"
## ps           "/home/rstudio-user/R/x86_64-pc-linux-gnu-library/3.6"
## purrr        "/home/rstudio-user/R/x86_64-pc-linux-gnu-library/3.6"
## R6           "/home/rstudio-user/R/x86_64-pc-linux-gnu-library/3.6"
## rcmdcheck    "/home/rstudio-user/R/x86_64-pc-linux-gnu-library/3.6"
## RColorBrewer "/home/rstudio-user/R/x86_64-pc-linux-gnu-library/3.6"
## Rcpp         "/home/rstudio-user/R/x86_64-pc-linux-gnu-library/3.6"
## readr        "/home/rstudio-user/R/x86_64-pc-linux-gnu-library/3.6"
## readxl       "/home/rstudio-user/R/x86_64-pc-linux-gnu-library/3.6"
## rematch      "/home/rstudio-user/R/x86_64-pc-linux-gnu-library/3.6"
## remotes      "/home/rstudio-user/R/x86_64-pc-linux-gnu-library/3.6"
## reprex       "/home/rstudio-user/R/x86_64-pc-linux-gnu-library/3.6"
## reshape2     "/home/rstudio-user/R/x86_64-pc-linux-gnu-library/3.6"
## rex          "/home/rstudio-user/R/x86_64-pc-linux-gnu-library/3.6"
## rlang        "/home/rstudio-user/R/x86_64-pc-linux-gnu-library/3.6"
## rmarkdown    "/home/rstudio-user/R/x86_64-pc-linux-gnu-library/3.6"
## roxygen2     "/home/rstudio-user/R/x86_64-pc-linux-gnu-library/3.6"
## rprojroot    "/home/rstudio-user/R/x86_64-pc-linux-gnu-library/3.6"
## rstudioapi   "/home/rstudio-user/R/x86_64-pc-linux-gnu-library/3.6"
## rversions    "/home/rstudio-user/R/x86_64-pc-linux-gnu-library/3.6"
## rvest        "/home/rstudio-user/R/x86_64-pc-linux-gnu-library/3.6"
## scales       "/home/rstudio-user/R/x86_64-pc-linux-gnu-library/3.6"
## selectr      "/home/rstudio-user/R/x86_64-pc-linux-gnu-library/3.6"
## sessioninfo  "/home/rstudio-user/R/x86_64-pc-linux-gnu-library/3.6"
## stringi      "/home/rstudio-user/R/x86_64-pc-linux-gnu-library/3.6"
## stringr      "/home/rstudio-user/R/x86_64-pc-linux-gnu-library/3.6"
## sys          "/home/rstudio-user/R/x86_64-pc-linux-gnu-library/3.6"
## testthat     "/home/rstudio-user/R/x86_64-pc-linux-gnu-library/3.6"
## tibble       "/home/rstudio-user/R/x86_64-pc-linux-gnu-library/3.6"
## tidyr        "/home/rstudio-user/R/x86_64-pc-linux-gnu-library/3.6"
## tidyselect   "/home/rstudio-user/R/x86_64-pc-linux-gnu-library/3.6"
## tidyverse    "/home/rstudio-user/R/x86_64-pc-linux-gnu-library/3.6"
## tinytex      "/home/rstudio-user/R/x86_64-pc-linux-gnu-library/3.6"
## usethis      "/home/rstudio-user/R/x86_64-pc-linux-gnu-library/3.6"
## utf8         "/home/rstudio-user/R/x86_64-pc-linux-gnu-library/3.6"
## vctrs        "/home/rstudio-user/R/x86_64-pc-linux-gnu-library/3.6"
## viridisLite  "/home/rstudio-user/R/x86_64-pc-linux-gnu-library/3.6"
## whisker      "/home/rstudio-user/R/x86_64-pc-linux-gnu-library/3.6"
## withr        "/home/rstudio-user/R/x86_64-pc-linux-gnu-library/3.6"
## writexl      "/home/rstudio-user/R/x86_64-pc-linux-gnu-library/3.6"
## xfun         "/home/rstudio-user/R/x86_64-pc-linux-gnu-library/3.6"
## xml2         "/home/rstudio-user/R/x86_64-pc-linux-gnu-library/3.6"
## xopen        "/home/rstudio-user/R/x86_64-pc-linux-gnu-library/3.6"
## yaml         "/home/rstudio-user/R/x86_64-pc-linux-gnu-library/3.6"
## base         "/opt/R/3.6.0/lib/R/library"                          
## boot         "/opt/R/3.6.0/lib/R/library"                          
## class        "/opt/R/3.6.0/lib/R/library"                          
## cluster      "/opt/R/3.6.0/lib/R/library"                          
## codetools    "/opt/R/3.6.0/lib/R/library"                          
## compiler     "/opt/R/3.6.0/lib/R/library"                          
## datasets     "/opt/R/3.6.0/lib/R/library"                          
## foreign      "/opt/R/3.6.0/lib/R/library"                          
## graphics     "/opt/R/3.6.0/lib/R/library"                          
## grDevices    "/opt/R/3.6.0/lib/R/library"                          
## grid         "/opt/R/3.6.0/lib/R/library"                          
## KernSmooth   "/opt/R/3.6.0/lib/R/library"                          
## lattice      "/opt/R/3.6.0/lib/R/library"                          
## MASS         "/opt/R/3.6.0/lib/R/library"                          
## Matrix       "/opt/R/3.6.0/lib/R/library"                          
## methods      "/opt/R/3.6.0/lib/R/library"                          
## mgcv         "/opt/R/3.6.0/lib/R/library"                          
## nlme         "/opt/R/3.6.0/lib/R/library"                          
## nnet         "/opt/R/3.6.0/lib/R/library"                          
## parallel     "/opt/R/3.6.0/lib/R/library"                          
## rpart        "/opt/R/3.6.0/lib/R/library"                          
## spatial      "/opt/R/3.6.0/lib/R/library"                          
## splines      "/opt/R/3.6.0/lib/R/library"                          
## stats        "/opt/R/3.6.0/lib/R/library"                          
## stats4       "/opt/R/3.6.0/lib/R/library"                          
## survival     "/opt/R/3.6.0/lib/R/library"                          
## tcltk        "/opt/R/3.6.0/lib/R/library"                          
## tools        "/opt/R/3.6.0/lib/R/library"                          
## utils        "/opt/R/3.6.0/lib/R/library"                          
##              Version      Priority     
## alluvial     "0.1-2"      NA           
## askpass      "1.1"        NA           
## assertthat   "0.2.1"      NA           
## backports    "1.1.5"      NA           
## base64enc    "0.1-3"      NA           
## BH           "1.72.0-3"   NA           
## bookdown     "0.18"       NA           
## brew         "1.0-6"      NA           
## broom        "0.5.3.9000" NA           
## callr        "3.4.3"      NA           
## cellranger   "1.1.0"      NA           
## cli          "2.0.2"      NA           
## clipr        "0.7.0"      NA           
## clisymbols   "1.2.0"      NA           
## colorspace   "1.4-1"      NA           
## commonmark   "1.7"        NA           
## covr         "3.5.0"      NA           
## crayon       "1.3.4"      NA           
## crosstalk    "1.1.0.1"    NA           
## curl         "4.3"        NA           
## DBI          "1.1.0"      NA           
## dbplyr       "1.4.2"      NA           
## desc         "1.2.0"      NA           
## devtools     "2.2.2"      NA           
## digest       "0.6.25"     NA           
## dplyr        "0.8.5"      NA           
## DT           "0.13"       NA           
## ellipsis     "0.3.0"      NA           
## evaluate     "0.14"       NA           
## fansi        "0.4.1"      NA           
## farver       "2.0.3"      NA           
## forcats      "0.5.0"      NA           
## fs           "1.3.2"      NA           
## generics     "0.0.2"      NA           
## ggalluvial   "0.11.1"     NA           
## ggplot2      "3.3.0"      NA           
## gh           "1.1.0"      NA           
## git2r        "0.26.1"     NA           
## glue         "1.3.2"      NA           
## gtable       "0.3.0"      NA           
## haven        "2.2.0"      NA           
## highr        "0.8"        NA           
## hms          "0.5.3"      NA           
## htmltools    "0.4.0"      NA           
## htmlwidgets  "1.5.1"      NA           
## httr         "1.4.1"      NA           
## ini          "0.3.1"      NA           
## isoband      "0.2.0"      NA           
## jsonlite     "1.6.1"      NA           
## knitr        "1.28"       NA           
## labeling     "0.3"        NA           
## later        "1.0.0"      NA           
## lazyeval     "0.2.2"      NA           
## lifecycle    "0.2.0"      NA           
## lubridate    "1.7.4"      NA           
## magrittr     "1.5"        NA           
## markdown     "1.1"        NA           
## memoise      "1.1.0"      NA           
## mime         "0.9"        NA           
## modelr       "0.1.6"      NA           
## munsell      "0.5.0"      NA           
## openssl      "1.4.1"      NA           
## pillar       "1.4.3"      NA           
## pkgbuild     "1.0.6"      NA           
## pkgconfig    "2.0.3"      NA           
## pkgload      "1.0.2"      NA           
## plogr        "0.2.0"      NA           
## plyr         "1.8.6"      NA           
## praise       "1.0.0"      NA           
## prettyunits  "1.1.1"      NA           
## processx     "3.4.2"      NA           
## progress     "1.2.2"      NA           
## promises     "1.1.0"      NA           
## ps           "1.3.2"      NA           
## purrr        "0.3.3"      NA           
## R6           "2.4.1"      NA           
## rcmdcheck    "1.3.3"      NA           
## RColorBrewer "1.1-2"      NA           
## Rcpp         "1.0.4"      NA           
## readr        "1.3.1"      NA           
## readxl       "1.3.1"      NA           
## rematch      "1.0.1"      NA           
## remotes      "2.1.1"      NA           
## reprex       "0.3.0"      NA           
## reshape2     "1.4.3"      NA           
## rex          "1.1.2"      NA           
## rlang        "0.4.5"      NA           
## rmarkdown    "2.1"        NA           
## roxygen2     "7.1.0"      NA           
## rprojroot    "1.3-2"      NA           
## rstudioapi   "0.11"       NA           
## rversions    "2.0.1"      NA           
## rvest        "0.3.5"      NA           
## scales       "1.1.0"      NA           
## selectr      "0.4-2"      NA           
## sessioninfo  "1.1.1"      NA           
## stringi      "1.4.6"      NA           
## stringr      "1.4.0"      NA           
## sys          "3.3"        NA           
## testthat     "2.3.2"      NA           
## tibble       "3.0.0"      NA           
## tidyr        "1.0.2"      NA           
## tidyselect   "1.0.0"      NA           
## tidyverse    "1.3.0"      NA           
## tinytex      "0.20"       NA           
## usethis      "1.5.1"      NA           
## utf8         "1.1.4"      NA           
## vctrs        "0.2.4"      NA           
## viridisLite  "0.3.0"      NA           
## whisker      "0.4"        NA           
## withr        "2.1.2"      NA           
## writexl      "1.2"        NA           
## xfun         "0.12"       NA           
## xml2         "1.2.5"      NA           
## xopen        "1.0.0"      NA           
## yaml         "2.2.1"      NA           
## base         "3.6.0"      "base"       
## boot         "1.3-22"     "recommended"
## class        "7.3-15"     "recommended"
## cluster      "2.0.8"      "recommended"
## codetools    "0.2-16"     "recommended"
## compiler     "3.6.0"      "base"       
## datasets     "3.6.0"      "base"       
## foreign      "0.8-71"     "recommended"
## graphics     "3.6.0"      "base"       
## grDevices    "3.6.0"      "base"       
## grid         "3.6.0"      "base"       
## KernSmooth   "2.23-15"    "recommended"
## lattice      "0.20-38"    "recommended"
## MASS         "7.3-51.4"   "recommended"
## Matrix       "1.2-17"     "recommended"
## methods      "3.6.0"      "base"       
## mgcv         "1.8-28"     "recommended"
## nlme         "3.1-139"    "recommended"
## nnet         "7.3-12"     "recommended"
## parallel     "3.6.0"      "base"       
## rpart        "4.1-15"     "recommended"
## spatial      "7.3-11"     "recommended"
## splines      "3.6.0"      "base"       
## stats        "3.6.0"      "base"       
## stats4       "3.6.0"      "base"       
## survival     "2.44-1.1"   "recommended"
## tcltk        "3.6.0"      "base"       
## tools        "3.6.0"      "base"       
## utils        "3.6.0"      "base"       
##              Depends                                          
## alluvial     NA                                               
## askpass      NA                                               
## assertthat   NA                                               
## backports    "R (>= 3.0.0)"                                   
## base64enc    "R (>= 2.9.0)"                                   
## BH           NA                                               
## bookdown     NA                                               
## brew         NA                                               
## broom        "R (>= 3.1)"                                     
## callr        NA                                               
## cellranger   "R (>= 3.0.0)"                                   
## cli          "R (>= 2.10)"                                    
## clipr        NA                                               
## clisymbols   NA                                               
## colorspace   "R (>= 3.0.0), methods"                          
## commonmark   NA                                               
## covr         "R (>= 3.1.0), methods"                          
## crayon       NA                                               
## crosstalk    NA                                               
## curl         "R (>= 3.0.0)"                                   
## DBI          "methods, R (>= 3.0.0)"                          
## dbplyr       "R (>= 3.1)"                                     
## desc         "R (>= 3.1.0)"                                   
## devtools     "R (>= 3.0.2), usethis (>= 1.5.0)"               
## digest       "R (>= 3.1.0)"                                   
## dplyr        "R (>= 3.2.0)"                                   
## DT           NA                                               
## ellipsis     "R (>= 3.2)"                                     
## evaluate     "R (>= 3.0.2)"                                   
## fansi        "R (>= 3.1.0)"                                   
## farver       NA                                               
## forcats      "R (>= 3.2)"                                     
## fs           "R (>= 3.1)"                                     
## generics     "R (>= 3.1)"                                     
## ggalluvial   "R (>= 3.3), ggplot2 (>= 2.2)"                   
## ggplot2      "R (>= 3.2)"                                     
## gh           NA                                               
## git2r        "R (>= 3.1)"                                     
## glue         "R (>= 3.1)"                                     
## gtable       "R (>= 3.0)"                                     
## haven        "R (>= 3.2)"                                     
## highr        "R (>= 3.2.3)"                                   
## hms          NA                                               
## htmltools    "R (>= 2.14.1)"                                  
## htmlwidgets  NA                                               
## httr         "R (>= 3.2)"                                     
## ini          NA                                               
## isoband      NA                                               
## jsonlite     "methods"                                        
## knitr        "R (>= 3.2.3)"                                   
## labeling     NA                                               
## later        NA                                               
## lazyeval     "R (>= 3.1.0)"                                   
## lifecycle    "R (>= 3.2)"                                     
## lubridate    "methods, R (>= 3.0.0)"                          
## magrittr     NA                                               
## markdown     "R (>= 2.11.1)"                                  
## memoise      NA                                               
## mime         NA                                               
## modelr       "R (>= 3.2)"                                     
## munsell      NA                                               
## openssl      NA                                               
## pillar       NA                                               
## pkgbuild     "R (>= 3.1)"                                     
## pkgconfig    NA                                               
## pkgload      NA                                               
## plogr        NA                                               
## plyr         "R (>= 3.1.0)"                                   
## praise       NA                                               
## prettyunits  NA                                               
## processx     NA                                               
## progress     NA                                               
## promises     NA                                               
## ps           "R (>= 3.1)"                                     
## purrr        "R (>= 3.2)"                                     
## R6           "R (>= 3.0)"                                     
## rcmdcheck    NA                                               
## RColorBrewer "R (>= 2.0.0)"                                   
## Rcpp         "R (>= 3.0.0)"                                   
## readr        "R (>= 3.1)"                                     
## readxl       NA                                               
## rematch      NA                                               
## remotes      "R (>= 3.0.0)"                                   
## reprex       "R (>= 3.1)"                                     
## reshape2     "R (>= 3.1)"                                     
## rex          NA                                               
## rlang        "R (>= 3.2.0)"                                   
## rmarkdown    "R (>= 3.0)"                                     
## roxygen2     "R (>= 3.2)"                                     
## rprojroot    "R (>= 3.0.0)"                                   
## rstudioapi   NA                                               
## rversions    NA                                               
## rvest        "R (>= 3.2), xml2"                               
## scales       "R (>= 3.2)"                                     
## selectr      "R (>= 3.0)"                                     
## sessioninfo  NA                                               
## stringi      "R (>= 2.14)"                                    
## stringr      "R (>= 3.1)"                                     
## sys          NA                                               
## testthat     "R (>= 3.1)"                                     
## tibble       "R (>= 3.1.0)"                                   
## tidyr        "R (>= 3.1)"                                     
## tidyselect   "R (>= 3.2)"                                     
## tidyverse    "R (>= 3.2)"                                     
## tinytex      NA                                               
## usethis      "R (>= 3.2)"                                     
## utf8         "R (>= 2.10)"                                    
## vctrs        "R (>= 3.2)"                                     
## viridisLite  "R (>= 2.10)"                                    
## whisker      NA                                               
## withr        "R (>= 3.0.2)"                                   
## writexl      NA                                               
## xfun         NA                                               
## xml2         "R (>= 3.1.0)"                                   
## xopen        "R (>= 3.1)"                                     
## yaml         NA                                               
## base         NA                                               
## boot         "R (>= 3.0.0), graphics, stats"                  
## class        "R (>= 3.0.0), stats, utils"                     
## cluster      "R (>= 3.3.0)"                                   
## codetools    "R (>= 2.1)"                                     
## compiler     NA                                               
## datasets     NA                                               
## foreign      "R (>= 3.0.0)"                                   
## graphics     NA                                               
## grDevices    NA                                               
## grid         NA                                               
## KernSmooth   "R (>= 2.5.0), stats"                            
## lattice      "R (>= 3.0.0)"                                   
## MASS         "R (>= 3.1.0), grDevices, graphics, stats, utils"
## Matrix       "R (>= 3.2.0)"                                   
## methods      NA                                               
## mgcv         "R (>= 2.14.0), nlme (>= 3.1-64)"                
## nlme         "R (>= 3.4.0)"                                   
## nnet         "R (>= 2.14.0), stats, utils"                    
## parallel     NA                                               
## rpart        "R (>= 2.15.0), graphics, stats, grDevices"      
## spatial      "R (>= 3.0.0), graphics, stats, utils"           
## splines      NA                                               
## stats        NA                                               
## stats4       NA                                               
## survival     "R (>= 2.13.0)"                                  
## tcltk        NA                                               
## tools        NA                                               
## utils        NA                                               
##              Imports                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
## alluvial     NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## askpass      "sys (>= 2.1)"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
## assertthat   "tools"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
## backports    "utils"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
## base64enc    NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## BH           NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## bookdown     "htmltools (>= 0.3.6), knitr (>= 1.22), rmarkdown (>= 2.0),\nxfun (>= 0.6), tinytex (>= 0.12)"                                                                                                                                                                                                                                                                                                                                                                                                              
## brew         NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## broom        "backports, dplyr, ellipsis, generics (>= 0.0.2), glue,\nmethods, purrr, reshape2, rlang, stringr, tibble, tidyr"                                                                                                                                                                                                                                                                                                                                                                                           
## callr        "processx (>= 3.4.0), R6, utils"                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
## cellranger   "rematch, tibble"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
## cli          "assertthat, crayon (>= 1.3.4), glue, methods, utils, fansi"                                                                                                                                                                                                                                                                                                                                                                                                                                                
## clipr        "utils"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
## clisymbols   NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## colorspace   "graphics, grDevices, stats"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
## commonmark   NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## covr         "digest, stats, utils, jsonlite, rex, httr, crayon, withr (>=\n1.0.2), yaml"                                                                                                                                                                                                                                                                                                                                                                                                                                
## crayon       "grDevices, methods, utils"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
## crosstalk    "htmltools (>= 0.3.6), jsonlite, lazyeval, R6"                                                                                                                                                                                                                                                                                                                                                                                                                                                              
## curl         NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## DBI          NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## dbplyr       "assertthat (>= 0.2.0), DBI (>= 1.0.0), dplyr (>= 0.8.0), glue\n(>= 1.2.0), methods, purrr (>= 0.2.5), R6 (>= 2.2.2), rlang (>=\n0.2.0), tibble (>= 1.4.2), tidyselect (>= 0.2.4), utils"                                                                                                                                                                                                                                                                                                                   
## desc         "assertthat, utils, R6, crayon, rprojroot"                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
## devtools     "callr, cli, covr (>= 3.2.0), crayon, desc, digest, DT,\nellipsis (>= 0.3.0), glue, git2r (>= 0.23.0), httr (>= 0.4),\njsonlite, memoise (>= 1.0.0), pkgbuild (>= 1.0.3), pkgload (>=\n1.0.2), rcmdcheck (>= 1.3.3), remotes (>= 2.1.1), rlang,\nroxygen2 (>= 6.1.1), rstudioapi (>= 0.7), rversions,\nsessioninfo (>= 1.1.1), stats, testthat (>= 2.1.1), tools,\nutils, withr"                                                                                                                            
## digest       "utils"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
## dplyr        "ellipsis, assertthat (>= 0.2.0), glue (>= 1.3.0), magrittr (>=\n1.5), methods, pkgconfig, R6, Rcpp (>= 1.0.1), rlang (>=\n0.4.0), tibble (>= 2.0.0), tidyselect (>= 0.2.5), utils"                                                                                                                                                                                                                                                                                                                         
## DT           "htmltools (>= 0.3.6), htmlwidgets (>= 1.3), jsonlite (>=\n0.9.16), magrittr, crosstalk, promises"                                                                                                                                                                                                                                                                                                                                                                                                          
## ellipsis     "rlang (>= 0.3.0)"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## evaluate     "methods"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
## fansi        NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## farver       NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## forcats      "ellipsis, magrittr, rlang, tibble"                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
## fs           "methods, Rcpp"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
## generics     "methods"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
## ggalluvial   "stats, dplyr (>= 0.7), tidyr (>= 0.7), lazyeval, rlang,\ntidyselect"                                                                                                                                                                                                                                                                                                                                                                                                                                       
## ggplot2      "digest, glue, grDevices, grid, gtable (>= 0.1.1), isoband,\nMASS, mgcv, rlang (>= 0.3.0), scales (>= 0.5.0), stats, tibble,\nwithr (>= 2.0.0)"                                                                                                                                                                                                                                                                                                                                                             
## gh           "cli, ini, jsonlite, httr (>= 1.2)"                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
## git2r        "graphics, utils"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
## glue         "methods"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
## gtable       "grid"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
## haven        "forcats (>= 0.2.0), hms, Rcpp (>= 0.11.4), readr (>= 0.1.0),\nrlang (>= 0.4.0), tibble, tidyselect"                                                                                                                                                                                                                                                                                                                                                                                                        
## highr        NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## hms          "methods, pkgconfig, rlang, vctrs (>= 0.2.1)"                                                                                                                                                                                                                                                                                                                                                                                                                                                               
## htmltools    "utils, digest, Rcpp, rlang"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
## htmlwidgets  "grDevices, htmltools (>= 0.3), jsonlite (>= 0.9.16), yaml"                                                                                                                                                                                                                                                                                                                                                                                                                                                 
## httr         "curl (>= 3.0.0), jsonlite, mime, openssl (>= 0.8), R6"                                                                                                                                                                                                                                                                                                                                                                                                                                                     
## ini          NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## isoband      "Rcpp, grid, utils"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
## jsonlite     NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## knitr        "evaluate (>= 0.10), highr, markdown, stringr (>= 0.6), yaml\n(>= 2.1.19), methods, xfun, tools"                                                                                                                                                                                                                                                                                                                                                                                                            
## labeling     NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## later        "Rcpp (>= 0.12.9), rlang"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
## lazyeval     NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## lifecycle    "glue, rlang (>= 0.4.0)"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
## lubridate    "stringr, Rcpp (>= 0.12.13),"                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
## magrittr     NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## markdown     "utils, xfun, mime (>= 0.3)"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
## memoise      "digest (>= 0.6.3)"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
## mime         "tools"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
## modelr       "broom, dplyr, magrittr, purrr (>= 0.2.2), rlang (>= 0.2.0),\ntibble, tidyr (>= 0.8.0), tidyselect"                                                                                                                                                                                                                                                                                                                                                                                                         
## munsell      "colorspace, methods"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
## openssl      "askpass"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
## pillar       "cli, crayon (>= 1.3.4), fansi, rlang (>= 0.3.0), utf8 (>=\n1.1.0), vctrs (>= 0.2.0)"                                                                                                                                                                                                                                                                                                                                                                                                                       
## pkgbuild     "callr (>= 3.2.0), cli, crayon, desc, prettyunits, R6,\nrprojroot, withr (>= 2.1.2)"                                                                                                                                                                                                                                                                                                                                                                                                                        
## pkgconfig    "utils"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
## pkgload      "desc, methods, pkgbuild, rlang, rprojroot, rstudioapi, utils,\nwithr"                                                                                                                                                                                                                                                                                                                                                                                                                                      
## plogr        NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## plyr         "Rcpp (>= 0.11.0)"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## praise       NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## prettyunits  NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## processx     "ps (>= 1.2.0), R6, utils"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
## progress     "hms, prettyunits, R6, crayon"                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
## promises     "R6, Rcpp, later, rlang, stats, magrittr"                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
## ps           "utils"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
## purrr        "magrittr (>= 1.5), rlang (>= 0.3.1)"                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
## R6           NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## rcmdcheck    "callr (>= 3.1.1.9000), cli (>= 1.1.0), crayon, desc (>=\n1.2.0), digest, pkgbuild, prettyunits, R6, rprojroot,\nsessioninfo (>= 1.1.1), utils, withr, xopen"                                                                                                                                                                                                                                                                                                                                               
## RColorBrewer NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## Rcpp         "methods, utils"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
## readr        "Rcpp (>= 0.12.0.5), tibble, hms (>= 0.4.1), R6, clipr, crayon,\nmethods"                                                                                                                                                                                                                                                                                                                                                                                                                                   
## readxl       "cellranger, Rcpp (>= 0.12.18), tibble (>= 1.3.1), utils"                                                                                                                                                                                                                                                                                                                                                                                                                                                   
## rematch      NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## remotes      "methods, stats, tools, utils"                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
## reprex       "callr (>= 2.0.0), clipr (>= 0.4.0), fs, rlang, rmarkdown,\nutils, whisker, withr"                                                                                                                                                                                                                                                                                                                                                                                                                          
## reshape2     "plyr (>= 1.8.1), Rcpp, stringr"                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
## rex          "magrittr, lazyeval"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
## rlang        NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## rmarkdown    "tools, utils, knitr (>= 1.22), yaml (>= 2.1.19), htmltools (>=\n0.3.5), evaluate (>= 0.13), base64enc, jsonlite, mime, tinytex\n(>= 0.11), xfun, methods, stringr (>= 1.2.0)"                                                                                                                                                                                                                                                                                                                              
## roxygen2     "brew, commonmark, desc (>= 1.2.0), digest, knitr, methods,\npkgload (>= 1.0.2), purrr (>= 0.3.3), R6 (>= 2.1.2), Rcpp (>=\n0.11.0), rlang, stringi, stringr (>= 1.0.0), utils, xml2"                                                                                                                                                                                                                                                                                                                       
## rprojroot    "backports"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
## rstudioapi   NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## rversions    "curl, utils, xml2 (>= 1.0.0)"                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
## rvest        "httr (>= 0.5), magrittr, selectr"                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## scales       "farver (>= 2.0.0), labeling, munsell (>= 0.5), R6,\nRColorBrewer, viridisLite, lifecycle"                                                                                                                                                                                                                                                                                                                                                                                                                  
## selectr      "methods, stringr, R6"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
## sessioninfo  "cli, tools, utils, withr"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
## stringi      "tools, utils, stats"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
## stringr      "glue (>= 1.2.0), magrittr, stringi (>= 1.1.7)"                                                                                                                                                                                                                                                                                                                                                                                                                                                             
## sys          NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## testthat     "cli, crayon (>= 1.3.4), digest, ellipsis, evaluate, magrittr,\nmethods, pkgload, praise, R6 (>= 2.2.0), rlang (>= 0.4.1),\nwithr (>= 2.0.0)"                                                                                                                                                                                                                                                                                                                                                               
## tibble       "cli, crayon (>= 1.3.4), ellipsis (>= 0.2.0), fansi (>= 0.4.0),\nlifecycle (>= 0.2.0), magrittr, methods, pillar (>= 1.4.3),\npkgconfig, rlang (>= 0.4.3), utils, vctrs (>= 0.2.4)"                                                                                                                                                                                                                                                                                                                         
## tidyr        "dplyr (>= 0.8.2), ellipsis (>= 0.1.0), glue, magrittr, purrr,\nRcpp, rlang, stringi, tibble (>= 2.1.1), tidyselect (>= 0.2.5),\nutils, vctrs (>= 0.2.0), lifecycle"                                                                                                                                                                                                                                                                                                                                        
## tidyselect   "ellipsis, glue (>= 1.3.0), purrr (>= 0.3.2), rlang (>= 0.4.3),\nvctrs (>= 0.2.2)"                                                                                                                                                                                                                                                                                                                                                                                                                          
## tidyverse    "broom (>= 0.5.2), cli (>= 1.1.0), crayon (>= 1.3.4), dbplyr\n(>= 1.4.2), dplyr (>= 0.8.3), forcats (>= 0.4.0), ggplot2 (>=\n3.2.1), haven (>= 2.2.0), hms (>= 0.5.2), httr (>= 1.4.1),\njsonlite (>= 1.6), lubridate (>= 1.7.4), magrittr (>= 1.5),\nmodelr (>= 0.1.5), pillar (>= 1.4.2), purrr (>= 0.3.3), readr\n(>= 1.3.1), readxl (>= 1.3.1), reprex (>= 0.3.0), rlang (>=\n0.4.1), rstudioapi (>= 0.10), rvest (>= 0.3.5), stringr (>=\n1.4.0), tibble (>= 2.1.3), tidyr (>= 1.0.0), xml2 (>= 1.2.2)"
## tinytex      "xfun (>= 0.5)"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
## usethis      "clipr (>= 0.3.0), clisymbols, crayon, curl (>= 2.7), desc, fs\n(>= 1.3.0), gh, git2r (>= 0.23), glue (>= 1.3.0), purrr, rlang,\nrprojroot (>= 1.2), rstudioapi, stats, utils, whisker, withr,\nyaml"                                                                                                                                                                                                                                                                                                       
## utf8         NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## vctrs        "ellipsis (>= 0.2.0), digest, glue, rlang (>= 0.4.5)"                                                                                                                                                                                                                                                                                                                                                                                                                                                       
## viridisLite  NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## whisker      NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## withr        "stats, graphics, grDevices"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
## writexl      NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## xfun         "stats, tools"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
## xml2         "Rcpp, methods"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
## xopen        "processx"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
## yaml         NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## base         NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## boot         NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## class        "MASS"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
## cluster      "graphics, grDevices, stats, utils"                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
## codetools    NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## compiler     NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## datasets     NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## foreign      "methods, utils, stats"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
## graphics     "grDevices"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
## grDevices    NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## grid         "grDevices, utils"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## KernSmooth   NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## lattice      "grid, grDevices, graphics, stats, utils"                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
## MASS         "methods"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
## Matrix       "methods, graphics, grid, stats, utils, lattice"                                                                                                                                                                                                                                                                                                                                                                                                                                                            
## methods      "utils, stats"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
## mgcv         "methods, stats, graphics, Matrix, splines, utils"                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## nlme         "graphics, stats, utils, lattice"                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
## nnet         NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## parallel     "tools, compiler"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
## rpart        NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## spatial      NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## splines      "graphics, stats"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
## stats        "utils, grDevices, graphics"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
## stats4       "graphics, methods, stats"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
## survival     "graphics, Matrix, methods, splines, stats, utils"                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## tcltk        "utils"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
## tools        NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## utils        NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
##              LinkingTo                              
## alluvial     NA                                     
## askpass      NA                                     
## assertthat   NA                                     
## backports    NA                                     
## base64enc    NA                                     
## BH           NA                                     
## bookdown     NA                                     
## brew         NA                                     
## broom        NA                                     
## callr        NA                                     
## cellranger   NA                                     
## cli          NA                                     
## clipr        NA                                     
## clisymbols   NA                                     
## colorspace   NA                                     
## commonmark   NA                                     
## covr         NA                                     
## crayon       NA                                     
## crosstalk    NA                                     
## curl         NA                                     
## DBI          NA                                     
## dbplyr       NA                                     
## desc         NA                                     
## devtools     NA                                     
## digest       NA                                     
## dplyr        "BH, plogr (>= 0.2.0), Rcpp (>= 1.0.1)"
## DT           NA                                     
## ellipsis     NA                                     
## evaluate     NA                                     
## fansi        NA                                     
## farver       NA                                     
## forcats      NA                                     
## fs           "Rcpp"                                 
## generics     NA                                     
## ggalluvial   NA                                     
## ggplot2      NA                                     
## gh           NA                                     
## git2r        NA                                     
## glue         NA                                     
## gtable       NA                                     
## haven        "Rcpp"                                 
## highr        NA                                     
## hms          NA                                     
## htmltools    "Rcpp"                                 
## htmlwidgets  NA                                     
## httr         NA                                     
## ini          NA                                     
## isoband      "Rcpp, testthat"                       
## jsonlite     NA                                     
## knitr        NA                                     
## labeling     NA                                     
## later        "Rcpp, BH"                             
## lazyeval     NA                                     
## lifecycle    NA                                     
## lubridate    "Rcpp,"                                
## magrittr     NA                                     
## markdown     NA                                     
## memoise      NA                                     
## mime         NA                                     
## modelr       NA                                     
## munsell      NA                                     
## openssl      NA                                     
## pillar       NA                                     
## pkgbuild     NA                                     
## pkgconfig    NA                                     
## pkgload      NA                                     
## plogr        NA                                     
## plyr         "Rcpp"                                 
## praise       NA                                     
## prettyunits  NA                                     
## processx     NA                                     
## progress     NA                                     
## promises     "later, Rcpp"                          
## ps           NA                                     
## purrr        NA                                     
## R6           NA                                     
## rcmdcheck    NA                                     
## RColorBrewer NA                                     
## Rcpp         NA                                     
## readr        "Rcpp, BH"                             
## readxl       "progress, Rcpp"                       
## rematch      NA                                     
## remotes      NA                                     
## reprex       NA                                     
## reshape2     "Rcpp"                                 
## rex          NA                                     
## rlang        NA                                     
## rmarkdown    NA                                     
## roxygen2     "Rcpp"                                 
## rprojroot    NA                                     
## rstudioapi   NA                                     
## rversions    NA                                     
## rvest        NA                                     
## scales       NA                                     
## selectr      NA                                     
## sessioninfo  NA                                     
## stringi      NA                                     
## stringr      NA                                     
## sys          NA                                     
## testthat     NA                                     
## tibble       NA                                     
## tidyr        "Rcpp"                                 
## tidyselect   NA                                     
## tidyverse    NA                                     
## tinytex      NA                                     
## usethis      NA                                     
## utf8         NA                                     
## vctrs        NA                                     
## viridisLite  NA                                     
## whisker      NA                                     
## withr        NA                                     
## writexl      NA                                     
## xfun         NA                                     
## xml2         "Rcpp (>= 0.12.12)"                    
## xopen        NA                                     
## yaml         NA                                     
## base         NA                                     
## boot         NA                                     
## class        NA                                     
## cluster      NA                                     
## codetools    NA                                     
## compiler     NA                                     
## datasets     NA                                     
## foreign      NA                                     
## graphics     NA                                     
## grDevices    NA                                     
## grid         NA                                     
## KernSmooth   NA                                     
## lattice      NA                                     
## MASS         NA                                     
## Matrix       NA                                     
## methods      NA                                     
## mgcv         NA                                     
## nlme         NA                                     
## nnet         NA                                     
## parallel     NA                                     
## rpart        NA                                     
## spatial      NA                                     
## splines      NA                                     
## stats        NA                                     
## stats4       NA                                     
## survival     NA                                     
## tcltk        NA                                     
## tools        NA                                     
## utils        NA                                     
##              Suggests                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
## alluvial     "devtools, testthat, reshape2, knitr, rmarkdown, dplyr"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
## askpass      "testthat"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
## assertthat   "testthat, covr"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## backports    NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
## base64enc    NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
## BH           NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
## bookdown     "htmlwidgets, rstudioapi, miniUI, rsconnect (>= 0.4.3), servr\n(>= 0.13), shiny, testit (>= 0.9), tufte, webshot"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
## brew         NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
## broom        "AER, akima, AUC, bbmle, betareg, biglm, binGroup, boot,\nbtergm, car, caret, cluster, coda, covr, drc, e1071, emmeans,\nepiR, ergm, gam (>= 1.15), gamlss, gamlss.data, gamlss.dist,\ngeepack, ggplot2, glmnet, gmm, Hmisc, irlba, joineRML, Kendall,\nknitr, ks, Lahman, lavaan, leaps, lfe, lm.beta, lmodel2,\nlmtest, lsmeans, maps, maptools, MASS, Matrix, mclust,\nmediation, metafor, mgcv, modeltests, muhaz, multcomp, network,\nnnet, orcutt (>= 2.2), ordinal, plm, poLCA, psych, quantreg,\nrgeos, rmarkdown, robust, robustbase, rsample, sp, speedglm,\nspelling, statnet.common, survey, survival, systemfit, testthat\n(>= 2.1.0), tseries, xergm, zoo, glmnetUtils, lme4, gee,\nmclogit"
## callr        "cliapp, covr, crayon, fansi, pingr, ps, rprojroot, spelling,\ntestthat, tibble, withr"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
## cellranger   "covr, testthat (>= 1.0.0), knitr, rmarkdown"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
## cli          "callr, covr, htmlwidgets, knitr, mockery, rmarkdown,\nrstudioapi, prettycode (>= 1.1.0), testthat, withr"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
## clipr        "covr, knitr, rmarkdown, rstudioapi (>= 0.5), testthat (>=\n2.0.0)"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
## clisymbols   "testthat"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
## colorspace   "datasets, utils, KernSmooth, MASS, kernlab, mvtnorm, vcd,\ntcltk, shiny, shinyjs, ggplot2, dplyr, scales, grid, png, jpeg,\nknitr, rmarkdown, RColorBrewer, rcartocolor, scico, viridis,\nwesanderson"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
## commonmark   "curl, testthat, xml2"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
## covr         "R6, knitr, rmarkdown, htmltools, DT (>= 0.2), testthat,\nrlang, rstudioapi (>= 0.2), xml2 (>= 1.0.0), parallel, memoise,\nmockery"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
## crayon       "mockery, rstudioapi, testthat, withr"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
## crosstalk    "shiny, ggplot2, testthat (>= 2.1.0)"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
## curl         "spelling, testthat (>= 1.0.0), knitr, jsonlite, rmarkdown,\nmagrittr, httpuv (>= 1.4.4), webutils"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
## DBI          "blob, covr, hms, knitr, magrittr, rmarkdown, rprojroot,\nRSQLite (>= 1.1-2), testthat, xml2"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
## dbplyr       "bit64, covr, knitr, Lahman, nycflights13, RMariaDB (>=\n1.0.2), rmarkdown, RMySQL (>= 0.10.11), RPostgreSQL (>= 0.4.1),\nRSQLite (>= 2.1.0), testthat (>= 2.0.0), withr (>= 2.1.2)"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
## desc         "covr, testthat, whoami, withr"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
## devtools     "BiocManager, bitops, curl (>= 0.9), evaluate, foghorn (>=\n1.1.0), gmailr (> 0.7.0), knitr, lintr (>= 0.2.1), mockery,\npingr, MASS, pkgdown, Rcpp (>= 0.10.0), rhub (>= 1.0.2),\nrmarkdown, spelling (>= 1.1), whisker"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
## digest       "tinytest, knitr, rmarkdown"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
## dplyr        "bit64, callr, covr, crayon (>= 1.3.4), DBI, dbplyr, dtplyr,\nggplot2, hms, knitr, Lahman, lubridate, MASS, mgcv,\nmicrobenchmark, nycflights13, rmarkdown, RMySQL, RPostgreSQL,\nRSQLite, testthat, withr, broom, purrr, readr"                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## DT           "knitr (>= 1.8), rmarkdown, shiny (>= 1.2.0)"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
## ellipsis     "covr, testthat"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## evaluate     "testthat, lattice, ggplot2"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
## fansi        "unitizer, knitr, rmarkdown"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
## farver       "testthat (>= 2.1.0), covr"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
## forcats      "covr, ggplot2, testthat, readr, knitr, rmarkdown, dplyr"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
## fs           "testthat, covr, pillar (>= 1.0.0), tibble (>= 1.1.0), crayon,\nrmarkdown, knitr, withr, spelling"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
## generics     "covr, pkgload, testthat, tibble"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
## ggalluvial   "grid, alluvial, testthat, knitr, babynames, sessioninfo,\nggrepel, ggfittext (>= 0.6), vdiffr (>= 0.2)"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
## ggplot2      "covr, dplyr, ggplot2movies, hexbin, Hmisc, knitr, lattice,\nmapproj, maps, maptools, multcomp, munsell, nlme, profvis,\nquantreg, rgeos, rmarkdown, rpart, sf (>= 0.7-3), svglite (>=\n1.2.0.9001), testthat (>= 2.1.0), vdiffr (>= 0.3.0)"                                                                                                                                                                                                                                                                                                                                                                                                                                                              
## gh           "covr, keyring, pingr, testthat, withr"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
## git2r        "getPass"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
## glue         "testthat, covr, magrittr, crayon, knitr, rmarkdown, DBI,\nRSQLite, R.utils, forcats, microbenchmark, rprintf, stringr,\nggplot2, dplyr, withr, vctrs (>= 0.2.2)"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
## gtable       "covr, testthat, knitr, rmarkdown, ggplot2, profvis"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
## haven        "covr, fs, knitr, rmarkdown, testthat, pillar (>= 1.4.0), cli,\ncrayon"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
## highr        "knitr, testit"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
## hms          "crayon, lubridate, pillar (>= 1.1.0), testthat"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## htmltools    "markdown, testthat, withr"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
## htmlwidgets  "knitr (>= 1.8)"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## httr         "covr, httpuv, jpeg, knitr, png, readr, rmarkdown, testthat\n(>= 0.8.0), xml2"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
## ini          "testthat"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
## isoband      "covr, ggplot2, knitr, lwgeom, magick, microbenchmark,\nrmarkdown, sf, testthat"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## jsonlite     "httr, curl, plyr, testthat, knitr, rmarkdown, R.rsp, sp"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
## knitr        "formatR, testit, digest, rgl (>= 0.95.1201), codetools,\nrmarkdown, htmlwidgets (>= 0.7), webshot, tikzDevice (>= 0.10),\ntinytex, reticulate (>= 1.4), JuliaCall (>= 0.11.1), magick,\npng, jpeg, gifski, xml2 (>= 1.2.0), httr, DBI (>= 0.4-1),\nshowtext, tibble, sass, styler (>= 1.2.0)"                                                                                                                                                                                                                                                                                                                                                                                                            
## labeling     NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
## later        "knitr, rmarkdown, testthat"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
## lazyeval     "knitr, rmarkdown (>= 0.2.65), testthat, covr"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
## lifecycle    "covr, crayon, knitr, rmarkdown, testthat (>= 2.1.0)"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
## lubridate    "testthat, knitr, covr"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
## magrittr     "testthat, knitr"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
## markdown     "knitr, RCurl"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
## memoise      "testthat, aws.s3, httr, covr"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
## mime         NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
## modelr       "compiler, covr, ggplot2, testthat"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
## munsell      "ggplot2, testthat"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
## openssl      "testthat, digest, knitr, rmarkdown, jsonlite, jose, sodium"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
## pillar       "knitr, lubridate, testthat (>= 2.0.0), withr"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
## pkgbuild     "Rcpp, testthat, covr"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
## pkgconfig    "covr, testthat, disposables (>= 1.0.3)"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
## pkgload      "bitops, covr, Rcpp, testthat"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
## plogr        "Rcpp"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
## plyr         "abind, covr, doParallel, foreach, iterators, itertools,\ntcltk, testthat"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
## praise       "testthat"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
## prettyunits  "codetools, covr, testthat"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
## processx     "callr (>= 3.2.0), codetools, covr, crayon, curl, debugme,\nparallel, testthat, withr"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
## progress     "Rcpp, testthat, withr"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
## promises     "testthat, future, knitr, rmarkdown"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
## ps           "callr, covr, curl, pingr, processx (>= 3.1.0), R6, rlang,\ntestthat, tibble"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
## purrr        "covr, crayon, dplyr (>= 0.7.8), knitr, rmarkdown, testthat,\ntibble, tidyselect"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
## R6           "knitr, microbenchmark, pryr, testthat, ggplot2, scales"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
## rcmdcheck    "covr, knitr, mockery, rmarkdown, testthat"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
## RColorBrewer NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
## Rcpp         "tinytest, inline, rbenchmark, pkgKitten (>= 0.1.2)"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
## readr        "curl, testthat, knitr, rmarkdown, stringi, covr, spelling"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
## readxl       "covr, knitr, rmarkdown, rprojroot (>= 1.1), testthat"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
## rematch      "covr, testthat"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## remotes      "brew, callr, codetools, curl, covr, git2r (>= 0.23.0), knitr,\nmockery, pkgbuild (>= 1.0.1), pingr, rmarkdown, rprojroot,\ntestthat, withr"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
## reprex       "covr, devtools, fortunes, knitr, miniUI, rprojroot,\nrstudioapi, shiny, styler (>= 1.0.2), testthat (>= 2.0.0)"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## reshape2     "covr, lattice, testthat (>= 0.8.0)"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
## rex          "testthat, knitr, rmarkdown, dplyr, ggplot2, Hmisc, stringr,\nrvest, roxygen2, covr"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
## rlang        "cli, covr, crayon, glue, magrittr, methods, pillar,\nrmarkdown, testthat (>= 2.3.0), vctrs (>= 0.2.3)"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
## rmarkdown    "shiny (>= 0.11), tufte, testthat, digest, dygraphs, tibble,\nfs, pkgdown, callr (>= 2.0.0)"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
## roxygen2     "covr, devtools, rmarkdown, testthat (>= 2.1.0), R.methodsS3,\nR.oo"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
## rprojroot    "testthat, mockr, knitr, withr, rmarkdown"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
## rstudioapi   "testthat, knitr, rmarkdown, clipr"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
## rversions    "mockery, testthat"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
## rvest        "covr, knitr, png, rmarkdown, spelling, stringi (>= 0.3.1),\ntestthat"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
## scales       "bit64, covr, dichromat, hms, testthat (>= 2.1.0), ggplot2"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
## selectr      "testthat, XML, xml2"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
## sessioninfo  "callr, covr, mockery, testthat"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## stringi      NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
## stringr      "covr, htmltools, htmlwidgets, knitr, rmarkdown, testthat"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
## sys          "unix (>= 1.4), spelling, testthat"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
## testthat     "covr, curl (>= 0.9.5), devtools, knitr, rmarkdown, usethis,\nvctrs (>= 0.1.0), xml2"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
## tibble       "bench, bit64, blob, covr, dplyr, evaluate, hms, htmltools,\nimport, knitr, mockr, nycflights13, purrr, rmarkdown, testthat\n(>= 2.1.0), tidyr, withr"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
## tidyr        "covr, jsonlite, knitr, repurrrsive (>= 1.0.0), rmarkdown,\nreadr, testthat (>= 2.1.0)"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
## tidyselect   "covr, crayon, dplyr, knitr, magrittr, rmarkdown, testthat (>=\n2.3.0), tibble (>= 2.1.3), withr"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
## tidyverse    "covr, feather, glue, knitr, rmarkdown, testthat"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
## tinytex      "testit, rstudioapi"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
## usethis      "covr, knitr, magick, pkgdown (>= 1.1.0), rmarkdown, roxygen2,\nspelling (>= 1.2), styler (>= 1.0.2), testthat (>= 2.1.0)"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
## utf8         "knitr, rmarkdown, testthat"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
## vctrs        "bit64, covr, crayon, generics, knitr, pillar (>= 1.4.1),\npkgdown, rmarkdown, testthat (>= 2.3.0), tibble, xml2, zeallot"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
## viridisLite  "hexbin (>= 1.27.0), ggplot2 (>= 1.0.1), testthat, covr"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
## whisker      "markdown"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
## withr        "testthat, covr, lattice, DBI, RSQLite, methods, knitr,\nrmarkdown"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
## writexl      "spelling, readxl, nycflights13, testthat, bit64"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
## xfun         "testit, parallel, rstudioapi, tinytex, mime, markdown, knitr,\nhtmltools, base64enc, remotes, rmarkdown"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
## xml2         "covr, curl, httr, knitr, magrittr, mockery, rmarkdown,\ntestthat (>= 2.1.0)"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
## xopen        "ps, testthat"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
## yaml         "RUnit"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
## base         "methods"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
## boot         "MASS, survival"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## class        NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
## cluster      "MASS, Matrix"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
## codetools    NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
## compiler     NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
## datasets     NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
## foreign      NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
## graphics     NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
## grDevices    "KernSmooth"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
## grid         "lattice"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
## KernSmooth   "MASS"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
## lattice      "KernSmooth, MASS, latticeExtra"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## MASS         "lattice, nlme, nnet, survival"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
## Matrix       "expm, MASS"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
## methods      "codetools"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
## mgcv         "parallel, survival, MASS"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
## nlme         "Hmisc, MASS"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
## nnet         "MASS"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
## parallel     "methods"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
## rpart        "survival"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
## spatial      "MASS"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
## splines      "Matrix, methods"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
## stats        "MASS, Matrix, SuppDists, methods, stats4"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
## stats4       NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
## survival     NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
## tcltk        NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
## tools        "codetools, methods, xml2, curl, commonmark"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
## utils        "methods, xml2, commonmark"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
##              Enhances                                                  
## alluvial     NA                                                        
## askpass      NA                                                        
## assertthat   NA                                                        
## backports    NA                                                        
## base64enc    "png"                                                     
## BH           NA                                                        
## bookdown     NA                                                        
## brew         NA                                                        
## broom        NA                                                        
## callr        NA                                                        
## cellranger   NA                                                        
## cli          NA                                                        
## clipr        NA                                                        
## clisymbols   NA                                                        
## colorspace   NA                                                        
## commonmark   NA                                                        
## covr         NA                                                        
## crayon       NA                                                        
## crosstalk    NA                                                        
## curl         NA                                                        
## DBI          NA                                                        
## dbplyr       NA                                                        
## desc         NA                                                        
## devtools     NA                                                        
## digest       NA                                                        
## dplyr        NA                                                        
## DT           NA                                                        
## ellipsis     NA                                                        
## evaluate     NA                                                        
## fansi        NA                                                        
## farver       NA                                                        
## forcats      NA                                                        
## fs           NA                                                        
## generics     NA                                                        
## ggalluvial   NA                                                        
## ggplot2      "sp"                                                      
## gh           NA                                                        
## git2r        NA                                                        
## glue         NA                                                        
## gtable       NA                                                        
## haven        NA                                                        
## highr        NA                                                        
## hms          NA                                                        
## htmltools    "knitr"                                                   
## htmlwidgets  "shiny (>= 1.1)"                                          
## httr         NA                                                        
## ini          NA                                                        
## isoband      NA                                                        
## jsonlite     NA                                                        
## knitr        NA                                                        
## labeling     NA                                                        
## later        NA                                                        
## lazyeval     NA                                                        
## lifecycle    NA                                                        
## lubridate    "chron, fts, timeSeries, timeDate, tis, tseries, xts, zoo"
## magrittr     NA                                                        
## markdown     NA                                                        
## memoise      NA                                                        
## mime         NA                                                        
## modelr       NA                                                        
## munsell      NA                                                        
## openssl      NA                                                        
## pillar       NA                                                        
## pkgbuild     NA                                                        
## pkgconfig    NA                                                        
## pkgload      NA                                                        
## plogr        NA                                                        
## plyr         NA                                                        
## praise       NA                                                        
## prettyunits  NA                                                        
## processx     NA                                                        
## progress     NA                                                        
## promises     NA                                                        
## ps           NA                                                        
## purrr        NA                                                        
## R6           NA                                                        
## rcmdcheck    NA                                                        
## RColorBrewer NA                                                        
## Rcpp         NA                                                        
## readr        NA                                                        
## readxl       NA                                                        
## rematch      NA                                                        
## remotes      NA                                                        
## reprex       NA                                                        
## reshape2     NA                                                        
## rex          NA                                                        
## rlang        NA                                                        
## rmarkdown    NA                                                        
## roxygen2     NA                                                        
## rprojroot    NA                                                        
## rstudioapi   NA                                                        
## rversions    NA                                                        
## rvest        NA                                                        
## scales       NA                                                        
## selectr      NA                                                        
## sessioninfo  NA                                                        
## stringi      NA                                                        
## stringr      NA                                                        
## sys          NA                                                        
## testthat     NA                                                        
## tibble       NA                                                        
## tidyr        NA                                                        
## tidyselect   NA                                                        
## tidyverse    NA                                                        
## tinytex      NA                                                        
## usethis      NA                                                        
## utf8         NA                                                        
## vctrs        NA                                                        
## viridisLite  NA                                                        
## whisker      NA                                                        
## withr        NA                                                        
## writexl      NA                                                        
## xfun         NA                                                        
## xml2         NA                                                        
## xopen        NA                                                        
## yaml         NA                                                        
## base         NA                                                        
## boot         NA                                                        
## class        NA                                                        
## cluster      NA                                                        
## codetools    NA                                                        
## compiler     NA                                                        
## datasets     NA                                                        
## foreign      NA                                                        
## graphics     NA                                                        
## grDevices    NA                                                        
## grid         NA                                                        
## KernSmooth   NA                                                        
## lattice      "chron"                                                   
## MASS         NA                                                        
## Matrix       "MatrixModels, graph, SparseM, sfsmisc"                   
## methods      NA                                                        
## mgcv         NA                                                        
## nlme         NA                                                        
## nnet         NA                                                        
## parallel     "snow, nws, Rmpi"                                         
## rpart        NA                                                        
## spatial      NA                                                        
## splines      NA                                                        
## stats        NA                                                        
## stats4       NA                                                        
## survival     NA                                                        
## tcltk        NA                                                        
## tools        NA                                                        
## utils        NA                                                        
##              License                                  License_is_FOSS
## alluvial     "MIT + file LICENSE"                     NA             
## askpass      "MIT + file LICENSE"                     NA             
## assertthat   "GPL-3"                                  NA             
## backports    "GPL-2 | GPL-3"                          NA             
## base64enc    "GPL-2 | GPL-3"                          NA             
## BH           "BSL-1.0"                                NA             
## bookdown     "GPL-3"                                  NA             
## brew         "GPL-2"                                  NA             
## broom        "MIT + file LICENSE"                     NA             
## callr        "MIT + file LICENSE"                     NA             
## cellranger   "MIT + file LICENSE"                     NA             
## cli          "MIT + file LICENSE"                     NA             
## clipr        "GPL-3"                                  NA             
## clisymbols   "MIT + file LICENSE"                     NA             
## colorspace   "BSD_3_clause + file LICENSE"            NA             
## commonmark   "BSD_2_clause + file LICENSE"            NA             
## covr         "GPL-3"                                  NA             
## crayon       "MIT + file LICENSE"                     NA             
## crosstalk    "MIT + file LICENSE"                     NA             
## curl         "MIT + file LICENSE"                     NA             
## DBI          "LGPL (>= 2.1)"                          NA             
## dbplyr       "MIT + file LICENSE"                     NA             
## desc         "MIT + file LICENSE"                     NA             
## devtools     "GPL (>= 2)"                             NA             
## digest       "GPL (>= 2)"                             NA             
## dplyr        "MIT + file LICENSE"                     NA             
## DT           "GPL-3 | file LICENSE"                   NA             
## ellipsis     "GPL-3"                                  NA             
## evaluate     "MIT + file LICENSE"                     NA             
## fansi        "GPL (>= 2)"                             NA             
## farver       "MIT + file LICENSE"                     NA             
## forcats      "GPL-3"                                  NA             
## fs           "GPL-3"                                  NA             
## generics     "GPL-2"                                  NA             
## ggalluvial   "GPL-3"                                  NA             
## ggplot2      "GPL-2 | file LICENSE"                   NA             
## gh           "MIT + file LICENSE"                     NA             
## git2r        "GPL-2"                                  NA             
## glue         "MIT + file LICENSE"                     NA             
## gtable       "GPL-2"                                  NA             
## haven        "MIT + file LICENSE"                     NA             
## highr        "GPL"                                    NA             
## hms          "GPL-3"                                  NA             
## htmltools    "GPL (>= 2)"                             NA             
## htmlwidgets  "MIT + file LICENSE"                     NA             
## httr         "MIT + file LICENSE"                     NA             
## ini          "GPL-3"                                  NA             
## isoband      "MIT + file LICENSE"                     NA             
## jsonlite     "MIT + file LICENSE"                     NA             
## knitr        "GPL"                                    NA             
## labeling     "MIT + file LICENSE | Unlimited"         NA             
## later        "GPL (>= 2)"                             NA             
## lazyeval     "GPL-3"                                  NA             
## lifecycle    "GPL-3"                                  NA             
## lubridate    "GPL (>= 2)"                             NA             
## magrittr     "MIT + file LICENSE"                     NA             
## markdown     "GPL-2"                                  NA             
## memoise      "MIT + file LICENSE"                     NA             
## mime         "GPL"                                    NA             
## modelr       "GPL-3"                                  NA             
## munsell      "MIT + file LICENSE"                     NA             
## openssl      "MIT + file LICENSE"                     NA             
## pillar       "GPL-3"                                  NA             
## pkgbuild     "GPL-3"                                  NA             
## pkgconfig    "MIT + file LICENSE"                     NA             
## pkgload      "GPL-3"                                  NA             
## plogr        "MIT + file LICENSE"                     NA             
## plyr         "MIT + file LICENSE"                     NA             
## praise       "MIT + file LICENSE"                     NA             
## prettyunits  "MIT + file LICENSE"                     NA             
## processx     "MIT + file LICENSE"                     NA             
## progress     "MIT + file LICENSE"                     NA             
## promises     "MIT + file LICENSE"                     NA             
## ps           "BSD_3_clause + file LICENSE"            NA             
## purrr        "GPL-3 | file LICENSE"                   NA             
## R6           "MIT + file LICENSE"                     NA             
## rcmdcheck    "MIT + file LICENSE"                     NA             
## RColorBrewer "Apache License 2.0"                     NA             
## Rcpp         "GPL (>= 2)"                             NA             
## readr        "GPL (>= 2) | file LICENSE"              NA             
## readxl       "GPL-3"                                  NA             
## rematch      "MIT + file LICENSE"                     NA             
## remotes      "GPL (>= 2)"                             NA             
## reprex       "MIT + file LICENSE"                     NA             
## reshape2     "MIT + file LICENSE"                     NA             
## rex          "MIT + file LICENSE"                     NA             
## rlang        "GPL-3"                                  NA             
## rmarkdown    "GPL-3"                                  NA             
## roxygen2     "GPL (>= 2)"                             NA             
## rprojroot    "GPL-3"                                  NA             
## rstudioapi   "MIT + file LICENSE"                     NA             
## rversions    "MIT + file LICENSE"                     NA             
## rvest        "GPL-3"                                  NA             
## scales       "MIT + file LICENSE"                     NA             
## selectr      "BSD_3_clause + file LICENCE"            NA             
## sessioninfo  "GPL-2"                                  NA             
## stringi      "file LICENSE"                           "yes"          
## stringr      "GPL-2 | file LICENSE"                   NA             
## sys          "MIT + file LICENSE"                     NA             
## testthat     "MIT + file LICENSE"                     NA             
## tibble       "MIT + file LICENSE"                     NA             
## tidyr        "MIT + file LICENSE"                     NA             
## tidyselect   "GPL-3"                                  NA             
## tidyverse    "GPL-3 | file LICENSE"                   NA             
## tinytex      "MIT + file LICENSE"                     NA             
## usethis      "GPL-3"                                  NA             
## utf8         "Apache License (== 2.0) | file LICENSE" NA             
## vctrs        "GPL-3"                                  NA             
## viridisLite  "MIT + file LICENSE"                     NA             
## whisker      "GPL-3"                                  NA             
## withr        "GPL (>= 2)"                             NA             
## writexl      "BSD_2_clause + file LICENSE"            NA             
## xfun         "MIT + file LICENSE"                     NA             
## xml2         "GPL (>= 2)"                             NA             
## xopen        "MIT + file LICENSE"                     NA             
## yaml         "BSD_3_clause + file LICENSE"            NA             
## base         "Part of R 3.6.0"                        NA             
## boot         "Unlimited"                              NA             
## class        "GPL-2 | GPL-3"                          NA             
## cluster      "GPL (>= 2)"                             NA             
## codetools    "GPL"                                    NA             
## compiler     "Part of R 3.6.0"                        NA             
## datasets     "Part of R 3.6.0"                        NA             
## foreign      "GPL (>= 2)"                             NA             
## graphics     "Part of R 3.6.0"                        NA             
## grDevices    "Part of R 3.6.0"                        NA             
## grid         "Part of R 3.6.0"                        NA             
## KernSmooth   "Unlimited"                              NA             
## lattice      "GPL (>= 2)"                             NA             
## MASS         "GPL-2 | GPL-3"                          NA             
## Matrix       "GPL (>= 2) | file LICENCE"              NA             
## methods      "Part of R 3.6.0"                        NA             
## mgcv         "GPL (>= 2)"                             NA             
## nlme         "GPL (>= 2) | file LICENCE"              NA             
## nnet         "GPL-2 | GPL-3"                          NA             
## parallel     "Part of R 3.6.0"                        NA             
## rpart        "GPL-2 | GPL-3"                          NA             
## spatial      "GPL-2 | GPL-3"                          NA             
## splines      "Part of R 3.6.0"                        NA             
## stats        "Part of R 3.6.0"                        NA             
## stats4       "Part of R 3.6.0"                        NA             
## survival     "LGPL (>= 2)"                            NA             
## tcltk        "Part of R 3.6.0"                        NA             
## tools        "Part of R 3.6.0"                        NA             
## utils        "Part of R 3.6.0"                        NA             
##              License_restricts_use OS_type MD5sum NeedsCompilation Built  
## alluvial     NA                    NA      NA     "no"             "3.6.0"
## askpass      NA                    NA      NA     "yes"            "3.6.0"
## assertthat   NA                    NA      NA     "no"             "3.6.0"
## backports    NA                    NA      NA     "yes"            "3.6.0"
## base64enc    NA                    NA      NA     "yes"            "3.6.0"
## BH           NA                    NA      NA     "no"             "3.6.0"
## bookdown     NA                    NA      NA     "no"             "3.6.0"
## brew         NA                    NA      NA     NA               "3.6.0"
## broom        NA                    NA      NA     "no"             "3.6.0"
## callr        NA                    NA      NA     "no"             "3.6.0"
## cellranger   NA                    NA      NA     "no"             "3.6.0"
## cli          NA                    NA      NA     "no"             "3.6.0"
## clipr        NA                    NA      NA     "no"             "3.6.0"
## clisymbols   NA                    NA      NA     "no"             "3.6.0"
## colorspace   NA                    NA      NA     "yes"            "3.6.0"
## commonmark   NA                    NA      NA     "yes"            "3.6.0"
## covr         NA                    NA      NA     "yes"            "3.6.0"
## crayon       NA                    NA      NA     "no"             "3.6.0"
## crosstalk    NA                    NA      NA     "no"             "3.6.0"
## curl         NA                    NA      NA     "yes"            "3.6.0"
## DBI          NA                    NA      NA     "no"             "3.6.0"
## dbplyr       NA                    NA      NA     "no"             "3.6.0"
## desc         NA                    NA      NA     "no"             "3.6.0"
## devtools     NA                    NA      NA     "no"             "3.6.0"
## digest       NA                    NA      NA     "yes"            "3.6.0"
## dplyr        NA                    NA      NA     "yes"            "3.6.0"
## DT           NA                    NA      NA     "no"             "3.6.0"
## ellipsis     NA                    NA      NA     "yes"            "3.6.0"
## evaluate     NA                    NA      NA     "no"             "3.6.0"
## fansi        NA                    NA      NA     "yes"            "3.6.0"
## farver       NA                    NA      NA     "yes"            "3.6.0"
## forcats      NA                    NA      NA     "no"             "3.6.0"
## fs           NA                    NA      NA     "yes"            "3.6.0"
## generics     NA                    NA      NA     "no"             "3.6.0"
## ggalluvial   NA                    NA      NA     "no"             "3.6.0"
## ggplot2      NA                    NA      NA     "no"             "3.6.0"
## gh           NA                    NA      NA     "no"             "3.6.0"
## git2r        NA                    NA      NA     "yes"            "3.6.0"
## glue         NA                    NA      NA     "yes"            "3.6.0"
## gtable       NA                    NA      NA     "no"             "3.6.0"
## haven        NA                    NA      NA     "yes"            "3.6.0"
## highr        NA                    NA      NA     "no"             "3.6.0"
## hms          NA                    NA      NA     "no"             "3.6.0"
## htmltools    NA                    NA      NA     "yes"            "3.6.0"
## htmlwidgets  NA                    NA      NA     "no"             "3.6.0"
## httr         NA                    NA      NA     "no"             "3.6.0"
## ini          NA                    NA      NA     "no"             "3.6.0"
## isoband      NA                    NA      NA     "yes"            "3.6.0"
## jsonlite     NA                    NA      NA     "yes"            "3.6.0"
## knitr        NA                    NA      NA     "no"             "3.6.0"
## labeling     NA                    NA      NA     "no"             "3.6.0"
## later        NA                    NA      NA     "yes"            "3.6.0"
## lazyeval     NA                    NA      NA     "yes"            "3.6.0"
## lifecycle    NA                    NA      NA     "no"             "3.6.0"
## lubridate    NA                    NA      NA     "yes"            "3.6.0"
## magrittr     NA                    NA      NA     "no"             "3.6.0"
## markdown     NA                    NA      NA     "yes"            "3.6.0"
## memoise      NA                    NA      NA     "no"             "3.6.0"
## mime         NA                    NA      NA     "yes"            "3.6.0"
## modelr       NA                    NA      NA     "no"             "3.6.0"
## munsell      NA                    NA      NA     "no"             "3.6.0"
## openssl      NA                    NA      NA     "yes"            "3.6.0"
## pillar       NA                    NA      NA     "no"             "3.6.0"
## pkgbuild     NA                    NA      NA     "no"             "3.6.0"
## pkgconfig    NA                    NA      NA     "no"             "3.6.0"
## pkgload      NA                    NA      NA     "yes"            "3.6.0"
## plogr        NA                    NA      NA     "no"             "3.6.0"
## plyr         NA                    NA      NA     "yes"            "3.6.0"
## praise       NA                    NA      NA     "no"             "3.6.0"
## prettyunits  NA                    NA      NA     "no"             "3.6.0"
## processx     NA                    NA      NA     "yes"            "3.6.0"
## progress     NA                    NA      NA     "no"             "3.6.0"
## promises     NA                    NA      NA     "yes"            "3.6.0"
## ps           NA                    NA      NA     "yes"            "3.6.0"
## purrr        NA                    NA      NA     "yes"            "3.6.0"
## R6           NA                    NA      NA     "no"             "3.6.0"
## rcmdcheck    NA                    NA      NA     "no"             "3.6.0"
## RColorBrewer NA                    NA      NA     "no"             "3.6.0"
## Rcpp         NA                    NA      NA     "yes"            "3.6.0"
## readr        NA                    NA      NA     "yes"            "3.6.0"
## readxl       NA                    NA      NA     "yes"            "3.6.0"
## rematch      NA                    NA      NA     "no"             "3.6.0"
## remotes      NA                    NA      NA     "no"             "3.6.0"
## reprex       NA                    NA      NA     "no"             "3.6.0"
## reshape2     NA                    NA      NA     "yes"            "3.6.0"
## rex          NA                    NA      NA     "no"             "3.6.0"
## rlang        NA                    NA      NA     "yes"            "3.6.0"
## rmarkdown    NA                    NA      NA     "no"             "3.6.0"
## roxygen2     NA                    NA      NA     "yes"            "3.6.0"
## rprojroot    NA                    NA      NA     "no"             "3.6.0"
## rstudioapi   NA                    NA      NA     "no"             "3.6.0"
## rversions    NA                    NA      NA     "no"             "3.6.0"
## rvest        NA                    NA      NA     "no"             "3.6.0"
## scales       NA                    NA      NA     "no"             "3.6.0"
## selectr      NA                    NA      NA     "no"             "3.6.0"
## sessioninfo  NA                    NA      NA     "no"             "3.6.0"
## stringi      NA                    NA      NA     "yes"            "3.6.0"
## stringr      NA                    NA      NA     "no"             "3.6.0"
## sys          NA                    NA      NA     "yes"            "3.6.0"
## testthat     NA                    NA      NA     "yes"            "3.6.0"
## tibble       NA                    NA      NA     "yes"            "3.6.0"
## tidyr        NA                    NA      NA     "yes"            "3.6.0"
## tidyselect   NA                    NA      NA     "yes"            "3.6.0"
## tidyverse    NA                    NA      NA     "no"             "3.6.0"
## tinytex      NA                    NA      NA     "no"             "3.6.0"
## usethis      NA                    NA      NA     "no"             "3.6.0"
## utf8         NA                    NA      NA     "yes"            "3.6.0"
## vctrs        NA                    NA      NA     "yes"            "3.6.0"
## viridisLite  NA                    NA      NA     "no"             "3.6.0"
## whisker      NA                    NA      NA     "no"             "3.6.0"
## withr        NA                    NA      NA     "no"             "3.6.0"
## writexl      NA                    NA      NA     "yes"            "3.6.0"
## xfun         NA                    NA      NA     "no"             "3.6.0"
## xml2         NA                    NA      NA     "yes"            "3.6.0"
## xopen        NA                    NA      NA     "no"             "3.6.0"
## yaml         NA                    NA      NA     "yes"            "3.6.0"
## base         NA                    NA      NA     NA               "3.6.0"
## boot         NA                    NA      NA     "no"             "3.6.0"
## class        NA                    NA      NA     "yes"            "3.6.0"
## cluster      NA                    NA      NA     "yes"            "3.6.0"
## codetools    NA                    NA      NA     "no"             "3.6.0"
## compiler     NA                    NA      NA     NA               "3.6.0"
## datasets     NA                    NA      NA     NA               "3.6.0"
## foreign      NA                    NA      NA     "yes"            "3.6.0"
## graphics     NA                    NA      NA     "yes"            "3.6.0"
## grDevices    NA                    NA      NA     "yes"            "3.6.0"
## grid         NA                    NA      NA     "yes"            "3.6.0"
## KernSmooth   NA                    NA      NA     "yes"            "3.6.0"
## lattice      NA                    NA      NA     "yes"            "3.6.0"
## MASS         NA                    NA      NA     "yes"            "3.6.0"
## Matrix       NA                    NA      NA     "yes"            "3.6.0"
## methods      NA                    NA      NA     "yes"            "3.6.0"
## mgcv         NA                    NA      NA     "yes"            "3.6.0"
## nlme         NA                    NA      NA     "yes"            "3.6.0"
## nnet         NA                    NA      NA     "yes"            "3.6.0"
## parallel     NA                    NA      NA     "yes"            "3.6.0"
## rpart        NA                    NA      NA     "yes"            "3.6.0"
## spatial      NA                    NA      NA     "yes"            "3.6.0"
## splines      NA                    NA      NA     "yes"            "3.6.0"
## stats        NA                    NA      NA     "yes"            "3.6.0"
## stats4       NA                    NA      NA     NA               "3.6.0"
## survival     NA                    NA      NA     "yes"            "3.6.0"
## tcltk        NA                    NA      NA     "yes"            "3.6.0"
## tools        NA                    NA      NA     "yes"            "3.6.0"
## utils        NA                    NA      NA     "yes"            "3.6.0"
```



<!--chapter:end:index.Rmd-->

---
title: "Introduccion"
author: "Salvador Garcia"
output:   
  html_document:
    toc: true
    theme: united
    toc_depth: 1

---

# Estructura de datos de R

## Ayuda y vignettes

1. Cada función de la paquetería instalada desde el CRAN contiene una sección de ayuda, donde se brinda la descripción de la función, los argumentos de entrada y salida y ejemplos de uso. Con el código: `help(nombre_función)` se accede a esta ayuda. 

2. Algunos paquetes contienen viñetas o **vignettes** que es una documentación más detallada del paquete. Para acceder a estas viñetas se utiliza el código: `vignette("nombre_paquete")`

3. Si se requiere información rápida de visualización, desarrollo de paquetes, conceptos básicos y avanzados de R, markdown, shiny, etc, los [Cheat sheets de RStudio](https://www.rstudio.com/resources/cheatsheets/) son una fuente fácil y rápida.

4. Si se requiere mayor documentación acerca de R, estos libros son muy útiles:

  + [R for data science](http://r4ds.had.co.nz/). Contiene documentación de la paquetería del tidyverse e información útil para manejo de datos.
  
  + [ggplot2: elegant graphics for data analysis](http://hadley.nz/). Contiene documentación de ggplot, una librería basada en el *grammar of graphics* para visualización 
  
  + [Advanced R](http://adv-r.had.co.nz/). contiene información a detalle de como funciona R.
  
  + [R packages](http://r-pkgs.had.co.nz/): contiene información que permite la creación y publicación de paquetes en R.


## Namespaces
Como el nombre lo sugiere, un *namespace* es un espacio de nombres para las funciones. En la situación óptima, cada desarrollador de paquete no debería definir nombres de funciones ya existentes, pero en la realidad es que hay paquetes que tienen funciones que se llama de la misma manera que funciones de otros paquetes (y como no hacerlo, ¡si hay más de 10,000 paquetes en el CRAN!) Ahora, ¿Cómo sabrá R a que función estamos haciendo referencia?

Para esto, es muy util saber el namespace de cada paquete. Por ejemplo, una función llamada summarize se encuentra en los paquetes Hmisc y plyr (y tiene distinta funcionalidad cada función), y si están cargados los dos, ¿Cómo hacemos referencia a cada una de estas funciones? Con el namespace:



```r
# Hacer referencia a la funcion summarize() del paquete Hmisc
Hmisc::summarize()
# Hacer referencia a la funcion summarize() del paquete plyr
plyr::summarize()
```

## Paquetería útil para el análisis de datos
Gran parte del poder de R proviene de los paquetes que se pueden instalar desde el CRAN. De los paquetes más útiles para analizar datos son los siguientes:

Importar datos       |  Tratar datos    | Desarrollo de paquetes
---------------------------  | --------------------------- | ---------------------------
**ggplot2**: visualizar datos | **readr**: importar .csv y fwf | **devtools** desarrollo de paquetes
**dplyr**: manipular datos | **readxl**: importar .xlsx y .xls | **roxygen2** desarrollo de documentación
**tidyr**: ordenar datos | **haven**: importar SAP, SPSS y Stata | **testthat** para pruebas unitarias
**stringr**: trabajar con texto | **httr**: comunicarse con APIs web | 
**lubridate**: trabajar con fechas | **rvest**: scrapping websites | 


## Estructuras de datos en R

En R, al igual que otros lenguajes de programación, hay distintos tipos de estructuras de datos. Las estructuras de datos básicas en R pueden ser organizadas de acuerdo a la dimensionalidad (1d, 2d, nd) y si contienen datos homogéneos o heterogéneos (Es importante destacar que R no tiene datos de 0-dimensional (escalares). Los que parecen ser escalares son de hecho vectores de longitud uno).

Dim  | Homogeneo     | Heterogeneo
-------- | --------------------------  | --------------------------
1d           | vector atómico | lista
2d       | matriz | Data Frame
nd       | array

Datos homogéneos:

### Vectores atómicos

Son estructuras de datos homogéneas de una dimensión. Hay cuatro tipos de vectores básicos: lógicos, entero, numéricos y de caracteres.

Operaciones:

1. **Creación**: Son creados con la expresión **`c()`**

2. **Selección de elementos**: Se realiza con **`[ ]`**, indicando el índice dentro de los corchetes (es posible extraer un valor 3. indexando con números negativos)

4. **Agregar nuevo valor**: Se asigna un nuevo valor en el índice asignado.

5. **Cambiar un valor**: Se asigna el nuevo valor sobre un índice ya existente.

6. **Buscar un valor**: Usando la función **`match(vector, valor_buscado)`** se obtiene un vector lógico indicando si la posición es el valor buscado.

7. **Operaciones aritméticas**: suma, multiplicación

Algunas funciones comunes sobre vectores:

* `length`: número de elementos en el vector

* `class`: clase del vector

* `summary`: resumen de información del vector

* `unique`: valores únicos del vector

* `table`: tabla de frecuencias para cada elemento del vector

* `sum`: suma de los elementos del vector

* `mean`: promedio de elementos del vector

* `sd`: desviación estándar de los elementos del vector

* `cumsum`: suma acumulada de elemento anterior del vector

### Matrices y arrays.

Son estructuras de datos con más de una dimensión. Al igual que el vector, solamente puede contener un tipo de datos en específico. Al tener dos dimensiones, para acceder a un elemento se tiene que indexar sobre los renglones y las columnas. 

Operaciones:

1. **Creación**: Son creados con la expresión **`matrix()`**

2. **Selección de elementos**: Se realiza con **`[ , ]`**, indicando el índice de los renglones y las columnas dentro de los corchetes (es posible extraer un valor indexando con números negativos)

3. **Agregar nuevo valor**: Se asigna un nuevo valor en los índice asignados.

4. **Cambiar un valor**: Se asigna el nuevo valor sobre un índices ya existente.

5. **Buscar un valor**: Usando la función **`match(matriz, valor_buscado)`** se obtiene un vector numérico indicando si la posición es el valor buscado.

6. **Operaciones aritméticas**: suma, multiplicación

Algunas funciones comunes sobre matrices:

* `dim`: dimensión de una matriz 

* `nrow`: número de renglones de la matriz

* `rownames`: devuelve el nombre de los renglones

* `rbind`: une los renglones de dos matrices del mismo tipo con el mismo número de columnas

* `ncol`: número de columnas de la matriz

* `colnames`: devuelve el nombre de las columnas

* `cbind`: une las columnas de dos matrices del mismo tipo con el mismo número de renglones

* `t`: para obtener la matriz transpuesta

* `diag`: depende del argumento,

    - Si se da un vector como argumento, regresa una matriz diagonal con los elementos del 
      vector como las entradas de la diagonal.
      
    - Si se da una matriz como argumento, regresa un vector que contiene
      los elementos de la diagonal de la matriz. 
      
    - Si se da un valor numérico, regresa la matriz 
      identidad multiplicada por dicho valor. 

### Listas.
Una lista puede contener elementos de distinto tipo. Por ejemplo, un elemento puede ser numérico, otro puede ser una cadena de texto y otro un elemento booleano. Inclusive, un elemento de una lista puede ser otra lista.

Operaciones:

1. **Creación**: Son creados con la expresión **`list()`**

2. **Selección de elementos**: Se realiza con **`[[ ]]`**, indicando el índice dentro de los corchetes (**NO** es posible extraer un valor indexando con números negativos)

3. **Agregar nuevo valor**: Se asigna un nuevo valor en el índice asignado y usando **`[[ ]]`**.

4. **Cambiar un valor**: Se asigna el nuevo valor sobre un indice ya existente y usando **`[[ ]]`**.

5. **Buscar un valor**: Usando la función **`match(vector, valor_buscado)`** se obtiene un vector lógico indicando si la posición es el valor buscado.

Algunas funciones comunes sobre listas:

* `length`: número de elementos en la lista

* `class`: devuelve la clase lista

* `unique`: valores únicos del vector

* `unlist`: vuelve un vector la lista. (tener cuidado por que cambia el formato de los datos)

### Data.frames

Un **data.frame** es un conjunto de vectores del mismo tamaño agrupados en una tabla. Son estructuras rectangulares donde cada columna tiene elementos de la misma clase, pero entre columnas pueden tener diferentes clases.


Operaciones:
1. **Creación**: Son creados con la expresión **`data.frame()`**

2. **Selección de elementos**: Se puede seleccionar una columna entera con el símbolo **`$`** y el nombre de la columna: **`dataframe$variable_nombre`**, se puede seleccionar un elemento en particular al igual que una matriz.

3. **Agregar una nueva columna**: Se puede asignar una nuevo vector del mismo tamaño como una columna nueva.
**`dataframe$variable_nombra =  vector_nuevo`**

Algunas funciones comunes sobre data frames:

* `dim`: dimensión de una data.frame 

* `nrow`: número de renglones de un data.frame

* `rownames`: devuelve el nombre de los renglones

* `rbind`: une los renglones de dos data.frames del mismo tipo con el mismo número de columas

* `ncol`: número de columnas de un data.frame

* `colnames`: devuelve el nombre de las columnas

* `cbind`: une las columnas de dos data.frames del mismo tipo con el mismo número de renglones

* `summary`: se obtiene el resumen de los datos.

## Funciones, condicionales e iteraciones:
Al igual que en otros lenguajes de programación, existen 

### Funciones

Una función en R es muy parecido a una función común. Recibe unos parámetros de entrada, los cuales usa para arrojar otros de salida. Los objetos creados dentro de la función son *locales*, es decir, solamente existen dentro del *scope* de la función. Si se quiere exportar algún valor, o lista se tiene que mencionar explicitamente. (Por default, las funciones en R devuelven la última linea del código siempre y cuando no sea una asignación). La sintaxis es la siguiente:


```r
 mi_funcion <- function(valor){
   valor_exportado <- 5
   valor_no_exportado <- valor
   valor_exportado
 }
 mi_funcion(10)
```

```
## [1] 5
```

### Condicionales

Otra estructura muy explotada en los lenguajes de programación son los condicionales. Los principales en R son `dplyr::if_else` y `dplyr::case_when`. El primero evalua si una expresión es verdadera o falsa y da distinto resultado en caso de ser verdadero y uno en caso de ser falso. El segundo vectoriza multiples condicionales `if`. Por ejemplo:




```r
library(dplyr)
```


```r
x <- c(-5:5, NA)
if_else(x < 0, NA_integer_, x)
```

```
##  [1] NA NA NA NA NA  0  1  2  3  4  5 NA
```

```r
if_else(x < 0, "negativo", "positivo", "faltante")
```

```
##  [1] "negativo" "negativo" "negativo" "negativo" "negativo" "positivo"
##  [7] "positivo" "positivo" "positivo" "positivo" "positivo" "faltante"
```


```r
edad <- 1:10
case_when(
  edad > 35 ~ "adulto",
  edad > 20 ~ "adulto joven",
  edad > 10 ~ "adolescente",
  TRUE ~ "niño"
)
```

```
##  [1] "niño" "niño" "niño" "niño" "niño" "niño" "niño" "niño" "niño" "niño"
```


### Iteraciones

Las iteraciones en cualquier lenguaje de programación son básicamente replicar un código múltiples veces con el mismo o distintos argumentos. En R los más básicos son los ciclos `for`, `while` y `repeat`:
![](figures/chapter3/3-for.png)
Como se observa en la imagen, el ciclo **for** se ejecuta n veces con n conocido (o bien, sobre un vector ya conocido). Por otra parte, un ciclo **while** se ejecuta mientras una condición se cumpla, por lo que teóricamente puede seguir iterando mientras no se cumpla dicha condición. Finalmente, en el ciclo **repeat** se repite el código hasta que explicitamente se salga del código con un comando llamado **break**. Los dos comandos faltantes son **next** y **break**. El primero sirve para terminal la iteración actual y continuar con la siguiente, mientras que el segundo sirve para salir por completo del ciclo.


```r
# ejemplos de for:
for (numero in 1:3){
  print(paste("El número es", numero))
}
```

```
## [1] "El número es 1"
## [1] "El número es 2"
## [1] "El número es 3"
```

```r
for (anio in c(2015,2016,2017,2018)){
  print(paste("El año es", anio))
}
```

```
## [1] "El año es 2015"
## [1] "El año es 2016"
## [1] "El año es 2017"
## [1] "El año es 2018"
```

```r
# ejemplo de while
i <- 1
while (i < 6) {
  print(i)
  i = i+1
}
```

```
## [1] 1
## [1] 2
## [1] 3
## [1] 4
## [1] 5
```

```r
# ejemplo de repeat (con break)
x <- 1
repeat {
  print(x)
  x = x+1
  if (x == 6){
  break
  }
}
```

```
## [1] 1
## [1] 2
## [1] 3
## [1] 4
## [1] 5
```

```r
# ejemplo de repeat (con break y next)
x <- 1
repeat {
  if (x == 3){
    x = x+1
    next
  }
  print(x)
  x = x+1
  if (x == 6){
  break
  }
}
```

```
## [1] 1
## [1] 2
## [1] 4
## [1] 5
```

## Ejercicios de practica

### Ejercicio 3

Tipo de datos: String, double, integer, boolean
Vector Atomico: vector con elementos del mismo tipo (string, double, entero)
Matrix: vector de dos dimensiones con elementos del mismo tipo (string, double, entero)
Lista: unidimensional elementos de distinto tipo (string, double, entero)
Dataframe: multidimensional que nos permite almacenar una tabla o base de datos en R. Se compone de columnas y renglones   

Tipos de dato:

```r
soy_string <- "Hola soy una cadena de texto"
soy_double <- 5.3
soy_integer <- 5
soy_boolean <- TRUE
```

Vector atómico:

```r
soy_vector_atomico <- c(1,2,3)  
var(soy_vector_atomico)
```

```
## [1] 1
```

```r
mean(soy_vector_atomico)
```

```
## [1] 2
```

```r
length(soy_vector_atomico)
```

```
## [1] 3
```

Matriz:

```r
soy_matrix <- matrix(c(1,2,3,4), ncol = 2)
mean(matrix)
```

```
## Warning in mean.default(matrix): argument is not numeric or logical: returning
## NA
```

```
## [1] NA
```

```r
dim(matrix)
```

```
## NULL
```

Lista:

```r
soy_lista <- list(1, "texto", 1.5, 1)
length(soy_lista)
```

```
## [1] 4
```

```r
unique(soy_lista)
```

```
## [[1]]
## [1] 1
## 
## [[2]]
## [1] "texto"
## 
## [[3]]
## [1] 1.5
```


Dataframe:

```r
soy_data_frame <- data.frame(col1 = c("text1", "text2"), col2 = c(1,2))
dim(soy_data_frame)
```

```
## [1] 2 2
```

```r
colnames(soy_data_frame)
```

```
## [1] "col1" "col2"
```

```r
summary(soy_data_frame)
```

```
##     col1        col2     
##  text1:1   Min.   :1.00  
##  text2:1   1st Qu.:1.25  
##            Median :1.50  
##            Mean   :1.50  
##            3rd Qu.:1.75  
##            Max.   :2.00
```


Operaciones comunes dataframe:

```r
head(mtcars, 5) # obtiene primeros 5 registros
```

```
##                    mpg cyl disp  hp drat    wt  qsec vs am gear carb
## Mazda RX4         21.0   6  160 110 3.90 2.620 16.46  0  1    4    4
## Mazda RX4 Wag     21.0   6  160 110 3.90 2.875 17.02  0  1    4    4
## Datsun 710        22.8   4  108  93 3.85 2.320 18.61  1  1    4    1
## Hornet 4 Drive    21.4   6  258 110 3.08 3.215 19.44  1  0    3    1
## Hornet Sportabout 18.7   8  360 175 3.15 3.440 17.02  0  0    3    2
```

```r
tail(mtcars, 5) # obtiene ultimos 5 registros
```

```
##                 mpg cyl  disp  hp drat    wt qsec vs am gear carb
## Lotus Europa   30.4   4  95.1 113 3.77 1.513 16.9  1  1    5    2
## Ford Pantera L 15.8   8 351.0 264 4.22 3.170 14.5  0  1    5    4
## Ferrari Dino   19.7   6 145.0 175 3.62 2.770 15.5  0  1    5    6
## Maserati Bora  15.0   8 301.0 335 3.54 3.570 14.6  0  1    5    8
## Volvo 142E     21.4   4 121.0 109 4.11 2.780 18.6  1  1    4    2
```
  
al operador %>% (en paquete magrittr) se le conoce como pipe, sirve para pasar datos (en un substituto de anidación):

```r
install.packages("magrittr", repo="http://cran.rstudio.com/")
```

```
## Installing package into '/home/rstudio-user/R/x86_64-pc-linux-gnu-library/3.6'
## (as 'lib' is unspecified)
```


```r
library(magrittr)
tail(head(mtcars, 10), 5)
```

```
##             mpg cyl  disp  hp drat   wt  qsec vs am gear carb
## Valiant    18.1   6 225.0 105 2.76 3.46 20.22  1  0    3    1
## Duster 360 14.3   8 360.0 245 3.21 3.57 15.84  0  0    3    4
## Merc 240D  24.4   4 146.7  62 3.69 3.19 20.00  1  0    4    2
## Merc 230   22.8   4 140.8  95 3.92 3.15 22.90  1  0    4    2
## Merc 280   19.2   6 167.6 123 3.92 3.44 18.30  1  0    4    4
```

```r
mtcars %>% head(10) %>% tail(5)
```

```
##             mpg cyl  disp  hp drat   wt  qsec vs am gear carb
## Valiant    18.1   6 225.0 105 2.76 3.46 20.22  1  0    3    1
## Duster 360 14.3   8 360.0 245 3.21 3.57 15.84  0  0    3    4
## Merc 240D  24.4   4 146.7  62 3.69 3.19 20.00  1  0    4    2
## Merc 230   22.8   4 140.8  95 3.92 3.15 22.90  1  0    4    2
## Merc 280   19.2   6 167.6 123 3.92 3.44 18.30  1  0    4    4
```

```r
mtcars %>% head(5)
```

```
##                    mpg cyl disp  hp drat    wt  qsec vs am gear carb
## Mazda RX4         21.0   6  160 110 3.90 2.620 16.46  0  1    4    4
## Mazda RX4 Wag     21.0   6  160 110 3.90 2.875 17.02  0  1    4    4
## Datsun 710        22.8   4  108  93 3.85 2.320 18.61  1  1    4    1
## Hornet 4 Drive    21.4   6  258 110 3.08 3.215 19.44  1  0    3    1
## Hornet Sportabout 18.7   8  360 175 3.15 3.440 17.02  0  0    3    2
```

```r
mtcars %>% tail(5) 
```

```
##                 mpg cyl  disp  hp drat    wt qsec vs am gear carb
## Lotus Europa   30.4   4  95.1 113 3.77 1.513 16.9  1  1    5    2
## Ford Pantera L 15.8   8 351.0 264 4.22 3.170 14.5  0  1    5    4
## Ferrari Dino   19.7   6 145.0 175 3.62 2.770 15.5  0  1    5    6
## Maserati Bora  15.0   8 301.0 335 3.54 3.570 14.6  0  1    5    8
## Volvo 142E     21.4   4 121.0 109 4.11 2.780 18.6  1  1    4    2
```


<!--chapter:end:Chap01_introduction.Rmd-->

---
title: "Importar datos"
author: "Salvador Garcia"
output:   
  html_document:
    toc: true
    theme: united
    toc_depth: 1

---

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
readr::write_csv(mtcars, "mtcars.csv")
file <- readr::read_csv("mtcars.csv")
```

```
## Parsed with column specification:
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
readr::write_delim(mtcars, "mtcars.txt", delim = "\t")
file <- readr::read_delim("mtcars.txt", delim = "\t")
```

```
## Parsed with column specification:
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

writexl::write_xlsx(mtcars, "mtcars.xlsx")
file <- readxl::read_excel("mtcars.xlsx")
```

### Ejercicio 6

```r
library(haven)

haven::write_sas(mtcars, "mtcars.sas7bdat")
file <- haven::read_sas("mtcars.sas7bdat")
```

<!--chapter:end:Chap02_data_import.Rmd-->

---
title: "Intro data visualization"
author: "Salvador Garcia"
output:   
  html_document:
    toc: true
    theme: united
    toc_depth: 1

---
# Intro a visualización de datos

## Motivación

R tiene un framework para crear gráficas que (creo yo) es de los más versátiles para cosas estáticas. Este framework es llamado ggplot. Además de ese framework cuenta con otros como lattice o base, pero en general están en desuso. 


```r
library(alluvial)
library(ggalluvial)
```

```
## Loading required package: ggplot2
```

```r
library(magrittr)
data(vaccinations)
cbPalette <- c("#999999", "#E69F00", "#56B4E9", "#009E73", "#F0E442",
               "#0072B2", "#D55E00", "#CC79A7")
levels(vaccinations$response) <- rev(levels(vaccinations$response))
vaccinations %>% ggplot(
  aes(x = survey, 
      fill = response,
      stratum = response, 
      alluvium = subject,
      weight = freq)) +
  geom_flow() +
  geom_stratum(alpha = .8) +
  geom_text(stat = "stratum", infer.label = TRUE, size = 2.5) +
  theme_bw() + theme(legend.position = "none", 
                     panel.background = element_rect(fill = NA),
                     panel.grid.major.y = element_line(size = 1),
                     panel.grid.major.x = element_line(size = 0),
                     panel.grid.minor = element_line(size = 0),
                     axis.line = element_line(size = 0),
                     panel.border = element_rect(size = 0)) +
  scale_fill_manual( values = c(cbPalette, "#999999", "#999999")) +
  theme(legend.position = "none") +
  labs(title = "Respuestas en encuestas de vacunación en tres puntos en el tiempo", 
       x = "encuesta", y = "numero de personas")
```

![](Chap03_intro_data_visualization_files/figure-latex/unnamed-chunk-1-1.pdf)<!-- --> 


Si notan, el texto para crear la grafíca es largo y parece dificil, pero con practica todos estos comandos se vuelven intuitivos. Para esta intro a visualización de datos, solamente veremos diferentes tipos de gráficas y en capitulos siguientes profundizaremos en creación de gráficas. Además veremos conceptos básicos de bases de datos.

## Formato largo y ancho de bases
En procesamiento de bases comunmente se utilizan dos tipos de layout (largo/long, ancho/wide). En el formato wide, se tiene un renglon por cada data point y multiples columnas que contienen los atributos. En el formato long, cada punto se repite n veces de acuerdo al nùmero de atributos. R viene con algunos databases integrados, mtcars es uno de ellos.

1. tidyr::gather() pasa de formato ancho a largo
2. tidyr::spread() pasa de formato largo a ancho

Ejemplo de formato ancho:

```r
library(tidyr)
```

```
## 
## Attaching package: 'tidyr'
```

```
## The following object is masked from 'package:magrittr':
## 
##     extract
```

```r
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

## tidyverse
Tidyverse es una colección de paquetes/librerias que sirven para el análisis de datos, este consiste en un grupo de paquetes para facilitar el trabajo con datos.

## ggplot
ggplot es el paquete de visualización de datos que consiste en distintos elementos. Hay que diferenciar entre los distintos conceptos:

1. ggplot2 es una libreria que trabaja por 'capas' y trabaja sobre formatos largos de base de datos
2. ggplot(): es la base de la gráfica. Inicializa una grafica vacia.
3. aes(): se les llama los aesthetics. Es lo que define en que valor de x, y, color, relleno, tamaño tendrá la gráfica
  
Todas las funciones de ggplot que inician con geom_ definen distintos tipos de gráficas.

4. geom_point(): Te define una grafica de puntos (o scatterplot). 
5. geom_bar(): Te define una grafica de barras (o barplot)
6. geom_histogram(): Te define un histograma
7. geom_line(): Te define una gráfica de linea
8. geom_boxplot(): Te define gráfica de boxplot

Asi como muchos otros tipos de gráfica. A cada gráfica le podemos añadir o modificar cuestiones del formato.

9. theme(): dentro de esta funcion podemos agregar o modificar particularidades de la grafica
 
Además, se le puede modificar el texto de la gráfica

10. labs(): te permite modificar el texto del eje x, eje y, titulo, subtitulo, caption, etc

### Scatterplot

Sin formato

```r
library(ggplot2)

mtcars %>% 
  dplyr::mutate(car_type = row.names(.)) %>%
  ggplot() + # crea un empty plot
    geom_point(aes(x = car_type, y = carb, color = carb)) + # vamos agregando capas 
    theme(axis.text.x = element_text(angle = 90, hjust = 1)) + # agregamos formato 
    labs(title = "Automoviles por nùmero de cilindros", 
         subtitle = "Se pueden añadir distintos elementos a la grafica",
         caption = "Tambien se pueden añadir pies de nota",
         x = "Tipo de automovil",
         y = "Númerop de cilindros") + # tambièn se pueden agregar elementos extra
  theme_minimal() # incluso se puede sobreescribir los elementos definidos previamente
```

![](Chap03_intro_data_visualization_files/figure-latex/unnamed-chunk-4-1.pdf)<!-- --> 

Con formato

```r
mtcars %>% 
  dplyr::mutate(car_type = row.names(.)) %>%
  ggplot() + 
  geom_point(aes(x = car_type, y = carb, color = factor(carb), size = carb)) +
  theme_minimal()+
  theme(axis.text.x = element_text(angle = 90, hjust = 1),
        legend.position = "bottom") +
  labs(title = "Automoviles por nùmero de cilindros", 
       subtitle = "Se pueden añadir distintos elementos a la grafica",
       caption = "Tambien se pueden añadir pies de nota",
       x = "Tipo de automovil",
       y = "Número de cilindros",
       color = "Número de cilindros") +
  guides(size = FALSE)
```

![](Chap03_intro_data_visualization_files/figure-latex/unnamed-chunk-5-1.pdf)<!-- --> 

### Barplot

```r
mtcars %>% 
  dplyr::mutate(car_type = row.names(.)) %>%
  ggplot() + 
  geom_bar(aes(x = factor(carb), fill = factor(carb)), 
           stat = "count") +
  theme_minimal() +
  scale_fill_manual(values = c("dodgerblue4", "firebrick4", "goldenrod3", "darkslategray4", "deeppink4", "chartreuse4"))+
  theme(axis.text.x = element_text(angle = 90, hjust = 1),
        legend.position = "bottom") +
  labs(title = "Automoviles por nùmero de cilindros", 
       subtitle = "Se pueden añadir distintos elementos a la grafica",
       caption = "Tambien se pueden añadir pies de nota",
       x = "Tipo de automovil",
       y = "Número de cilindros",
       color = "Número de cilindros") +
  guides(size = FALSE)+
  theme()
```

![](Chap03_intro_data_visualization_files/figure-latex/unnamed-chunk-6-1.pdf)<!-- --> 



## Ejercicios de práctica
### Ejercicio 7
- tidyr::gather() pasa de formato ancho a largo
- tidyr::spread() pasa de formato largo a ancho


```r
library(dplyr)
```

```
## 
## Attaching package: 'dplyr'
```

```
## The following objects are masked from 'package:stats':
## 
##     filter, lag
```

```
## The following objects are masked from 'package:base':
## 
##     intersect, setdiff, setequal, union
```

```r
library(tidyr)
wide_db <- 
  mtcars %>% 
  dplyr::mutate(car_type = row.names(.)) %>% 
  dplyr::filter(car_type == "Camaro Z28") 

wide_db %>% head
```

```
##    mpg cyl disp  hp drat   wt  qsec vs am gear carb   car_type
## 1 13.3   8  350 245 3.73 3.84 15.41  0  0    3    4 Camaro Z28
```


```r
long_db <- 
  wide_db %>% 
  tidyr::gather(attribute, value, mpg:carb)

long_db %>% head
```

```
##     car_type attribute  value
## 1 Camaro Z28       mpg  13.30
## 2 Camaro Z28       cyl   8.00
## 3 Camaro Z28      disp 350.00
## 4 Camaro Z28        hp 245.00
## 5 Camaro Z28      drat   3.73
## 6 Camaro Z28        wt   3.84
```


```r
wide_db <- 
  long_db %>% 
  tidyr::spread(attribute, value)
```

### Ejercicio 8

Analiza como se transiciona del siguiente chunk de código:

```r
library(ggplot2)

mtcars %>% 
  dplyr::mutate(car_type = row.names(.)) %>%
  ggplot() + # crea un empty plot
    geom_point(aes(x = car_type, y = carb, color = carb)) + # vamos agregando capas 
    theme(axis.text.x = element_text(angle = 90, hjust = 1)) + # agregamos formato 
    labs(title = "Automoviles por nùmero de cilindros", 
         subtitle = "Se pueden añadir distintos elementos a la grafica",
         caption = "Tambien se pueden añadir pies de nota",
         x = "Tipo de automovil",
         y = "Númerop de cilindros") + # tambièn se pueden agregar elementos extra
  theme_minimal() # incluso se puede sobreescribir los elementos definidos previamente
```

![](Chap03_intro_data_visualization_files/figure-latex/unnamed-chunk-10-1.pdf)<!-- --> 


### Ejercicio 9


```r
mtcars %>% 
  dplyr::mutate(car_type = row.names(.)) %>%
  ggplot() + 
  geom_point(aes(x = car_type, y = carb, color = factor(carb), size = carb)) +
  theme_minimal()+
  theme(axis.text.x = element_text(angle = 90, hjust = 1),
        legend.position = "bottom") +
  labs(title = "Automoviles por nùmero de cilindros", 
       subtitle = "Se pueden añadir distintos elementos a la grafica",
       caption = "Tambien se pueden añadir pies de nota",
       x = "Tipo de automovil",
       y = "Número de cilindros",
       color = "Número de cilindros") +
  guides(size = FALSE)
```

![](Chap03_intro_data_visualization_files/figure-latex/unnamed-chunk-11-1.pdf)<!-- --> 


<!--chapter:end:Chap03_intro_data_visualization.Rmd-->

---
title: "Estadística basica"
author: "Salvador Garcia"
output:   
  html_document:
    toc: true
    theme: united
    toc_depth: 1

---
# Estadística básica

Para esta sección de estadística básica veremos funciones asociadas a distribuciones. Estas son de 4 tipos para varios tipos de distribución:


```r
# dnorm, dt, dchisq, df funcion de distribución de la normal, t-student, chisquared, f 
# Nos dice la 'altura' en los puntos dados. Para distribuciones continuas no es muy util, pero para discretas si
dnorm(x = c(-100, -1, 0, 1, 100),mean = 0, sd = 1)
```

```
## [1] 0.0000000 0.2419707 0.3989423 0.2419707 0.0000000
```

```r
dbinom(x = c(0,1,2), size = 2, prob = .5)
```

```
## [1] 0.25 0.50 0.25
```


```r
# qnorm, qt, qchisq, qf la funcion quantile de las distribuciones. Recibe como argumento la probabilidad y devuelve el valor del quantil
qnorm(p = c(0,.5,1), mean = 0, sd = 1) # en que valor te acumula 0%, 50% y 100%
```

```
## [1] -Inf    0  Inf
```


```r
# pnorm, pt, pchisq, pf la funcion inversa a la quantile. cuanta probabilidad te acumula en los valores dados
pnorm(q = c(-Inf, 0, Inf), mean = 0, sd = 1)
```

```
## [1] 0.0 0.5 1.0
```


```r
# rnorm, rt, rchisq, rf te devuelve random samples de la distribución en cuestión
rnorm(n = 10, mean = 0, sd = 1)
```

```
##  [1]  1.51010630  0.37789850  0.47795861  1.73064133 -1.37950997 -1.70918656
##  [7]  0.61482037 -0.06169038 -1.06827546  1.01925245
```

## Ejercicios de práctica
### Ejercicio 10

```r
library(tidyverse)
```

```
## -- Attaching packages ------------------ tidyverse 1.3.0 --
```

```
## v ggplot2 3.3.0     v purrr   0.3.3
## v tibble  3.0.0     v dplyr   0.8.5
## v tidyr   1.0.2     v stringr 1.4.0
## v readr   1.3.1     v forcats 0.5.0
```

```
## -- Conflicts --------------------- tidyverse_conflicts() --
## x dplyr::filter() masks stats::filter()
## x dplyr::lag()    masks stats::lag()
```

```r
  data.frame(x = c(seq(-10, 10, by = .01))) %>% 
    mutate(
      normal = dnorm(x = x, mean = 0, sd = 1),
      t_student = dt(x = x, df = 10),
      chi_sq = dchisq(x = x, df = 10),
      unif = dunif(x = x, min = min(x), max = max(x))
      ) %>% 
    gather(distribucion, valor, normal:unif) %>% 
    ggplot(aes(x = x, y = valor, color = distribucion))+
    geom_line()+
    facet_wrap(~distribucion, ncol = 2)+
    theme_minimal()
```

![](Chap04_basic_stats_files/figure-latex/unnamed-chunk-5-1.pdf)<!-- --> 


### Distribution function

```r
data.frame(q = c(seq(-10, 10, by = .01))) %>% 
    mutate(
      normal = pnorm(q = q, mean = 0, sd = 1),
      t_student = pt(q = q, df = 10),
      chi_sq = pchisq(q = q, df = 1),
      unif = punif(q = q, min = min(q), max = max(q))
    ) %>% 
    gather(distribucion, valor, normal:unif) %>% 
    ggplot(aes(x = q, y = valor, color = distribucion))+
    geom_line()+
    facet_wrap(~distribucion, ncol = 2)+
    theme_minimal()
```

![](Chap04_basic_stats_files/figure-latex/unnamed-chunk-6-1.pdf)<!-- --> 
 
### Quantile function


```r
data.frame(q = c(seq(0.01, .99, by = .01))) %>% 
    mutate(
      normal = qnorm(p = q, mean = 0, sd = 1),
      t_student = qt(p = q, df = 10),
      chi_sq = qchisq(p = q, df = 1),
      unif = qunif(p = q, min = min(q), max = max(q))
    ) %>% 
    gather(distribucion, valor, normal:unif) %>% 
    ggplot(aes(x = q, y = valor, color = distribucion))+
    geom_line()+
    facet_wrap(~distribucion, ncol = 2)+
    theme_minimal()
```

![](Chap04_basic_stats_files/figure-latex/unnamed-chunk-7-1.pdf)<!-- --> 

### Random function

```r
data.frame(
      normal = rnorm(n = 10000, mean = 0, sd = 1),
      t_student = rt(n = 10000, df = 10),
      chi_sq = rchisq(n = 10000, df = 1),
      unif = runif(n = 10000, min = -3, max = 3)
    ) %>% 
    gather(distribucion, valor, normal:unif) %>% 
    ggplot(aes(x = valor, fill = distribucion))+
    geom_density()+
    facet_wrap(~distribucion, ncol = 2)+
    theme_minimal()
```

![](Chap04_basic_stats_files/figure-latex/unnamed-chunk-8-1.pdf)<!-- --> 

<!--chapter:end:Chap04_basic_stats.Rmd-->

