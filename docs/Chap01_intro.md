# Introducción

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
## [1] "/Users/sgarciago/Desktop/Repos/class_2020_R"
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
## 
## The downloaded binary packages are in
## 	/var/folders/t4/6cs23xyn51b429l5x8q39fl80000gp/T//RtmpYGQa3c/downloaded_packages
```


```r
library(crayon)
```

Para visualizar todos los paquetes se puede ocupar el panel derecho en la pestaña de packages o bien con la funcion: installed.packages()
  

```r
installed.packages()
```

```
##                   Package            
## A3                "A3"               
## abind             "abind"            
## alluvial          "alluvial"         
## AmesHousing       "AmesHousing"      
## AnomalyDetection  "AnomalyDetection" 
## anytime           "anytime"          
## askpass           "askpass"          
## assertthat        "assertthat"       
## awtools           "awtools"          
## backports         "backports"        
## base              "base"             
## base64enc         "base64enc"        
## BH                "BH"               
## bit               "bit"              
## bit64             "bit64"            
## blob              "blob"             
## bmp               "bmp"              
## bookdown          "bookdown"         
## boot              "boot"             
## brew              "brew"             
## brio              "brio"             
## broom             "broom"            
## butcher           "butcher"          
## callr             "callr"            
## car               "car"              
## carData           "carData"          
## catboost          "catboost"         
## cellranger        "cellranger"       
## checkmate         "checkmate"        
## class             "class"            
## cli               "cli"              
## clipr             "clipr"            
## cluster           "cluster"          
## codetools         "codetools"        
## colorspace        "colorspace"       
## commonmark        "commonmark"       
## compiler          "compiler"         
## config            "config"           
## conquer           "conquer"          
## corrplot          "corrplot"         
## covr              "covr"             
## cowplot           "cowplot"          
## cpp11             "cpp11"            
## crayon            "crayon"           
## crosstalk         "crosstalk"        
## curl              "curl"             
## data.table        "data.table"       
## datasets          "datasets"         
## DBI               "DBI"              
## dbplyr            "dbplyr"           
## DEoptimR          "DEoptimR"         
## desc              "desc"             
## devtools          "devtools"         
## dials             "dials"            
## DiceDesign        "DiceDesign"       
## diffobj           "diffobj"          
## digest            "digest"           
## diptest           "diptest"          
## doParallel        "doParallel"       
## dotCall64         "dotCall64"        
## downloader        "downloader"       
## dplyr             "dplyr"            
## DT                "DT"               
## ellipsis          "ellipsis"         
## evaluate          "evaluate"         
## extrafont         "extrafont"        
## extrafontdb       "extrafontdb"      
## fansi             "fansi"            
## farver            "farver"           
## fastmap           "fastmap"          
## fields            "fields"           
## flexmix           "flexmix"          
## flextable         "flextable"        
## forcats           "forcats"          
## foreach           "foreach"          
## forecast          "forecast"         
## foreign           "foreign"          
## formattable       "formattable"      
## Formula           "Formula"          
## fpc               "fpc"              
## fracdiff          "fracdiff"         
## freesurferformats "freesurferformats"
## fs                "fs"               
## fsbrain           "fsbrain"          
## furrr             "furrr"            
## future            "future"           
## gdtools           "gdtools"          
## generics          "generics"         
## ggalluvial        "ggalluvial"       
## GGally            "GGally"           
## ggh4x             "ggh4x"            
## ggplot2           "ggplot2"          
## ggpubr            "ggpubr"           
## ggrepel           "ggrepel"          
## ggridges          "ggridges"         
## ggsci             "ggsci"            
## ggsignif          "ggsignif"         
## gh                "gh"               
## git2r             "git2r"            
## glmnet            "glmnet"           
## globals           "globals"          
## glue              "glue"             
## gower             "gower"            
## GPfit             "GPfit"            
## graphics          "graphics"         
## grDevices         "grDevices"        
## grid              "grid"             
## gridExtra         "gridExtra"        
## gtable            "gtable"           
## hardhat           "hardhat"          
## haven             "haven"            
## highr             "highr"            
## Hmisc             "Hmisc"            
## hms               "hms"              
## htmlTable         "htmlTable"        
## htmltools         "htmltools"        
## htmlwidgets       "htmlwidgets"      
## httpuv            "httpuv"           
## httr              "httr"             
## huxtable          "huxtable"         
## igraph            "igraph"           
## imager            "imager"           
## infer             "infer"            
## ini               "ini"              
## ipred             "ipred"            
## isoband           "isoband"          
## iterators         "iterators"        
## janitor           "janitor"          
## jpeg              "jpeg"             
## jsonlite          "jsonlite"         
## keras             "keras"            
## kernlab           "kernlab"          
## KernSmooth        "KernSmooth"       
## knitr             "knitr"            
## labeling          "labeling"         
## later             "later"            
## lattice           "lattice"          
## latticeExtra      "latticeExtra"     
## lava              "lava"             
## lazyeval          "lazyeval"         
## learnr            "learnr"           
## lhs               "lhs"              
## lifecycle         "lifecycle"        
## lightgbm          "lightgbm"         
## listenv           "listenv"          
## lme4              "lme4"             
## lmtest            "lmtest"           
## lobstr            "lobstr"           
## lubridate         "lubridate"        
## magick            "magick"           
## magrittr          "magrittr"         
## manipulateWidget  "manipulateWidget" 
## maps              "maps"             
## maptools          "maptools"         
## markdown          "markdown"         
## MASS              "MASS"             
## mathjaxr          "mathjaxr"         
## Matrix            "Matrix"           
## MatrixModels      "MatrixModels"     
## matrixStats       "matrixStats"      
## mclust            "mclust"           
## memoise           "memoise"          
## methods           "methods"          
## mgcv              "mgcv"             
## mime              "mime"             
## miniUI            "miniUI"           
## minqa             "minqa"            
## modeldata         "modeldata"        
## modelr            "modelr"           
## modeltools        "modeltools"       
## moments           "moments"          
## munsell           "munsell"          
## nlme              "nlme"             
## nloptr            "nloptr"           
## nnet              "nnet"             
## nullabor          "nullabor"         
## numDeriv          "numDeriv"         
## odbc              "odbc"             
## officer           "officer"          
## openssl           "openssl"          
## openxlsx          "openxlsx"         
## packrat           "packrat"          
## parallel          "parallel"         
## parsnip           "parsnip"          
## patchwork         "patchwork"        
## pbapply           "pbapply"          
## pbkrtest          "pbkrtest"         
## pillar            "pillar"           
## pkgbuild          "pkgbuild"         
## pkgconfig         "pkgconfig"        
## pkgfilecache      "pkgfilecache"     
## pkgload           "pkgload"          
## plyr              "plyr"             
## png               "png"              
## polynom           "polynom"          
## prabclus          "prabclus"         
## praise            "praise"           
## prettyunits       "prettyunits"      
## pROC              "pROC"             
## processx          "processx"         
## prodlim           "prodlim"          
## progress          "progress"         
## promises          "promises"         
## ps                "ps"               
## purrr             "purrr"            
## quadprog          "quadprog"         
## quantmod          "quantmod"         
## quantreg          "quantreg"         
## R6                "R6"               
## randomForest      "randomForest"     
## ranger            "ranger"           
## rappdirs          "rappdirs"         
## rcmdcheck         "rcmdcheck"        
## RColorBrewer      "RColorBrewer"     
## Rcpp              "Rcpp"             
## RcppArmadillo     "RcppArmadillo"    
## RcppEigen         "RcppEigen"        
## readbitmap        "readbitmap"       
## readr             "readr"            
## readxl            "readxl"           
## readxlsb          "readxlsb"         
## recipes           "recipes"          
## rematch           "rematch"          
## rematch2          "rematch2"         
## remotes           "remotes"          
## renv              "renv"             
## reprex            "reprex"           
## reshape           "reshape"          
## reticulate        "reticulate"       
## rex               "rex"              
## rgl               "rgl"              
## rio               "rio"              
## rJava             "rJava"            
## RJDBC             "RJDBC"            
## rlang             "rlang"            
## rmarkdown         "rmarkdown"        
## robustbase        "robustbase"       
## roxygen2          "roxygen2"         
## rpart             "rpart"            
## rprojroot         "rprojroot"        
## rsample           "rsample"          
## rsconnect         "rsconnect"        
## rstatix           "rstatix"          
## rstudioapi        "rstudioapi"       
## Rttf2pt1          "Rttf2pt1"         
## rversions         "rversions"        
## rvest             "rvest"            
## rvg               "rvg"              
## scales            "scales"           
## selectr           "selectr"          
## sessioninfo       "sessioninfo"      
## shape             "shape"            
## shiny             "shiny"            
## slider            "slider"           
## snakecase         "snakecase"        
## sourcetools       "sourcetools"      
## sp                "sp"               
## spam              "spam"             
## sparkline         "sparkline"        
## SparseM           "SparseM"          
## spatial           "spatial"          
## splines           "splines"          
## SQUAREM           "SQUAREM"          
## squash            "squash"           
## stacks            "stacks"           
## statmod           "statmod"          
## stats             "stats"            
## stats4            "stats4"           
## stringi           "stringi"          
## stringr           "stringr"          
## survival          "survival"         
## sys               "sys"              
## systemfonts       "systemfonts"      
## tcltk             "tcltk"            
## tensorflow        "tensorflow"       
## testthat          "testthat"         
## tfruns            "tfruns"           
## tibble            "tibble"           
## tidymodels        "tidymodels"       
## tidyr             "tidyr"            
## tidyselect        "tidyselect"       
## tidyverse         "tidyverse"        
## tiff              "tiff"             
## timeDate          "timeDate"         
## tinytex           "tinytex"          
## tools             "tools"            
## tree              "tree"             
## treesnip          "treesnip"         
## tseries           "tseries"          
## tsibble           "tsibble"          
## TTR               "TTR"              
## tune              "tune"             
## urca              "urca"             
## usethis           "usethis"          
## utf8              "utf8"             
## utils             "utils"            
## uuid              "uuid"             
## vctrs             "vctrs"            
## viridis           "viridis"          
## viridisLite       "viridisLite"      
## waldo             "waldo"            
## warp              "warp"             
## webshot           "webshot"          
## whisker           "whisker"          
## withr             "withr"            
## workflows         "workflows"        
## writexl           "writexl"          
## xfun              "xfun"             
## xgboost           "xgboost"          
## XLConnect         "XLConnect"        
## xlsx              "xlsx"             
## xlsxjars          "xlsxjars"         
## xml2              "xml2"             
## xopen             "xopen"            
## xtable            "xtable"           
## xts               "xts"              
## yaml              "yaml"             
## yardstick         "yardstick"        
## zeallot           "zeallot"          
## zip               "zip"              
## zoo               "zoo"              
##                   LibPath                                                         
## A3                "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## abind             "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## alluvial          "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## AmesHousing       "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## AnomalyDetection  "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## anytime           "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## askpass           "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## assertthat        "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## awtools           "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## backports         "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## base              "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## base64enc         "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## BH                "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## bit               "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## bit64             "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## blob              "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## bmp               "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## bookdown          "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## boot              "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## brew              "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## brio              "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## broom             "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## butcher           "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## callr             "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## car               "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## carData           "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## catboost          "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## cellranger        "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## checkmate         "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## class             "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## cli               "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## clipr             "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## cluster           "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## codetools         "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## colorspace        "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## commonmark        "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## compiler          "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## config            "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## conquer           "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## corrplot          "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## covr              "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## cowplot           "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## cpp11             "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## crayon            "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## crosstalk         "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## curl              "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## data.table        "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## datasets          "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## DBI               "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## dbplyr            "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## DEoptimR          "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## desc              "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## devtools          "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## dials             "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## DiceDesign        "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## diffobj           "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## digest            "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## diptest           "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## doParallel        "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## dotCall64         "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## downloader        "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## dplyr             "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## DT                "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## ellipsis          "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## evaluate          "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## extrafont         "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## extrafontdb       "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## fansi             "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## farver            "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## fastmap           "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## fields            "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## flexmix           "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## flextable         "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## forcats           "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## foreach           "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## forecast          "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## foreign           "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## formattable       "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## Formula           "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## fpc               "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## fracdiff          "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## freesurferformats "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## fs                "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## fsbrain           "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## furrr             "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## future            "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## gdtools           "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## generics          "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## ggalluvial        "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## GGally            "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## ggh4x             "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## ggplot2           "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## ggpubr            "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## ggrepel           "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## ggridges          "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## ggsci             "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## ggsignif          "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## gh                "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## git2r             "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## glmnet            "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## globals           "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## glue              "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## gower             "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## GPfit             "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## graphics          "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## grDevices         "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## grid              "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## gridExtra         "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## gtable            "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## hardhat           "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## haven             "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## highr             "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## Hmisc             "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## hms               "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## htmlTable         "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## htmltools         "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## htmlwidgets       "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## httpuv            "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## httr              "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## huxtable          "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## igraph            "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## imager            "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## infer             "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## ini               "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## ipred             "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## isoband           "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## iterators         "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## janitor           "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## jpeg              "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## jsonlite          "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## keras             "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## kernlab           "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## KernSmooth        "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## knitr             "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## labeling          "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## later             "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## lattice           "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## latticeExtra      "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## lava              "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## lazyeval          "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## learnr            "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## lhs               "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## lifecycle         "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## lightgbm          "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## listenv           "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## lme4              "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## lmtest            "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## lobstr            "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## lubridate         "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## magick            "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## magrittr          "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## manipulateWidget  "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## maps              "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## maptools          "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## markdown          "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## MASS              "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## mathjaxr          "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## Matrix            "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## MatrixModels      "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## matrixStats       "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## mclust            "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## memoise           "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## methods           "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## mgcv              "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## mime              "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## miniUI            "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## minqa             "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## modeldata         "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## modelr            "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## modeltools        "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## moments           "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## munsell           "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## nlme              "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## nloptr            "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## nnet              "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## nullabor          "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## numDeriv          "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## odbc              "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## officer           "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## openssl           "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## openxlsx          "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## packrat           "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## parallel          "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## parsnip           "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## patchwork         "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## pbapply           "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## pbkrtest          "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## pillar            "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## pkgbuild          "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## pkgconfig         "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## pkgfilecache      "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## pkgload           "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## plyr              "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## png               "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## polynom           "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## prabclus          "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## praise            "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## prettyunits       "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## pROC              "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## processx          "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## prodlim           "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## progress          "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## promises          "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## ps                "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## purrr             "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## quadprog          "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## quantmod          "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## quantreg          "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## R6                "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## randomForest      "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## ranger            "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## rappdirs          "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## rcmdcheck         "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## RColorBrewer      "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## Rcpp              "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## RcppArmadillo     "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## RcppEigen         "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## readbitmap        "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## readr             "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## readxl            "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## readxlsb          "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## recipes           "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## rematch           "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## rematch2          "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## remotes           "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## renv              "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## reprex            "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## reshape           "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## reticulate        "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## rex               "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## rgl               "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## rio               "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## rJava             "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## RJDBC             "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## rlang             "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## rmarkdown         "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## robustbase        "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## roxygen2          "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## rpart             "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## rprojroot         "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## rsample           "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## rsconnect         "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## rstatix           "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## rstudioapi        "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## Rttf2pt1          "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## rversions         "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## rvest             "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## rvg               "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## scales            "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## selectr           "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## sessioninfo       "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## shape             "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## shiny             "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## slider            "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## snakecase         "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## sourcetools       "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## sp                "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## spam              "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## sparkline         "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## SparseM           "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## spatial           "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## splines           "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## SQUAREM           "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## squash            "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## stacks            "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## statmod           "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## stats             "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## stats4            "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## stringi           "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## stringr           "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## survival          "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## sys               "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## systemfonts       "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## tcltk             "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## tensorflow        "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## testthat          "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## tfruns            "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## tibble            "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## tidymodels        "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## tidyr             "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## tidyselect        "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## tidyverse         "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## tiff              "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## timeDate          "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## tinytex           "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## tools             "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## tree              "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## treesnip          "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## tseries           "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## tsibble           "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## TTR               "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## tune              "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## urca              "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## usethis           "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## utf8              "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## utils             "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## uuid              "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## vctrs             "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## viridis           "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## viridisLite       "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## waldo             "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## warp              "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## webshot           "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## whisker           "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## withr             "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## workflows         "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## writexl           "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## xfun              "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## xgboost           "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## XLConnect         "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## xlsx              "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## xlsxjars          "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## xml2              "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## xopen             "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## xtable            "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## xts               "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## yaml              "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## yardstick         "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## zeallot           "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## zip               "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
## zoo               "/Library/Frameworks/R.framework/Versions/4.0/Resources/library"
##                   Version       Priority     
## A3                "1.0.0"       NA           
## abind             "1.4-5"       NA           
## alluvial          "0.1-2"       NA           
## AmesHousing       "0.0.4"       NA           
## AnomalyDetection  "1.0"         NA           
## anytime           "0.3.9"       NA           
## askpass           "1.1"         NA           
## assertthat        "0.2.1"       NA           
## awtools           "0.2.1"       NA           
## backports         "1.1.10"      NA           
## base              "4.0.2"       "base"       
## base64enc         "0.1-3"       NA           
## BH                "1.72.0-3"    NA           
## bit               "4.0.4"       NA           
## bit64             "4.0.5"       NA           
## blob              "1.2.1"       NA           
## bmp               "0.3"         NA           
## bookdown          "0.21"        NA           
## boot              "1.3-25"      "recommended"
## brew              "1.0-6"       NA           
## brio              "1.1.0"       NA           
## broom             "0.7.0"       NA           
## butcher           "0.1.2"       NA           
## callr             "3.5.1"       NA           
## car               "3.0-10"      NA           
## carData           "3.0-4"       NA           
## catboost          "0.24.2"      NA           
## cellranger        "1.1.0"       NA           
## checkmate         "2.0.0"       NA           
## class             "7.3-17"      "recommended"
## cli               "2.1.0"       NA           
## clipr             "0.7.0"       NA           
## cluster           "2.1.0"       "recommended"
## codetools         "0.2-16"      "recommended"
## colorspace        "1.4-1"       NA           
## commonmark        "1.7"         NA           
## compiler          "4.0.2"       "base"       
## config            "0.3"         NA           
## conquer           "1.0.2"       NA           
## corrplot          "0.84"        NA           
## covr              "3.5.1"       NA           
## cowplot           "1.1.0"       NA           
## cpp11             "0.2.3"       NA           
## crayon            "1.3.4"       NA           
## crosstalk         "1.1.0.1"     NA           
## curl              "4.3"         NA           
## data.table        "1.13.2"      NA           
## datasets          "4.0.2"       "base"       
## DBI               "1.1.0"       NA           
## dbplyr            "1.4.4"       NA           
## DEoptimR          "1.0-8"       NA           
## desc              "1.2.0"       NA           
## devtools          "2.3.2"       NA           
## dials             "0.0.9"       NA           
## DiceDesign        "1.8-1"       NA           
## diffobj           "0.3.2"       NA           
## digest            "0.6.26"      NA           
## diptest           "0.75-7"      NA           
## doParallel        "1.0.16"      NA           
## dotCall64         "1.0-0"       NA           
## downloader        "0.4"         NA           
## dplyr             "1.0.2"       NA           
## DT                "0.15"        NA           
## ellipsis          "0.3.1"       NA           
## evaluate          "0.14"        NA           
## extrafont         "0.17"        NA           
## extrafontdb       "1.0"         NA           
## fansi             "0.4.1"       NA           
## farver            "2.0.3"       NA           
## fastmap           "1.0.1"       NA           
## fields            "11.6"        NA           
## flexmix           "2.3-15"      NA           
## flextable         "0.5.11"      NA           
## forcats           "0.5.0"       NA           
## foreach           "1.5.1"       NA           
## forecast          "8.12"        NA           
## foreign           "0.8-80"      "recommended"
## formattable       "0.2.0.1"     NA           
## Formula           "1.2-3"       NA           
## fpc               "2.2-7"       NA           
## fracdiff          "1.5-1"       NA           
## freesurferformats "0.1.13"      NA           
## fs                "1.5.0"       NA           
## fsbrain           "0.4.0"       NA           
## furrr             "0.1.0"       NA           
## future            "1.19.1"      NA           
## gdtools           "0.2.2"       NA           
## generics          "0.0.2"       NA           
## ggalluvial        "0.12.2"      NA           
## GGally            "2.0.0"       NA           
## ggh4x             "0.1.0.9000"  NA           
## ggplot2           "3.3.2"       NA           
## ggpubr            "0.4.0"       NA           
## ggrepel           "0.8.2"       NA           
## ggridges          "0.5.2"       NA           
## ggsci             "2.9"         NA           
## ggsignif          "0.6.0"       NA           
## gh                "1.1.0"       NA           
## git2r             "0.27.1"      NA           
## glmnet            "4.0-2"       NA           
## globals           "0.13.1"      NA           
## glue              "1.4.2"       NA           
## gower             "0.2.2"       NA           
## GPfit             "1.0-8"       NA           
## graphics          "4.0.2"       "base"       
## grDevices         "4.0.2"       "base"       
## grid              "4.0.2"       "base"       
## gridExtra         "2.3"         NA           
## gtable            "0.3.0"       NA           
## hardhat           "0.1.4"       NA           
## haven             "2.3.1"       NA           
## highr             "0.8"         NA           
## Hmisc             "4.4-1"       NA           
## hms               "0.5.3"       NA           
## htmlTable         "2.1.0"       NA           
## htmltools         "0.5.0"       NA           
## htmlwidgets       "1.5.1"       NA           
## httpuv            "1.5.4"       NA           
## httr              "1.4.2"       NA           
## huxtable          "5.1.0"       NA           
## igraph            "1.2.6"       NA           
## imager            "0.42.3"      NA           
## infer             "0.5.3"       NA           
## ini               "0.3.1"       NA           
## ipred             "0.9-9"       NA           
## isoband           "0.2.2"       NA           
## iterators         "1.0.13"      NA           
## janitor           "2.0.1"       NA           
## jpeg              "0.1-8.1"     NA           
## jsonlite          "1.7.1"       NA           
## keras             "2.3.0.0"     NA           
## kernlab           "0.9-29"      NA           
## KernSmooth        "2.23-17"     "recommended"
## knitr             "1.29"        NA           
## labeling          "0.3"         NA           
## later             "1.1.0.1"     NA           
## lattice           "0.20-41"     "recommended"
## latticeExtra      "0.6-29"      NA           
## lava              "1.6.8"       NA           
## lazyeval          "0.2.2"       NA           
## learnr            "0.10.1"      NA           
## lhs               "1.1.1"       NA           
## lifecycle         "0.2.0"       NA           
## lightgbm          "3.0.0"       NA           
## listenv           "0.8.0"       NA           
## lme4              "1.1-23"      NA           
## lmtest            "0.9-37"      NA           
## lobstr            "1.1.1"       NA           
## lubridate         "1.7.9"       NA           
## magick            "2.5.2"       NA           
## magrittr          "2.0.1"       NA           
## manipulateWidget  "0.10.1"      NA           
## maps              "3.3.0"       NA           
## maptools          "1.0-2"       NA           
## markdown          "1.1"         NA           
## MASS              "7.3-51.6"    "recommended"
## mathjaxr          "1.0-1"       NA           
## Matrix            "1.2-18"      "recommended"
## MatrixModels      "0.4-1"       NA           
## matrixStats       "0.57.0"      NA           
## mclust            "5.4.6"       NA           
## memoise           "1.1.0"       NA           
## methods           "4.0.2"       "base"       
## mgcv              "1.8-31"      "recommended"
## mime              "0.9"         NA           
## miniUI            "0.1.1.1"     NA           
## minqa             "1.2.4"       NA           
## modeldata         "0.0.2"       NA           
## modelr            "0.1.8"       NA           
## modeltools        "0.2-23"      NA           
## moments           "0.14"        NA           
## munsell           "0.5.0"       NA           
## nlme              "3.1-148"     "recommended"
## nloptr            "1.2.2.2"     NA           
## nnet              "7.3-14"      "recommended"
## nullabor          "0.3.9"       NA           
## numDeriv          "2016.8-1.1"  NA           
## odbc              "1.2.3"       NA           
## officer           "0.3.14"      NA           
## openssl           "1.4.2"       NA           
## openxlsx          "4.2.2"       NA           
## packrat           "0.5.0"       NA           
## parallel          "4.0.2"       "base"       
## parsnip           "0.1.3.9000"  NA           
## patchwork         "1.0.1"       NA           
## pbapply           "1.4-3"       NA           
## pbkrtest          "0.4-8.6"     NA           
## pillar            "1.4.6"       NA           
## pkgbuild          "1.1.0"       NA           
## pkgconfig         "2.0.3"       NA           
## pkgfilecache      "0.1.2"       NA           
## pkgload           "1.1.0"       NA           
## plyr              "1.8.6"       NA           
## png               "0.1-7"       NA           
## polynom           "1.4-0"       NA           
## prabclus          "2.3-2"       NA           
## praise            "1.0.0"       NA           
## prettyunits       "1.1.1"       NA           
## pROC              "1.16.2"      NA           
## processx          "3.4.4"       NA           
## prodlim           "2019.11.13"  NA           
## progress          "1.2.2"       NA           
## promises          "1.1.1"       NA           
## ps                "1.3.4"       NA           
## purrr             "0.3.4"       NA           
## quadprog          "1.5-8"       NA           
## quantmod          "0.4.17"      NA           
## quantreg          "5.73"        NA           
## R6                "2.4.1"       NA           
## randomForest      "4.6-14"      NA           
## ranger            "0.12.1"      NA           
## rappdirs          "0.3.1"       NA           
## rcmdcheck         "1.3.3"       NA           
## RColorBrewer      "1.1-2"       NA           
## Rcpp              "1.0.5"       NA           
## RcppArmadillo     "0.9.900.3.0" NA           
## RcppEigen         "0.3.3.7.0"   NA           
## readbitmap        "0.1.5"       NA           
## readr             "1.4.0"       NA           
## readxl            "1.3.1"       NA           
## readxlsb          "0.1.4"       NA           
## recipes           "0.1.14"      NA           
## rematch           "1.0.1"       NA           
## rematch2          "2.1.2"       NA           
## remotes           "2.2.0"       NA           
## renv              "0.12.2"      NA           
## reprex            "0.3.0"       NA           
## reshape           "0.8.8"       NA           
## reticulate        "1.16"        NA           
## rex               "1.2.0"       NA           
## rgl               "0.103.5"     NA           
## rio               "0.5.16"      NA           
## rJava             "0.9-13"      NA           
## RJDBC             "0.2-8"       NA           
## rlang             "0.4.8"       NA           
## rmarkdown         "2.5"         NA           
## robustbase        "0.93-6"      NA           
## roxygen2          "7.1.1"       NA           
## rpart             "4.1-15"      "recommended"
## rprojroot         "1.3-2"       NA           
## rsample           "0.0.8"       NA           
## rsconnect         "0.8.16"      NA           
## rstatix           "0.6.0"       NA           
## rstudioapi        "0.11"        NA           
## Rttf2pt1          "1.3.8"       NA           
## rversions         "2.0.2"       NA           
## rvest             "0.3.6"       NA           
## rvg               "0.2.5"       NA           
## scales            "1.1.1"       NA           
## selectr           "0.4-2"       NA           
## sessioninfo       "1.1.1"       NA           
## shape             "1.4.5"       NA           
## shiny             "1.5.0"       NA           
## slider            "0.1.5"       NA           
## snakecase         "0.11.0"      NA           
## sourcetools       "0.1.7"       NA           
## sp                "1.4-4"       NA           
## spam              "2.5-1"       NA           
## sparkline         "2.0"         NA           
## SparseM           "1.78"        NA           
## spatial           "7.3-12"      "recommended"
## splines           "4.0.2"       "base"       
## SQUAREM           "2020.4"      NA           
## squash            "1.0.9"       NA           
## stacks            "0.0.0.9000"  NA           
## statmod           "1.4.34"      NA           
## stats             "4.0.2"       "base"       
## stats4            "4.0.2"       "base"       
## stringi           "1.5.3"       NA           
## stringr           "1.4.0"       NA           
## survival          "3.1-12"      "recommended"
## sys               "3.4"         NA           
## systemfonts       "0.3.2"       NA           
## tcltk             "4.0.2"       "base"       
## tensorflow        "2.2.0"       NA           
## testthat          "3.0.0"       NA           
## tfruns            "1.4"         NA           
## tibble            "3.0.4"       NA           
## tidymodels        "0.1.1"       NA           
## tidyr             "1.1.2"       NA           
## tidyselect        "1.1.0"       NA           
## tidyverse         "1.3.0"       NA           
## tiff              "0.1-6"       NA           
## timeDate          "3043.102"    NA           
## tinytex           "0.25"        NA           
## tools             "4.0.2"       "base"       
## tree              "1.0-40"      NA           
## treesnip          "0.1.0.9000"  NA           
## tseries           "0.10-47"     NA           
## tsibble           "0.9.2"       NA           
## TTR               "0.24.2"      NA           
## tune              "0.1.1"       NA           
## urca              "1.3-0"       NA           
## usethis           "1.6.3"       NA           
## utf8              "1.1.4"       NA           
## utils             "4.0.2"       "base"       
## uuid              "0.1-4"       NA           
## vctrs             "0.3.4"       NA           
## viridis           "0.5.1"       NA           
## viridisLite       "0.3.0"       NA           
## waldo             "0.2.2"       NA           
## warp              "0.1.0"       NA           
## webshot           "0.5.2"       NA           
## whisker           "0.4"         NA           
## withr             "2.3.0"       NA           
## workflows         "0.2.1"       NA           
## writexl           "1.3.1"       NA           
## xfun              "0.16"        NA           
## xgboost           "1.2.0.1"     NA           
## XLConnect         "1.0.1"       NA           
## xlsx              "0.6.4.2"     NA           
## xlsxjars          "0.6.1"       NA           
## xml2              "1.3.2"       NA           
## xopen             "1.0.0"       NA           
## xtable            "1.8-4"       NA           
## xts               "0.12-0"      NA           
## yaml              "2.2.1"       NA           
## yardstick         "0.0.7"       NA           
## zeallot           "0.1.0"       NA           
## zip               "2.1.1"       NA           
## zoo               "1.8-8"       NA           
##                   Depends                                                                  
## A3                "R (>= 2.15.0), xtable, pbapply"                                         
## abind             "R (>= 1.5.0)"                                                           
## alluvial          NA                                                                       
## AmesHousing       "R (>= 2.10)"                                                            
## AnomalyDetection  "R (>= 2.10.0)"                                                          
## anytime           "R (>= 3.2.0)"                                                           
## askpass           NA                                                                       
## assertthat        NA                                                                       
## awtools           NA                                                                       
## backports         "R (>= 3.0.0)"                                                           
## base              NA                                                                       
## base64enc         "R (>= 2.9.0)"                                                           
## BH                NA                                                                       
## bit               "R (>= 2.9.2)"                                                           
## bit64             "R (>= 3.0.1), bit (>= 4.0.0), utils, methods, stats"                    
## blob              NA                                                                       
## bmp               NA                                                                       
## bookdown          NA                                                                       
## boot              "R (>= 3.0.0), graphics, stats"                                          
## brew              NA                                                                       
## brio              NA                                                                       
## broom             "R (>= 3.1)"                                                             
## butcher           "R (>= 3.1)"                                                             
## callr             NA                                                                       
## car               "R (>= 3.5.0), carData (>= 3.0-0)"                                       
## carData           "R (>= 3.5.0)"                                                           
## catboost          NA                                                                       
## cellranger        "R (>= 3.0.0)"                                                           
## checkmate         "R (>= 3.0.0)"                                                           
## class             "R (>= 3.0.0), stats, utils"                                             
## cli               "R (>= 2.10)"                                                            
## clipr             NA                                                                       
## cluster           "R (>= 3.3.0)"                                                           
## codetools         "R (>= 2.1)"                                                             
## colorspace        "R (>= 3.0.0), methods"                                                  
## commonmark        NA                                                                       
## compiler          NA                                                                       
## config            NA                                                                       
## conquer           "R (>= 3.5.0)"                                                           
## corrplot          NA                                                                       
## covr              "R (>= 3.1.0), methods"                                                  
## cowplot           "R (>= 3.5.0)"                                                           
## cpp11             NA                                                                       
## crayon            NA                                                                       
## crosstalk         NA                                                                       
## curl              "R (>= 3.0.0)"                                                           
## data.table        "R (>= 3.1.0)"                                                           
## datasets          NA                                                                       
## DBI               "methods, R (>= 3.0.0)"                                                  
## dbplyr            "R (>= 3.1)"                                                             
## DEoptimR          NA                                                                       
## desc              "R (>= 3.1.0)"                                                           
## devtools          "R (>= 3.0.2), usethis (>= 1.6.3)"                                       
## dials             "scales, R (>= 2.10)"                                                    
## DiceDesign        "R (>= 2.10)"                                                            
## diffobj           "R (>= 3.1.0)"                                                           
## digest            "R (>= 3.3.0)"                                                           
## diptest           NA                                                                       
## doParallel        "R (>= 2.14.0), foreach(>= 1.2.0), iterators(>= 1.0.0),\nparallel, utils"
## dotCall64         "R (>= 3.1)"                                                             
## downloader        NA                                                                       
## dplyr             "R (>= 3.2.0)"                                                           
## DT                NA                                                                       
## ellipsis          "R (>= 3.2)"                                                             
## evaluate          "R (>= 3.0.2)"                                                           
## extrafont         "R (>= 2.15)"                                                            
## extrafontdb       "R (>= 2.14)"                                                            
## fansi             "R (>= 3.1.0)"                                                           
## farver            NA                                                                       
## fastmap           NA                                                                       
## fields            "R (>= 3.0), methods, spam"                                              
## flexmix           "R (>= 2.15.0), lattice"                                                 
## flextable         NA                                                                       
## forcats           "R (>= 3.2)"                                                             
## foreach           "R (>= 2.5.0)"                                                           
## forecast          "R (>= 3.0.2),"                                                          
## foreign           "R (>= 4.0.0)"                                                           
## formattable       "R (> 3.0.2)"                                                            
## Formula           "R (>= 2.0.0), stats"                                                    
## fpc               "R (>= 2.0)"                                                             
## fracdiff          NA                                                                       
## freesurferformats NA                                                                       
## fs                "R (>= 3.1)"                                                             
## fsbrain           NA                                                                       
## furrr             "R (>= 3.2.0), future (>= 1.6.2)"                                        
## future            NA                                                                       
## gdtools           NA                                                                       
## generics          "R (>= 3.1)"                                                             
## ggalluvial        "R (>= 3.5), ggplot2 (>= 2.2)"                                           
## GGally            "R (>= 3.1), ggplot2 (>= 3.3.0)"                                         
## ggh4x             "ggplot2 (>= 3.3.0)"                                                     
## ggplot2           "R (>= 3.2)"                                                             
## ggpubr            "R (>= 3.1.0), ggplot2"                                                  
## ggrepel           "R (>= 3.0.0), ggplot2 (>= 2.2.0)"                                       
## ggridges          "R (>= 3.2)"                                                             
## ggsci             "R (>= 3.0.2)"                                                           
## ggsignif          NA                                                                       
## gh                NA                                                                       
## git2r             "R (>= 3.1)"                                                             
## glmnet            "R (>= 3.6.0), Matrix (>= 1.0-6)"                                        
## globals           "R (>= 3.1.2)"                                                           
## glue              "R (>= 3.2)"                                                             
## gower             NA                                                                       
## GPfit             NA                                                                       
## graphics          NA                                                                       
## grDevices         NA                                                                       
## grid              NA                                                                       
## gridExtra         NA                                                                       
## gtable            "R (>= 3.0)"                                                             
## hardhat           "R (>= 2.10)"                                                            
## haven             "R (>= 3.2)"                                                             
## highr             "R (>= 3.2.3)"                                                           
## Hmisc             "lattice, survival (>= 3.1-6), Formula, ggplot2 (>= 2.2)"                
## hms               NA                                                                       
## htmlTable         NA                                                                       
## htmltools         "R (>= 2.14.1)"                                                          
## htmlwidgets       NA                                                                       
## httpuv            "R (>= 2.15.1)"                                                          
## httr              "R (>= 3.2)"                                                             
## huxtable          "R (>= 2.10)"                                                            
## igraph            "methods"                                                                
## imager            "R (>= 2.10.0),magrittr"                                                 
## infer             "R (>= 3.5.0)"                                                           
## ini               NA                                                                       
## ipred             "R (>= 2.10)"                                                            
## isoband           NA                                                                       
## iterators         "R (>= 2.5.0), utils"                                                    
## janitor           "R (>= 3.1.2)"                                                           
## jpeg              "R (>= 2.9.0)"                                                           
## jsonlite          "methods"                                                                
## keras             "R (>= 3.2)"                                                             
## kernlab           "R (>= 2.10)"                                                            
## KernSmooth        "R (>= 2.5.0), stats"                                                    
## knitr             "R (>= 3.2.3)"                                                           
## labeling          NA                                                                       
## later             NA                                                                       
## lattice           "R (>= 3.0.0)"                                                           
## latticeExtra      "R (>= 3.6.0), lattice"                                                  
## lava              "R (>= 3.5)"                                                             
## lazyeval          "R (>= 3.1.0)"                                                           
## learnr            NA                                                                       
## lhs               "R (>= 3.4.0)"                                                           
## lifecycle         "R (>= 3.2)"                                                             
## lightgbm          "R (>= 3.5), R6 (>= 2.0)"                                                
## listenv           "R (>= 3.1.2)"                                                           
## lme4              "R (>= 3.2.0), Matrix (>= 1.2-1), methods, stats"                        
## lmtest            "R (>= 3.0.0), stats, zoo"                                               
## lobstr            "R (>= 3.2)"                                                             
## lubridate         "methods, R (>= 3.2)"                                                    
## magick            NA                                                                       
## magrittr          NA                                                                       
## manipulateWidget  NA                                                                       
## maps              "R (>= 3.0.0)"                                                           
## maptools          "R (>= 2.10), sp (>= 1.0-11)"                                            
## markdown          "R (>= 2.11.1)"                                                          
## MASS              "R (>= 3.1.0), grDevices, graphics, stats, utils"                        
## mathjaxr          NA                                                                       
## Matrix            "R (>= 3.2.0)"                                                           
## MatrixModels      "R (>= 3.0.1)"                                                           
## matrixStats       "R (>= 2.12.0)"                                                          
## mclust            "R (>= 3.0)"                                                             
## memoise           NA                                                                       
## methods           NA                                                                       
## mgcv              "R (>= 2.14.0), nlme (>= 3.1-64)"                                        
## mime              NA                                                                       
## miniUI            NA                                                                       
## minqa             NA                                                                       
## modeldata         "R (>= 2.10)"                                                            
## modelr            "R (>= 3.2)"                                                             
## modeltools        "stats, stats4"                                                          
## moments           NA                                                                       
## munsell           NA                                                                       
## nlme              "R (>= 3.4.0)"                                                           
## nloptr            NA                                                                       
## nnet              "R (>= 3.0.0), stats, utils"                                             
## nullabor          NA                                                                       
## numDeriv          "R (>= 2.11.1)"                                                          
## odbc              "R (>= 3.2.0)"                                                           
## officer           NA                                                                       
## openssl           NA                                                                       
## openxlsx          "R (>= 3.3.0)"                                                           
## packrat           "R (>= 3.0.0)"                                                           
## parallel          NA                                                                       
## parsnip           "R (>= 2.10)"                                                            
## patchwork         NA                                                                       
## pbapply           "R (>= 3.2.0)"                                                           
## pbkrtest          "R (>= 3.6.0), lme4 (>= 1.1.10)"                                         
## pillar            NA                                                                       
## pkgbuild          "R (>= 3.1)"                                                             
## pkgconfig         NA                                                                       
## pkgfilecache      NA                                                                       
## pkgload           NA                                                                       
## plyr              "R (>= 3.1.0)"                                                           
## png               "R (>= 2.9.0)"                                                           
## polynom           NA                                                                       
## prabclus          "R (>= 2.10), MASS, mclust"                                              
## praise            NA                                                                       
## prettyunits       NA                                                                       
## pROC              "R (>= 2.14)"                                                            
## processx          NA                                                                       
## prodlim           "R (>= 2.9.0)"                                                           
## progress          NA                                                                       
## promises          NA                                                                       
## ps                "R (>= 3.1)"                                                             
## purrr             "R (>= 3.2)"                                                             
## quadprog          "R (>= 3.1.0)"                                                           
## quantmod          "R (>= 3.2.0), xts(>= 0.9-0), zoo, TTR(>= 0.2), methods"                 
## quantreg          "R (>= 2.6), stats, SparseM"                                             
## R6                "R (>= 3.0)"                                                             
## randomForest      "R (>= 3.2.2), stats"                                                    
## ranger            "R (>= 3.1)"                                                             
## rappdirs          "R (>= 2.14), methods"                                                   
## rcmdcheck         NA                                                                       
## RColorBrewer      "R (>= 2.0.0)"                                                           
## Rcpp              NA                                                                       
## RcppArmadillo     "R (>= 3.3.0)"                                                           
## RcppEigen         "R (>= 2.15.1)"                                                          
## readbitmap        NA                                                                       
## readr             "R (>= 3.1)"                                                             
## readxl            NA                                                                       
## readxlsb          "R (>= 3.3.0)"                                                           
## recipes           "R (>= 3.1), dplyr"                                                      
## rematch           NA                                                                       
## rematch2          NA                                                                       
## remotes           "R (>= 3.0.0)"                                                           
## renv              NA                                                                       
## reprex            "R (>= 3.1)"                                                             
## reshape           "R (>= 2.6.1)"                                                           
## reticulate        "R (>= 3.0)"                                                             
## rex               NA                                                                       
## rgl               "R (>= 4.0.0)"                                                           
## rio               "R (>= 2.15.0)"                                                          
## rJava             "R (>= 2.5.0), methods"                                                  
## RJDBC             "methods, DBI, rJava (>= 0.4-15), R (>= 2.4.0)"                          
## rlang             "R (>= 3.2.0)"                                                           
## rmarkdown         "R (>= 3.0)"                                                             
## robustbase        "R (>= 3.1.0)"                                                           
## roxygen2          "R (>= 3.2)"                                                             
## rpart             "R (>= 2.15.0), graphics, stats, grDevices"                              
## rprojroot         "R (>= 3.0.0)"                                                           
## rsample           "R (>= 3.2)"                                                             
## rsconnect         "R (>= 3.0.0)"                                                           
## rstatix           "R (>= 3.3.0)"                                                           
## rstudioapi        NA                                                                       
## Rttf2pt1          "R (>= 2.15)"                                                            
## rversions         NA                                                                       
## rvest             "R (>= 3.2), xml2"                                                       
## rvg               "R (>= 3.0)"                                                             
## scales            "R (>= 3.2)"                                                             
## selectr           "R (>= 3.0)"                                                             
## sessioninfo       NA                                                                       
## shape             "R (>= 2.01)"                                                            
## shiny             "R (>= 3.0.2), methods"                                                  
## slider            "R (>= 3.2)"                                                             
## snakecase         "R (>= 3.2)"                                                             
## sourcetools       "R (>= 3.0.2)"                                                           
## sp                "R (>= 3.0.0), methods"                                                  
## spam              "R (>= 3.1), dotCall64, grid, methods"                                   
## sparkline         NA                                                                       
## SparseM           "R (>= 2.15), methods"                                                   
## spatial           "R (>= 3.0.0), graphics, stats, utils"                                   
## splines           NA                                                                       
## SQUAREM           "R (>= 3.0)"                                                             
## squash            NA                                                                       
## stacks            "R (>= 2.10)"                                                            
## statmod           "R (>= 3.0.0)"                                                           
## stats             NA                                                                       
## stats4            NA                                                                       
## stringi           "R (>= 2.14)"                                                            
## stringr           "R (>= 3.1)"                                                             
## survival          "R (>= 3.4.0)"                                                           
## sys               NA                                                                       
## systemfonts       NA                                                                       
## tcltk             NA                                                                       
## tensorflow        "R (>= 3.1)"                                                             
## testthat          "R (>= 3.1)"                                                             
## tfruns            "R (>= 3.1)"                                                             
## tibble            "R (>= 3.1.0)"                                                           
## tidymodels        "R (>= 3.1)"                                                             
## tidyr             "R (>= 3.1)"                                                             
## tidyselect        "R (>= 3.2)"                                                             
## tidyverse         "R (>= 3.2)"                                                             
## tiff              "R (>= 2.9.0)"                                                           
## timeDate          "R (>= 2.15.1), graphics, utils, stats, methods"                         
## tinytex           NA                                                                       
## tools             NA                                                                       
## tree              "R (>= 3.6.0), grDevices, graphics, stats"                               
## treesnip          "R (>= 3.5.0), parsnip (>= 0.1.3.9000)"                                  
## tseries           "R (>= 2.10.0)"                                                          
## tsibble           "R (>= 3.2.0)"                                                           
## TTR               NA                                                                       
## tune              "R (>= 2.10)"                                                            
## urca              "R (>= 2.0.0), methods"                                                  
## usethis           "R (>= 3.2)"                                                             
## utf8              "R (>= 2.10)"                                                            
## utils             NA                                                                       
## uuid              "R (>= 2.9.0)"                                                           
## vctrs             "R (>= 3.2)"                                                             
## viridis           "R (>= 2.10), viridisLite (>= 0.3.0)"                                    
## viridisLite       "R (>= 2.10)"                                                            
## waldo             NA                                                                       
## warp              "R (>= 3.2)"                                                             
## webshot           "R (>= 3.0)"                                                             
## whisker           NA                                                                       
## withr             "R (>= 3.2.0)"                                                           
## workflows         "R (>= 3.2)"                                                             
## writexl           NA                                                                       
## xfun              NA                                                                       
## xgboost           "R (>= 3.3.0)"                                                           
## XLConnect         "R (>= 2.10.0)"                                                          
## xlsx              NA                                                                       
## xlsxjars          "rJava"                                                                  
## xml2              "R (>= 3.1.0)"                                                           
## xopen             "R (>= 3.1)"                                                             
## xtable            "R (>= 2.10.0)"                                                          
## xts               "zoo (>= 1.7-12)"                                                        
## yaml              NA                                                                       
## yardstick         "R (>= 2.10)"                                                            
## zeallot           NA                                                                       
## zip               NA                                                                       
## zoo               "R (>= 3.1.0), stats"                                                    
##                   Imports                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
## A3                NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## abind             "methods, utils"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
## alluvial          NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## AmesHousing       "dplyr, magrittr"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
## AnomalyDetection  "ggplot2, stringr, lubridate"                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
## anytime           "Rcpp (>= 0.12.9)"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## askpass           "sys (>= 2.1)"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
## assertthat        "tools"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
## awtools           "ggplot2 (>= 2.2.1), grDevices, dplyr, grid, scales, extrafont,\nknitr, rmarkdown, tools"                                                                                                                                                                                                                                                                                                                                                                                                                   
## backports         "utils"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
## base              NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## base64enc         NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## BH                NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## bit               NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## bit64             NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## blob              "methods, rlang, vctrs (>= 0.2.1)"                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## bmp               NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## bookdown          "htmltools (>= 0.3.6), knitr (>= 1.22), rmarkdown (>= 2.4),\nxfun (>= 0.13), tinytex (>= 0.12), yaml (>= 2.1.19)"                                                                                                                                                                                                                                                                                                                                                                                           
## boot              NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## brew              NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## brio              NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## broom             "backports, dplyr, ellipsis, generics (>= 0.0.2), glue,\nmethods, purrr, rlang, stringr, tibble (>= 3.0.0), tidyr"                                                                                                                                                                                                                                                                                                                                                                                          
## butcher           "purrr, rlang, lobstr (>= 1.1.1), tibble (>= 2.1.1), usethis\n(>= 1.5.0), fs, utils, methods, modeldata"                                                                                                                                                                                                                                                                                                                                                                                                    
## callr             "processx (>= 3.4.4), R6, utils"                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
## car               "abind, MASS, mgcv, nnet, pbkrtest (>= 0.4-4), quantreg,\ngrDevices, utils, stats, graphics, maptools, rio, lme4, nlme"                                                                                                                                                                                                                                                                                                                                                                                     
## carData           NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## catboost          "jsonlite"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
## cellranger        "rematch, tibble"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
## checkmate         "backports (>= 1.1.0), utils"                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
## class             "MASS"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
## cli               "assertthat, crayon (>= 1.3.4), glue, methods, utils, fansi"                                                                                                                                                                                                                                                                                                                                                                                                                                                
## clipr             "utils"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
## cluster           "graphics, grDevices, stats, utils"                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
## codetools         NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## colorspace        "graphics, grDevices, stats"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
## commonmark        NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## compiler          NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## config            "yaml (>= 2.1.13)"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## conquer           "Rcpp (>= 1.0.3), Matrix, matrixStats, stats"                                                                                                                                                                                                                                                                                                                                                                                                                                                               
## corrplot          NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## covr              "digest, stats, utils, jsonlite, rex, httr, crayon, withr (>=\n1.0.2), yaml"                                                                                                                                                                                                                                                                                                                                                                                                                                
## cowplot           "ggplot2 (> 2.2.1), grid, gtable, grDevices, methods, rlang,\nscales"                                                                                                                                                                                                                                                                                                                                                                                                                                       
## cpp11             NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## crayon            "grDevices, methods, utils"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
## crosstalk         "htmltools (>= 0.3.6), jsonlite, lazyeval, R6"                                                                                                                                                                                                                                                                                                                                                                                                                                                              
## curl              NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## data.table        "methods"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
## datasets          NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## DBI               NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## dbplyr            "assertthat (>= 0.2.0), DBI (>= 1.0.0), dplyr (>= 0.8.0), glue\n(>= 1.2.0), lifecycle, magrittr, methods, purrr (>= 0.2.5), R6\n(>= 2.2.2), rlang (>= 0.2.0), tibble (>= 1.4.2), tidyselect (>=\n0.2.4), blob (>= 1.2.0), utils"                                                                                                                                                                                                                                                                            
## DEoptimR          "stats"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
## desc              "assertthat, utils, R6, crayon, rprojroot"                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
## devtools          "callr (>= 3.4.4), cli (>= 2.0.2), covr (>= 3.5.1), desc (>=\n1.2.0), DT (>= 0.15), ellipsis (>= 0.3.1), httr (>= 1.4.2),\njsonlite (>= 1.7.1), memoise (>= 1.1.0), pkgbuild (>= 1.1.0),\npkgload (>= 1.1.0), rcmdcheck (>= 1.3.3), remotes (>= 2.2.0),\nrlang (>= 0.4.7), roxygen2 (>= 7.1.1), rstudioapi (>= 0.11),\nrversions (>= 2.0.2), sessioninfo (>= 1.1.1), stats, testthat\n(>= 2.3.2), tools, utils, withr (>= 2.2.0)"                                                                           
## dials             "glue, purrr, tibble, rlang, utils, withr, DiceDesign, dplyr\n(>= 0.8.5), vctrs (>= 0.3.0.9000)"                                                                                                                                                                                                                                                                                                                                                                                                            
## DiceDesign        NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## diffobj           "crayon (>= 1.3.2), tools, methods, utils, stats"                                                                                                                                                                                                                                                                                                                                                                                                                                                           
## digest            "utils"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
## diptest           NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## doParallel        NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## dotCall64         NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## downloader        "utils, digest"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
## dplyr             "ellipsis, generics, glue (>= 1.3.2), lifecycle (>= 0.2.0),\nmagrittr (>= 1.5), methods, R6, rlang (>= 0.4.7), tibble (>=\n2.1.3), tidyselect (>= 1.1.0), utils, vctrs (>= 0.3.2)"                                                                                                                                                                                                                                                                                                                          
## DT                "htmltools (>= 0.3.6), htmlwidgets (>= 1.3), jsonlite (>=\n0.9.16), magrittr, crosstalk, promises"                                                                                                                                                                                                                                                                                                                                                                                                          
## ellipsis          "rlang (>= 0.3.0)"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## evaluate          "methods"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
## extrafont         "extrafontdb, grDevices, utils, Rttf2pt1"                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
## extrafontdb       NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## fansi             NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## farver            NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## fastmap           NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## fields            "maps"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
## flexmix           "graphics, grid, grDevices, methods, modeltools (>= 0.2-16),\nnnet, stats, stats4, utils"                                                                                                                                                                                                                                                                                                                                                                                                                   
## flextable         "stats, utils, grDevices, graphics, officer (>= 0.3.13),\nrmarkdown, knitr, htmltools, xml2, data.table, uuid, gdtools\n(>= 0.1.6), rlang, base64enc"                                                                                                                                                                                                                                                                                                                                                       
## forcats           "ellipsis, magrittr, rlang, tibble"                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
## foreach           "codetools, utils, iterators"                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
## forecast          "colorspace, fracdiff, ggplot2 (>= 2.2.1), graphics, lmtest,\nmagrittr, nnet, parallel, Rcpp (>= 0.11.0), stats, timeDate,\ntseries, urca, zoo"                                                                                                                                                                                                                                                                                                                                                             
## foreign           "methods, utils, stats"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
## formattable       "methods, htmltools, htmlwidgets, knitr, rmarkdown"                                                                                                                                                                                                                                                                                                                                                                                                                                                         
## Formula           NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## fpc               "MASS, cluster, mclust, flexmix, prabclus, class, diptest,\nrobustbase, kernlab, grDevices, graphics, methods, stats,\nutils, parallel"                                                                                                                                                                                                                                                                                                                                                                     
## fracdiff          "stats"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
## freesurferformats "pkgfilecache (>= 0.1.1), xml2"                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
## fs                "methods"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
## fsbrain           "reshape, freesurferformats (>= 0.1.12), pkgfilecache (>=\n0.1.1), rgl, squash, fields, data.table"                                                                                                                                                                                                                                                                                                                                                                                                         
## furrr             "globals (>= 0.10.3), rlang (>= 0.2.0), purrr (>= 0.2.4)"                                                                                                                                                                                                                                                                                                                                                                                                                                                   
## future            "digest, globals (>= 0.12.5), listenv (>= 0.8.0), parallel,\ntools, utils"                                                                                                                                                                                                                                                                                                                                                                                                                                  
## gdtools           "Rcpp (>= 0.12.12), systemfonts (>= 0.1.1)"                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
## generics          "methods"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
## ggalluvial        "stats, dplyr (>= 0.7), tidyr (>= 0.7), lazyeval, rlang,\ntidyselect"                                                                                                                                                                                                                                                                                                                                                                                                                                       
## GGally            "grDevices, grid, gtable (>= 0.2.0), plyr (>= 1.8.3), progress,\nRColorBrewer, reshape (>= 0.8.5), scales (>= 1.1.0), utils,\nrlang, lifecycle"                                                                                                                                                                                                                                                                                                                                                             
## ggh4x             "grid, gtable, scales, vctrs"                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
## ggplot2           "digest, glue, grDevices, grid, gtable (>= 0.1.1), isoband,\nMASS, mgcv, rlang (>= 0.3.0), scales (>= 0.5.0), stats, tibble,\nwithr (>= 2.0.0)"                                                                                                                                                                                                                                                                                                                                                             
## ggpubr            "ggrepel, grid, ggsci, stats, utils, tidyr, purrr, dplyr (>=\n0.7.1), cowplot, ggsignif, scales, gridExtra, glue, polynom,\nrlang, rstatix (>= 0.6.0), tibble, magrittr"                                                                                                                                                                                                                                                                                                                                    
## ggrepel           "grid, Rcpp, scales (>= 0.3.0)"                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
## ggridges          "ggplot2 (>= 3.0.0), grid (>= 3.0.0), plyr (>= 1.8.0), scales\n(>= 0.4.1), withr (>= 2.1.1)"                                                                                                                                                                                                                                                                                                                                                                                                                
## ggsci             "grDevices, scales, ggplot2 (>= 2.0.0)"                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
## ggsignif          "ggplot2 (>= 2.0.0)"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
## gh                "cli, ini, jsonlite, httr (>= 1.2)"                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
## git2r             "graphics, utils"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
## glmnet            "methods, utils, foreach, shape, survival"                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
## globals           "codetools"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
## glue              "methods"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
## gower             NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## GPfit             "lhs (>= 0.5), lattice (>= 0.18-8)"                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
## graphics          "grDevices"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
## grDevices         NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## grid              "grDevices, utils"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## gridExtra         "gtable, grid, grDevices, graphics, utils"                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
## gtable            "grid"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
## hardhat           "glue, rlang (>= 0.4.1), tibble, vctrs (>= 0.3.0)"                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## haven             "forcats (>= 0.2.0), hms, methods, Rcpp (>= 0.11.4), readr (>=\n0.1.0), rlang (>= 0.4.0), tibble, tidyselect, vctrs (>= 0.3.0)"                                                                                                                                                                                                                                                                                                                                                                             
## highr             NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## Hmisc             "methods, latticeExtra, cluster, rpart, nnet, foreign, gtable,\ngrid, gridExtra, data.table, htmlTable (>= 1.11.0), viridis,\nhtmltools, base64enc"                                                                                                                                                                                                                                                                                                                                                         
## hms               "methods, pkgconfig, rlang, vctrs (>= 0.2.1)"                                                                                                                                                                                                                                                                                                                                                                                                                                                               
## htmlTable         "stringr, knitr (>= 1.6), magrittr (>= 1.5), methods,\ncheckmate, htmlwidgets, htmltools, rstudioapi (>= 0.6)"                                                                                                                                                                                                                                                                                                                                                                                              
## htmltools         "utils, digest, grDevices, base64enc, rlang"                                                                                                                                                                                                                                                                                                                                                                                                                                                                
## htmlwidgets       "grDevices, htmltools (>= 0.3), jsonlite (>= 0.9.16), yaml"                                                                                                                                                                                                                                                                                                                                                                                                                                                 
## httpuv            "Rcpp (>= 0.11.0), utils, R6, promises, later (>= 0.8.0)"                                                                                                                                                                                                                                                                                                                                                                                                                                                   
## httr              "curl (>= 3.0.0), jsonlite, mime, openssl (>= 0.8), R6"                                                                                                                                                                                                                                                                                                                                                                                                                                                     
## huxtable          "assertthat, commonmark, generics, glue, memoise, R6, rlang,\nstats, stringr (>= 1.2.0), tidyselect, utils, xml2"                                                                                                                                                                                                                                                                                                                                                                                           
## igraph            "graphics, grDevices, magrittr, Matrix, pkgconfig (>= 2.0.0),\nstats, utils"                                                                                                                                                                                                                                                                                                                                                                                                                                
## imager            "Rcpp (>=\n0.11.5),methods,stringr,png,jpeg,readbitmap,grDevices,purrr,downloader,igraph"                                                                                                                                                                                                                                                                                                                                                                                                                   
## infer             "dplyr (>= 0.7.0), methods, tibble, rlang (>= 0.2.0), ggplot2,\nmagrittr, glue (>= 1.3.0), grDevices, purrr"                                                                                                                                                                                                                                                                                                                                                                                                
## ini               NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## ipred             "rpart (>= 3.1-8), MASS, survival, nnet, class, prodlim"                                                                                                                                                                                                                                                                                                                                                                                                                                                    
## isoband           "grid, utils"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
## iterators         NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## janitor           "dplyr (>= 0.7.0), lifecycle, lubridate, magrittr, purrr,\nrlang, stringi, stringr, snakecase (>= 0.9.2), tidyselect (>=\n1.0.0), tidyr (>= 0.7.0)"                                                                                                                                                                                                                                                                                                                                                         
## jpeg              NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## jsonlite          NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## keras             "generics (>= 0.0.1), reticulate (>= 1.10), tensorflow (>=\n2.0.0), tfruns (>= 1.0), magrittr, zeallot, methods, R6"                                                                                                                                                                                                                                                                                                                                                                                        
## kernlab           "methods, stats, grDevices, graphics"                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
## KernSmooth        NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## knitr             "evaluate (>= 0.10), highr, markdown, stringr (>= 0.6), yaml\n(>= 2.1.19), methods, xfun (>= 0.15), tools"                                                                                                                                                                                                                                                                                                                                                                                                  
## labeling          NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## later             "Rcpp (>= 0.12.9), rlang"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
## lattice           "grid, grDevices, graphics, stats, utils"                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
## latticeExtra      "grid, stats, utils, grDevices, png, jpeg, RColorBrewer"                                                                                                                                                                                                                                                                                                                                                                                                                                                    
## lava              "grDevices, graphics, methods, numDeriv, stats, survival,\nSQUAREM, utils"                                                                                                                                                                                                                                                                                                                                                                                                                                  
## lazyeval          NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## learnr            "utils, parallel, withr, rappdirs, rprojroot, jsonlite,\nhtmltools (>= 0.3.5), htmlwidgets, evaluate, knitr (>= 1.14),\nmarkdown, shiny (>= 1.0), rmarkdown (>= 1.12.0), ellipsis (>=\n0.2.0.1), checkmate, renv (>= 0.8.0)"                                                                                                                                                                                                                                                                                
## lhs               "Rcpp"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
## lifecycle         "glue, rlang (>= 0.4.0)"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
## lightgbm          "data.table (>= 1.9.6), graphics, jsonlite (>= 1.0), Matrix (>=\n1.1-0), methods, utils"                                                                                                                                                                                                                                                                                                                                                                                                                    
## listenv           NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## lme4              "graphics, grid, splines, utils, parallel, MASS, lattice, boot,\nnlme (>= 3.1-123), minqa (>= 1.1.15), nloptr (>= 1.0.4),\nstatmod"                                                                                                                                                                                                                                                                                                                                                                         
## lmtest            "graphics"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
## lobstr            "crayon, Rcpp, rlang (>= 0.3.0)"                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
## lubridate         "generics, Rcpp (>= 0.12.13)"                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
## magick            "Rcpp (>= 0.12.12), magrittr, curl"                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
## magrittr          NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## manipulateWidget  "shiny (>= 1.0.3), miniUI, htmltools, htmlwidgets, knitr,\nmethods, tools, base64enc, grDevices, codetools, webshot"                                                                                                                                                                                                                                                                                                                                                                                        
## maps              "graphics, utils"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
## maptools          "foreign (>= 0.8), methods, grid, lattice, stats, utils,\ngrDevices"                                                                                                                                                                                                                                                                                                                                                                                                                                        
## markdown          "utils, xfun, mime (>= 0.3)"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
## MASS              "methods"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
## mathjaxr          NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## Matrix            "methods, graphics, grid, stats, utils, lattice"                                                                                                                                                                                                                                                                                                                                                                                                                                                            
## MatrixModels      "stats, methods, Matrix (>= 1.1-5)"                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
## matrixStats       NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## mclust            "stats, utils, graphics, grDevices"                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
## memoise           "digest (>= 0.6.3)"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
## methods           "utils, stats"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
## mgcv              "methods, stats, graphics, Matrix, splines, utils"                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## mime              "tools"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
## miniUI            "shiny (>= 0.13), htmltools (>= 0.3), utils"                                                                                                                                                                                                                                                                                                                                                                                                                                                                
## minqa             "Rcpp (>= 0.9.10)"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## modeldata         NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## modelr            "broom, magrittr, purrr (>= 0.2.2), rlang (>= 0.2.0), tibble,\ntidyr (>= 0.8.0), tidyselect, vctrs"                                                                                                                                                                                                                                                                                                                                                                                                         
## modeltools        "methods"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
## moments           NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## munsell           "colorspace, methods"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
## nlme              "graphics, stats, utils, lattice"                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
## nloptr            NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## nnet              NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## nullabor          "MASS, rlang, moments, fpc, tsibble, forecast, ggplot2, dplyr,\npurrr, tidyr, tibble, magrittr, viridis"                                                                                                                                                                                                                                                                                                                                                                                                    
## numDeriv          NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## odbc              "bit64, blob (>= 1.2.0), DBI (>= 1.0.0), hms, methods, rlang,\nRcpp (>= 0.12.11)"                                                                                                                                                                                                                                                                                                                                                                                                                           
## officer           "R6, grDevices, zip (>= 2.1.0), uuid,stats, magrittr,utils,\nxml2 (>= 1.1.0), graphics"                                                                                                                                                                                                                                                                                                                                                                                                                     
## openssl           "askpass"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
## openxlsx          "grDevices, methods, Rcpp, stats, utils, zip, stringi"                                                                                                                                                                                                                                                                                                                                                                                                                                                      
## packrat           "tools, utils"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
## parallel          "tools, compiler"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
## parsnip           "dplyr (>= 0.8.0.1), rlang (>= 0.3.1), purrr, utils, tibble (>=\n2.1.1), generics, glue, magrittr, stats, tidyr (>= 1.0.0),\nglobals, prettyunits, vctrs (>= 0.2.0)"                                                                                                                                                                                                                                                                                                                                        
## patchwork         "ggplot2 (>= 3.0.0), gtable, grid, stats, grDevices, utils,\ngraphics"                                                                                                                                                                                                                                                                                                                                                                                                                                      
## pbapply           "parallel"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
## pbkrtest          "Matrix (>= 1.2.3), parallel, magrittr, MASS, methods"                                                                                                                                                                                                                                                                                                                                                                                                                                                      
## pillar            "cli, crayon (>= 1.3.4), ellipsis, fansi, lifecycle, rlang (>=\n0.3.0), utf8 (>= 1.1.0), vctrs (>= 0.2.0)"                                                                                                                                                                                                                                                                                                                                                                                                  
## pkgbuild          "callr (>= 3.2.0), cli, crayon, desc, prettyunits, R6,\nrprojroot, withr (>= 2.1.2)"                                                                                                                                                                                                                                                                                                                                                                                                                        
## pkgconfig         "utils"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
## pkgfilecache      "downloader, rappdirs"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
## pkgload           "cli, crayon, desc, methods, pkgbuild, rlang, rprojroot,\nrstudioapi, utils, withr"                                                                                                                                                                                                                                                                                                                                                                                                                         
## plyr              "Rcpp (>= 0.11.0)"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## png               NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## polynom           "stats, graphics"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
## prabclus          NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## praise            NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## prettyunits       NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## pROC              "methods, plyr, Rcpp (>= 0.11.1)"                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
## processx          "ps (>= 1.2.0), R6, utils"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
## prodlim           "Rcpp (>= 0.11.5), stats, grDevices, graphics, survival,\nKernSmooth, lava"                                                                                                                                                                                                                                                                                                                                                                                                                                 
## progress          "hms, prettyunits, R6, crayon"                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
## promises          "R6, Rcpp, later, rlang, stats, magrittr"                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
## ps                "utils"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
## purrr             "magrittr (>= 1.5), rlang (>= 0.3.1)"                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
## quadprog          NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## quantmod          "curl"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
## quantreg          "methods, graphics, Matrix, MatrixModels, conquer"                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## R6                NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## randomForest      NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## ranger            "Rcpp (>= 0.11.2), Matrix"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
## rappdirs          NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## rcmdcheck         "callr (>= 3.1.1.9000), cli (>= 1.1.0), crayon, desc (>=\n1.2.0), digest, pkgbuild, prettyunits, R6, rprojroot,\nsessioninfo (>= 1.1.1), utils, withr, xopen"                                                                                                                                                                                                                                                                                                                                               
## RColorBrewer      NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## Rcpp              "methods, utils"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
## RcppArmadillo     "Rcpp (>= 0.11.0), stats, utils, methods"                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
## RcppEigen         "Matrix (>= 1.1-0), Rcpp (>= 0.11.0), stats, utils"                                                                                                                                                                                                                                                                                                                                                                                                                                                         
## readbitmap        "bmp, jpeg, png, tiff"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
## readr             "cli, clipr, crayon, hms (>= 0.4.1), methods, rlang, R6,\ntibble, utils, lifecycle"                                                                                                                                                                                                                                                                                                                                                                                                                         
## readxl            "cellranger, Rcpp (>= 0.12.18), tibble (>= 1.3.1), utils"                                                                                                                                                                                                                                                                                                                                                                                                                                                   
## readxlsb          "Rcpp, xml2, cellranger, utils"                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
## recipes           "generics, glue, gower, ipred, lifecycle, lubridate, magrittr,\nMatrix, purrr (>= 0.2.3), rlang (>= 0.4.0), stats, tibble,\ntidyr (>= 1.0.0), tidyselect (>= 0.2.5), timeDate, utils, withr"                                                                                                                                                                                                                                                                                                                
## rematch           NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## rematch2          "tibble"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
## remotes           "methods, stats, tools, utils"                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
## renv              "utils"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
## reprex            "callr (>= 2.0.0), clipr (>= 0.4.0), fs, rlang, rmarkdown,\nutils, whisker, withr"                                                                                                                                                                                                                                                                                                                                                                                                                          
## reshape           "plyr"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
## reticulate        "graphics, jsonlite, Matrix, methods, rappdirs, Rcpp (>=\n0.12.7), utils"                                                                                                                                                                                                                                                                                                                                                                                                                                   
## rex               "lazyeval"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
## rgl               "graphics, grDevices, stats, utils, htmlwidgets, htmltools,\nknitr, jsonlite (>= 0.9.20), shiny, magrittr, crosstalk,\nmanipulateWidget (>= 0.9.0), mathjaxr"                                                                                                                                                                                                                                                                                                                                               
## rio               "tools, stats, utils, foreign, haven (>= 1.1.0), curl (>= 0.6),\ndata.table (>= 1.9.8), readxl (>= 0.1.1), openxlsx, tibble"                                                                                                                                                                                                                                                                                                                                                                                
## rJava             NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## RJDBC             NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## rlang             NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## rmarkdown         "tools, utils, knitr (>= 1.22), yaml (>= 2.1.19), htmltools (>=\n0.3.5), evaluate (>= 0.13), jsonlite, tinytex (>= 0.11), xfun\n(>= 0.15), methods, stringr (>= 1.2.0)"                                                                                                                                                                                                                                                                                                                                     
## robustbase        "stats, graphics, utils, methods, DEoptimR"                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
## roxygen2          "brew, commonmark, desc (>= 1.2.0), digest, knitr, methods,\npkgload (>= 1.0.2), purrr (>= 0.3.3), R6 (>= 2.1.2), Rcpp (>=\n0.11.0), rlang, stringi, stringr (>= 1.0.0), utils, xml2"                                                                                                                                                                                                                                                                                                                       
## rpart             NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## rprojroot         "backports"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
## rsample           "dplyr (>= 0.8.5), purrr, tibble, rlang (>= 0.4.0), methods,\ngenerics, utils, tidyselect, furrr, tidyr, vctrs (>= 0.3.0),\nmodeldata, slider (>= 0.1.5), ellipsis"                                                                                                                                                                                                                                                                                                                                         
## rsconnect         "curl, digest, jsonlite, openssl, packrat (>= 0.4.8-1),\nrstudioapi (>= 0.5), yaml (>= 2.1.5)"                                                                                                                                                                                                                                                                                                                                                                                                              
## rstatix           "stats, utils, tidyr (>= 1.0.0), purrr, broom (>= 0.5.6), rlang\n(>= 0.3.1), tibble (>= 2.1.3), dplyr (>= 0.7.1), magrittr,\ncorrplot, tidyselect (>= 1.0.0), car, generics (>= 0.0.2)"                                                                                                                                                                                                                                                                                                                     
## rstudioapi        NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## Rttf2pt1          NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## rversions         "curl, utils, xml2 (>= 1.0.0)"                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
## rvest             "httr (>= 0.5), magrittr, selectr"                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## rvg               "grDevices, Rcpp (>= 0.12.12), officer (>= 0.3.6), gdtools (>=\n0.2.1), xml2 (>= 1.0.0), rlang"                                                                                                                                                                                                                                                                                                                                                                                                             
## scales            "farver (>= 2.0.3), labeling, lifecycle, munsell (>= 0.5), R6,\nRColorBrewer, viridisLite"                                                                                                                                                                                                                                                                                                                                                                                                                  
## selectr           "methods, stringr, R6"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
## sessioninfo       "cli, tools, utils, withr"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
## shape             "stats, graphics, grDevices"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
## shiny             "utils, grDevices, httpuv (>= 1.5.2), mime (>= 0.3), jsonlite\n(>= 0.9.16), xtable, digest, htmltools (>= 0.4.0.9003), R6 (>=\n2.0), sourcetools, later (>= 1.0.0), promises (>= 1.1.0),\ntools, crayon, rlang (>= 0.4.0), fastmap (>= 1.0.0), withr,\ncommonmark (>= 1.7), glue (>= 1.3.2)"                                                                                                                                                                                                                
## slider            "glue, rlang (>= 0.4.5), vctrs (>= 0.3.0), warp"                                                                                                                                                                                                                                                                                                                                                                                                                                                            
## snakecase         "stringr, stringi"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## sourcetools       NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## sp                "utils, stats, graphics, grDevices, lattice, grid"                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## spam              NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## sparkline         "htmltools, htmlwidgets (>= 0.8)"                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
## SparseM           "graphics, stats, utils"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
## spatial           NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## splines           "graphics, stats"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
## SQUAREM           NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## squash            "graphics, grDevices, methods, stats"                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
## stacks            "tune (>= 0.1.1), dplyr (>= 1.0.0), rlang (>= 0.4.0), tibble\n(>= 2.1.3), purrr (>= 0.3.2), parsnip (>= 0.0.4), workflows (>=\n0.1.0), recipes, yardstick, tidyr, dials, digest, glue,\ngenerics, ggplot2, glmnet, rsample, cli, crayon, butcher, stats"                                                                                                                                                                                                                                                    
## statmod           "stats, graphics"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
## stats             "utils, grDevices, graphics"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
## stats4            "graphics, methods, stats"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
## stringi           "tools, utils, stats"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
## stringr           "glue (>= 1.2.0), magrittr, stringi (>= 1.1.7)"                                                                                                                                                                                                                                                                                                                                                                                                                                                             
## survival          "graphics, Matrix, methods, splines, stats, utils"                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## sys               NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## systemfonts       NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## tcltk             "utils"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
## tensorflow        "config, jsonlite (>= 1.2), processx, reticulate (>= 1.10),\ntfruns (>= 1.0), utils, yaml, rstudioapi (>= 0.7)"                                                                                                                                                                                                                                                                                                                                                                                             
## testthat          "brio, callr (>= 3.5.1), cli, crayon (>= 1.3.4), desc, digest,\nellipsis (>= 0.2.0), evaluate, jsonlite, lifecycle, magrittr,\nmethods, pkgload, praise, processx, ps (>= 1.3.4), R6 (>=\n2.2.0), rlang (>= 0.4.1), utils, waldo (>= 0.2.1), withr (>=\n2.0.0)"                                                                                                                                                                                                                                             
## tfruns            "utils, jsonlite (>= 1.2), base64enc, yaml, config, magrittr,\nwhisker, tidyselect, rlang, rstudioapi (>= 0.7), reticulate"                                                                                                                                                                                                                                                                                                                                                                                 
## tibble            "cli, crayon (>= 1.3.4), ellipsis (>= 0.2.0), fansi (>= 0.4.0),\nlifecycle (>= 0.2.0), magrittr, methods, pillar (>= 1.4.3),\npkgconfig, rlang (>= 0.4.3), utils, vctrs (>= 0.3.2)"                                                                                                                                                                                                                                                                                                                         
## tidymodels        "broom (>= 0.7.0), cli (>= 2.0.2), crayon (>= 1.3.4), dials (>=\n0.0.8), dplyr (>= 1.0.0), ggplot2 (>= 3.3.2), infer (>= 0.5.2),\nmagrittr (>= 1.5), modeldata (>= 0.0.2), parsnip (>= 0.1.2),\npurrr (>= 0.3.4), recipes (>= 0.1.13), rlang (>= 0.4.7),\nrsample (>= 0.0.7), rstudioapi (>= 0.11), tibble (>= 3.0.3),\ntidyr (>= 1.1.0), tune (>= 0.1.1), workflows (>= 0.1.2),\nyardstick (>= 0.0.7)"                                                                                                     
## tidyr             "dplyr (>= 0.8.2), ellipsis (>= 0.1.0), glue, magrittr, purrr,\nrlang, tibble (>= 2.1.1), tidyselect (>= 1.1.0), utils, vctrs\n(>= 0.3.0), lifecycle"                                                                                                                                                                                                                                                                                                                                                       
## tidyselect        "ellipsis, glue (>= 1.3.0), purrr (>= 0.3.2), rlang (>= 0.4.6),\nvctrs (>= 0.2.2)"                                                                                                                                                                                                                                                                                                                                                                                                                          
## tidyverse         "broom (>= 0.5.2), cli (>= 1.1.0), crayon (>= 1.3.4), dbplyr\n(>= 1.4.2), dplyr (>= 0.8.3), forcats (>= 0.4.0), ggplot2 (>=\n3.2.1), haven (>= 2.2.0), hms (>= 0.5.2), httr (>= 1.4.1),\njsonlite (>= 1.6), lubridate (>= 1.7.4), magrittr (>= 1.5),\nmodelr (>= 0.1.5), pillar (>= 1.4.2), purrr (>= 0.3.3), readr\n(>= 1.3.1), readxl (>= 1.3.1), reprex (>= 0.3.0), rlang (>=\n0.4.1), rstudioapi (>= 0.10), rvest (>= 0.3.5), stringr (>=\n1.4.0), tibble (>= 2.1.3), tidyr (>= 1.0.0), xml2 (>= 1.2.2)"
## tiff              NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## timeDate          NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## tinytex           "xfun (>= 0.5)"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
## tools             NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## tree              NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## treesnip          "rlang, purrr, tree, tibble, dplyr, stats"                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
## tseries           "graphics, stats, utils, quadprog, zoo, quantmod (>= 0.4-9)"                                                                                                                                                                                                                                                                                                                                                                                                                                                
## tsibble           "anytime (>= 0.3.1), dplyr (>= 1.0.0), ellipsis (>= 0.3.0),\nlifecycle, lubridate (>= 1.7.0), methods, purrr (>= 0.2.3),\nrlang (>= 0.4.6), tibble (>= 3.0.0), tidyselect (>= 1.0.0),\nvctrs (>= 0.3.1)"                                                                                                                                                                                                                                                                                                    
## TTR               "xts (>= 0.10-0), zoo, curl"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
## tune              "dplyr (>= 0.8.5), rlang (>= 0.4.0), tibble (>= 2.1.3), purrr\n(>= 0.3.2), dials (>= 0.0.4), recipes (>= 0.1.9), utils,\nggplot2, glue, cli (>= 2.0.0), crayon, yardstick, rsample,\ntidyr, GPfit, foreach, parsnip (>= 0.0.4), workflows (>=\n0.1.0), hardhat (>= 0.1.0), lifecycle, vctrs (>= 0.3.0)"                                                                                                                                                                                                     
## urca              "nlme, graphics, stats"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
## usethis           "clipr (>= 0.3.0), cli, crayon, curl (>= 2.7), desc, fs (>=\n1.3.0), gh (>= 1.1.0), git2r (>= 0.23), glue (>= 1.3.0), purrr,\nrematch2, rlang (>= 0.4.3), rprojroot (>= 1.2), rstudioapi,\nstats, utils, whisker, withr, yaml"                                                                                                                                                                                                                                                                              
## utf8              NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## utils             NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## uuid              NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## vctrs             "ellipsis (>= 0.2.0), digest, glue, rlang (>= 0.4.7)"                                                                                                                                                                                                                                                                                                                                                                                                                                                       
## viridis           "stats, ggplot2 (>= 1.0.1), gridExtra"                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
## viridisLite       NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## waldo             "cli, diffobj, fansi, glue, methods, rematch2, rlang, tibble"                                                                                                                                                                                                                                                                                                                                                                                                                                               
## warp              NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## webshot           "magrittr, jsonlite, callr"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
## whisker           NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## withr             "graphics, grDevices, stats"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
## workflows         "cli (>= 2.0.0), ellipsis (>= 0.2.0), generics, glue, hardhat\n(>= 0.1.4), parsnip (>= 0.1.3), rlang (>= 0.4.1), tidyselect\n(>= 1.1.0)"                                                                                                                                                                                                                                                                                                                                                                    
## writexl           NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## xfun              "stats, tools"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
## xgboost           "Matrix (>= 1.1-0), methods, data.table (>= 1.9.6), magrittr\n(>= 1.5), stringi (>= 0.5.2)"                                                                                                                                                                                                                                                                                                                                                                                                                 
## XLConnect         "methods, rJava"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
## xlsx              "rJava, xlsxjars, grDevices, utils"                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
## xlsxjars          NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## xml2              "methods"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
## xopen             "processx"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
## xtable            "stats, utils"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
## xts               "methods"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
## yaml              NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## yardstick         "dplyr (>= 0.8.5), generics, pROC (>= 1.15.0), rlang (>=\n0.4.0), tidyselect, utils"                                                                                                                                                                                                                                                                                                                                                                                                                        
## zeallot           NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## zip               NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## zoo               "utils, graphics, grDevices, lattice (>= 0.20-27)"                                                                                                                                                                                                                                                                                                                                                                                                                                                          
##                   LinkingTo                                    
## A3                NA                                           
## abind             NA                                           
## alluvial          NA                                           
## AmesHousing       NA                                           
## AnomalyDetection  NA                                           
## anytime           "Rcpp (>= 0.12.9), BH"                       
## askpass           NA                                           
## assertthat        NA                                           
## awtools           NA                                           
## backports         NA                                           
## base              NA                                           
## base64enc         NA                                           
## BH                NA                                           
## bit               NA                                           
## bit64             NA                                           
## blob              NA                                           
## bmp               NA                                           
## bookdown          NA                                           
## boot              NA                                           
## brew              NA                                           
## brio              NA                                           
## broom             NA                                           
## butcher           NA                                           
## callr             NA                                           
## car               NA                                           
## carData           NA                                           
## catboost          NA                                           
## cellranger        NA                                           
## checkmate         NA                                           
## class             NA                                           
## cli               NA                                           
## clipr             NA                                           
## cluster           NA                                           
## codetools         NA                                           
## colorspace        NA                                           
## commonmark        NA                                           
## compiler          NA                                           
## config            NA                                           
## conquer           "Rcpp, RcppArmadillo (>= 0.9.850.1.0)"       
## corrplot          NA                                           
## covr              NA                                           
## cowplot           NA                                           
## cpp11             NA                                           
## crayon            NA                                           
## crosstalk         NA                                           
## curl              NA                                           
## data.table        NA                                           
## datasets          NA                                           
## DBI               NA                                           
## dbplyr            NA                                           
## DEoptimR          NA                                           
## desc              NA                                           
## devtools          NA                                           
## dials             NA                                           
## DiceDesign        NA                                           
## diffobj           NA                                           
## digest            NA                                           
## diptest           NA                                           
## doParallel        NA                                           
## dotCall64         NA                                           
## downloader        NA                                           
## dplyr             NA                                           
## DT                NA                                           
## ellipsis          NA                                           
## evaluate          NA                                           
## extrafont         NA                                           
## extrafontdb       NA                                           
## fansi             NA                                           
## farver            NA                                           
## fastmap           NA                                           
## fields            NA                                           
## flexmix           NA                                           
## flextable         NA                                           
## forcats           NA                                           
## foreach           NA                                           
## forecast          "Rcpp (>= 0.11.0), RcppArmadillo (>= 0.2.35)"
## foreign           NA                                           
## formattable       NA                                           
## Formula           NA                                           
## fpc               NA                                           
## fracdiff          NA                                           
## freesurferformats NA                                           
## fs                NA                                           
## fsbrain           NA                                           
## furrr             NA                                           
## future            NA                                           
## gdtools           "Rcpp"                                       
## generics          NA                                           
## ggalluvial        NA                                           
## GGally            NA                                           
## ggh4x             NA                                           
## ggplot2           NA                                           
## ggpubr            NA                                           
## ggrepel           "Rcpp"                                       
## ggridges          NA                                           
## ggsci             NA                                           
## ggsignif          NA                                           
## gh                NA                                           
## git2r             NA                                           
## glmnet            NA                                           
## globals           NA                                           
## glue              NA                                           
## gower             NA                                           
## GPfit             NA                                           
## graphics          NA                                           
## grDevices         NA                                           
## grid              NA                                           
## gridExtra         NA                                           
## gtable            NA                                           
## hardhat           NA                                           
## haven             "Rcpp"                                       
## highr             NA                                           
## Hmisc             NA                                           
## hms               NA                                           
## htmlTable         NA                                           
## htmltools         NA                                           
## htmlwidgets       NA                                           
## httpuv            "Rcpp, BH, later"                            
## httr              NA                                           
## huxtable          NA                                           
## igraph            NA                                           
## imager            "Rcpp"                                       
## infer             NA                                           
## ini               NA                                           
## ipred             NA                                           
## isoband           "testthat"                                   
## iterators         NA                                           
## janitor           NA                                           
## jpeg              NA                                           
## jsonlite          NA                                           
## keras             NA                                           
## kernlab           NA                                           
## KernSmooth        NA                                           
## knitr             NA                                           
## labeling          NA                                           
## later             "Rcpp, BH"                                   
## lattice           NA                                           
## latticeExtra      NA                                           
## lava              NA                                           
## lazyeval          NA                                           
## learnr            NA                                           
## lhs               "Rcpp"                                       
## lifecycle         NA                                           
## lightgbm          NA                                           
## listenv           NA                                           
## lme4              "Rcpp (>= 0.10.5), RcppEigen"                
## lmtest            NA                                           
## lobstr            "Rcpp"                                       
## lubridate         "Rcpp"                                       
## magick            "Rcpp"                                       
## magrittr          NA                                           
## manipulateWidget  NA                                           
## maps              NA                                           
## maptools          NA                                           
## markdown          NA                                           
## MASS              NA                                           
## mathjaxr          NA                                           
## Matrix            NA                                           
## MatrixModels      NA                                           
## matrixStats       NA                                           
## mclust            NA                                           
## memoise           NA                                           
## methods           NA                                           
## mgcv              NA                                           
## mime              NA                                           
## miniUI            NA                                           
## minqa             "Rcpp"                                       
## modeldata         NA                                           
## modelr            NA                                           
## modeltools        NA                                           
## moments           NA                                           
## munsell           NA                                           
## nlme              NA                                           
## nloptr            NA                                           
## nnet              NA                                           
## nullabor          NA                                           
## numDeriv          NA                                           
## odbc              "Rcpp"                                       
## officer           NA                                           
## openssl           NA                                           
## openxlsx          "Rcpp"                                       
## packrat           NA                                           
## parallel          NA                                           
## parsnip           NA                                           
## patchwork         NA                                           
## pbapply           NA                                           
## pbkrtest          NA                                           
## pillar            NA                                           
## pkgbuild          NA                                           
## pkgconfig         NA                                           
## pkgfilecache      NA                                           
## pkgload           NA                                           
## plyr              "Rcpp"                                       
## png               NA                                           
## polynom           NA                                           
## prabclus          NA                                           
## praise            NA                                           
## prettyunits       NA                                           
## pROC              "Rcpp"                                       
## processx          NA                                           
## prodlim           "Rcpp"                                       
## progress          NA                                           
## promises          "later, Rcpp"                                
## ps                NA                                           
## purrr             NA                                           
## quadprog          NA                                           
## quantmod          NA                                           
## quantreg          NA                                           
## R6                NA                                           
## randomForest      NA                                           
## ranger            "Rcpp, RcppEigen"                            
## rappdirs          NA                                           
## rcmdcheck         NA                                           
## RColorBrewer      NA                                           
## Rcpp              NA                                           
## RcppArmadillo     "Rcpp"                                       
## RcppEigen         "Rcpp"                                       
## readbitmap        NA                                           
## readr             "BH, cpp11"                                  
## readxl            "progress, Rcpp"                             
## readxlsb          "Rcpp"                                       
## recipes           NA                                           
## rematch           NA                                           
## rematch2          NA                                           
## remotes           NA                                           
## renv              NA                                           
## reprex            NA                                           
## reshape           NA                                           
## reticulate        "Rcpp"                                       
## rex               NA                                           
## rgl               NA                                           
## rio               NA                                           
## rJava             NA                                           
## RJDBC             NA                                           
## rlang             NA                                           
## rmarkdown         NA                                           
## robustbase        NA                                           
## roxygen2          "Rcpp"                                       
## rpart             NA                                           
## rprojroot         NA                                           
## rsample           NA                                           
## rsconnect         NA                                           
## rstatix           NA                                           
## rstudioapi        NA                                           
## Rttf2pt1          NA                                           
## rversions         NA                                           
## rvest             NA                                           
## rvg               "Rcpp, gdtools"                              
## scales            NA                                           
## selectr           NA                                           
## sessioninfo       NA                                           
## shape             NA                                           
## shiny             NA                                           
## slider            "vctrs (>= 0.3.0)"                           
## snakecase         NA                                           
## sourcetools       NA                                           
## sp                NA                                           
## spam              NA                                           
## sparkline         NA                                           
## SparseM           NA                                           
## spatial           NA                                           
## splines           NA                                           
## SQUAREM           NA                                           
## squash            NA                                           
## stacks            NA                                           
## statmod           NA                                           
## stats             NA                                           
## stats4            NA                                           
## stringi           NA                                           
## stringr           NA                                           
## survival          NA                                           
## sys               NA                                           
## systemfonts       "cpp11"                                      
## tcltk             NA                                           
## tensorflow        NA                                           
## testthat          NA                                           
## tfruns            NA                                           
## tibble            NA                                           
## tidymodels        NA                                           
## tidyr             "cpp11 (>= 0.2.1)"                           
## tidyselect        NA                                           
## tidyverse         NA                                           
## tiff              NA                                           
## timeDate          NA                                           
## tinytex           NA                                           
## tools             NA                                           
## tree              NA                                           
## treesnip          NA                                           
## tseries           NA                                           
## tsibble           NA                                           
## TTR               "xts"                                        
## tune              NA                                           
## urca              NA                                           
## usethis           NA                                           
## utf8              NA                                           
## utils             NA                                           
## uuid              NA                                           
## vctrs             NA                                           
## viridis           NA                                           
## viridisLite       NA                                           
## waldo             NA                                           
## warp              NA                                           
## webshot           NA                                           
## whisker           NA                                           
## withr             NA                                           
## workflows         NA                                           
## writexl           NA                                           
## xfun              NA                                           
## xgboost           NA                                           
## XLConnect         NA                                           
## xlsx              NA                                           
## xlsxjars          NA                                           
## xml2              NA                                           
## xopen             NA                                           
## xtable            NA                                           
## xts               "zoo"                                        
## yaml              NA                                           
## yardstick         NA                                           
## zeallot           NA                                           
## zip               NA                                           
## zoo               NA                                           
##                   Suggests                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
## A3                "randomForest, e1071"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
## abind             NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
## alluvial          "devtools, testthat, reshape2, knitr, rmarkdown, dplyr"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
## AmesHousing       "covr"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
## AnomalyDetection  "testthat"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## anytime           "tinytest (>= 1.0.0), gettz"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
## askpass           "testthat"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## assertthat        "testthat, covr"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
## awtools           NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
## backports         NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
## base              "methods"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
## base64enc         NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
## BH                NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
## bit               "testthat (>= 0.11.0), roxygen2, knitr, rmarkdown,\nmicrobenchmark, bit64 (>= 4.0.0), ff (>= 4.0.0)"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
## bit64             NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
## blob              "covr, crayon, pillar (>= 1.2.1), testthat"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
## bmp               "pixmap, testthat"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
## bookdown          "htmlwidgets, rstudioapi, miniUI, rsconnect (>= 0.4.3), servr\n(>= 0.13), shiny, testit (>= 0.9), tufte, webshot"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
## boot              "MASS, survival"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
## brew              NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
## brio              "testthat (>= 2.1.0), covr"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
## broom             "AER, akima, AUC, bbmle, betareg, biglm, binGroup, boot,\nbtergm, car, caret, cluster, coda, covr, drc, e1071, emmeans,\nepiR, ergm, fixest (>= 0.3.1), gam (>= 1.15), gamlss,\ngamlss.data, gamlss.dist, gee, geepack, ggplot2, glmnet,\nglmnetUtils, gmm, Hmisc, irlba, joineRML, Kendall, knitr, ks,\nLahman, lavaan, leaps, lfe, lm.beta, lme4, lmodel2, lmtest,\nlsmeans, maps, maptools, MASS, Matrix, mclogit, mclust,\nmediation, metafor, mfx, mgcv, modeldata, modeltests, muhaz,\nmultcomp, network, nnet, orcutt (>= 2.2), ordinal, plm, poLCA,\npsych, quantreg, rgeos, rmarkdown, robust, robustbase, rsample,\nsandwich, sp, spdep, spatialreg, speedglm, spelling,\nstatnet.common, survey, survival, systemfit, testthat (>=\n2.1.0), tseries, zoo"
## butcher           "clisymbols, testthat (>= 2.1.0), parsnip, knitr, rmarkdown,\nC50, kknn, rpart, ranger, recipes, rsample, TH.data, ipred,\nsurvival, MASS, QSARdata, caret, flexsurv, pkgload, sparklyr,\nrandomForest, kernlab, earth, covr, e1071, nnet, xgboost,\ndplyr, mda, NMF, dimRed, ddalpha, pls, fastICA, RSpectra, RANN"                                                                                                                                                                                                                                                                                                                                                                                                                                                
## callr             "cli, covr, crayon, fansi, pingr, ps, rprojroot, spelling,\ntestthat, tibble, withr (>= 2.3.0)"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
## car               "alr4, boot, coxme, knitr, leaps, lmtest, Matrix,\nMatrixModels, rgl (>= 0.93.960), sandwich, SparseM, survival,\nsurvey"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
## carData           NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
## catboost          "caret, testthat, dplyr, e1071"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
## cellranger        "covr, testthat (>= 1.0.0), knitr, rmarkdown"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
## checkmate         "R6, fastmatch, data.table (>= 1.9.8), devtools, ggplot2,\nknitr, magrittr, microbenchmark, rmarkdown, testthat (>=\n0.11.0), tinytest (>= 1.1.0), tibble"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## class             NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
## cli               "callr, covr, htmlwidgets, knitr, mockery, ps (>= 1.3.4.9000),\nrmarkdown, rstudioapi, prettycode (>= 1.1.0), testthat, withr"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
## clipr             "covr, knitr, rmarkdown, rstudioapi (>= 0.5), testthat (>=\n2.0.0)"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
## cluster           "MASS, Matrix"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
## codetools         NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
## colorspace        "datasets, utils, KernSmooth, MASS, kernlab, mvtnorm, vcd,\ntcltk, shiny, shinyjs, ggplot2, dplyr, scales, grid, png, jpeg,\nknitr, rmarkdown, RColorBrewer, rcartocolor, scico, viridis,\nwesanderson"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
## commonmark        "curl, testthat, xml2"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
## compiler          NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
## config            "testthat, knitr"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
## conquer           NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
## corrplot          "knitr, RColorBrewer, testthat"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
## covr              "R6, curl, knitr, rmarkdown, htmltools, DT (>= 0.2), testthat,\nrlang, rstudioapi (>= 0.2), xml2 (>= 1.0.0), parallel, memoise,\nmockery"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
## cowplot           "Cairo, covr, dplyr, forcats, gridGraphics (>= 0.4-0), knitr,\nlattice, magick, maps, PASWR, patchwork, rmarkdown, ragg,\ntestthat (>= 1.0.0), tidyr, vdiffr (>= 0.3.0), VennDiagram"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
## cpp11             "bench, brio, callr, cli, covr, decor, desc, ggplot2, glue,\nknitr, lobstr, mockery, progress, rmarkdown, scales, testthat,\ntibble, utils, vctrs, withr"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
## crayon            "mockery, rstudioapi, testthat, withr"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
## crosstalk         "shiny, ggplot2, testthat (>= 2.1.0)"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
## curl              "spelling, testthat (>= 1.0.0), knitr, jsonlite, rmarkdown,\nmagrittr, httpuv (>= 1.4.4), webutils"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
## data.table        "bit64, curl, R.utils, xts, nanotime, zoo, yaml, knitr,\nrmarkdown"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
## datasets          NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
## DBI               "blob, covr, hms, knitr, magrittr, rmarkdown, rprojroot,\nRSQLite (>= 1.1-2), testthat, xml2"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
## dbplyr            "bit64, covr, knitr, Lahman, nycflights13, odbc, RMariaDB (>=\n1.0.2), rmarkdown, RPostgres (>= 1.1.3), RSQLite (>= 2.1.0),\ntestthat (>= 2.0.0)"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
## DEoptimR          NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
## desc              "covr, testthat, whoami, withr"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
## devtools          "BiocManager (>= 1.30.10), curl (>= 4.3), digest (>= 0.6.25),\nfoghorn (>= 1.3.1), gmailr (>= 1.0.0), knitr (>= 1.29), lintr\n(>= 2.0.1), MASS, mockery (>= 0.4.2), pingr (>= 2.0.1), pkgdown\n(>= 1.6.1), rhub (>= 1.1.1), rmarkdown (>= 2.3), spelling (>=\n2.1)"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
## dials             "testthat, knitr, rpart, covr, kernlab, xml2, rmarkdown"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
## DiceDesign        "rgl, randtoolbox, lattice"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
## diffobj           "knitr, rmarkdown, testthat"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
## digest            "tinytest, knitr, rmarkdown, minidown"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
## diptest           NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
## doParallel        "caret, mlbench, rpart, RUnit"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
## dotCall64         "microbenchmark, OpenMPController, RColorBrewer, roxygen2,\nspam, testthat,"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
## downloader        "testthat"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## dplyr             "bench, broom, callr, covr, DBI, dbplyr (>= 1.4.3), knitr,\nLahman, lobstr, microbenchmark, nycflights13, purrr, rmarkdown,\nRMySQL, RPostgreSQL, RSQLite, testthat (>= 2.1.0), withr"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
## DT                "knitr (>= 1.8), rmarkdown, shiny (>= 1.2.0), testit"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
## ellipsis          "covr, testthat"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
## evaluate          "testthat, lattice, ggplot2"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
## extrafont         "fontcm"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
## extrafontdb       NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
## fansi             "unitizer, knitr, rmarkdown"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
## farver            "testthat (>= 2.1.0), covr"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
## fastmap           "testthat (>= 2.1.1)"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
## fields            NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
## flexmix           "actuar, codetools, diptest, Ecdat, ellipse, gclus, glmnet,\nlme4 (>= 1.1), MASS, mgcv (>= 1.8-0), mlbench, multcomp,\nmvtnorm, SuppDists, survival"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
## flextable         "testthat (>= 2.1.0), xtable, magrittr, webshot, magick,\nggplot2, scales, broom"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
## forcats           "covr, ggplot2, testthat, readr, knitr, rmarkdown, dplyr"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
## foreach           "randomForest, doMC, doParallel, testthat, knitr, rmarkdown"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
## forecast          "uroot, knitr, rmarkdown, rticles, testthat, methods"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
## foreign           NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
## formattable       "testthat, DT, shiny, covr"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
## Formula           NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
## fpc               "tclust, pdfCluster, EMMIXskew, mvtnorm"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
## fracdiff          "longmemo, forecast, urca"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## freesurferformats "knitr, rmarkdown, testthat (>= 2.1.0), oro.nifti (>= 0.9),\ngifti (>= 0.7.5), cifti (>= 0.4.5)"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
## fs                "testthat, covr, pillar (>= 1.0.0), tibble (>= 1.1.0), crayon,\nrmarkdown, knitr, withr, spelling, vctrs (>= 0.3.0)"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
## fsbrain           "knitr, rmarkdown, testthat (>= 2.1.0), sphereplot (>= 1.5),\nmagick, misc3d, viridis, RColorBrewer"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
## furrr             "listenv (>= 0.6.0), dplyr (>= 0.7.4), testthat"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
## future            "RhpcBLASctl, R.rsp, markdown"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
## gdtools           "htmltools, testthat, fontquiver (>= 0.2.0), curl"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
## generics          "covr, pkgload, testthat, tibble"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
## ggalluvial        "grid, alluvial, testthat, knitr, rmarkdown, babynames,\nsessioninfo, ggrepel, ggfittext (>= 0.6), vdiffr (>= 0.2)"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
## GGally            "broom (>= 0.4.0), chemometrics, geosphere (>= 1.5-1),\nggforce, Hmisc, igraph (>= 1.0.1), intergraph (>= 2.0-2), maps\n(>= 3.1.0), mapproj, network (>= 1.12.0), scagnostics, sna (>=\n2.3-2), survival, rmarkdown, roxygen2, testthat, crosstalk,\nknitr, spelling"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
## ggh4x             "covr, digest, fitdistrplus, ggdendro, knitr, MASS, reshape2,\nrlang, rmarkdown, stats, testthat (>= 2.1.0), utils"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
## ggplot2           "covr, dplyr, ggplot2movies, hexbin, Hmisc, knitr, lattice,\nmapproj, maps, maptools, multcomp, munsell, nlme, profvis,\nquantreg, RColorBrewer, rgeos, rmarkdown, rpart, sf (>= 0.7-3),\nsvglite (>= 1.2.0.9001), testthat (>= 2.1.0), vdiffr (>= 0.3.0)"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## ggpubr            "grDevices, knitr, RColorBrewer, gtable"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
## ggrepel           "knitr, rmarkdown, testthat, gridExtra, devtools, prettydoc"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
## ggridges          "covr, dplyr, patchwork, ggplot2movies, forcats, knitr,\nrmarkdown, testthat, vdiffr"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
## ggsci             "knitr, rmarkdown, gridExtra, reshape2"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
## ggsignif          "testthat, knitr, rmarkdown"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
## gh                "covr, keyring, pingr, testthat, withr"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
## git2r             "getPass"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
## glmnet            "knitr, lars, testthat"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
## globals           NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
## glue              "testthat, covr, magrittr, crayon, knitr, rmarkdown, DBI,\nRSQLite, R.utils, forcats, microbenchmark, rprintf, stringr,\nggplot2, dplyr, withr, vctrs (>= 0.3.0)"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
## gower             "tinytest (>= 0.9.3),"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
## GPfit             "testthat"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## graphics          NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
## grDevices         "KernSmooth"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
## grid              "lattice"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
## gridExtra         "ggplot2, egg, lattice, knitr, testthat"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
## gtable            "covr, testthat, knitr, rmarkdown, ggplot2, profvis"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
## hardhat           "covr, crayon, devtools, knitr, modeldata (>= 0.0.2), recipes\n(>= 0.1.8), rmarkdown (>= 2.3), roxygen2, testthat (>= 2.1.0),\nusethis"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
## haven             "covr, fs, knitr, rmarkdown, testthat, pillar (>= 1.4.0), cli,\ncrayon"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
## highr             "knitr, testit"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
## Hmisc             "acepack, chron, rms, mice, tables, knitr, plotly (>= 4.5.6),\nrlang, plyr"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
## hms               "crayon, lubridate, pillar (>= 1.1.0), testthat"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
## htmlTable         "testthat, XML, xml2, Hmisc, reshape, rmarkdown, chron,\nlubridate, tibble, purrr, tidyselect, glue, rlang, tidyr (>=\n0.7.2), dplyr (>= 0.7.4)"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
## htmltools         "markdown, testthat, withr, Cairo, ragg"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
## htmlwidgets       "knitr (>= 1.8)"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
## httpuv            "testthat, callr, curl, websocket"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
## httr              "covr, httpuv, jpeg, knitr, png, readr, rmarkdown, testthat\n(>= 0.8.0), xml2"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
## huxtable          "AER, bookdown, broom (>= 0.5.1), broom.mixed, covr, crayon,\ndevtools, dplyr (>= 0.7.0), fansi, flextable (>= 0.5.5),\nftExtra (>= 0.0.2), ggplot2, httr, knitr, lme4, lmtest, nlme,\nnnet, officer, openxlsx, psych, rmarkdown, sandwich, scales,\ntestthat, tibble, tinytex"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
## igraph            "ape, digest, graph, igraphdata, rgl, scales, stats4, tcltk,\ntestthat, withr"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
## imager            "knitr, rmarkdown,ggplot2,dplyr,scales,\ntestthat,OpenMPController,raster,spatstat, magick,Cairo"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
## infer             "broom, devtools (>= 1.12.0), knitr, tidyr, rmarkdown,\nnycflights13, stringr, testthat, covr, vdiffr, fs"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## ini               "testthat"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## ipred             "mvtnorm, mlbench, TH.data"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
## isoband           "covr, ggplot2, knitr, magick, microbenchmark, rmarkdown, sf,\ntestthat"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
## iterators         "RUnit, foreach"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
## janitor           "knitr, rmarkdown, sf, testthat, tibble, tidygraph"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
## jpeg              NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
## jsonlite          "httr, curl, plyr, testthat, knitr, rmarkdown, R.rsp, sf"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
## keras             "ggplot2, testthat (>= 2.1.0), knitr, rmarkdown, tfdatasets,\njpeg"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
## kernlab           NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
## KernSmooth        "MASS"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
## knitr             "formatR, testit, digest, rgl (>= 0.95.1201), codetools,\nrmarkdown, htmlwidgets (>= 0.7), webshot, tikzDevice (>= 0.10),\ntinytex, reticulate (>= 1.4), JuliaCall (>= 0.11.1), magick,\npng, jpeg, gifski, xml2 (>= 1.2.0), httr, DBI (>= 0.4-1),\nshowtext, tibble, sass, ragg, styler (>= 1.2.0)"                                                                                                                                                                                                                                                                                                                                                                                                                                                                
## labeling          NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
## later             "knitr, rmarkdown, testthat"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
## lattice           "KernSmooth, MASS, latticeExtra"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
## latticeExtra      "maps, mapproj, deldir, tripack, quantreg, zoo, MASS, mgcv"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
## lava              "KernSmooth, Matrix, Rgraphviz, data.table, ellipse, fields,\nforeach, geepack, gof (>= 0.9), graph, knitr, bookdown,\nrmarkdown, igraph (>= 0.6), lava.tobit (>= 0.4.7), lavaSearch2,\nlme4, magrittr, mets (>= 1.1), nlme, optimx, polycor, quantreg,\nrgl, R.rsp (>= 0.40), testthat (>= 0.11), visNetwork, zoo"                                                                                                                                                                                                                                                                                                                                                                                                                                                 
## lazyeval          "knitr, rmarkdown (>= 0.2.65), testthat, covr"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
## learnr            "testthat (>= 2.1.0), callr, rlang"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
## lhs               "testthat, assertthat, DoE.base, knitr, rmarkdown, covr"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
## lifecycle         "covr, crayon, knitr, rmarkdown, testthat (>= 2.1.0)"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
## lightgbm          "testthat"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## listenv           "R.utils, R.rsp, markdown"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## lme4              "knitr, rmarkdown, PKPDmodels, MEMSS, testthat (>= 0.8.1),\nggplot2, mlmRev, optimx (>= 2013.8.6), gamm4, pbkrtest, HSAUR2,\nnumDeriv, car, dfoptim"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
## lmtest            "car, strucchange, sandwich, dynlm, stats4, survival, AER"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## lobstr            "covr, pillar, pkgdown, testthat"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
## lubridate         "covr, knitr, testthat (>= 2.1.0), vctrs (>= 0.3.0)"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
## magick            "av (>= 0.3), spelling, jsonlite, methods, knitr, rmarkdown,\nrsvg, webp, pdftools, ggplot2, gapminder, IRdisplay, tesseract\n(>= 2.0), gifski"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
## magrittr          "covr, knitr, rlang, rmarkdown, testthat"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
## manipulateWidget  "dygraphs, leaflet, plotly, xts, rmarkdown, testthat, covr"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
## maps              "mapproj (>= 1.2-0), mapdata (>= 2.3.0), sp, maptools,\nrnaturalearth"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
## maptools          "rgeos (>= 0.1-8), spatstat (>= 1.60), PBSmapping, maps,\nRColorBrewer, raster, polyclip, spatstat.utils, plotrix"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
## markdown          "knitr, RCurl"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
## MASS              "lattice, nlme, nnet, survival"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
## mathjaxr          NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
## Matrix            "expm, MASS"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
## MatrixModels      NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
## matrixStats       "base64enc, ggplot2, knitr, microbenchmark, R.devices, R.rsp"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
## mclust            "knitr (>= 1.12), rmarkdown (>= 0.9), mix (>= 1.0), geometry\n(>= 0.3-6), MASS"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
## memoise           "testthat, aws.s3, httr, covr"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
## methods           "codetools"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
## mgcv              "parallel, survival, MASS"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## mime              NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
## miniUI            NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
## minqa             NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
## modeldata         "covr"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
## modelr            "compiler, covr, ggplot2, testthat"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
## modeltools        NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
## moments           NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
## munsell           "ggplot2, testthat"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
## nlme              "Hmisc, MASS"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
## nloptr            "testthat (>= 0.8.1), knitr, rmarkdown, inline (>= 0.3.14)"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
## nnet              "MASS"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
## nullabor          "reshape2, knitr"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
## numDeriv          NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
## odbc              "covr, DBItest, magrittr, RSQLite, testthat, tibble"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
## officer           "testthat, devEMF,tibble,ggplot2, rmarkdown, base64enc, knitr,\nrsvg"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
## openssl           "testthat (>= 2.1.0), digest, knitr, rmarkdown, jsonlite,\njose, sodium"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
## openxlsx          "knitr, testthat, roxygen2, rmarkdown"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
## packrat           "testthat (>= 0.7), devtools, httr, knitr, rmarkdown"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
## parallel          "methods"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
## parsnip           "testthat, knitr, rmarkdown, survival, keras, xgboost, covr,\nC50, sparklyr (>= 1.0.0), earth, kernlab, kknn, randomForest,\nranger (>= 0.12.0), rpart, MASS, nlme, modeldata, liquidSVM,\nMatrix"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
## patchwork         "knitr, rmarkdown, gridGraphics, gridExtra, ragg, testthat (>=\n2.1.0), vdiffr, covr"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
## pbapply           NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
## pbkrtest          NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
## pillar            "bit64, knitr, lubridate, testthat (>= 2.0.0), withr"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
## pkgbuild          "Rcpp, cpp11, testthat, covr"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
## pkgconfig         "covr, testthat, disposables (>= 1.0.3)"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
## pkgfilecache      "knitr, rmarkdown, testthat (>= 2.1.0)"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
## pkgload           "bitops, covr, Rcpp, testthat"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
## plyr              "abind, covr, doParallel, foreach, iterators, itertools,\ntcltk, testthat"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## png               NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
## polynom           "knitr, rmarkdown"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
## prabclus          "spdep, spatialreg, bootstrap, maptools, foreign, mvtnorm"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## praise            "testthat"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## prettyunits       "codetools, covr, testthat"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
## pROC              "microbenchmark, tcltk, MASS, logcondens, doParallel,\ntestthat, vdiffr, ggplot2"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
## processx          "callr (>= 3.2.0), codetools, covr, crayon, curl, debugme,\nparallel, testthat, withr"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
## prodlim           NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
## progress          "Rcpp, testthat, withr"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
## promises          "testthat, future, knitr, rmarkdown"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
## ps                "callr, covr, curl, pingr, processx (>= 3.1.0), R6, rlang,\ntestthat, tibble"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
## purrr             "covr, crayon, dplyr (>= 0.7.8), knitr, rmarkdown, testthat,\ntibble, tidyselect"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
## quadprog          NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
## quantmod          "DBI,RMySQL,RSQLite,timeSeries,XML,downloader,jsonlite(>= 1.1)"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
## quantreg          "tripack, akima, MASS, survival, rgl, logspline, nor1mix,\nFormula, zoo, R.rsp"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
## R6                "knitr, microbenchmark, pryr, testthat, ggplot2, scales"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
## randomForest      "RColorBrewer, MASS"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
## ranger            "survival, testthat"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
## rappdirs          "testthat, roxygen2"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
## rcmdcheck         "covr, knitr, mockery, rmarkdown, testthat"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
## RColorBrewer      NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
## Rcpp              "tinytest, inline, rbenchmark, pkgKitten (>= 0.1.2)"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
## RcppArmadillo     "tinytest, Matrix, pkgKitten, reticulate, slam"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
## RcppEigen         "inline, tinytest, pkgKitten, microbenchmark"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
## readbitmap        "pixmap, testthat"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
## readr             "covr, curl, dplyr, knitr, rmarkdown, spelling, stringi,\ntestthat, xml2"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
## readxl            "covr, knitr, rmarkdown, rprojroot (>= 1.1), testthat"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
## readxlsb          "knitr, rmarkdown"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
## recipes           "covr, ddalpha, dimRed (>= 0.2.2), fastICA, ggplot2, igraph,\nkernlab, knitr, modeldata, RANN, RcppRoll, rmarkdown, rpart,\nrsample, RSpectra, testthat (>= 2.1.0), xml2"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
## rematch           "covr, testthat"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
## rematch2          "covr, testthat"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
## remotes           "brew, callr, codetools, curl, covr, git2r (>= 0.23.0), knitr,\nmockery, pkgbuild (>= 1.0.1), pingr, rmarkdown, rprojroot,\ntestthat, withr"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
## renv              "R6, cli, covr, devtools, knitr, packrat, remotes, reticulate,\nrmarkdown, rstudioapi, testthat, uuid, yaml"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
## reprex            "covr, devtools, fortunes, knitr, miniUI, rprojroot,\nrstudioapi, shiny, styler (>= 1.0.2), testthat (>= 2.0.0)"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
## reshape           NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
## reticulate        "callr, knitr, rmarkdown, testthat"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
## rex               "testthat, knitr, rmarkdown, dplyr, ggplot2, magrittr, Hmisc,\nstringr, rvest, roxygen2, covr"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
## rgl               "MASS, rmarkdown, deldir, orientlib, lattice, misc3d,\nrstudioapi, magick, plotrix (>= 3.7-3), tripack, interp,\nalphashape3d, tcltk, js (>= 1.2), akima"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
## rio               "datasets, bit64, testthat, knitr, magrittr, clipr, csvy,\nfeather, fst, hexView, jsonlite, readODS (>= 1.6.4), readr,\nrmatio, xml2 (>= 1.2.0), yaml"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
## rJava             NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
## RJDBC             NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
## rlang             "cli, covr, crayon, glue, magrittr, methods, pillar,\nrmarkdown, testthat (>= 2.3.0), vctrs (>= 0.2.3), withr"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
## rmarkdown         "shiny (>= 0.11), tufte, testthat, digest, dygraphs, vctrs,\ntibble, fs, rsconnect"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
## robustbase        "grid, MASS, lattice, boot, cluster, Matrix, robust,\nfit.models, MPV, xtable, ggplot2, GGally, RColorBrewer,\nreshape2, sfsmisc, catdata, doParallel, foreach, skewt"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
## roxygen2          "covr, devtools, rmarkdown, testthat (>= 2.1.0), R.methodsS3,\nR.oo"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
## rpart             "survival"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## rprojroot         "testthat, mockr, knitr, withr, rmarkdown"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## rsample           "ggplot2, testthat, rmarkdown, knitr, AmesHousing, recipes (>=\n0.1.4), broom, xml2, covr"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## rsconnect         "RCurl, callr, httpuv, knitr, plumber (>= 0.3.2), reticulate,\nrmarkdown (>= 1.1), shiny, sourcetools, testthat, xtable"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
## rstatix           "knitr, rmarkdown, ggpubr, graphics, emmeans, coin, boot,\ntestthat, spelling"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
## rstudioapi        "testthat, knitr, rmarkdown, clipr"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
## Rttf2pt1          NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
## rversions         "mockery, testthat"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
## rvest             "covr, knitr, png, rmarkdown, spelling, stringi (>= 0.3.1),\ntestthat"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
## rvg               "rmarkdown, htmltools, testthat, covr, grid, knitr"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
## scales            "bit64, covr, dichromat, ggplot2, hms (>= 0.5.0), testthat (>=\n2.1.0)"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
## selectr           "testthat, XML, xml2"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
## sessioninfo       "callr, covr, mockery, testthat"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
## shape             NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
## shiny             "datasets, Cairo (>= 1.5-5), testthat (>= 2.1.1), knitr (>=\n1.6), markdown, rmarkdown, ggplot2, reactlog (>= 1.0.0),\nmagrittr, shinytest, yaml, future, dygraphs, ragg, showtext"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
## slider            "covr, dplyr (>= 0.8.3), knitr, lubridate, rmarkdown, testthat\n(>= 2.1.0), xml2"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
## snakecase         "testthat, covr, tibble, purrrlyr, knitr, rmarkdown, magrittr"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
## sourcetools       "testthat"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## sp                "RColorBrewer, rgdal (>= 1.2-3), rgeos (>= 0.3-13), gstat,\nmaptools, deldir"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
## spam              "spam64, fields, SparseM, Matrix, testthat, R.rsp, truncdist,\nknitr, rmarkdown"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
## sparkline         "formattable, knitr, rmarkdown, shiny"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
## SparseM           NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
## spatial           "MASS"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
## splines           "Matrix, methods"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
## SQUAREM           "setRNG"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
## squash            NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
## stacks            "testthat, covr, kernlab, knitr, modeldata, rmarkdown,\npalmerpenguins, ranger, nnet, broom"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
## statmod           "MASS, tweedie"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
## stats             "MASS, Matrix, SuppDists, methods, stats4"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## stats4            NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
## stringi           NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
## stringr           "covr, htmltools, htmlwidgets, knitr, rmarkdown, testthat"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## survival          NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
## sys               "unix (>= 1.4), spelling, testthat"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
## systemfonts       "testthat (>= 2.1.0), covr, knitr, rmarkdown, tools"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
## tcltk             NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
## tensorflow        "testthat (>= 2.1.0), keras, tfestimators, callr"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
## testthat          "covr, curl (>= 0.9.5), diffviewer (>= 0.1.0), knitr, mockery,\nrmarkdown, rstudioapi, shiny, usethis, vctrs (>= 0.1.0), xml2"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
## tfruns            "testthat, knitr"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
## tibble            "bench, bit64, blob, covr, dplyr, evaluate, formattable, hms,\nhtmltools, import, knitr, lubridate, mockr, nycflights13,\npurrr, rmarkdown, testthat (>= 2.1.0), tidyr, withr"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
## tidymodels        "covr, knitr, rmarkdown, testthat, xml2"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
## tidyr             "covr, jsonlite, knitr, repurrrsive (>= 1.0.0), rmarkdown,\nreadr, testthat (>= 2.1.0)"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
## tidyselect        "covr, crayon, dplyr, knitr, magrittr, rmarkdown, testthat (>=\n2.3.0), tibble (>= 2.1.3), withr"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
## tidyverse         "covr, feather, glue, knitr, rmarkdown, testthat"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
## tiff              NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
## timeDate          "date, RUnit"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
## tinytex           "testit, rstudioapi"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
## tools             "codetools, methods, xml2, curl, commonmark"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
## tree              "MASS"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
## treesnip          "testthat (>= 2.1.0), tidymodels, catboost, modeldata,\nlightgbm, knitr, rmarkdown, readr"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## tseries           NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
## tsibble           "covr, furrr, ggplot2 (>= 3.3.0), hms, knitr, nanotime,\nnycflights13 (>= 1.0.0), rmarkdown, scales (>= 1.1.0),\nspelling, testthat (>= 2.3.2), tidyr (>= 1.1.0), timeDate"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
## TTR               "RUnit"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
## tune              "testthat, knitr, covr, kernlab, randomForest, modeldata,\nxml2, spelling"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## urca              NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
## usethis           "covr, knitr, magick, pkgdown (>= 1.4.0), rmarkdown, roxygen2,\nspelling (>= 1.2), styler (>= 1.2.0), testthat (>= 2.1.0)"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## utf8              "knitr, rmarkdown, testthat"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
## utils             "methods, xml2, commonmark"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
## uuid              NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
## vctrs             "bit64, covr, crayon, dplyr (>= 0.8.5), generics, knitr,\npillar (>= 1.4.4), pkgdown, rmarkdown, testthat (>= 2.3.0),\ntibble, withr, xml2, waldo (>= 0.2.0), zeallot"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
## viridis           "hexbin (>= 1.27.0), scales, MASS, knitr, dichromat,\ncolorspace, rasterVis, httr, mapproj, vdiffr, svglite (>=\n1.2.0), testthat, covr, rmarkdown, rgdal"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## viridisLite       "hexbin (>= 1.27.0), ggplot2 (>= 1.0.1), testthat, covr"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
## waldo             "testthat, covr, R6"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
## warp              "covr, testthat (>= 2.1.0), knitr, rmarkdown"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
## webshot           "httpuv, knitr, rmarkdown, shiny"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
## whisker           "markdown"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
## withr             "covr, DBI, knitr, lattice, methods, rmarkdown, RSQLite,\ntestthat (>= 2.1.0)"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
## workflows         "covr, knitr, magrittr, modeldata (>= 0.0.2), recipes,\nrmarkdown, testthat (>= 2.3.0)"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
## writexl           "spelling, readxl, nycflights13, testthat, bit64"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
## xfun              "testit, parallel, codetools, rstudioapi, tinytex, mime,\nmarkdown, knitr, htmltools, remotes, rmarkdown"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
## xgboost           "knitr, rmarkdown, ggplot2 (>= 1.0.1), DiagrammeR (>= 0.9.0),\nCkmeans.1d.dp (>= 3.3.1), vcd (>= 1.3), testthat, lintr, igraph\n(>= 1.0.1), jsonlite, float, crayon"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
## XLConnect         "RUnit, lattice, ggplot2 (>= 0.9.3), zoo"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
## xlsx              "rprojroot, testthat, covr, tibble, knitr, rmarkdown,\nRefManageR"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
## xlsxjars          NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
## xml2              "covr, curl, httr, knitr, magrittr, mockery, rmarkdown,\ntestthat (>= 2.1.0)"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
## xopen             "ps, testthat"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
## xtable            "knitr, plm, zoo, survival"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
## xts               "timeSeries, timeDate, tseries, chron, fts, tis, RUnit"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
## yaml              "RUnit"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
## yardstick         "covr, crayon, ggplot2, kableExtra, knitr, purrr, rmarkdown,\ntestthat, tidyr"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
## zeallot           "testthat, knitr, rmarkdown, purrr, magrittr"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
## zip               "covr, processx, R6, testthat, withr"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
## zoo               "AER, coda, chron, fts, ggplot2 (>= 3.0.0), mondate, scales,\nstrucchange, timeDate, timeSeries, tis, tseries, xts"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
##                   Enhances                               
## A3                NA                                     
## abind             NA                                     
## alluvial          NA                                     
## AmesHousing       NA                                     
## AnomalyDetection  NA                                     
## anytime           NA                                     
## askpass           NA                                     
## assertthat        NA                                     
## awtools           NA                                     
## backports         NA                                     
## base              NA                                     
## base64enc         "png"                                  
## BH                NA                                     
## bit               NA                                     
## bit64             NA                                     
## blob              NA                                     
## bmp               NA                                     
## bookdown          NA                                     
## boot              NA                                     
## brew              NA                                     
## brio              NA                                     
## broom             NA                                     
## butcher           NA                                     
## callr             NA                                     
## car               NA                                     
## carData           NA                                     
## catboost          NA                                     
## cellranger        NA                                     
## checkmate         NA                                     
## class             NA                                     
## cli               NA                                     
## clipr             NA                                     
## cluster           NA                                     
## codetools         NA                                     
## colorspace        NA                                     
## commonmark        NA                                     
## compiler          NA                                     
## config            NA                                     
## conquer           NA                                     
## corrplot          NA                                     
## covr              NA                                     
## cowplot           NA                                     
## cpp11             NA                                     
## crayon            NA                                     
## crosstalk         NA                                     
## curl              NA                                     
## data.table        NA                                     
## datasets          NA                                     
## DBI               NA                                     
## dbplyr            NA                                     
## DEoptimR          "robustbase"                           
## desc              NA                                     
## devtools          NA                                     
## dials             NA                                     
## DiceDesign        NA                                     
## diffobj           NA                                     
## digest            NA                                     
## diptest           NA                                     
## doParallel        "compiler"                             
## dotCall64         NA                                     
## downloader        NA                                     
## dplyr             NA                                     
## DT                NA                                     
## ellipsis          NA                                     
## evaluate          NA                                     
## extrafont         NA                                     
## extrafontdb       NA                                     
## fansi             NA                                     
## farver            NA                                     
## fastmap           NA                                     
## fields            NA                                     
## flexmix           NA                                     
## flextable         NA                                     
## forcats           NA                                     
## foreach           NA                                     
## forecast          NA                                     
## foreign           NA                                     
## formattable       NA                                     
## Formula           NA                                     
## fpc               NA                                     
## fracdiff          NA                                     
## freesurferformats NA                                     
## fs                NA                                     
## fsbrain           NA                                     
## furrr             NA                                     
## future            NA                                     
## gdtools           NA                                     
## generics          NA                                     
## ggalluvial        NA                                     
## GGally            NA                                     
## ggh4x             NA                                     
## ggplot2           "sp"                                   
## ggpubr            NA                                     
## ggrepel           NA                                     
## ggridges          NA                                     
## ggsci             NA                                     
## ggsignif          NA                                     
## gh                NA                                     
## git2r             NA                                     
## glmnet            NA                                     
## globals           NA                                     
## glue              NA                                     
## gower             NA                                     
## GPfit             NA                                     
## graphics          NA                                     
## grDevices         NA                                     
## grid              NA                                     
## gridExtra         NA                                     
## gtable            NA                                     
## hardhat           NA                                     
## haven             NA                                     
## highr             NA                                     
## Hmisc             NA                                     
## hms               NA                                     
## htmlTable         NA                                     
## htmltools         "knitr"                                
## htmlwidgets       "shiny (>= 1.1)"                       
## httpuv            NA                                     
## httr              NA                                     
## huxtable          NA                                     
## igraph            NA                                     
## imager            NA                                     
## infer             NA                                     
## ini               NA                                     
## ipred             NA                                     
## isoband           NA                                     
## iterators         NA                                     
## janitor           NA                                     
## jpeg              NA                                     
## jsonlite          NA                                     
## keras             NA                                     
## kernlab           NA                                     
## KernSmooth        NA                                     
## knitr             NA                                     
## labeling          NA                                     
## later             NA                                     
## lattice           "chron"                                
## latticeExtra      NA                                     
## lava              NA                                     
## lazyeval          NA                                     
## learnr            NA                                     
## lhs               NA                                     
## lifecycle         NA                                     
## lightgbm          NA                                     
## listenv           NA                                     
## lme4              NA                                     
## lmtest            NA                                     
## lobstr            NA                                     
## lubridate         "chron, timeDate, tis, zoo"            
## magick            NA                                     
## magrittr          NA                                     
## manipulateWidget  NA                                     
## maps              NA                                     
## maptools          "gpclib"                               
## markdown          NA                                     
## MASS              NA                                     
## mathjaxr          NA                                     
## Matrix            "MatrixModels, graph, SparseM, sfsmisc"
## MatrixModels      NA                                     
## matrixStats       NA                                     
## mclust            NA                                     
## memoise           NA                                     
## methods           NA                                     
## mgcv              NA                                     
## mime              NA                                     
## miniUI            NA                                     
## minqa             NA                                     
## modeldata         NA                                     
## modelr            NA                                     
## modeltools        NA                                     
## moments           NA                                     
## munsell           NA                                     
## nlme              NA                                     
## nloptr            NA                                     
## nnet              NA                                     
## nullabor          NA                                     
## numDeriv          NA                                     
## odbc              NA                                     
## officer           NA                                     
## openssl           NA                                     
## openxlsx          NA                                     
## packrat           NA                                     
## parallel          "snow, nws, Rmpi"                      
## parsnip           NA                                     
## patchwork         NA                                     
## pbapply           NA                                     
## pbkrtest          NA                                     
## pillar            NA                                     
## pkgbuild          NA                                     
## pkgconfig         NA                                     
## pkgfilecache      NA                                     
## pkgload           NA                                     
## plyr              NA                                     
## png               NA                                     
## polynom           NA                                     
## prabclus          NA                                     
## praise            NA                                     
## prettyunits       NA                                     
## pROC              NA                                     
## processx          NA                                     
## prodlim           NA                                     
## progress          NA                                     
## promises          NA                                     
## ps                NA                                     
## purrr             NA                                     
## quadprog          NA                                     
## quantmod          NA                                     
## quantreg          NA                                     
## R6                NA                                     
## randomForest      NA                                     
## ranger            NA                                     
## rappdirs          NA                                     
## rcmdcheck         NA                                     
## RColorBrewer      NA                                     
## Rcpp              NA                                     
## RcppArmadillo     NA                                     
## RcppEigen         NA                                     
## readbitmap        NA                                     
## readr             NA                                     
## readxl            NA                                     
## readxlsb          NA                                     
## recipes           NA                                     
## rematch           NA                                     
## rematch2          NA                                     
## remotes           NA                                     
## renv              NA                                     
## reprex            NA                                     
## reshape           NA                                     
## reticulate        NA                                     
## rex               NA                                     
## rgl               NA                                     
## rio               NA                                     
## rJava             NA                                     
## RJDBC             NA                                     
## rlang             "winch"                                
## rmarkdown         NA                                     
## robustbase        NA                                     
## roxygen2          NA                                     
## rpart             NA                                     
## rprojroot         NA                                     
## rsample           NA                                     
## rsconnect         NA                                     
## rstatix           NA                                     
## rstudioapi        NA                                     
## Rttf2pt1          NA                                     
## rversions         NA                                     
## rvest             NA                                     
## rvg               NA                                     
## scales            NA                                     
## selectr           NA                                     
## sessioninfo       NA                                     
## shape             NA                                     
## shiny             NA                                     
## slider            NA                                     
## snakecase         NA                                     
## sourcetools       NA                                     
## sp                NA                                     
## spam              NA                                     
## sparkline         NA                                     
## SparseM           NA                                     
## spatial           NA                                     
## splines           NA                                     
## SQUAREM           NA                                     
## squash            NA                                     
## stacks            NA                                     
## statmod           NA                                     
## stats             NA                                     
## stats4            NA                                     
## stringi           NA                                     
## stringr           NA                                     
## survival          NA                                     
## sys               NA                                     
## systemfonts       NA                                     
## tcltk             NA                                     
## tensorflow        NA                                     
## testthat          NA                                     
## tfruns            NA                                     
## tibble            NA                                     
## tidymodels        NA                                     
## tidyr             NA                                     
## tidyselect        NA                                     
## tidyverse         NA                                     
## tiff              NA                                     
## timeDate          NA                                     
## tinytex           NA                                     
## tools             NA                                     
## tree              NA                                     
## treesnip          NA                                     
## tseries           NA                                     
## tsibble           NA                                     
## TTR               "quantmod"                             
## tune              NA                                     
## urca              NA                                     
## usethis           NA                                     
## utf8              NA                                     
## utils             NA                                     
## uuid              NA                                     
## vctrs             NA                                     
## viridis           NA                                     
## viridisLite       NA                                     
## waldo             NA                                     
## warp              NA                                     
## webshot           NA                                     
## whisker           NA                                     
## withr             NA                                     
## workflows         NA                                     
## writexl           NA                                     
## xfun              NA                                     
## xgboost           NA                                     
## XLConnect         NA                                     
## xlsx              NA                                     
## xlsxjars          NA                                     
## xml2              NA                                     
## xopen             NA                                     
## xtable            NA                                     
## xts               NA                                     
## yaml              NA                                     
## yardstick         NA                                     
## zeallot           NA                                     
## zip               NA                                     
## zoo               NA                                     
##                   License                                  License_is_FOSS
## A3                "GPL (>= 2)"                             NA             
## abind             "LGPL (>= 2)"                            NA             
## alluvial          "MIT + file LICENSE"                     NA             
## AmesHousing       "GPL-2"                                  NA             
## AnomalyDetection  "GPL-3"                                  NA             
## anytime           "GPL (>= 2)"                             NA             
## askpass           "MIT + file LICENSE"                     NA             
## assertthat        "GPL-3"                                  NA             
## awtools           "MIT"                                    NA             
## backports         "GPL-2 | GPL-3"                          NA             
## base              "Part of R 4.0.2"                        NA             
## base64enc         "GPL-2 | GPL-3"                          NA             
## BH                "BSL-1.0"                                NA             
## bit               "GPL-2 | GPL-3"                          NA             
## bit64             "GPL-2 | GPL-3"                          NA             
## blob              "GPL-3"                                  NA             
## bmp               "GPL (>= 2)"                             NA             
## bookdown          "GPL-3"                                  NA             
## boot              "Unlimited"                              NA             
## brew              "GPL-2"                                  NA             
## brio              "MIT + file LICENSE"                     NA             
## broom             "MIT + file LICENSE"                     NA             
## butcher           "MIT + file LICENSE"                     NA             
## callr             "MIT + file LICENSE"                     NA             
## car               "GPL (>= 2)"                             NA             
## carData           "GPL (>= 2)"                             NA             
## catboost          "Apache License (== 2.0)"                NA             
## cellranger        "MIT + file LICENSE"                     NA             
## checkmate         "BSD_3_clause + file LICENSE"            NA             
## class             "GPL-2 | GPL-3"                          NA             
## cli               "MIT + file LICENSE"                     NA             
## clipr             "GPL-3"                                  NA             
## cluster           "GPL (>= 2)"                             NA             
## codetools         "GPL"                                    NA             
## colorspace        "BSD_3_clause + file LICENSE"            NA             
## commonmark        "BSD_2_clause + file LICENSE"            NA             
## compiler          "Part of R 4.0.2"                        NA             
## config            "GPL-3"                                  NA             
## conquer           "GPL-3"                                  NA             
## corrplot          "GPL"                                    NA             
## covr              "GPL-3"                                  NA             
## cowplot           "GPL-2"                                  NA             
## cpp11             "MIT + file LICENSE"                     NA             
## crayon            "MIT + file LICENSE"                     NA             
## crosstalk         "MIT + file LICENSE"                     NA             
## curl              "MIT + file LICENSE"                     NA             
## data.table        "MPL-2.0 | file LICENSE"                 NA             
## datasets          "Part of R 4.0.2"                        NA             
## DBI               "LGPL (>= 2.1)"                          NA             
## dbplyr            "MIT + file LICENSE"                     NA             
## DEoptimR          "GPL (>= 2)"                             NA             
## desc              "MIT + file LICENSE"                     NA             
## devtools          "GPL (>= 2)"                             NA             
## dials             "GPL-2"                                  NA             
## DiceDesign        "GPL-3"                                  NA             
## diffobj           "GPL (>= 2)"                             NA             
## digest            "GPL (>= 2)"                             NA             
## diptest           "GPL (>= 2)"                             NA             
## doParallel        "GPL-2"                                  NA             
## dotCall64         "GPL (>= 2)"                             NA             
## downloader        "GPL-2"                                  NA             
## dplyr             "MIT + file LICENSE"                     NA             
## DT                "GPL-3 | file LICENSE"                   NA             
## ellipsis          "GPL-3"                                  NA             
## evaluate          "MIT + file LICENSE"                     NA             
## extrafont         "GPL-2"                                  NA             
## extrafontdb       "GPL-2"                                  NA             
## fansi             "GPL (>= 2)"                             NA             
## farver            "MIT + file LICENSE"                     NA             
## fastmap           "MIT + file LICENSE"                     NA             
## fields            "GPL (>= 2)"                             NA             
## flexmix           "GPL (>= 2)"                             NA             
## flextable         "GPL-3"                                  NA             
## forcats           "GPL-3"                                  NA             
## foreach           "Apache License (== 2.0)"                NA             
## forecast          "GPL-3"                                  NA             
## foreign           "GPL (>= 2)"                             NA             
## formattable       "MIT + file LICENSE"                     NA             
## Formula           "GPL-2 | GPL-3"                          NA             
## fpc               "GPL"                                    NA             
## fracdiff          "GPL (>= 2)"                             NA             
## freesurferformats "MIT + file LICENSE"                     NA             
## fs                "GPL-3"                                  NA             
## fsbrain           "MIT + file LICENSE"                     NA             
## furrr             "LGPL (>= 2.1)"                          NA             
## future            "LGPL (>= 2.1)"                          NA             
## gdtools           "GPL-3 | file LICENSE"                   NA             
## generics          "GPL-2"                                  NA             
## ggalluvial        "GPL-3"                                  NA             
## GGally            "GPL (>= 2.0)"                           NA             
## ggh4x             "GPL-3"                                  NA             
## ggplot2           "GPL-2 | file LICENSE"                   NA             
## ggpubr            "GPL-2"                                  NA             
## ggrepel           "GPL-3 | file LICENSE"                   NA             
## ggridges          "GPL-2 | file LICENSE"                   NA             
## ggsci             "GPL-3 | file LICENSE"                   NA             
## ggsignif          "GPL-3"                                  NA             
## gh                "MIT + file LICENSE"                     NA             
## git2r             "GPL-2"                                  NA             
## glmnet            "GPL-2"                                  NA             
## globals           "LGPL (>= 2.1)"                          NA             
## glue              "MIT + file LICENSE"                     NA             
## gower             "GPL-3"                                  NA             
## GPfit             "GPL-2"                                  NA             
## graphics          "Part of R 4.0.2"                        NA             
## grDevices         "Part of R 4.0.2"                        NA             
## grid              "Part of R 4.0.2"                        NA             
## gridExtra         "GPL (>= 2)"                             NA             
## gtable            "GPL-2"                                  NA             
## hardhat           "MIT + file LICENSE"                     NA             
## haven             "MIT + file LICENSE"                     NA             
## highr             "GPL"                                    NA             
## Hmisc             "GPL (>= 2)"                             NA             
## hms               "GPL-3"                                  NA             
## htmlTable         "GPL (>= 3)"                             NA             
## htmltools         "GPL (>= 2)"                             NA             
## htmlwidgets       "MIT + file LICENSE"                     NA             
## httpuv            "GPL (>= 2) | file LICENSE"              NA             
## httr              "MIT + file LICENSE"                     NA             
## huxtable          "MIT + file LICENSE"                     NA             
## igraph            "GPL (>= 2)"                             NA             
## imager            "LGPL-3"                                 NA             
## infer             "CC0"                                    NA             
## ini               "GPL-3"                                  NA             
## ipred             "GPL (>= 2)"                             NA             
## isoband           "MIT + file LICENSE"                     NA             
## iterators         "Apache License (== 2.0)"                NA             
## janitor           "MIT + file LICENSE"                     NA             
## jpeg              "GPL-2 | GPL-3"                          NA             
## jsonlite          "MIT + file LICENSE"                     NA             
## keras             "MIT + file LICENSE"                     NA             
## kernlab           "GPL-2"                                  NA             
## KernSmooth        "Unlimited"                              NA             
## knitr             "GPL"                                    NA             
## labeling          "MIT + file LICENSE | Unlimited"         NA             
## later             "GPL (>= 2)"                             NA             
## lattice           "GPL (>= 2)"                             NA             
## latticeExtra      "GPL (>= 2)"                             NA             
## lava              "GPL-3"                                  NA             
## lazyeval          "GPL-3"                                  NA             
## learnr            "Apache License (>= 2.0)"                NA             
## lhs               "GPL-3"                                  NA             
## lifecycle         "GPL-3"                                  NA             
## lightgbm          "MIT + file LICENSE"                     NA             
## listenv           "LGPL (>= 2.1)"                          NA             
## lme4              "GPL (>= 2)"                             NA             
## lmtest            "GPL-2 | GPL-3"                          NA             
## lobstr            "GPL-3"                                  NA             
## lubridate         "GPL (>= 2)"                             NA             
## magick            "MIT + file LICENSE"                     NA             
## magrittr          "MIT + file LICENSE"                     NA             
## manipulateWidget  "GPL (>= 2) | file LICENSE"              NA             
## maps              "GPL-2"                                  NA             
## maptools          "GPL (>= 2)"                             NA             
## markdown          "GPL-2"                                  NA             
## MASS              "GPL-2 | GPL-3"                          NA             
## mathjaxr          "GPL-3"                                  NA             
## Matrix            "GPL (>= 2) | file LICENCE"              NA             
## MatrixModels      "GPL (>= 2)"                             NA             
## matrixStats       "Artistic-2.0"                           NA             
## mclust            "GPL (>= 2)"                             NA             
## memoise           "MIT + file LICENSE"                     NA             
## methods           "Part of R 4.0.2"                        NA             
## mgcv              "GPL (>= 2)"                             NA             
## mime              "GPL"                                    NA             
## miniUI            "GPL-3"                                  NA             
## minqa             "GPL-2"                                  NA             
## modeldata         "MIT + file LICENSE"                     NA             
## modelr            "GPL-3"                                  NA             
## modeltools        "GPL-2"                                  NA             
## moments           "GPL (>= 2)"                             NA             
## munsell           "MIT + file LICENSE"                     NA             
## nlme              "GPL (>= 2) | file LICENCE"              NA             
## nloptr            "LGPL-3"                                 NA             
## nnet              "GPL-2 | GPL-3"                          NA             
## nullabor          "GPL (>= 2)"                             NA             
## numDeriv          "GPL-2"                                  NA             
## odbc              "MIT + file LICENSE"                     NA             
## officer           "GPL-3"                                  NA             
## openssl           "MIT + file LICENSE"                     NA             
## openxlsx          "MIT + file LICENSE"                     NA             
## packrat           "GPL-2"                                  NA             
## parallel          "Part of R 4.0.2"                        NA             
## parsnip           "GPL-2"                                  NA             
## patchwork         "MIT + file LICENSE"                     NA             
## pbapply           "GPL-2"                                  NA             
## pbkrtest          "GPL (>= 2)"                             NA             
## pillar            "GPL-3"                                  NA             
## pkgbuild          "GPL-3"                                  NA             
## pkgconfig         "MIT + file LICENSE"                     NA             
## pkgfilecache      "MIT + file LICENSE"                     NA             
## pkgload           "GPL-3"                                  NA             
## plyr              "MIT + file LICENSE"                     NA             
## png               "GPL-2 | GPL-3"                          NA             
## polynom           "GPL-2"                                  NA             
## prabclus          "GPL"                                    NA             
## praise            "MIT + file LICENSE"                     NA             
## prettyunits       "MIT + file LICENSE"                     NA             
## pROC              "GPL (>= 3)"                             NA             
## processx          "MIT + file LICENSE"                     NA             
## prodlim           "GPL (>= 2)"                             NA             
## progress          "MIT + file LICENSE"                     NA             
## promises          "MIT + file LICENSE"                     NA             
## ps                "BSD_3_clause + file LICENSE"            NA             
## purrr             "GPL-3 | file LICENSE"                   NA             
## quadprog          "GPL (>= 2)"                             NA             
## quantmod          "GPL-3"                                  NA             
## quantreg          "GPL (>= 2)"                             NA             
## R6                "MIT + file LICENSE"                     NA             
## randomForest      "GPL (>= 2)"                             NA             
## ranger            "GPL-3"                                  NA             
## rappdirs          "MIT + file LICENSE"                     NA             
## rcmdcheck         "MIT + file LICENSE"                     NA             
## RColorBrewer      "Apache License 2.0"                     NA             
## Rcpp              "GPL (>= 2)"                             NA             
## RcppArmadillo     "GPL (>= 2)"                             NA             
## RcppEigen         "GPL (>= 2) | file LICENSE"              NA             
## readbitmap        "GPL (>= 2)"                             NA             
## readr             "GPL (>= 2) | file LICENSE"              NA             
## readxl            "GPL-3"                                  NA             
## readxlsb          "GPL-3"                                  NA             
## recipes           "GPL-2"                                  NA             
## rematch           "MIT + file LICENSE"                     NA             
## rematch2          "MIT + file LICENSE"                     NA             
## remotes           "GPL (>= 2)"                             NA             
## renv              "MIT + file LICENSE"                     NA             
## reprex            "MIT + file LICENSE"                     NA             
## reshape           "MIT + file LICENSE"                     NA             
## reticulate        "Apache License 2.0"                     NA             
## rex               "MIT + file LICENSE"                     NA             
## rgl               "GPL"                                    NA             
## rio               "GPL-2"                                  NA             
## rJava             "GPL-2"                                  NA             
## RJDBC             "MIT + file LICENSE"                     NA             
## rlang             "GPL-3"                                  NA             
## rmarkdown         "GPL-3"                                  NA             
## robustbase        "GPL (>= 2)"                             NA             
## roxygen2          "GPL (>= 2)"                             NA             
## rpart             "GPL-2 | GPL-3"                          NA             
## rprojroot         "GPL-3"                                  NA             
## rsample           "GPL-2"                                  NA             
## rsconnect         "GPL-2"                                  NA             
## rstatix           "GPL-2"                                  NA             
## rstudioapi        "MIT + file LICENSE"                     NA             
## Rttf2pt1          "file LICENSE"                           "yes"          
## rversions         "MIT + file LICENSE"                     NA             
## rvest             "GPL-3"                                  NA             
## rvg               "GPL-3"                                  NA             
## scales            "MIT + file LICENSE"                     NA             
## selectr           "BSD_3_clause + file LICENCE"            NA             
## sessioninfo       "GPL-2"                                  NA             
## shape             "GPL (>= 3)"                             NA             
## shiny             "GPL-3 | file LICENSE"                   NA             
## slider            "MIT + file LICENSE"                     NA             
## snakecase         "GPL-3"                                  NA             
## sourcetools       "MIT + file LICENSE"                     NA             
## sp                "GPL (>= 2)"                             NA             
## spam              "LGPL-2 | BSD_3_clause + file LICENSE"   NA             
## sparkline         "MIT + file LICENSE"                     NA             
## SparseM           "GPL (>= 2)"                             NA             
## spatial           "GPL-2 | GPL-3"                          NA             
## splines           "Part of R 4.0.2"                        NA             
## SQUAREM           "GPL (>= 2)"                             NA             
## squash            "Artistic-2.0"                           NA             
## stacks            "MIT + file LICENSE"                     NA             
## statmod           "GPL-2 | GPL-3"                          NA             
## stats             "Part of R 4.0.2"                        NA             
## stats4            "Part of R 4.0.2"                        NA             
## stringi           "file LICENSE"                           NA             
## stringr           "GPL-2 | file LICENSE"                   NA             
## survival          "LGPL (>= 2)"                            NA             
## sys               "MIT + file LICENSE"                     NA             
## systemfonts       "MIT + file LICENSE"                     NA             
## tcltk             "Part of R 4.0.2"                        NA             
## tensorflow        "Apache License 2.0"                     NA             
## testthat          "MIT + file LICENSE"                     NA             
## tfruns            "Apache License 2.0"                     NA             
## tibble            "MIT + file LICENSE"                     NA             
## tidymodels        "GPL-3 | file LICENSE"                   NA             
## tidyr             "MIT + file LICENSE"                     NA             
## tidyselect        "GPL-3"                                  NA             
## tidyverse         "GPL-3 | file LICENSE"                   NA             
## tiff              "GPL-2 | GPL-3"                          NA             
## timeDate          "GPL (>= 2)"                             NA             
## tinytex           "MIT + file LICENSE"                     NA             
## tools             "Part of R 4.0.2"                        NA             
## tree              "GPL-2 | GPL-3"                          NA             
## treesnip          "GPL-3"                                  NA             
## tseries           "GPL-2"                                  NA             
## tsibble           "GPL-3"                                  NA             
## TTR               "GPL (>= 2)"                             NA             
## tune              "MIT + file LICENSE"                     NA             
## urca              "GPL (>= 2)"                             NA             
## usethis           "GPL-3"                                  NA             
## utf8              "Apache License (== 2.0) | file LICENSE" NA             
## utils             "Part of R 4.0.2"                        NA             
## uuid              "MIT + file LICENSE"                     NA             
## vctrs             "GPL-3"                                  NA             
## viridis           "MIT + file LICENSE"                     NA             
## viridisLite       "MIT + file LICENSE"                     NA             
## waldo             "MIT + file LICENSE"                     NA             
## warp              "MIT + file LICENSE"                     NA             
## webshot           "GPL-2"                                  NA             
## whisker           "GPL-3"                                  NA             
## withr             "GPL (>= 2)"                             NA             
## workflows         "MIT + file LICENSE"                     NA             
## writexl           "BSD_2_clause + file LICENSE"            NA             
## xfun              "MIT + file LICENSE"                     NA             
## xgboost           "Apache License (== 2.0) | file LICENSE" NA             
## XLConnect         "GPL-3"                                  NA             
## xlsx              "GPL-3"                                  NA             
## xlsxjars          "GPL-3"                                  NA             
## xml2              "GPL (>= 2)"                             NA             
## xopen             "MIT + file LICENSE"                     NA             
## xtable            "GPL (>= 2)"                             NA             
## xts               "GPL (>= 2)"                             NA             
## yaml              "BSD_3_clause + file LICENSE"            NA             
## yardstick         "GPL-2"                                  NA             
## zeallot           "MIT + file LICENSE"                     NA             
## zip               "CC0"                                    NA             
## zoo               "GPL-2 | GPL-3"                          NA             
##                   License_restricts_use OS_type MD5sum NeedsCompilation Built  
## A3                NA                    NA      NA     "no"             "4.0.2"
## abind             NA                    NA      NA     "no"             "4.0.2"
## alluvial          NA                    NA      NA     "no"             "4.0.2"
## AmesHousing       NA                    NA      NA     "no"             "4.0.2"
## AnomalyDetection  NA                    NA      NA     "no"             "4.0.2"
## anytime           NA                    NA      NA     "yes"            "4.0.2"
## askpass           NA                    NA      NA     "yes"            "4.0.2"
## assertthat        NA                    NA      NA     "no"             "4.0.2"
## awtools           NA                    NA      NA     "no"             "4.0.2"
## backports         NA                    NA      NA     "yes"            "4.0.2"
## base              NA                    NA      NA     NA               "4.0.2"
## base64enc         NA                    NA      NA     "yes"            "4.0.2"
## BH                NA                    NA      NA     "no"             "4.0.2"
## bit               NA                    NA      NA     "yes"            "4.0.2"
## bit64             NA                    NA      NA     "yes"            "4.0.2"
## blob              NA                    NA      NA     "no"             "4.0.2"
## bmp               NA                    NA      NA     "no"             "4.0.2"
## bookdown          NA                    NA      NA     "no"             "4.0.2"
## boot              NA                    NA      NA     "no"             "4.0.2"
## brew              NA                    NA      NA     NA               "4.0.2"
## brio              NA                    NA      NA     "yes"            "4.0.2"
## broom             NA                    NA      NA     "no"             "4.0.2"
## butcher           NA                    NA      NA     "no"             "4.0.2"
## callr             NA                    NA      NA     "no"             "4.0.2"
## car               NA                    NA      NA     "no"             "4.0.2"
## carData           NA                    NA      NA     "no"             "4.0.2"
## catboost          NA                    NA      NA     "yes"            "4.0.2"
## cellranger        NA                    NA      NA     "no"             "4.0.2"
## checkmate         NA                    NA      NA     "yes"            "4.0.2"
## class             NA                    NA      NA     "yes"            "4.0.2"
## cli               NA                    NA      NA     "no"             "4.0.2"
## clipr             NA                    NA      NA     "no"             "4.0.2"
## cluster           NA                    NA      NA     "yes"            "4.0.2"
## codetools         NA                    NA      NA     "no"             "4.0.2"
## colorspace        NA                    NA      NA     "yes"            "4.0.2"
## commonmark        NA                    NA      NA     "yes"            "4.0.2"
## compiler          NA                    NA      NA     NA               "4.0.2"
## config            NA                    NA      NA     "no"             "4.0.2"
## conquer           NA                    NA      NA     "yes"            "4.0.2"
## corrplot          NA                    NA      NA     "no"             "4.0.2"
## covr              NA                    NA      NA     "yes"            "4.0.2"
## cowplot           NA                    NA      NA     "no"             "4.0.2"
## cpp11             NA                    NA      NA     "no"             "4.0.2"
## crayon            NA                    NA      NA     "no"             "4.0.2"
## crosstalk         NA                    NA      NA     "no"             "4.0.2"
## curl              NA                    NA      NA     "yes"            "4.0.1"
## data.table        NA                    NA      NA     "yes"            "4.0.2"
## datasets          NA                    NA      NA     NA               "4.0.2"
## DBI               NA                    NA      NA     "no"             "4.0.2"
## dbplyr            NA                    NA      NA     "no"             "4.0.2"
## DEoptimR          NA                    NA      NA     "no"             "4.0.2"
## desc              NA                    NA      NA     "no"             "4.0.2"
## devtools          NA                    NA      NA     "no"             "4.0.2"
## dials             NA                    NA      NA     "no"             "4.0.2"
## DiceDesign        NA                    NA      NA     "yes"            "4.0.2"
## diffobj           NA                    NA      NA     "yes"            "4.0.2"
## digest            NA                    NA      NA     "yes"            "4.0.2"
## diptest           NA                    NA      NA     "yes"            "4.0.2"
## doParallel        NA                    NA      NA     "no"             "4.0.2"
## dotCall64         NA                    NA      NA     "yes"            "4.0.2"
## downloader        NA                    NA      NA     "no"             "4.0.2"
## dplyr             NA                    NA      NA     "yes"            "4.0.2"
## DT                NA                    NA      NA     "no"             "4.0.2"
## ellipsis          NA                    NA      NA     "yes"            "4.0.2"
## evaluate          NA                    NA      NA     "no"             "4.0.1"
## extrafont         NA                    NA      NA     "no"             "4.0.2"
## extrafontdb       NA                    NA      NA     NA               "4.0.2"
## fansi             NA                    NA      NA     "yes"            "4.0.2"
## farver            NA                    NA      NA     "yes"            "4.0.2"
## fastmap           NA                    NA      NA     "yes"            "4.0.2"
## fields            NA                    NA      NA     "yes"            "4.0.2"
## flexmix           NA                    NA      NA     "no"             "4.0.2"
## flextable         NA                    NA      NA     "no"             "4.0.2"
## forcats           NA                    NA      NA     "no"             "4.0.2"
## foreach           NA                    NA      NA     "no"             "4.0.2"
## forecast          NA                    NA      NA     "yes"            "4.0.2"
## foreign           NA                    NA      NA     "yes"            "4.0.2"
## formattable       NA                    NA      NA     "no"             "4.0.2"
## Formula           NA                    NA      NA     "no"             "4.0.2"
## fpc               NA                    NA      NA     "no"             "4.0.2"
## fracdiff          NA                    NA      NA     "yes"            "4.0.2"
## freesurferformats NA                    NA      NA     "no"             "4.0.2"
## fs                NA                    NA      NA     "yes"            "4.0.2"
## fsbrain           NA                    NA      NA     "no"             "4.0.2"
## furrr             NA                    NA      NA     "no"             "4.0.2"
## future            NA                    NA      NA     "no"             "4.0.2"
## gdtools           NA                    NA      NA     "yes"            "4.0.2"
## generics          NA                    NA      NA     "no"             "4.0.2"
## ggalluvial        NA                    NA      NA     "no"             "4.0.2"
## GGally            NA                    NA      NA     "no"             "4.0.2"
## ggh4x             NA                    NA      NA     "no"             "4.0.2"
## ggplot2           NA                    NA      NA     "no"             "4.0.2"
## ggpubr            NA                    NA      NA     "no"             "4.0.2"
## ggrepel           NA                    NA      NA     "yes"            "4.0.2"
## ggridges          NA                    NA      NA     "no"             "4.0.2"
## ggsci             NA                    NA      NA     "no"             "4.0.2"
## ggsignif          NA                    NA      NA     "no"             "4.0.2"
## gh                NA                    NA      NA     "no"             "4.0.2"
## git2r             NA                    NA      NA     "yes"            "4.0.2"
## glmnet            NA                    NA      NA     "yes"            "4.0.2"
## globals           NA                    NA      NA     "no"             "4.0.2"
## glue              NA                    NA      NA     "yes"            "4.0.2"
## gower             NA                    NA      NA     "yes"            "4.0.2"
## GPfit             NA                    NA      NA     "no"             "4.0.2"
## graphics          NA                    NA      NA     "yes"            "4.0.2"
## grDevices         NA                    NA      NA     "yes"            "4.0.2"
## grid              NA                    NA      NA     "yes"            "4.0.2"
## gridExtra         NA                    NA      NA     "no"             "4.0.2"
## gtable            NA                    NA      NA     "no"             "4.0.2"
## hardhat           NA                    NA      NA     "no"             "4.0.2"
## haven             NA                    NA      NA     "yes"            "4.0.2"
## highr             NA                    NA      NA     "no"             "4.0.2"
## Hmisc             NA                    NA      NA     "yes"            "4.0.2"
## hms               NA                    NA      NA     "no"             "4.0.2"
## htmlTable         NA                    NA      NA     "no"             "4.0.2"
## htmltools         NA                    NA      NA     "yes"            "4.0.2"
## htmlwidgets       NA                    NA      NA     "no"             "4.0.2"
## httpuv            NA                    NA      NA     "yes"            "4.0.2"
## httr              NA                    NA      NA     "no"             "4.0.2"
## huxtable          NA                    NA      NA     "no"             "4.0.2"
## igraph            NA                    NA      NA     "yes"            "4.0.2"
## imager            NA                    NA      NA     "yes"            "4.0.2"
## infer             NA                    NA      NA     "no"             "4.0.2"
## ini               NA                    NA      NA     "no"             "4.0.2"
## ipred             NA                    NA      NA     "yes"            "4.0.2"
## isoband           NA                    NA      NA     "yes"            "4.0.2"
## iterators         NA                    NA      NA     "no"             "4.0.2"
## janitor           NA                    NA      NA     "no"             "4.0.2"
## jpeg              NA                    NA      NA     "yes"            "4.0.2"
## jsonlite          NA                    NA      NA     "yes"            "4.0.2"
## keras             NA                    NA      NA     "no"             "4.0.2"
## kernlab           NA                    NA      NA     "yes"            "4.0.2"
## KernSmooth        NA                    NA      NA     "yes"            "4.0.2"
## knitr             NA                    NA      NA     "no"             "4.0.2"
## labeling          NA                    NA      NA     "no"             "4.0.2"
## later             NA                    NA      NA     "yes"            "4.0.2"
## lattice           NA                    NA      NA     "yes"            "4.0.2"
## latticeExtra      NA                    NA      NA     "no"             "4.0.2"
## lava              NA                    NA      NA     "no"             "4.0.2"
## lazyeval          NA                    NA      NA     "yes"            "4.0.2"
## learnr            NA                    NA      NA     "no"             "4.0.2"
## lhs               NA                    NA      NA     "yes"            "4.0.2"
## lifecycle         NA                    NA      NA     "no"             "4.0.2"
## lightgbm          NA                    NA      NA     "yes"            "4.0.2"
## listenv           NA                    NA      NA     "no"             "4.0.2"
## lme4              NA                    NA      NA     "yes"            "4.0.1"
## lmtest            NA                    NA      NA     "yes"            "4.0.2"
## lobstr            NA                    NA      NA     "yes"            "4.0.2"
## lubridate         NA                    NA      NA     "yes"            "4.0.2"
## magick            NA                    NA      NA     "yes"            "4.0.2"
## magrittr          NA                    NA      NA     "yes"            "4.0.2"
## manipulateWidget  NA                    NA      NA     "no"             "4.0.2"
## maps              NA                    NA      NA     "yes"            "4.0.2"
## maptools          NA                    NA      NA     "yes"            "4.0.2"
## markdown          NA                    NA      NA     "yes"            "4.0.2"
## MASS              NA                    NA      NA     "yes"            "4.0.2"
## mathjaxr          NA                    NA      NA     "no"             "4.0.2"
## Matrix            NA                    NA      NA     "yes"            "4.0.2"
## MatrixModels      NA                    NA      NA     "no"             "4.0.2"
## matrixStats       NA                    NA      NA     "yes"            "4.0.2"
## mclust            NA                    NA      NA     "yes"            "4.0.2"
## memoise           NA                    NA      NA     "no"             "4.0.2"
## methods           NA                    NA      NA     "yes"            "4.0.2"
## mgcv              NA                    NA      NA     "yes"            "4.0.2"
## mime              NA                    NA      NA     "yes"            "4.0.2"
## miniUI            NA                    NA      NA     "no"             "4.0.2"
## minqa             NA                    NA      NA     "yes"            "4.0.2"
## modeldata         NA                    NA      NA     "no"             "4.0.2"
## modelr            NA                    NA      NA     "no"             "4.0.2"
## modeltools        NA                    NA      NA     "no"             "4.0.2"
## moments           NA                    NA      NA     "no"             "4.0.2"
## munsell           NA                    NA      NA     "no"             "4.0.2"
## nlme              NA                    NA      NA     "yes"            "4.0.2"
## nloptr            NA                    NA      NA     "yes"            "4.0.2"
## nnet              NA                    NA      NA     "yes"            "4.0.2"
## nullabor          NA                    NA      NA     "no"             "4.0.2"
## numDeriv          NA                    NA      NA     "no"             "4.0.2"
## odbc              NA                    NA      NA     "yes"            "4.0.2"
## officer           NA                    NA      NA     "no"             "4.0.2"
## openssl           NA                    NA      NA     "yes"            "4.0.1"
## openxlsx          NA                    NA      NA     "yes"            "4.0.2"
## packrat           NA                    NA      NA     "no"             "4.0.2"
## parallel          NA                    NA      NA     "yes"            "4.0.2"
## parsnip           NA                    NA      NA     "no"             "4.0.2"
## patchwork         NA                    NA      NA     "no"             "4.0.2"
## pbapply           NA                    NA      NA     "no"             "4.0.2"
## pbkrtest          NA                    NA      NA     "no"             "4.0.2"
## pillar            NA                    NA      NA     "no"             "4.0.2"
## pkgbuild          NA                    NA      NA     "no"             "4.0.2"
## pkgconfig         NA                    NA      NA     "no"             "4.0.2"
## pkgfilecache      NA                    NA      NA     "no"             "4.0.2"
## pkgload           NA                    NA      NA     "yes"            "4.0.2"
## plyr              NA                    NA      NA     "yes"            "4.0.2"
## png               NA                    NA      NA     "yes"            "4.0.2"
## polynom           NA                    NA      NA     "no"             "4.0.2"
## prabclus          NA                    NA      NA     "no"             "4.0.2"
## praise            NA                    NA      NA     "no"             "4.0.2"
## prettyunits       NA                    NA      NA     "no"             "4.0.2"
## pROC              NA                    NA      NA     "yes"            "4.0.2"
## processx          NA                    NA      NA     "yes"            "4.0.2"
## prodlim           NA                    NA      NA     "yes"            "4.0.2"
## progress          NA                    NA      NA     "no"             "4.0.2"
## promises          NA                    NA      NA     "yes"            "4.0.2"
## ps                NA                    NA      NA     "yes"            "4.0.2"
## purrr             NA                    NA      NA     "yes"            "4.0.2"
## quadprog          NA                    NA      NA     "yes"            "4.0.2"
## quantmod          NA                    NA      NA     "no"             "4.0.2"
## quantreg          NA                    NA      NA     "yes"            "4.0.2"
## R6                NA                    NA      NA     "no"             "4.0.2"
## randomForest      NA                    NA      NA     "yes"            "4.0.2"
## ranger            NA                    NA      NA     "yes"            "4.0.2"
## rappdirs          NA                    NA      NA     "yes"            "4.0.2"
## rcmdcheck         NA                    NA      NA     "no"             "4.0.2"
## RColorBrewer      NA                    NA      NA     "no"             "4.0.2"
## Rcpp              NA                    NA      NA     "yes"            "4.0.2"
## RcppArmadillo     NA                    NA      NA     "yes"            "4.0.2"
## RcppEigen         NA                    NA      NA     "yes"            "4.0.2"
## readbitmap        NA                    NA      NA     "no"             "4.0.2"
## readr             NA                    NA      NA     "yes"            "4.0.2"
## readxl            NA                    NA      NA     "yes"            "4.0.2"
## readxlsb          NA                    NA      NA     "yes"            "4.0.2"
## recipes           NA                    NA      NA     "no"             "4.0.2"
## rematch           NA                    NA      NA     "no"             "4.0.2"
## rematch2          NA                    NA      NA     "no"             "4.0.2"
## remotes           NA                    NA      NA     "no"             "4.0.2"
## renv              NA                    NA      NA     "no"             "4.0.2"
## reprex            NA                    NA      NA     "no"             "4.0.2"
## reshape           NA                    NA      NA     "yes"            "4.0.2"
## reticulate        NA                    NA      NA     "yes"            "4.0.2"
## rex               NA                    NA      NA     "no"             "4.0.2"
## rgl               NA                    NA      NA     "yes"            "4.0.2"
## rio               NA                    NA      NA     "no"             "4.0.2"
## rJava             NA                    NA      NA     "yes"            "4.0.2"
## RJDBC             NA                    NA      NA     "no"             "4.0.2"
## rlang             NA                    NA      NA     "yes"            "4.0.2"
## rmarkdown         NA                    NA      NA     "no"             "4.0.2"
## robustbase        NA                    NA      NA     "yes"            "4.0.2"
## roxygen2          NA                    NA      NA     "yes"            "4.0.2"
## rpart             NA                    NA      NA     "yes"            "4.0.2"
## rprojroot         NA                    NA      NA     "no"             "4.0.2"
## rsample           NA                    NA      NA     "no"             "4.0.2"
## rsconnect         NA                    NA      NA     "no"             "4.0.2"
## rstatix           NA                    NA      NA     "no"             "4.0.2"
## rstudioapi        NA                    NA      NA     "no"             "4.0.2"
## Rttf2pt1          NA                    NA      NA     "yes"            "4.0.2"
## rversions         NA                    NA      NA     "no"             "4.0.2"
## rvest             NA                    NA      NA     "no"             "4.0.2"
## rvg               NA                    NA      NA     "yes"            "4.0.2"
## scales            NA                    NA      NA     "no"             "4.0.2"
## selectr           NA                    NA      NA     "no"             "4.0.2"
## sessioninfo       NA                    NA      NA     "no"             "4.0.2"
## shape             NA                    NA      NA     "no"             "4.0.2"
## shiny             NA                    NA      NA     "no"             "4.0.2"
## slider            NA                    NA      NA     "yes"            "4.0.2"
## snakecase         NA                    NA      NA     "no"             "4.0.2"
## sourcetools       NA                    NA      NA     "yes"            "4.0.2"
## sp                NA                    NA      NA     "yes"            "4.0.2"
## spam              NA                    NA      NA     "yes"            "4.0.2"
## sparkline         NA                    NA      NA     "no"             "4.0.2"
## SparseM           NA                    NA      NA     "yes"            "4.0.2"
## spatial           NA                    NA      NA     "yes"            "4.0.2"
## splines           NA                    NA      NA     "yes"            "4.0.2"
## SQUAREM           NA                    NA      NA     "no"             "4.0.2"
## squash            NA                    NA      NA     "no"             "4.0.2"
## stacks            NA                    NA      NA     "no"             "4.0.2"
## statmod           NA                    NA      NA     "yes"            "4.0.2"
## stats             NA                    NA      NA     "yes"            "4.0.2"
## stats4            NA                    NA      NA     NA               "4.0.2"
## stringi           NA                    NA      NA     "yes"            "4.0.2"
## stringr           NA                    NA      NA     "no"             "4.0.2"
## survival          NA                    NA      NA     "yes"            "4.0.2"
## sys               NA                    NA      NA     "yes"            "4.0.2"
## systemfonts       NA                    NA      NA     "yes"            "4.0.2"
## tcltk             NA                    NA      NA     "yes"            "4.0.2"
## tensorflow        NA                    NA      NA     "no"             "4.0.2"
## testthat          NA                    NA      NA     "yes"            "4.0.2"
## tfruns            NA                    NA      NA     "no"             "4.0.2"
## tibble            NA                    NA      NA     "yes"            "4.0.2"
## tidymodels        NA                    NA      NA     "no"             "4.0.2"
## tidyr             NA                    NA      NA     "yes"            "4.0.2"
## tidyselect        NA                    NA      NA     "yes"            "4.0.2"
## tidyverse         NA                    NA      NA     "no"             "4.0.2"
## tiff              NA                    NA      NA     "yes"            "4.0.2"
## timeDate          NA                    NA      NA     "no"             "4.0.2"
## tinytex           NA                    NA      NA     "no"             "4.0.2"
## tools             NA                    NA      NA     "yes"            "4.0.2"
## tree              NA                    NA      NA     "yes"            "4.0.2"
## treesnip          NA                    NA      NA     "no"             "4.0.2"
## tseries           NA                    NA      NA     "yes"            "4.0.2"
## tsibble           NA                    NA      NA     "no"             "4.0.2"
## TTR               NA                    NA      NA     "yes"            "4.0.2"
## tune              NA                    NA      NA     "no"             "4.0.2"
## urca              NA                    NA      NA     "yes"            "4.0.2"
## usethis           NA                    NA      NA     "no"             "4.0.2"
## utf8              NA                    NA      NA     "yes"            "4.0.2"
## utils             NA                    NA      NA     "yes"            "4.0.2"
## uuid              NA                    NA      NA     "yes"            "4.0.2"
## vctrs             NA                    NA      NA     "yes"            "4.0.2"
## viridis           NA                    NA      NA     "no"             "4.0.2"
## viridisLite       NA                    NA      NA     "no"             "4.0.1"
## waldo             NA                    NA      NA     "no"             "4.0.2"
## warp              NA                    NA      NA     "yes"            "4.0.2"
## webshot           NA                    NA      NA     "no"             "4.0.2"
## whisker           NA                    NA      NA     "no"             "4.0.2"
## withr             NA                    NA      NA     "no"             "4.0.2"
## workflows         NA                    NA      NA     "no"             "4.0.2"
## writexl           NA                    NA      NA     "yes"            "4.0.2"
## xfun              NA                    NA      NA     "yes"            "4.0.2"
## xgboost           NA                    NA      NA     "yes"            "4.0.2"
## XLConnect         NA                    NA      NA     "no"             "4.0.2"
## xlsx              NA                    NA      NA     "no"             "4.0.2"
## xlsxjars          NA                    NA      NA     "no"             "4.0.2"
## xml2              NA                    NA      NA     "yes"            "4.0.2"
## xopen             NA                    NA      NA     "no"             "4.0.2"
## xtable            NA                    NA      NA     "no"             "4.0.2"
## xts               NA                    NA      NA     "yes"            "4.0.2"
## yaml              NA                    NA      NA     "yes"            "4.0.2"
## yardstick         NA                    NA      NA     "yes"            "4.0.2"
## zeallot           NA                    NA      NA     "no"             "4.0.2"
## zip               NA                    NA      NA     "yes"            "4.0.2"
## zoo               NA                    NA      NA     "yes"            "4.0.2"
```


