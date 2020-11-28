# Introducción a estadística


```r
library(crayon)
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
## x ggplot2::%+%()  masks crayon::%+%()
## x dplyr::filter() masks stats::filter()
## x dplyr::lag()    masks stats::lag()
```

```r
library(Hmisc)
```

```
## Loading required package: lattice
```

```
## Loading required package: survival
```

```
## Loading required package: Formula
```

```
## 
## Attaching package: 'Hmisc'
```

```
## The following objects are masked from 'package:dplyr':
## 
##     src, summarize
```

```
## The following objects are masked from 'package:base':
## 
##     format.pval, units
```

```r
library(plyr)
```

```
## ------------------------------------------------------------------------------
```

```
## You have loaded plyr after dplyr - this is likely to cause problems.
## If you need functions from both plyr and dplyr, please load plyr first, then dplyr:
## library(plyr); library(dplyr)
```

```
## ------------------------------------------------------------------------------
```

```
## 
## Attaching package: 'plyr'
```

```
## The following objects are masked from 'package:Hmisc':
## 
##     is.discrete, summarize
```

```
## The following objects are masked from 'package:dplyr':
## 
##     arrange, count, desc, failwith, id, mutate, rename, summarise,
##     summarize
```

```
## The following object is masked from 'package:purrr':
## 
##     compact
```

```r
px = 14/488
py = 5/488

# Z (simetrica)
qnorm(.025, lower.tail = T)
```

```
## [1] -1.959964
```

```r
qnorm(.025, lower.tail = F)
```

```
## [1] 1.959964
```

```r
## Valor-p
pnorm(-1.959964, lower.tail = T)
```

```
## [1] 0.025
```

```r
# T (simetrica)
qt(.025, df = 11, lower.tail = T)
```

```
## [1] -2.200985
```

```r
qt(.025, df = 11, lower.tail = F)
```

```
## [1] 2.200985
```

```r
# J (no simetrica)
qchisq(.025, df = 11, lower.tail = T)
```

```
## [1] 3.815748
```

```r
qchisq(.025, df = 11, lower.tail = F)
```

```
## [1] 21.92005
```

```r
# J (no simetrica)
qf(.025, df1 = 11, df2 = 38, lower.tail = T)
```

```
## [1] 0.3256995
```

```r
qf(.025, df1 = 11, df2 = 38, lower.tail = F)
```

```
## [1] 2.35346
```


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
##  [1] -0.94178789 -0.33902910 -1.15299808  0.05328983 -1.65634251  0.42745287
##  [7] -0.60012918 -1.51585772  0.02547545 -0.52949662
```

## Ejercicios de práctica
### Ejercicio 10

```r
library(tidyverse)
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

<img src="Chap10_basic_stats_files/figure-html/unnamed-chunk-6-1.png" width="672" />


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

<img src="Chap10_basic_stats_files/figure-html/unnamed-chunk-7-1.png" width="672" />
 
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

<img src="Chap10_basic_stats_files/figure-html/unnamed-chunk-8-1.png" width="672" />

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

<img src="Chap10_basic_stats_files/figure-html/unnamed-chunk-9-1.png" width="672" />


# Pruebas de hipótesis

Las pruebas de hipótesis se componen de 4 elementos:

1. Hipótesis Nula
2. Hipótesis Alternativa
3. Estadístico de Prueba
4. Región de Rechazo

## Ejemplo de estadístico Z

### Diferencia de Medias

### Diferencia de Proporciones
**CDE: 5.2.15** 
\BeginKnitrBlock{exercise}<div class="exercise"><span class="exercise" id="exr:unnamed-chunk-10"><strong>(\#exr:unnamed-chunk-10) </strong></span>En un estudio reciente, se investigó el efecto de la ingesta de una cierta sustancia en el desarrollo de cáncer pulmonar. Se encontró que de 488 hombres que habían ingerido una baja cantidad de esta sustancia, 14 desarrollaron cáncer pulmonar. En un grupo del mismo tamaño en el que el consumo de esta sustancia era mayor, sólo 5 personas desarrollaron cáncer pulmonar.
a) ¿Pruebe si la ingesta alta de esa sustancia reduce el riesgo de cáncer pulmonar en los hombres? Emplee $\alpha = 0.01$</div>\EndKnitrBlock{exercise}

X: Antes, Y: Después

$\hat{p_X} = 14/488 = 0.0287$

$\hat{p_Y} = 5/488 = 0.0102$


1. Hipótesis Nula: $H_0: \mu_X-\mu_Y = 0$

2. Hipótesis Alternativa: $H_1: \mu_X-\mu_Y< 0$

3. Estadístico de Prueba: $Z =\frac{(\hat{p_X}-\hat{p_Y}) - (p_X-p_Y)}{\sqrt{\frac{(\hat{p_X})(1-\hat{p_X})}{n}+\frac{(\hat{p_Y})(1-\hat{p_Y})}{m}}} = \frac{(0.0287-0.0102) - (0)}{\sqrt{\frac{(0.0287)(1-0.0287)}{488}+\frac{(0.0102)(1-0.0102)}{488}}} = 2.0894$


4. Región de Rechazo: $RR = \{Z < Z_{0.01}\} = \{Z < qnorm(.01)\} = \{Z < -2.3263\}$


```r
library(tidyverse)

ggplot(data = data.frame(x = c(-3, 3)), aes(x)) +
  stat_function(fun = dnorm, n = 101, args = list(mean = 0, sd = 1)) + 
  theme_minimal() +
  labs(x = "mi texto en $", 
       y = "mi texto en €", 
       title = "mi titulo", 
       subtitle = "mi subtitulo") +
  geom_vline(xintercept = -2.3263, color = "red") +
  geom_rect(aes(xmin=-Inf,xmax=-2.3263,ymin=0,ymax=.5),alpha=0.1,fill="red")+
  geom_vline(xintercept = -2.0894, color = "orange")
```

<img src="Chap10_basic_stats_files/figure-html/unnamed-chunk-12-1.png" width="672" />

**No Rechazamos H_0**

b) Obtenga el nivel de significancia descriptivo o valor p

valor-p = $pnorm(-2.09) = 0.0183089$

## Ejemplo de estadistico T

### Diferencia de medias pareada

**CDE: 5.2.16** 
\BeginKnitrBlock{exercise}<div class="exercise"><span class="exercise" id="exr:unnamed-chunk-13"><strong>(\#exr:unnamed-chunk-13) </strong></span>Supóngase que, un psicólogo piensa que la edad influye en el coeficiente de inteligencia (IQ). Se toma una muestra aleatoria de 100 personas de mediana edad, de quienes se conoce su IQ a la edad de 16 años y actualmente. De restar, los coeficientes de su juventud de los coeficientes actuales, se obtuvo una diferencia promedio de 6 puntos, con una desviación estándar muestral de 7 puntos. Utilice $\alpha = .01$ para probar la hipotesis de que el IQ aumenta con la edad.</div>\EndKnitrBlock{exercise}

X: IQ a los 16 años
Y: IQ actual
$\bar{D}: \bar{Y}-\bar{X} = 6$
$S_{\bar{D}} = 7$  

1. Hipótesis Nula: $H_0: \mu_D = 0$

2. Hipótesis Alternativa: $H_1: \mu_D > 0$

3. Estadístico de Prueba: $T =\frac{\bar{D} - \mu_{\bar{D}}}{\sqrt{\frac{{S_{\bar{D}^2}}}{n}}} = \frac{6 - 0}{\sqrt{\frac{7^2}{100}}} = 8.5714$

4. Región de Rechazo: $RR = \{T < T_{99, 0.01}\} = \{T < qt(.99,99)\} = \{Z < 2.3646\}$

<img src="Chap10_basic_stats_files/figure-html/unnamed-chunk-15-1.png" width="672" />

**Rechazamos H_0**

valor-p = $pt(8.5714, 99, lower.tail = F) \sim 0$

## Ejemplo de estadistico J

**CDE: 5.2.23** 
\BeginKnitrBlock{exercise}<div class="exercise"><span class="exercise" id="exr:unnamed-chunk-16"><strong>(\#exr:unnamed-chunk-16) </strong></span>La Policía Federal de Caminos desea probar un radar detector de velocidades. Para esto hace circular frente al radar 61 patrullas a una velocidad de 110 Km/h. según su correspondiente velocímetro. De las 61 lecturas del radar obtiene $s^2 = 1.69$. Según la PFC el radar es aceptable si $\sigma <2km/h$. Adopte el punto de vista que el error grave es comprar el radar cuando en realidad el error de medición está por arriba del límite.
a) Formule las hipótesis H0 y H1 apropiadas a este problema.
b) Pruebe las hipótesis de a) con un nivel de significancia del 1\%.
c) De una cota superior para el valor de P.
d) Verifique que la decisión de b) concuerda con la estimación de c)</div>\EndKnitrBlock{exercise}

1. Hipótesis Nula: $H_0: \sigma^2 = 4$

2. Hipótesis Alternativa: $H_1: \sigma^2 < 4$

3. Estadístico de Prueba: $J =\frac{(n-1)S^2}{\sigma^2} = \frac{(61-1) 1.69}{4}= 25.35$

4. Región de Rechazo: $RR = \{J < J_{0.01,60}\} = \{J < qchisq(.01,60)\} = \{J < 37.4849\}$

<img src="Chap10_basic_stats_files/figure-html/unnamed-chunk-17-1.png" width="672" />

**Rechazamos H_0**

valor-p = $pchisq(25.35, 60) \sim 0$

## Ejemplo de estadistico F


**CDE: 5.2.18** 
\BeginKnitrBlock{exercise}<div class="exercise"><span class="exercise" id="exr:unnamed-chunk-18"><strong>(\#exr:unnamed-chunk-18) </strong></span>La estabilidad de las mediciones de las características de un producto manufacturado es importante para mantener su calidad. En realidad, es mejor tener, a veces, una pequeña variación en el valor medio de alguna característica importante de un producto y tener una media del proceso un poco fuera del "blanco", que tener una amplia variación con una media que se ajuste perfectamente a las necesidades. La última situación puede producir un porcentaje mayor de productos defectuosos que la primera. Un fabricante de lámparas eléctricas sospechoso que una de sus líneas de producción estaba fabricando bombillas con una alta variación en su vida útil. Para probar su teoría comparó la vida útil de $n = 40$ lámparas, muestreadas al azar, de la línea que supuestamente no trabajaba bien, y $m = 40$ de la línea que parecía estar "bajo control". Las medias y las varianzas de las muestras para las dos líneas eran:
a) ¿Proporcionan los datos evidencia suficiente para indicar que las bombillas (o focos), producidos por la línea que supuestamente trabaja mal poseen una mayor varianza en la vida útil que las lámparas producidas por la línea que supuestamente estaba bajo control? Utilice $\alpha = 0.05$.
b) Encuentre el nivel de significancia descriptivo que se ha observado para la prueba e interprete su valor.</div>\EndKnitrBlock{exercise}

1. Hipótesis Nula: $H_0: \sigma^2_1 = \sigma^2_2 \Rightarrow \frac{\sigma^2_1}{\sigma^2_2} = 1$

2. Hipótesis Alternativa: $H_1: \sigma^2_1 > \sigma^2_2 \Rightarrow \frac{\sigma^2_1}{\sigma^2_2} > 1$

3. Estadístico de Prueba: $F =\frac{S_2^2 \sigma^2_1}{S_1^2\sigma^2_2} = \frac{37000}{92000} = 0.4021739$

4. Región de Rechazo: $RR = \{F > F_{0.05,39,39}\} = \{F > qf(.95,39,39)\} = \{F > 1.704465\}$


<img src="Chap10_basic_stats_files/figure-html/unnamed-chunk-19-1.png" width="672" />

**No Rechazamos H_0**

valor-p = $pf(0.4021739, 39,  39, lower.tail = F) \sim 0.997279$


