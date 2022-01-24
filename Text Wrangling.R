
## ---------------------------------------------------------------

library(RCurl); packageVersion("RCurl")
library(tidyverse); packageVersion("tidyverse")
library(stringr); packageVersion("stringr")
library(rvest); packageVersion("rvest")
library(methods); packageVersion("methods")
library(tm); packageVersion("tm")
library(wordcloud); packageVersion("wordcloud")
library(RColorBrewer); packageVersion("RColorBrewer")
library(janitor); packageVersion("janitor")
library(tidytext); packageVersion("tidytext")




## ---------------------------------------------------------------

# Get the text of Hamlet

# We have called the package RCurl previously to allow us to call the URL
hamlet_url <- "http://www.gutenberg.org/cache/epub/1787/pg1787.txt"
Hamlet_raw <- RCurl::getURL(hamlet_url)



## ---------------------------------------------------------------

# split string at end of line codes (\r\n); this returns a list - we only want the first element in the list
hamlet <- strsplit(Hamlet_raw, "\r\n")[[1]]
length(hamlet)



## ---------------------------------------------------------------
#examine the text - list out some elements
hamlet[350:360]


## ---------------------------------------------------------------

# get the number of lines that Hamlet speaks
hamlet_lines <- grep("  Ham. ", hamlet, value = TRUE)
length(hamlet_lines)

# inspect the data
head(hamlet_lines)


## ---------------------------------------------------------------

# get the number of lines that Hamlet speaks
hamlet_lines <- grep("  Ham.", hamlet, value = TRUE)
length(hamlet_lines)

# inspect the data
head(hamlet_lines)


## ---------------------------------------------------------------

# find Ophelia's lines
ophelia_lines <- grep(" Oph. ", hamlet)
length(ophelia_lines)
head(ophelia_lines)


## ---------------------------------------------------------------

#illustrate differences between grep and grepl
length(grep("  Ham. ", hamlet))
length(grepl("  Ham. ", hamlet))


## ---------------------------------------------------------------

# Extract the lines that match
# To do this you need to have called up the package stringr
pattern <- "  Ham. "
grep(pattern, hamlet, value = TRUE) %>%
  str_extract(pattern) %>%
  head()



## ---------------------------------------------------------------
# Example of use of . as a metacharacter

hamlet_lines <- grep("  Ham.", hamlet, value = TRUE)
length(hamlet_lines)

hamlet_lines <- grep("  Ham. ", hamlet, value = TRUE)
length(hamlet_lines)

hamlet_lines <- grep("  Ham\\.", hamlet, value = TRUE)
length(hamlet_lines)



## ---------------------------------------------------------------

# Example os use of character sets

head(grep("H[b-z]", hamlet, value = TRUE))


## ---------------------------------------------------------------

# Example of alternation

head(grep("  H(a|o)", hamlet, value = TRUE))



## ---------------------------------------------------------------

# Example of anchor at the beginning
head(grep("^  H[b-z]", hamlet, value = TRUE))



## ---------------------------------------------------------------

# Examples of repetitive patterns

head(grep("  $H(a|o)", hamlet, value = TRUE))



## ---------------------------------------------------------------

# Examples of repetitive patterns

head(grep("  *H(a|o)", hamlet, value = TRUE))


## ---------------------------------------------------------------

# Examples of repetitive patterns

head(grep("  +H(a|o)", hamlet, value = TRUE))


## ---------------------------------------------------------------

# Assign the characters
Hamlet <- grepl("  Ham\\.", hamlet)
Ophelia <- grepl("  Oph\\.", hamlet)
Polonius <- grepl("  Pol\\.", hamlet)
Gertrude <- grepl("  Queen\\.", hamlet)
Laertes <- grepl("  Laer\\.", hamlet)
Claudius <- grepl("  King\\.", hamlet)
Horatio <- grepl("  Hor\\.", hamlet)
Fortinbras <- grepl("  For\\.", hamlet)

length(Hamlet)
length(Ophelia)
length(Polonius)
length(Gertrude)
length(Laertes)
length(Claudius)
length(Horatio)
length(Fortinbras)

sum(Hamlet)
sum(Ophelia)
sum(Polonius)
sum(Gertrude)
sum(Laertes)
sum(Claudius)
sum(Horatio)
sum(Fortinbras)




## ---------------------------------------------------------------

# Let's tidy up the dataset
# Naturally we need to have called up the tidyverse package for this to work

speaker_freq <- data.frame(Hamlet, Polonius, Claudius, Horatio, Ophelia, Gertrude, Laertes) %>%
  mutate(line=1:length(hamlet)) %>%
  gather(key = "character", value = "speak", -line) %>%
  mutate(speak = as.numeric(speak)) %>%
  filter(line > 273 & line < 5131)

glimpse(speaker_freq)
  


## ---------------------------------------------------------------

# Delineate the Acts
acts_idx <- grep("^A[C|c][T|t] [I|V]+", hamlet)
acts_labels <- str_extract(hamlet[acts_idx], "^A[C|c][T|t] [I|V]+")
acts <- data.frame(line=acts_idx, labels = acts_labels)



## ---------------------------------------------------------------

# Plot the lines at which each character speaks
ggplot(data = speaker_freq, aes(x=line, y=speak)) +
  geom_smooth(aes(color=character), method = "loess", se = 0, span = 0.4) +
  geom_vline(xintercept = acts_idx, color = "darkgray", lty = 3) +
  geom_text(data = acts, aes(y=0.085, label = labels), hjust = "left", color = "darkgray") +
  ylim(c(0, NA)) +
  xlab("Line Number") +
  ylab("Proportion of Speeches")



## ---------------------------------------------------------------

url <- "https://en.wikipedia.org/wiki/List_of_songs_recorded_by_David_Bowie"
tables <- url %>% 
  read_html() %>% 
  html_nodes("table")
Bowie_songs <- tables %>%
  purrr::pluck(3) %>%
  html_table(fill = TRUE) %>%
  janitor::clean_names() %>%
  select(song, writer_s, year)
glimpse(Bowie_songs)



## ---------------------------------------------------------------

# Clean the data

Bowie_songs <- Bowie_songs %>%
  mutate(song = gsub('\\"', "", song), year = as.numeric(year)) 

glimpse(Bowie_songs)



## ---------------------------------------------------------------

# Count the number of different songwriters
pattern <- "Bowie"
Bowie_songs$bowie_wrote <- grepl(pattern, Bowie_songs$writer_s)
sum(Bowie_songs$bowie_wrote)




## ---------------------------------------------------------------

Bowie_songs %>% filter(bowie_wrote == "TRUE") -> Bowie_songs_only



## ---------------------------------------------------------------

Bowie_songs_only %>%
  unnest_tokens(word, song) %>%
  anti_join(get_stopwords(), by = "word") %>%
  count(word, sort = TRUE) %>%
  arrange(desc(n))  -> Bowie_words



## ---------------------------------------------------------------

#Get rid of parentheses and words in between
Bowie_songs_only$song <- gsub(" *\\(.*?\\) *","",as.character(Bowie_songs_only$song))

# Get rid of square brackets and words in between (used by Wikipedia to denote footnotes)
Bowie_songs_only$song <- gsub(" *\\[.*?\\] *","",as.character(Bowie_songs_only$song))

# Get rid of leading and trailing whitespace
Bowie_songs_only$song <- trimws(Bowie_songs_only$song, "both")

Bowie_songs_only %>%
  select(song) %>%
  unnest_tokens(word, song) %>%
  anti_join(get_stopwords(), by = "word") %>%
  count(word, sort = TRUE) %>%
  arrange(desc(n)) -> Bowie_words



## ---------------------------------------------------------------

# Create wordcloud from Bowie song titles

#We need to have the package wordcloud and RColorBrewer for this to work.
wordcloud(words = Bowie_words$word, freq = Bowie_words$n, max.words = 30, scale = c(4, 1), colors = topo.colors(n=30), random.color = TRUE)


