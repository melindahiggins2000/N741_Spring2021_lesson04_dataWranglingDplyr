library(knitr)
library(dplyr)
library(ggplot2)

library(kandinsky)
kandinsky(iris)
kandinsky(airquality)

library(palmerpenguins)
 
# Make a scatterplot
ggplot(penguins) +
  aes(x=bill_length_mm,
     y=bill_depth_mm,
     color = species) +
  geom_point() +
  xlab("Bill Length (mm)") +
  ylab("Bill Depth (mm)") +
  ggtitle("Penguins Bill Dimensions")

# Step 1 specify dataset
# penguins for ggplot()
ggplot(penguins) 

# Next add aes (aesthetics)
ggplot(penguins) +
 aes(x=bill_length_mm, #<<
     y=bill_depth_mm)  #<<

# Add points to graph
ggplot(penguins) +
 aes(x=bill_length_mm,
     y=bill_depth_mm) +
 geom_point() #<<
 
# Add color aesthetic
ggplot(penguins) +
 aes(x=bill_length_mm,
     y=bill_depth_mm,
     color = species) + #<<
 geom_point()

# Add axis labels and a title
ggplot(penguins) +
 aes(x=bill_length_mm,
     y=bill_depth_mm,
     color = species) +
 geom_point() +
 xlab("Bill Length(mm)") +   #<<
 ylab("Bill Depth (mm)") +    #<<
 ggtitle("Penguins Bill Dimensions")  #<<

# Add axis labels and a title
ggplot(penguins) +
 aes(x=bill_length_mm,
     y=bill_depth_mm,
     color = species) +
 geom_point() +
 xlab("Bill Length(mm)") +
 ylab("Bill Depth (mm)") +
 ggtitle("Penguins Bill Dimensions") +
 theme_dark() #<<

library(ggthemes)
 
ggplot(penguins) +
 aes(x=bill_length_mm,
     y=bill_depth_mm,
     color = species) +
 geom_point() +
 xlab("Bill Length(mm)") +
 ylab("Bill Depth (mm)") +
 ggtitle("WSJ Theme") +
 theme_wsj()

library(ggthemr)

ggthemr('pale')
ggplot(penguins,
      aes(x=bill_length_mm,
          y=bill_depth_mm,
          colour = species)) +
 geom_point() +
 xlab("Bill Length(mm)") +
 ylab("Bill Depth (mm)") +
 ggtitle("ggthemr - pale theme") +
 scale_colour_ggthemr_d()
ggthemr_reset()
 
# Look at flipper_length_mm
# for Palmer Penguins
# Histogram with density curve
# Use y=..density..
# Overlay with transparent density plot
ggplot(penguins,
      aes(x=flipper_length_mm)) +
 geom_histogram(aes(y=..density..),
                binwidth=2,
                colour="black",
                fill="white") +
 geom_density(alpha=.2,
              fill="#FF6666")

# Look at flipper_length_mm
# for Palmer Penguins
# Histogram with density curve
# Use y=..density..
# Overlay with transparent density plot
ggplot(penguins,
      aes(x=flipper_length_mm)) +
 geom_histogram(aes(y=..density..),
                binwidth=2,
                colour="black",
                fill="white") +
 geom_density(alpha=.2,
              fill="#FF6666") +
 facet_wrap(vars(species)) #<<

library(ggplot2)
library(patchwork)

# save each plot as an object
p1 <- ggplot(penguins,
        aes(x=bill_length_mm,
            y=bill_depth_mm,
            color = species)) +
 geom_point()

p2 <- ggplot(penguins,
            aes(x=species,
                y=bill_length_mm)) +
 geom_boxplot() +
 xlab("Species") +
 ylab("Bill Depth (mm)")
 
p3 <-
 ggplot(penguins,
        aes(x=flipper_length_mm)) +
 geom_histogram(aes(y=..density..),
   binwidth=2, colour="black",
   fill="white") +
 geom_density(alpha=.2, fill="#FF6666") +
 facet_wrap(vars(species))
 
# arrange plots as you like
(p1 | p2) / p3

