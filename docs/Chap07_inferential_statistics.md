# Estadistica inferencial

## Estimación por intervalos

El capítulo anterior abordó **estimación puntual**, que proporciona o estima un solo valor para darnos una idea del parámetro $\theta$. En ocasiones estimar un solo valor no es suficiente por que se requiere tener un rango de valores donde creemos se encuentra el parámetro. 

**Nivel de confianza**: Grado de seguridad que se tiene sobre la veracidad de una afirmación acerca del parámetro (o parámetros) de interés. El nivel de confianza se denota como $(1-\alpha)$ con $\alpha$ constante entre 0 y 1. 

**Intervalo de confianza (IC)**: Rango de valores en el que se encuentra el verdadero valor del parámetro $\theta$. Este rango de valores es dependiente la nivel de confianza $(1-\alpha)$. Sean $a$ y $b$ dos valores tal que:

$$P(a \leq \theta \leq b) = 1 - \alpha$$
Entonces $(a, b)$ es un intervalo tal que la probabilidad que el verdadero parámetro $\theta$ se encuentre dentro de los valores es $(1-\alpha)$

## Estadístico Z - Media (varianza conocida)
Recordando clases pasadas, se había encontrado la distrubión de los estimadores de la media ($\overline{X}$). De acuerdo si se tenía una varianza conocida o desconocida, el estimador $\overline{X}$ se podía distribuir normalmente o como una distribución t-student respectivamente.

### IC para media
Si se tienen $n$ datos, donda cada $X_i$ se modela con media $\mu$ y varianza $\sigma^2$ **conocida**, entonces tenemos que:

$$Z = \left(\frac{\overline{X}-\mu} {\sigma/\sqrt{n}} \right)  = \left(\frac{\overline{X}-\mu} {\sqrt{\frac{\sigma^2}{n}}} \right) \sim N\left(0,1\right)$$
Sean $-z_{\alpha/2}$ y $z_{\alpha_2}$ puntos críticos, tal que:

$$
P \left( -z_{\alpha/2} \leq Z \leq z_{\alpha/2}\right) = 1-\alpha\\
P\left(-z_{\alpha/2} \leq \frac{\overline{X}-\mu} {\sqrt{\frac{\sigma^2}{n}}} \leq z_{\alpha/2}\right) = 1-\alpha\\
P\left(\overline{X} - z_{\alpha/2} {\sqrt{\frac{\sigma^2}{n}}} \leq \mu \leq \overline{X} + z_{\alpha/2} {\sqrt{\frac{\sigma^2}{n}}}\right) = 1-\alpha
$$

Entonces el intervalo de confianza para $\mu$ puede ser expresado como:

\begin{equation}
\boxed{\left(\overline{X} - z_{\alpha/2} \frac{\sigma}{\sqrt{n}}, \overline{X} + z_{\alpha/2} \frac{\sigma}{\sqrt{n}}\right)}
(\#eq:form601)
\end{equation}


### IC para proporción
La proporción se puede ver como un caso particular de una media, solo que para el caso en el que cada $X_i$ se distribuye *Bernoulli*.

$$Z = \left(\frac{\overline{X}-\mu}{\sqrt{\frac{\sigma^2}{n}}}\right) = \left(\frac{\hat{p}-p}{\sqrt{\frac{p(1-p)}{n}}}\right) \sim N\left(0,1\right)$$
Sean $-z_{\alpha/2}$ y $z_{\alpha_2}$ como puntos críticos, tal que:

$$
P\left(-z_{\alpha/2} \leq Z \leq z_{\alpha/2}\right) = 1-\alpha \\ \\
P\left(-z_{\alpha/2} \leq \frac{\hat{p}-p}{\sqrt{\frac{p(1-p)}{n}}} \leq z_{\alpha/2}\right) = 1-\alpha\\ \\
P\left(\hat{p} - z_{\alpha/2} {\sqrt{\frac{p(1-p)}{n}}} \leq p \leq \hat{p} + z_{\alpha/2}  {\sqrt{\frac{p(1-p)}{n}}}\right) = 1-\alpha
$$
Entonces el intervalo de confianza puede ser expresado como:


\begin{equation}
\boxed{\left(\hat{p} - z_{\alpha/2} \sqrt{\frac{p(1-p)}{n}}, 
      \hat{p} + z_{\alpha/2} \sqrt{\frac{p(1-p)}{n}} \right)}
(\#eq:form602)
\end{equation}

### IC diferencia de medias (muestras independientes)
En el caso de tener dos poblaciones es posible medir la diferencia de medias entre las poblaciones. Se le llama muestra independientes cuando no hay relación entre una u otra población. En cambio cuando son dependientes comúnmente son muestras pareadas (siguiente sección). En el caso de independencia y asumiendo normalidad, se tienen dos poblaciones $X \sim N(\mu_x, \sigma_X^2)$ y $Y \sim N(\mu_y, \sigma_Y^2)$. En esta sección se asume que se conoce la varianza de ambas poblaciones. Con estos supuestos se sabe que $\overline{Y}-\overline{X} \sim N(\mu_{Y}-\mu_{X},\frac{\sigma_X^2}{n}+\frac{\sigma_Y^2}{m})$. De esta manera podemos escribir a Z como:

$$Z = \frac{\left(\overline{Y}-\overline{X}\right) -\left(\mu_{Y}-\mu_{X}\right)}{\sqrt{\frac{\sigma_X^2}{n}+\frac{\sigma_Y^2}{m}}} \sim N\left(0,1\right)$$
Sean $-z_{\alpha/2}$ y $z_{\alpha_2}$ puntos críticos, tal que:

$$
P\left(-z_{\alpha/2} \leq Z \leq z_{\alpha/2}\right) = 1-\alpha \\ \\
P\left(-z_{\alpha/2} \leq \frac{\left(\overline{Y}-\overline{X}\right) -\left(\mu_{Y}-\mu_{X}\right)}{\sqrt{\frac{\sigma_X^2}{n}+\frac{\sigma_Y^2}{m}}} \leq z_{\alpha/2}\right) = 1-\alpha\\ \\
P\left(\left(\overline{Y}-\overline{X}\right) - z_{\alpha/2} \sqrt{\frac{\sigma_X^2}{n}+\frac{\sigma_Y^2}{m}} \leq \mu_Y-\mu_X \leq \left(\overline{Y}-\overline{X}\right) + z_{\alpha/2}  \sqrt{\frac{\sigma_X^2}{n}+\frac{\sigma_Y^2}{m}}\right) = 1-\alpha
$$
Entonces el intervalo de confianza puede ser expresado como:

\begin{equation}
\boxed{
\left(\left(\overline{Y}-\overline{X}\right) - z_{\alpha/2} \sqrt{\frac{\sigma_X^2}{n}+\frac{\sigma_Y^2}{m}}, \left(\overline{Y}-\overline{X}\right) + z_{\alpha/2}  \sqrt{\frac{\sigma_X^2}{n}+\frac{\sigma_Y^2}{m}}\right)
}
(\#eq:form603)
\end{equation}


### IC diferencia de medias (muestras dependientes)
Otro caso común es cuando se desea medir la diferencia de las medias de dos grupos. Donde cada $X_i$ esta distribuida con media $\mu_X$ y varianza $\sigma_X^2$, y de una manera análoga $Y_i$ se distribuye $\mu_X$ y varianza $\sigma_X^2$. Cuando se asume que las muestras son pareadas se calcula la diferencia entre cada par de valores ($X_i$, $Y_i$). Para esto, se definer la diferencia $D_i = Y_i - X_i$. Definido de esta forma, D_i se distibuye con media $\mu_D = \mu_X - \mu_Y$ y varianza $\sigma_D^2 = \sigma_X^2 + \sigma_Y^2 - 2\sigma_{XY}$. En particular, al asumir normalidad: $\overline{Y}-\overline{X} \sim N\left(\mu_{Y}-\mu_{X},\frac{\sigma_X^2 + \sigma_Y^2 - 2\sigma_{XY}}{n}\right)$ o visto de otra manera: $\overline{D} \sim N\left(\mu_{D},\sqrt{\frac{\sigma_D^2}{n}}\right)$


$$  Z = \frac{\left(\overline{Y}-\overline{X} \right) - \left(\mu_{Y}-\mu_{X}\right)}{\sqrt{\frac{\sigma_X^2 + \sigma_Y^2 - 2\sigma_{XY}}{n}}}$$
Sean $-z_{\alpha/2}$ y $z_{\alpha_2}$ puntos críticos, tal que:

$$
P\left(-z_{\alpha/2} \leq Z \leq z_{\alpha/2}\right) = 1-\alpha \\ \\
P\left(-z_{\alpha/2} \leq \frac{\left(\overline{Y}-\overline{X}\right) -\left(\mu_{Y}-\mu_{X}\right)}{\sqrt{\frac{\sigma_X^2 + \sigma_Y^2 - 2\sigma_{XY}}{n}}} \leq z_{\alpha/2}\right) = 1-\alpha\\ \\
P\left(\left(\overline{Y}-\overline{X}\right) - z_{\alpha/2} \sqrt{\frac{\sigma_X^2 + \sigma_Y^2 - 2\sigma_{XY}}{n}} \leq \mu_Y-\mu_X \leq \left(\overline{Y}-\overline{X}\right) + z_{\alpha/2}  \sqrt{\frac{\sigma_X^2 + \sigma_Y^2 - 2\sigma_{XY}}{n}}\right) = 1-\alpha
$$

\begin{equation}
\boxed{
\left(\left(\overline{Y}-\overline{X}\right) - z_{\alpha/2} \sqrt{\frac{\sigma_X^2 + \sigma_Y^2 - 2\sigma_{XY}}{n}}, \left(\overline{Y}-\overline{X}\right) + z_{\alpha/2}  \sqrt{\frac{\sigma_X^2 + \sigma_Y^2 - 2\sigma_{XY}}{n}}\right)
}
(\#eq:form604)
\end{equation}


## Estadístico T - Media (varianza desconocida)

Los casos para el estadístico T son muy similares al estadístico Z, solamente que ahora se asume que no se conoce la varianza poblacional y es estimada por la varianza muestral.

### IC para la media

Si se tienen $n$ datos, donde cada $X_i$ se modela con media $\mu$ y varianza $\sigma^2$ **desconocida**, entonces la varianza se estima con con $s^2$. Por lo tanto tenemos que:

$$T = \left(\frac{\overline{X}-\mu}{s/\sqrt{n}}\right) = \left(\frac{\overline{X}-\mu}{\sqrt{\frac{s^2}{n}}}\right) \sim t_{n-1}$$

Sean $-t_{(n-1, \alpha/2)}$ y $t_{(n-1, \alpha/2)}$ como puntos críticos, tal que:

$$
P\left(-t_{(n-1, \alpha/2)} \leq T \leq t_{(n-1, \alpha/2)}\right) = 1-\alpha \\
P\left(-t_{(n-1, \alpha/2)} \leq \frac{\overline{X}-\mu}{\sqrt{\frac{s^2}{n}}} \leq t_{(n-1, \alpha/2)}\right) = 1-\alpha\\
P\left(\overline{X} - t_{(n-1, \alpha/2)} \sqrt{\frac{s^2}{n}} \leq \mu \leq \overline{X} + t_{(n-1, \alpha/2)} \sqrt{\frac{s^2}{n}}\right) = 1-\alpha
$$
Entonces el intervalo de confianza puede ser expresado como:

\begin{equation}
\boxed{\left(\overline{X} - t_{(n-1, \alpha/2)} \frac{s}{\sqrt{n}}, \overline{X} + t_{(n-1, \alpha/2)} \frac{s}{\sqrt{n}} \right)}
(\#eq:form605)
\end{equation}


### IC para la proporción

Nota: para el caso de la distribución $Bernoulli(p)$, al conocer la media se conoce la varianza. Esto es por que la media de la Bernoulli es $p$ y la varianza $p(1-p)$. Por lo tanto la proporción no se puede distribuir como $t-student$.

### IC diferencia de medias (muestras independientes)
Para la diferencia de medias se tiene no se conoce la varianza de X ni de Y, por lo que se estiman por medio de $S_X^2$ y $S_Y^2$:

$$T = \frac{\left(\overline{Y}-\overline{X}\right) -\left(\mu_{Y}-\mu_{X}\right)}{\sqrt{\frac{S_X^2}{n}+\frac{S_Y^2}{m}}} \sim t_{n+m-2}$$
Sean $-t_{(n+m-2,\alpha/2)}$ y $t_{(n+m-2, \alpha/2)}$ puntos críticos, tal que:

$$
P\left(-t_{(n+m-2,\alpha/2)} \leq T \leq t_{(n+m-2,\alpha/2)}\right) = 1-\alpha \\ \\
P\left(-t_{(n+m-2,\alpha/2)} \leq \frac{\left(\overline{Y}-\overline{X}\right) -\left(\mu_{Y}-\mu_{X}\right)}{\sqrt{\frac{S_X^2}{n}+\frac{S_Y^2}{m}}} \leq t_{(n+m-2,\alpha/2)}\right) = 1-\alpha\\ \\
P\left(\left(\overline{Y}-\overline{X}\right) - t_{(n+m-2,\alpha/2)} \sqrt{\frac{S_X^2}{n}+\frac{S_Y^2}{m}} \leq \mu_Y-\mu_X \leq \left(\overline{Y}-\overline{X}\right) + t_{(n+m-2,\alpha/2)}  \sqrt{\frac{S_X^2}{n}+\frac{S_Y^2}{m}}\right) = 1-\alpha
$$
Entonces el intervalo de confianza puede ser expresado como:

\begin{equation}
\boxed{
\left(\left(\overline{Y}-\overline{X}\right) - t_{(n+m-2, \alpha/2)} \sqrt{\frac{S_X^2}{n}+\frac{S_Y^2}{m}}, \left(\overline{Y}-\overline{X}\right) + t_{(n+m-2,\alpha/2)}  \sqrt{\frac{S_X^2}{n}+\frac{S_Y^2}{m}}\right)
}
(\#eq:form607)
\end{equation}

### IC diferencia de medias (muestras dependientes)

Para el caso de muestras independientes, podemos estimar la varianza como sigue:

$$S_D^2  = \frac{1}{n-1} \sum_{i = 1}^{n} (D_i-\bar{D})^2$$

De manera que: 

$$ T = \frac{\bar{D}- (\mu_Y-\mu_X)}{\sqrt{\frac{S_D^2}{n}}} \sim t_{n-1}$$
Es importante notar que los grados de libertad siguen siendo $n-1$. Sean $-t_{(n-1, \alpha/2)}$ y $t_{(n-1,\alpha\2)}$ puntos críticos, tal que:

$$
P\left(-t_{(n-1,\alpha/2)} \leq T \leq t_{(n-1,\alpha/2)}\right) = 1-\alpha \\ \\
P\left(-t_{(n-1,\alpha/2)} \leq \frac{\overline{D} -\left(\mu_{Y}-\mu_{X}\right)}{\sqrt{\frac{S_D^2}{n}}} \leq t_{(n-1,\alpha/2)}\right) = 1-\alpha\\ \\
P\left(\overline{D} - t_{(n-1,\alpha/2)} \sqrt{\frac{S_D^2}{n}} \leq \mu_Y-\mu_X \leq \overline{D} + t_{(n-1,\alpha/2)}  \sqrt{\frac{S_D^2}{n}}\right) = 1-\alpha
$$

Entonces el intervalo de confianza puede ser expresado como:

\begin{equation}
\boxed{
\left(\overline{D} - t_{(n-1, \alpha/2)} \sqrt{\frac{S_D^2}{n}}, \overline{D} + t_{(n-1,\alpha/2)}  \sqrt{\frac{S_D^2}{n}}\right)
}
(\#eq:form608)
\end{equation}

## Estadístico J - Varianza
Una vez revisado el intervalo de confianza para la media con varianza conocida y desconocida, un paso intuitivo es construir el de la varianza. Como se estudio en clases pasadas, el estimador más común de la varianza es $S^2$. Además se definió el estadistico J con distribución $\chi^2$. Suponiendo que se cada $X_i$ se distribuye normal y que se tienen n observaciones:

$$J = \frac{(n-1) s^2}{\sigma^2} \sim \chi_{n-1}^2$$

Entonces, definiendo $\chi_{(n-1, 1-\alpha/2)}^2$ y $\chi_{(n-1, \alpha/2)}^2$ como puntos criticos:

$$
P\left(\chi_{(n-1, 1-\alpha/2)}^2 \leq J \leq \chi_{(n-1, \alpha/2)}^2\right) = 1-\alpha \\ \\
P\left(\chi_{(n-1, 1-\alpha/2)}^2 \leq \frac{(n-1) s^2}{\sigma^2} \leq \chi_{(n-1, \alpha/2)}^2\right) = 1-\alpha\\ \\
P\left( \frac{(n-1)s^2}{\chi_{(n-1, \alpha/2)}^2}  \leq \sigma^2 \leq \frac{(n-1)s^2}{\chi_{(n-1, 1-\alpha/2)}^2}  \right) = 1-\alpha
$$
Entonces el intervalo de confianza puede ser expresado como:

\begin{equation}
\boxed{
\left( \frac{(n-1)s^2}{\chi_{(n-1, \alpha/2)}^2}, \frac{(n-1)s^2}{\chi_{(n-1, 1-\alpha/2)}^2}  \right)
}
(\#eq:form609)
\end{equation}


## Estadístico F - Cociente de varianzas

### IC para cociente de varianzas (muestras independientes)
El último estadistico estudiado es la F, usado para el cociente de varianzas. Este es usado en  procesos donde se requiere comparar la variabilidad de distintas poblaciones. Para comparar esta variaciones tomamos el supuesto de independencia de las muestras. De clases pasadas sabemos que el estadístico para medir esta variabilidad es la F:

$$ F = \frac{S_X^2 \sigma_Y^2}{S_Y^2 \sigma_X^2} \sim F_{(n-1, m-1)}$$

Entonces, definiendo $F_{(n-1, m-1, 1-\alpha/2)}$ y $F_{(n-1, m-1, \alpha/2)}$ como puntos criticos:

$$
P\left(F_{(n-1, m-1, 1- \alpha/2)} \leq F \leq F_{(n-1, m-1, \alpha/2)}\right) = 1-\alpha \\ \\
P\left(F_{(n-1, m-1, 1- \alpha/2)} \leq \frac{S_X^2 \sigma_Y^2}{S_Y^2 \sigma_X^2} \leq F_{(n-1, m-1, \alpha/2)}\right) = 1-\alpha\\ \\
P\left(\frac{S_Y^2}{S_X^2}F_{(n-1, m-1, 1- \alpha/2)} \leq \frac{\sigma_Y^2}{ \sigma_X^2} \leq    \frac{S_Y^2}{S_X^2} F_{(n-1, m-1, \alpha/2)}\right) = 1-\alpha
$$
Entonces el intervalo de confianza puede ser expresado como:
\begin{equation}
\boxed{
\left(\frac{S_Y^2}{S_X^2}F_{n-1, m-1, 1- \alpha/2}, \frac{S_Y^2}{S_X^2} F_{n-1, m-1, \alpha/2}  \right)
}
(\#eq:form610)
\end{equation}

## Tamaño de muestra

De los intervalos de confianza mostrados anteriormente, se puede ver que muchos dependen de dos factores: el nivel de confianza $1-\alpha$ y del tamaño de muestra $n$. Entonces podemos observar que el tamaño de la muestra influye el intervalo que mostramos. Generalmente el $n$ se encuentra en el denominador, por lo que a mayor tamaño de muestra, el intervalo de confianza se hace más reducido. De las primeras clases del curso se introdujo la expresion:

$$|{\hat{\theta}- \theta}| \leq B$$

Es decir, que tan cerca se encuentra el estimador del parámetro poblacional. La B la definimos coo el error máximo de estimación, tal que:

$$P(|{\hat{\theta}- \theta}| \leq B) = 1-\alpha$$

### Tamaño de muestra para la media

En el caso de la media, tenemos que el intervalo de confianza para $\mu$:

$$\left(\overline{X} - z_{\alpha/2} \frac{\sigma}{\sqrt{n}}, \overline{X} + z_{\alpha/2} \frac{\sigma}{\sqrt{n}}\right)$$
Y adecuando la expresión del tamaño de muestra para el caso tenemos que:

$$P(|{{\overline{X}}- \mu}| \leq B) = 1-\alpha$$
De esta manera, podemos ver $B =z_{\alpha/2} \frac{\sigma}{\sqrt{n}}$. Despejando $n$ de la expresión tenemos que:

$$ n = \frac{(z_{\alpha/2})^2 \sigma^2}{B^2} $$

### Tamaño de muestra para la proporción

En el caso de la proporción, tenemos que el intervalo de confianza para $p$:

$$\left(\hat{p} - z_{\alpha/2} \sqrt{\frac{p(1-p)}{n}}, 
      \hat{p} + z_{\alpha/2} \sqrt{\frac{p(1-p)}{n}} \right)$$

Y adecuando la expresión del tamaño de muestra para el caso tenemos que:

$$P(|{{\hat{p}}- p}| \leq B) = 1-\alpha$$
De esta manera, podemos ver $B =z_{\alpha/2} \frac{\sqrt{\hat{p}({1-\hat{p}})}}{\sqrt{n}}$. Despejando $n$ de la expresión tenemos que:

$$ n = \frac{(z_{\alpha/2})^2 \hat{p}({1-\hat{p}})}{B^2} $$
## Intervalos de confianza de un lado

Otra manera de construir intervalos de confianza es tomando unicamente en cuenta una cola. Se dice que un intervalo de confianza es **inferior** para $\theta$ si unicamente se proporciona un valor mínimo sin especificar un máximo:

$$(B, \infty)$$

Por otro lado, se dice que un intervalo de confianza es **superior** para $\theta$ si unicamente se proporciona un valor máximo sin especificar un valor mínimo:
$$(-\infty, A)$$

## Pruebas de hipótesis

Las pruebas de hipótesis se componen de 4 elementos:

1. Hipótesis Nula
2. Hipótesis Alternativa
3. Estadístico de Prueba
4. Región de Rechazo

## Ejemplo de estadístico Z

### Diferencia de Medias

### Diferencia de Proporciones
**CDE: 5.2.15** 
\BeginKnitrBlock{exercise}<div class="exercise"><span class="exercise" id="exr:unnamed-chunk-1"><strong>(\#exr:unnamed-chunk-1) </strong></span>En un estudio reciente, se investigó el efecto de la ingesta de una cierta sustancia en el desarrollo de cáncer pulmonar. Se encontró que de 488 hombres que habían ingerido una baja cantidad de esta sustancia, 14 desarrollaron cáncer pulmonar. En un grupo del mismo tamaño en el que el consumo de esta sustancia era mayor, sólo 5 personas desarrollaron cáncer pulmonar.
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

<img src="Chap07_inferential_statistics_files/figure-html/unnamed-chunk-3-1.png" width="672" />

**No Rechazamos H_0**

b) Obtenga el nivel de significancia descriptivo o valor p

valor-p = $pnorm(-2.09) = 0.0183089$

## Ejemplo de estadistico T

### Diferencia de medias pareada

**CDE: 5.2.16** 
\BeginKnitrBlock{exercise}<div class="exercise"><span class="exercise" id="exr:unnamed-chunk-4"><strong>(\#exr:unnamed-chunk-4) </strong></span>Supóngase que, un psicólogo piensa que la edad influye en el coeficiente de inteligencia (IQ). Se toma una muestra aleatoria de 100 personas de mediana edad, de quienes se conoce su IQ a la edad de 16 años y actualmente. De restar, los coeficientes de su juventud de los coeficientes actuales, se obtuvo una diferencia promedio de 6 puntos, con una desviación estándar muestral de 7 puntos. Utilice $\alpha = .01$ para probar la hipotesis de que el IQ aumenta con la edad.</div>\EndKnitrBlock{exercise}

X: IQ a los 16 años
Y: IQ actual
$\bar{D}: \bar{Y}-\bar{X} = 6$
$S_{\bar{D}} = 7$  

1. Hipótesis Nula: $H_0: \mu_D = 0$

2. Hipótesis Alternativa: $H_1: \mu_D > 0$

3. Estadístico de Prueba: $T =\frac{\bar{D} - \mu_{\bar{D}}}{\sqrt{\frac{{S_{\bar{D}^2}}}{n}}} = \frac{6 - 0}{\sqrt{\frac{7^2}{100}}} = 8.5714$

4. Región de Rechazo: $RR = \{T < T_{99, 0.01}\} = \{T < qt(.99,99)\} = \{Z < 2.3646\}$

<img src="Chap07_inferential_statistics_files/figure-html/unnamed-chunk-6-1.png" width="672" />

**Rechazamos H_0**

valor-p = $pt(8.5714, 99, lower.tail = F) \sim 0$

## Ejemplo de estadistico J

**CDE: 5.2.23** 
\BeginKnitrBlock{exercise}<div class="exercise"><span class="exercise" id="exr:unnamed-chunk-7"><strong>(\#exr:unnamed-chunk-7) </strong></span>La Policía Federal de Caminos desea probar un radar detector de velocidades. Para esto hace circular frente al radar 61 patrullas a una velocidad de 110 Km/h. según su correspondiente velocímetro. De las 61 lecturas del radar obtiene $s^2 = 1.69$. Según la PFC el radar es aceptable si $\sigma <2km/h$. Adopte el punto de vista que el error grave es comprar el radar cuando en realidad el error de medición está por arriba del límite.
a) Formule las hipótesis H0 y H1 apropiadas a este problema.
b) Pruebe las hipótesis de a) con un nivel de significancia del 1\%.
c) De una cota superior para el valor de P.
d) Verifique que la decisión de b) concuerda con la estimación de c)</div>\EndKnitrBlock{exercise}

1. Hipótesis Nula: $H_0: \sigma^2 = 4$

2. Hipótesis Alternativa: $H_1: \sigma^2 < 4$

3. Estadístico de Prueba: $J =\frac{(n-1)S^2}{\sigma^2} = \frac{(61-1) 1.69}{4}= 25.35$

4. Región de Rechazo: $RR = \{J < J_{0.01,60}\} = \{J < qchisq(.01,60)\} = \{J < 37.4849\}$

<img src="Chap07_inferential_statistics_files/figure-html/unnamed-chunk-8-1.png" width="672" />

**Rechazamos H_0**

valor-p = $pchisq(25.35, 60) \sim 0$

## Ejemplo de estadistico F


**CDE: 5.2.18** 
\BeginKnitrBlock{exercise}<div class="exercise"><span class="exercise" id="exr:unnamed-chunk-9"><strong>(\#exr:unnamed-chunk-9) </strong></span>La estabilidad de las mediciones de las características de un producto manufacturado es importante para mantener su calidad. En realidad, es mejor tener, a veces, una pequeña variación en el valor medio de alguna característica importante de un producto y tener una media del proceso un poco fuera del "blanco", que tener una amplia variación con una media que se ajuste perfectamente a las necesidades. La última situación puede producir un porcentaje mayor de productos defectuosos que la primera. Un fabricante de lámparas eléctricas sospechoso que una de sus líneas de producción estaba fabricando bombillas con una alta variación en su vida útil. Para probar su teoría comparó la vida útil de $n = 40$ lámparas, muestreadas al azar, de la línea que supuestamente no trabajaba bien, y $m = 40$ de la línea que parecía estar "bajo control". Las medias y las varianzas de las muestras para las dos líneas eran:
a) ¿Proporcionan los datos evidencia suficiente para indicar que las bombillas (o focos), producidos por la línea que supuestamente trabaja mal poseen una mayor varianza en la vida útil que las lámparas producidas por la línea que supuestamente estaba bajo control? Utilice $\alpha = 0.05$.
b) Encuentre el nivel de significancia descriptivo que se ha observado para la prueba e interprete su valor.</div>\EndKnitrBlock{exercise}

1. Hipótesis Nula: $H_0: \sigma^2_1 = \sigma^2_2 \Rightarrow \frac{\sigma^2_1}{\sigma^2_2} = 1$

2. Hipótesis Alternativa: $H_1: \sigma^2_1 > \sigma^2_2 \Rightarrow \frac{\sigma^2_1}{\sigma^2_2} > 1$

3. Estadístico de Prueba: $F =\frac{S_2^2 \sigma^2_1}{S_1^2\sigma^2_2} = \frac{37000}{92000} = 0.4021739$

4. Región de Rechazo: $RR = \{F > F_{0.05,39,39}\} = \{F > qf(.95,39,39)\} = \{F > 1.704465\}$


<img src="Chap07_inferential_statistics_files/figure-html/unnamed-chunk-10-1.png" width="672" />

**No Rechazamos H_0**

valor-p = $pf(0.4021739, 39,  39, lower.tail = F) \sim 0.997279$





