## ----setup, include=FALSE------------------------------
# For htmltools package, you may set options(htmltools.dir.version = FALSE) to suppress the version number in the subdirectory name.
options(htmltools.dir.version = FALSE)
library(knitr)
library(dplyr)


## ------------------------------------------------------
library(palmerpenguins)
str(penguins)


## ------------------------------------------------------
head(penguins)


## ------------------------------------------------------
class(penguins)


## ------------------------------------------------------
tail(penguins, 10)


## ----echo=FALSE----------------------------------------
a <- getOption("width")
options(width=120)


## ------------------------------------------------------
penguins.df <- data.frame(penguins)
class(penguins.df)
head(penguins.df)


## ----echo=FALSE----------------------------------------
options(width=a)


## ------------------------------------------------------
penguins %>%
  pull(bill_length_mm) %>%
  mean()


## ------------------------------------------------------
penguins %>%
  pull(bill_length_mm) %>%
  mean(na.rm = TRUE)


## ------------------------------------------------------
mean(penguins$bill_length_mm, na.rm = TRUE)


## ------------------------------------------------------
penguins %>%
  select(body_mass_g, flipper_length_mm) %>%
  summary()


## ------------------------------------------------------
penguins %>%
  select(body_mass_g, flipper_length_mm) %>%
  summarise(
    body_mean = mean(body_mass_g, na.rm=TRUE),
    body_sd = sd(body_mass_g, na.rm=TRUE),
    flip_mean = mean(flipper_length_mm, na.rm=TRUE),
    flip_sd = sd(flipper_length_mm, na.rm=TRUE)
  )


## ------------------------------------------------------
penguins %>%
  select(body_mass_g, flipper_length_mm, species) %>%
  group_by(species) %>% #<<
  summarise(
    body_mean = mean(body_mass_g, na.rm=TRUE),
    body_sd = sd(body_mass_g, na.rm=TRUE),
    flip_mean = mean(flipper_length_mm, na.rm=TRUE),
    flip_sd = sd(flipper_length_mm, na.rm=TRUE)
  )


## ------------------------------------------------------
penguins %>%
  select(body_mass_g, flipper_length_mm, species) %>%
  group_by(species) %>%
  summarise(
    body_mean = mean(body_mass_g, na.rm=TRUE),
    body_sd = sd(body_mass_g, na.rm=TRUE),
    flip_mean = mean(flipper_length_mm, na.rm=TRUE),
    flip_sd = sd(flipper_length_mm, na.rm=TRUE)
  ) %>%
  knitr::kable() #<<


## ------------------------------------------------------
penguins %>%
  select(body_mass_g, flipper_length_mm, species) %>%
  group_by(species) %>%
  summarise(
    body_mean = mean(body_mass_g, na.rm=TRUE),
    body_sd = sd(body_mass_g, na.rm=TRUE),
    flip_mean = mean(flipper_length_mm, na.rm=TRUE),
    flip_sd = sd(flipper_length_mm, na.rm=TRUE)
  ) %>%
  knitr::kable(col.names = c("Species", #<<
                             "Mean Body Mass (g)", #<<
                             "SD of Body Mass (g)", #<<
                             "Mean Flipper Length (mm)", #<<
                             "SD of Flipper Length (mm)")) #<<


## ----out.width = '=100%', echo=FALSE-------------------
knitr::include_graphics("img/dplyr_across.png")


## ------------------------------------------------------
penguins %>%
  group_by(species) %>%
  summarize(across(ends_with("mm"), mean, na.rm = TRUE)) %>% #<<
  knitr::kable()


## ----out.width = '=100%', echo=FALSE-------------------
knitr::include_graphics("img/dplyr_filter.jpg")


## ----echo=FALSE----------------------------------------
a <- getOption("width")
options(width=120)


## ------------------------------------------------------
penguins %>%
  filter(species == "Chinstrap") %>% #<<
  summary()


## ----echo=FALSE----------------------------------------
options(width=a)


## ----out.width = '75%', echo=FALSE---------------------
knitr::include_graphics("img/dplyr_mutate.png")


## ------------------------------------------------------
penguins.mod <- penguins %>%
  mutate(body_mass_kg = body_mass_g / 1000)

penguins.mod %>%
  select(body_mass_g, body_mass_kg) %>%
  head()
  


## ----out.width = '75%', echo=FALSE---------------------
knitr::include_graphics("img/dplyr_case_when.png")


## ----tablesize, eval=FALSE-----------------------------
## # Use case_when() to create
## # three size categories
## penguins_mod <- penguins %>%
##   mutate(size_bin = case_when(
##     body_mass_g > 4500 ~ "large",
##     body_mass_g > 3000 &
##       body_mass_g <= 4500 ~ "medium",
##     body_mass_g <= 3000 ~ "small"
##     )
##   )
## 
## # Create summary table
## # of size categories
## penguins_mod %>%
##   pull(size_bin) %>%
##   table(useNA = "ifany") %>% #<<
##   knitr::kable(
##     col.names = c("Size Category",
##                   "Frequency"))


## ----tablesize-out, ref.label="tablesize", echo=FALSE----

