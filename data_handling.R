#
library(tidyverse)
library(nycflights13)

#readr 
#data import operations
#convert files into data frames
#options to read and save data
#function name depends on delimiter

getwd()
airlines
write_delim(airlines, "airlines_dataset.csv", delim =";")
(example <- read_csv("the first line
         the second line of the file
         x, y, z
         1,3,5,
         0.5, 56, 0.3
         NA, x, /", skip=3, col_names = c("x", "y", "z"),na = c("NA", "X", "/")))
table4a
table4b

table4a %>% pivot_longer(c('1999', '2000'), names_to = "year", values_to = "cases")
table4a %>% pivot_longer(c('1999', '2000'), names_to = "year", values_to = "population")
table2 %>% pivot_wider(names_from = type, values_from = count)

table2
table3 %>% separate(rate, into = c("rate", "population"), sep = '/')

table5
table5 %>%unite("year",century, year, sep="") %>%
  separate(rate, into = c("cases", "population"))

#Relational database
data(package ="nycflights13")

airlines %>% count(carrier)
airlines %>% count(carrier) %>%filter(n!=1)
airports %>% count(faa) %>% filter(n!=1)
flights %>% count(year, month, day, hour, tailnum) %>%filter(n!=1)

#mutate is used to generate a new column
flights %>% mutate(ID_surr = row_number())

#dplyr::join
#inner join, left_join, right_join, full_join
flights %>% inner_join(airlines, by = "carrier") %>% select(year:day, flight, name)
airlines
