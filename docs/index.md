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

La primer diferencia para entender R, es entender la diferencia entre paquete y libreria. Paquete es el grupo de codigos que descargamos de internet y libreria es un paqute que se encuentra instalado y listo para usar.  

1. La paquetería básica de R está basada en librerías en Fortran y C, creando *wrappers* que hacen referencia a las funciones originales. Por ejemplo, al calcular distintas factorizaciones de matrices (LU, Chol, QR, SVD, Schur) son calculadas utilizando la librería de *LAPACK*.

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

