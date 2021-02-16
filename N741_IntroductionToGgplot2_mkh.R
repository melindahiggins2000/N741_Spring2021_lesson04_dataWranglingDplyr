## ----setup, include=FALSE-------------------------------
# For htmltools package, you may set options(htmltools.dir.version = FALSE) to suppress the version number in the subdirectory name.
options(htmltools.dir.version = FALSE)
knitr::opts_chunk$set(echo = TRUE)
knitr::opts_chunk$set(warning = FALSE)
knitr::opts_chunk$set(message = FALSE)

library(knitr)
library(dplyr)
library(ggplot2)


## ----out.width = '80%', echo=FALSE----------------------
knitr::include_graphics("img/ggfree.jpg")


## ----out.width = '75%', echo=FALSE----------------------
knitr::include_graphics("img/mancalas.jpg")


## ----message=FALSE, warning=FALSE, error=FALSE----------
library(kandinsky)
kandinsky(iris)


## -------------------------------------------------------
kandinsky(airquality)


## ----out.width = '100%', echo=FALSE---------------------
knitr::include_graphics("img/rgraphgallery_parallel.JPG")


## ----out.width = '100%', echo=FALSE---------------------
knitr::include_graphics("img/rgraphgallery_boxplotjitter.JPG")


## ----out.width = '80%', echo=FALSE----------------------
knitr::include_graphics("img/rgraphgallery_violinboxplot.JPG")


## ----out.width = '100%', echo=FALSE---------------------
knitr::include_graphics("img/rgraphgallery_lollipoprose.JPG")


## ----plot-label, eval=FALSE-----------------------------
## # Make a scatterplot
## ggplot(iris) +
##   aes(x=Sepal.Length,
##       y=Sepal.Width,
##       color = Species) +
##   geom_point() +
##   xlab("Sepal Length") +
##   ylab("Sepal Width") +
##   ggtitle("IRIS Dataset")
## 


## ----plot-label-out, ref.label="plot-label", echo=FALSE, fig.dim=c(4.8, 4.5), out.width="100%"----


## ----plot-label1, eval=FALSE----------------------------
## # Step 1 specify dataset iris for ggplot()
## ggplot(iris) #<<


## ----plot-label1-out, ref.label="plot-label1", echo=FALSE, fig.dim=c(4.8, 4.5), out.width="100%"----


## ----plot-label2, eval=FALSE----------------------------
## # Next add aes (aesthetics)
## ggplot(iris) +
##   aes(x=Sepal.Length, #<<
##       y=Sepal.Width)  #<<


## ----plot-label2-out, ref.label="plot-label2", echo=FALSE, fig.dim=c(4.8, 4.5), out.width="100%"----


## ----plot-label3, eval=FALSE----------------------------
## # Add points to graph
## ggplot(iris) +
##   aes(x=Sepal.Length,
##       y=Sepal.Width) +
##   geom_point() #<<
## 


## ----plot-label3-out, ref.label="plot-label3", echo=FALSE, fig.dim=c(4.8, 4.5), out.width="100%"----


## ----plot-label4, eval=FALSE----------------------------
## # Add color aesthetic
## ggplot(iris) +
##   aes(x=Sepal.Length,
##       y=Sepal.Width,
##       color = Species) + #<<
##   geom_point()
## 


## ----plot-label4-out, ref.label="plot-label4", echo=FALSE, fig.dim=c(4.8, 4.5), out.width="100%"----


## ----plot-label5, eval=FALSE----------------------------
## # Add axis labels and a title
## ggplot(iris) +
##   aes(x=Sepal.Length,
##       y=Sepal.Width,
##       color = Species) +
##   geom_point() +
##   xlab("Sepal Length") +   #<<
##   ylab("Sepal Width") +    #<<
##   ggtitle("IRIS Dataset")  #<<
## 


## ----plot-label5-out, ref.label="plot-label5", echo=FALSE, fig.dim=c(4.8, 4.5), out.width="100%"----


## ----plot-label5a, eval=FALSE---------------------------
## # Add axis labels and a title
## ggplot(iris) +
##   aes(x=Sepal.Length,
##       y=Sepal.Width,
##       color = Species) +
##   geom_point() +
##   xlab("Sepal Length") +   #<<
##   ylab("Sepal Width") +    #<<
##   ggtitle("IRIS Dataset")  #<<
## 


## ----plot-label5a-out, ref.label="plot-label5a", echo=FALSE, fig.dim=c(4.8, 4.5), out.width="100%"----


## ----histplot, eval=FALSE-------------------------------
## # Use iris dataset
## # Petal.Width variable
## # Histogram with density curve
## # Use y=..density..
## # Overlay with transparent density plot
## ggplot(iris, aes(x=Petal.Width)) +
##   geom_histogram(aes(y=..density..),
##                  binwidth=.5,
##                  colour="black",
##                  fill="white") +
##   geom_density(alpha=.2,
##                fill="#FF6666") +
##   xlim(-1, 4) #<<


## ----histplot-out, ref.label="histplot", echo=FALSE, fig.dim=c(4.8, 4.5), out.width="100%"----


## ----out.width = '20%', echo=FALSE----------------------
knitr::include_graphics("img/patchworklogo.png")


## ----plot-patch, eval=FALSE-----------------------------
## library(ggplot2)
## library(patchwork)
## 
## # save each plot as an object
## p1 <- ggplot(mtcars) + geom_point(aes(mpg, disp))
## p2 <- ggplot(mtcars) + geom_boxplot(aes(gear, disp, group = gear))
## p3 <- ggplot(mtcars) + geom_smooth(aes(disp, qsec))
## p4 <- ggplot(mtcars) + geom_bar(aes(carb))
## 
## # arrange plots as you like
## (p1 | p2 | p3) / p4


## ----plot-patch-out, ref.label="plot-patch", echo=FALSE, fig.dim=c(10, 5)----

