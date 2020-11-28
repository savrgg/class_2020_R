---
title: "06_estimacion_intervalos"
author: "Salvador Garcia"
output:   
  html_document:
    toc: true
    theme: united
    toc_depth: 4

---

# Estimación por intervalos

Durante el tema anterior se abordó la estimación puntual, donde se proporciona un solo valor que nos da una idea de un parámetro $\theta$. A veces un solo valor no es suficiente y es requerido tener un rango de valores donde creemos se encuentra el parámetro. 

**Nivel de confianza**: Grado de seguridad que se tiene sobre la veracidad de una afirmación acerca del parámetro (o parámetros) de interés. El nivel de confianza se denota como $1-\alpha$ con $\alpha$ constante entre 0 y 1. 

**Intervalo de confianza (IC)**: Rango de valores en el que se encuentra el verdadero valor del parámetro $\theta$. Este rango de valores es dependiente la nivel de confianza $1-\alpha$. Sean $T_1$ y $T_2$ dos estadísticas tal que:

$$P(T_1 < \theta < T_2) = 1 - \alpha$$

Entonces $(T_1, T_2)$ es un intervalo tal que la probabilidad que el verdadero parámetro $\theta$ se encuentre dentro de los valores es $1-\alpha$


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




