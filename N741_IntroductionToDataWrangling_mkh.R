## ----setup, include=FALSE-------------------------
# For htmltools package, you may set options(htmltools.dir.version = FALSE) to suppress the version number in the subdirectory name.
options(htmltools.dir.version = FALSE)
library(knitr)
library(dplyr)


## -------------------------------------------------
library(palmerpenguins)
str(penguins)


## -------------------------------------------------
head(penguins)


## -------------------------------------------------
class(penguins)


## -------------------------------------------------
tail(penguins, 10)


## -------------------------------------------------
penguins.df <- data.frame(penguins)
class(penguins.df)
head(penguins.df)


## -------------------------------------------------
penguins %>%
  pull(bill_length_mm) %>%
  mean()


## -------------------------------------------------
penguins %>%
  pull(bill_length_mm) %>%
  mean(na.rm = TRUE)


## -------------------------------------------------
mean(penguins$bill_length_mm, na.rm = TRUE)


## -------------------------------------------------
penguins %>%
  select(body_mass_g, flipper_length_mm) %>%
  summary()


## -------------------------------------------------
penguins %>%
  select(body_mass_g, flipper_length_mm) %>%
  summarise(
    body_mean = mean(body_mass_g, na.rm=TRUE),
    body_sd = sd(body_mass_g, na.rm=TRUE),
    flip_mean = mean(flipper_length_mm, na.rm=TRUE),
    flip_sd = sd(flipper_length_mm, na.rm=TRUE)
  )


## -------------------------------------------------
penguins %>%
  select(body_mass_g, flipper_length_mm, species) %>%
  group_by(species) %>% #<<
  summarise(
    body_mean = mean(body_mass_g, na.rm=TRUE),
    body_sd = sd(body_mass_g, na.rm=TRUE),
    flip_mean = mean(flipper_length_mm, na.rm=TRUE),
    flip_sd = sd(flipper_length_mm, na.rm=TRUE)
  )


## -------------------------------------------------
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


## -------------------------------------------------
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


## ----out.width = '=100%', echo=FALSE--------------
knitr::include_graphics("img/dplyr_filter.jpg")


## -------------------------------------------------
penguins %>%
  filter(species == "Chinstrap") %>% #<<
  summary()


## ----out.width = '75%', echo=FALSE----------------
knitr::include_graphics("img/dplyr_mutate.png")


## -------------------------------------------------
penguins.mod <- penguins %>%
  mutate(body_mass_kg = body_mass_g / 1000)

penguins.mod %>%
  select(body_mass_g, body_mass_kg) %>%
  head()
  

