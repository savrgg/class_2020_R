---
title: "06_estimacion_intervalos"
author: "Salvador Garcia"
output:   
  html_document:
    toc: true
    theme: united
    toc_depth: 4

---

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

