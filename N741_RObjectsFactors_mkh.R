library(knitr)
library(dplyr)

x <- c(1.12, 1.13, 4.23)
class(x)

y <- as.integer(c(1,2,3,4))
class(y)

animal <- 
  c("turtle","snail","butterfly",
    "turtle","butterfly")
class(animal)
table(animal) %>% knitr::kable()

hosp_choice <- c(1,1,2,3,2,2,4)
hospital <- 
  factor(hosp_choice,
         levels = c(1,2,3,4),
         labels = c("EHospital",
                    "EMidtown",
                    "EDecatur",
                    "St. Joe"))
table(hospital) %>% knitr::kable()

feeling <- 
  c("ok","ok","awesome","awful")
table(feeling) %>% knitr:: kable()

feeling_ordf <- 
  factor(feeling,
         levels = c("awesome",
                    "ok",
                    "awful"),
         ordered = TRUE) #<<
table(feeling_ordf) %>% knitr:: kable()

animals <- c("shark","shark","dino","dino","shark")
table(animals) %>% knitr::kable()

extinct <- animals == "dino"
table(extinct) %>% knitr::kable()

sum(extinct)
mean(extinct)

# multiply by 100 to get percent TRUE
mean(extinct)*100

