# 1.1.1) R Projects & Paths -----------------------------------------------
{
  # Directorio de trabajo (PATH)
  # Es donde se guardan por default los archivos y donde se leen por default. Podemos dividirlo como: 
  # - Path absoluto: especifica la ruta desde el root del sistema (por ejemplo: C:\Users\salvador\projecto1\archivo1.csv)
  # - Path relativo: es relativo a la carpeta (por ejemplo: archivo1.csv)
  # Al inicializar un proyecto, todo se usa a través de un path relativo   
}

getwd() # obtiene el path absoluto por default
setwd("/cloud/project/") # permite hacer overwrite del path por default

# 1.1.2) Installing & loading packages ------------------------------------
{
  # Para usar un paquete/libreria en R, son dos pasos: instalar y cargar libreria
  # Paso 1 (instalar paquete/libreria) - solo se corre una vez: install.packages("package")
  # Paso 2 (cargar paquete/libreria) - se corre cada vez que se requiera usar el paquete ya instalado: library(package)
  # Para visualizar todos los paquetes se puede ocupar el panel derecho en la pestaña de packages o bien con la funcion: installed.packages()
}

install.packages("tidyr")
library(tidyr) 
installed.packages()

# 1.1.3) Dataframes -------------------------------------------------------
{
  # Un dataframe es una estructura de datos que nos permite almacenar una tabla o base de datos en R. Se compone de columnas y renglones   
  # head(): obtiene primeros 5 registros
  # tail(): obtiene ultimos 5 registros
  # View(): visualiza de manera mas amigable la tabla
  # %>%: se le conoce como pipe, sirve para pasar datos (en un substituto de anidación)
}

tail(head(mtcars, 10), 5)
mtcars %>% head(10) %>% tail(5)
mtcars %>% head(5)
mtcars %>% tail(5) 
mtcars %>% View() 

# 1.1.4) Long & wide database formats [tidyr package] ---------------------
{
  # En procesamiento de bases comunmente se utilizan dos tipos de layout (largo/long, ancho/wide). 
  # En el formato wide, se tiene un renglon por cada data point y multiples columnas que contienen los atributos
  # En el formato long, cada punto se repite n veces de acuerdo al nùmero de atributos  
  # R viene con algunos databases integrados, mtcars es uno de ellos
  # tidyr::gather() pasa de formato ancho a largo
  # tidyr::spread() pasa de formato largo a ancho
  # El formato que comunmente estamos acostumbrados es el ancho, pero para R y procesamiento de datos 
  # es más común y mejor práctica trabajar sobre formatos largos.
}

library(tidyr)
wide_db <- 
  mtcars %>% 
  dplyr::mutate(car_type = row.names(.)) %>% 
  dplyr::filter(car_type == "Camaro Z28") 

wide_db %>% View()

long_db <- 
  wide_db %>% 
  tidyr::gather(attribute, value, mpg:carb)

wide_db <- 
  long_db %>% 
  tidyr::spread(attribute, value)

# 1.1.5) The tidyverse ----------------------------------------------------
{
  # tidyverse es una colección de paquetes/librerias que sirven para el análisis de datos.  
}

library(tidyverse)


# 1.1.6) Pipes [magrittr package] -----------------------------------------
{
  # El pipe sirve para tener conceptualmente en una misma pieza de código una serie de pasos. 
  # En el ejemplo de la sección 1.1.4 se puede ver ejemplificado  
}

wide_db %>% 
  tidyr::gather(attribute, value, mpg:carb) %>% 
  tidyr::spread(attribute, value)

# 1.1.7) R benchmarking ---------------------------------------------------
{
  # Hay una gran discusiòn acerca del performance entre lenguajes de programación R/python.
  # Ambas herramientas pueden realizar analisis muy similares, pero en cuanto a performance python supera a R. 
  # Además, Python es un lenguaje multipurpose y con un mayor número de adeptos (permite realizar paginas web/automatizaciones/etc)
  # Otra ventaja de Python es que permite tener en productivo aplicaciones con buen performance.
  # A mi parecer, R tiene una curva de aprendizaje más suave y tiene un soporte de Rstudio casi nativo. Además, 
  # para su uso básico permite realizar analisis de datos y estadística muy sencillo y contiene una libreria muy intuitiva para graficas (ggplot2)
  # Para mayor documentación del performance de R vs Python vs C puede consultar:
  # http://r.cs.purdue.edu/pub/ecoop12.pdf  
}

# 1.2.1) From flatfiles (csv, txt) [readr package]  
{
  # readr es una libreria para leer datos rectangulares (en forma de tabla)
  # readr::read_csv(): te permite leer datos desde un comma separated file (*.csv), 
  # readr::read_delim(): te permite leer datos de un file delimitado por un separador (tabulador, punto y coma, etc)
  # readr::write_csv(): te permite escribir archivos a un csv.
  # readr::write_delim(): te permite escribir archivos delimitados por un separador
}

library(readr)
readr::write_csv(mtcars, "mtcars.csv")
file <- readr::read_csv("mtcars.csv")

readr::write_delim(mtcars, "mtcars.txt", delim = "\t")
file <- readr::read_delim("mtcars.txt", delim = "\t")


# 1.2.2) From excel [readxl package] --------------------------------------
{
  # para leer/escribir archivos de excel, se usan las librerias readxl y writexl
  # write_xlsx(): te permite escribir archivos de xlsx
  # read_xlsx(): te permite leer de archivos xlsx
}

library(readxl)
library(writexl)

writexl::write_xlsx(mtcars, "mtcars.xlsx")
file <- readxl::read_excel("mtcars.xlsx")

# 1.2.3) From other source of data [haven package]  -----------------------
{
  # la libreria haven te permite escribir y leer archivos más complicados (por ejemplo de sas, spss, stata)
  # siguen la misma estructura que los paquetes pasados:
  # write_sas(): te permite escribir archivos .sas7bdat (de sas)
  # read_sas(): te permite leer archivos .sas7bdat (de sas)
}
library(haven)

haven::write_sas(mtcars, "mtcars.sas7bdat")
file <- haven::read_sas("mtcars.sas7bdat")

# 1.3.1) Framework for data visualization [ggplot2 package] ---------------
{
  # R cuenta con distintos formas de realizar gráficas. Las más comunes y menos estéticas son a
  # través de los paquetes 'base' y 'lattice'. Estos paquetes son antiguos y están entrando en
  # desuso. La libreria más popular ahora es'ggplot2'
  
  # ggplot2 es una libreria que trabaja por 'capas' y trabaja sobre formatos largos de base de datos
  # ggplot(): es la base de la gráfica. Inicializa una grafica vacia.
  # aes(): se les llama los aesthetics. Es lo que define en que valor de x, y, color, relleno, tamaño tendrá la gráfica
  
  
  # todas las funciones de ggplot que inician con geom_ definen distintos tipos de gráficas.
  # geom_point(): Te define una grafica de puntos (o scatterplot). 
  # geom_bar(): Te define una grafica de barras (o barplot)
  # geom_histogram(): Te define un histograma
  # geom_line(): Te define una gráfica de linea
  # geom_boxplot(): Te define gráfica de boxplot
  # asi como muchos otros tipos de gráfica

  # Cada gráfica le podemos añadir o modificar cuestiones del formato.
  # theme(): dentro de esta funcion podemos agregar o modificar particularidades de la grafica
 
  # Además, se le puede modificar el texto de la gráfica
  # labs(): te permite modificar el texto del eje x, eje y, titulo, subtitulo, caption, etc
}

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

# 1.3.2) Basic plots: Scatterplot, Barplot  ----------------------
{
  # Para un scatterplot debemos definir la x,y dentro de los aesthetics (recuerden que los aesthetics son variables)
  # del data.frame.
  
  # Para el scatterplot, obligatoriamente debemos definir x,y:
  # x = tipo de automovil (car_type)
  # y = número de cilindros (carb)
  # opcionalmente podemos definir el color y el tamaño del punto
  
  # despues de definir el geom_point() se procede a usar un template de formato
  # theme_minimal() para despues modificar elementos particulares con theme()
  # al final, modificamos el texto de los ejes con labs()
}

# Scatterplot
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

{
  # Para el barplot obligatroiamente debemos definir los siguientes aes():
  # Definir x (en el caso de usar stat = "count")
  # Definir x,y (en el caso de usar stat = "identity")
  # ademas de estos aes, en este caso se añadio fill
  # Después de esto, definimos de nuevo el theme_minimal() y 
  # se eligio manualmente el color de fill con scale_fill_manual
}

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

# 1.4.1) Density function (dnorm, dunif, dt, dchisq) ----------------------

{
  # En R también se puede calcular la funcion de densidad de una lista de distribuciones:
  # https://stat.ethz.ch/R-manual/R-devel/library/stats/html/Distributions.html
}

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
  
  

# 1.4.2) Distribution function (pnrom, punif, pt, pchisq)  ----------------

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
    
    
# 1.4.3) Quantile function (qnorm, qunif, qt, qchisq) ---------------------

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

#   1.4.4) Random samples (rnorm, runif, rt, rchisq)

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






