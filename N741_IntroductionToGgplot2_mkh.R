## ----setup, include=FALSE-------------------------------------
# For htmltools package, you may set options(htmltools.dir.version = FALSE) to suppress the version number in the subdirectory name.
options(htmltools.dir.version = FALSE)
knitr::opts_chunk$set(echo = TRUE)
knitr::opts_chunk$set(warning = FALSE)
knitr::opts_chunk$set(message = FALSE)

library(knitr)
library(dplyr)
library(ggplot2)


## ----out.width = '80%', echo=FALSE----------------------------
knitr::include_graphics("img/ggfree.jpg")


## ----out.width = '75%', echo=FALSE----------------------------
knitr::include_graphics("img/mancalas.jpg")


## ----message=FALSE, warning=FALSE, error=FALSE----------------
library(kandinsky)
kandinsky(iris)


## -------------------------------------------------------------
kandinsky(airquality)


## ----out.width = '100%', echo=FALSE---------------------------
knitr::include_graphics("img/rgraphgallery_parallel.JPG")


## ----out.width = '100%', echo=FALSE---------------------------
knitr::include_graphics("img/rgraphgallery_boxplotjitter.JPG")


## ----out.width = '80%', echo=FALSE----------------------------
knitr::include_graphics("img/rgraphgallery_violinboxplot.JPG")


## ----out.width = '100%', echo=FALSE---------------------------
knitr::include_graphics("img/rgraphgallery_lollipoprose.JPG")


## ----plot-label, eval=FALSE-----------------------------------
## library(palmerpenguins)
## 
## # Make a scatterplot
## ggplot(penguins) +
##   aes(x=bill_length_mm,
##       y=bill_depth_mm,
##       color = species) +
##   geom_point() +
##   xlab("Bill Length (mm)") +
##   ylab("Bill Depth (mm)") +
##   ggtitle("Penguins Bill Dimensions")
## 


## ----plot-label-out, ref.label="plot-label", echo=FALSE, out.width="100%"----


## ----plot-label1, eval=FALSE----------------------------------
## # Step 1 specify dataset
## # penguins for ggplot()
## ggplot(penguins) #<<


## ----plot-label1-out, ref.label="plot-label1", echo=FALSE, out.width="100%"----


## ----plot-label2, eval=FALSE----------------------------------
## # Next add aes (aesthetics)
## ggplot(penguins) +
##   aes(x=bill_length_mm, #<<
##       y=bill_depth_mm)  #<<


## ----plot-label2-out, ref.label="plot-label2", echo=FALSE, out.width="100%"----


## ----plot-label3, eval=FALSE----------------------------------
## # Add points to graph
## ggplot(penguins) +
##   aes(x=bill_length_mm,
##       y=bill_depth_mm) +
##   geom_point() #<<
## 


## ----plot-label3-out, ref.label="plot-label3", echo=FALSE, out.width="100%"----


## ----plot-label4, eval=FALSE----------------------------------
## # Add color aesthetic
## ggplot(penguins) +
##   aes(x=bill_length_mm,
##       y=bill_depth_mm,
##       color = species) + #<<
##   geom_point()
## 


## ----plot-label4-out, ref.label="plot-label4", echo=FALSE, out.width="100%"----


## ----plot-label5, eval=FALSE----------------------------------
## # Add axis labels and a title
## ggplot(penguins) +
##   aes(x=bill_length_mm,
##       y=bill_depth_mm,
##       color = species) +
##   geom_point() +
##   xlab("Bill Length(mm)") +   #<<
##   ylab("Bill Depth (mm)") +    #<<
##   ggtitle("Penguins Bill Dimensions")  #<<
## 


## ----plot-label5-out, ref.label="plot-label5", echo=FALSE, out.width="100%"----


## ----plot-label6, eval=FALSE----------------------------------
## # Add axis labels and a title
## ggplot(penguins) +
##   aes(x=bill_length_mm,
##       y=bill_depth_mm,
##       color = species) +
##   geom_point() +
##   xlab("Bill Length(mm)") +
##   ylab("Bill Depth (mm)") +
##   ggtitle("Penguins Bill Dimensions") +
##   theme_dark() #<<
## 


## ----plot-label6-out, ref.label="plot-label6", echo=FALSE, out.width="100%"----


## ----ggtheme1, eval=FALSE-------------------------------------
## library(ggthemes)
## 
## ggplot(penguins) +
##   aes(x=bill_length_mm,
##       y=bill_depth_mm,
##       color = species) +
##   geom_point() +
##   xlab("Bill Length(mm)") +
##   ylab("Bill Depth (mm)") +
##   ggtitle("WSJ Theme") +
##   theme_wsj()


## ----ggtheme1-out, ref.label="ggtheme1", echo=FALSE, out.width="90%"----


## ----ggthemr1, eval=FALSE-------------------------------------
## library(ggthemr)
## 
## ggthemr('pale')
## ggplot(penguins,
##        aes(x=bill_length_mm,
##            y=bill_depth_mm,
##            colour = species)) +
##   geom_point() +
##   xlab("Bill Length(mm)") +
##   ylab("Bill Depth (mm)") +
##   ggtitle("ggthemr - pale theme") +
##   scale_colour_ggthemr_d()
## ggthemr_reset()
## 


## ----ggthemr1-out, ref.label="ggthemr1", echo=FALSE, out.width="90%"----


## ----histplot, eval=FALSE-------------------------------------
## # Look at flipper_length_mm
## # for Palmer Penguins
## # Histogram with density curve
## # Use y=..density..
## # Overlay with transparent density plot
## ggplot(penguins,
##        aes(x=flipper_length_mm)) +
##   geom_histogram(aes(y=..density..),
##                  binwidth=2,
##                  colour="black",
##                  fill="white") +
##   geom_density(alpha=.2,
##                fill="#FF6666")


## ----histplot-out, ref.label="histplot", echo=FALSE, out.width="90%"----


## ----histplot2, eval=FALSE------------------------------------
## # Look at flipper_length_mm
## # for Palmer Penguins
## # Histogram with density curve
## # Use y=..density..
## # Overlay with transparent density plot
## ggplot(penguins,
##        aes(x=flipper_length_mm)) +
##   geom_histogram(aes(y=..density..),
##                  binwidth=2,
##                  colour="black",
##                  fill="white") +
##   geom_density(alpha=.2,
##                fill="#FF6666") +
##   facet_wrap(vars(species)) #<<


## ----histplot2-out, ref.label="histplot2", echo=FALSE, fig.dim=c(5, 3), out.width="100%"----


## ----out.width = '20%', echo=FALSE----------------------------
knitr::include_graphics("img/patchworklogo.png")


## ----out.width = '80%', echo=FALSE----------------------------
knitr::include_graphics("img/patchwork_blank.png")


## ----plot-patch, eval=FALSE-----------------------------------
## library(ggplot2)
## library(patchwork)
## 
## # save each plot as an object
## p1 <- ggplot(penguins,
##          aes(x=bill_length_mm,
##              y=bill_depth_mm,
##              color = species)) +
##   geom_point()
## 
## p2 <- ggplot(penguins,
##              aes(x=species,
##                  y=bill_length_mm)) +
##   geom_boxplot() +
##   xlab("Species") +
##   ylab("Bill Depth (mm)")
## 
## p3 <-
##   ggplot(penguins,
##          aes(x=flipper_length_mm)) +
##   geom_histogram(aes(y=..density..),
##     binwidth=2, colour="black",
##     fill="white") +
##   geom_density(alpha=.2, fill="#FF6666") +
##   facet_wrap(vars(species))
## 
## # arrange plots as you like
## (p1 | p2) / p3


## ----plot-patch-out, ref.label="plot-patch", echo=FALSE, fig.dim=c(8, 8)----

