# Visualización de datos

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
library(tidyverse)
```

```
## ── Attaching packages ─────────────────────────────────────── tidyverse 1.3.0 ──
```

```
## ✓ ggplot2 3.3.2     ✓ purrr   0.3.4
## ✓ tibble  3.0.4     ✓ dplyr   1.0.2
## ✓ tidyr   1.1.2     ✓ stringr 1.4.0
## ✓ readr   1.4.0     ✓ forcats 0.5.0
```

```
## ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
## x dplyr::filter() masks stats::filter()
## x dplyr::lag()    masks stats::lag()
```

```r
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

<img src="Chap05_visualization_files/figure-html/unnamed-chunk-1-1.png" width="672" />

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

<img src="Chap05_visualization_files/figure-html/unnamed-chunk-2-1.png" width="672" />

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

<img src="Chap05_visualization_files/figure-html/unnamed-chunk-3-1.png" width="672" />



## Ejercicios de práctica
### Ejercicio 7
- tidyr::gather() pasa de formato ancho a largo
- tidyr::spread() pasa de formato largo a ancho


```r
library(dplyr)
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

<img src="Chap05_visualization_files/figure-html/unnamed-chunk-7-1.png" width="672" />


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

<img src="Chap05_visualization_files/figure-html/unnamed-chunk-8-1.png" width="672" />

