--- 
title: "ITAM - Estadística 2"
author: "Salvador García"
site: bookdown::bookdown_site
documentclass: book
bibliography: [book.bib]
biblio-style: apalike
link-citations: yes
github-repo: ''
url: ''
description: "Notas para el curso de Estadística 2 - Primavera 2020"
---

# Introduccion


# Introducción a R

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



