#data transform #data manipulation for better visualization
#dplyr for data exploration and transformation
#fast on data frames
#filter, select, arrange, mutate, summarize, group bu verbs
#works with vectorized functions for calculating ranking, offsets, and more
#can work with databases

if(!require(tidyverse)){
  install.packages("tidyverse")
  library(tidyverse)
}

if(!require(nycflights13)){
  install.packages("nycflights13")
  library(nycflights13)
}

data(package = "ggplot2")
ggplot2::mpg
mpg

example_dplyr <- tribble(
  ~x, ~y, ~z,
  #--,--,---
  4,50, NA,
  6,4.6,5,
  2,5, NA
)

table(mpg$manufacturer, mpg$class, mpg$drv)
filter(mpg, cyl == 6| drv == 'r')
filter(example_dplyr, z>=3 | is.na(z))
NA == NA
is.na(NA)

mpg
mpg_new <- filter(mpg, displ %in% c(1.8,2))

#arrange
#change order of data using one or more attributes
mpg
(mpg_new <- arrange(mpg, desc(hwy)))
arrange(mpg, cty)
arrange(example_dplyr, desc(is.na(z)))

#select
#take subsets of data specifying attributes(subsets column)
mpg
select(mpg, 1, 2, hwy) #columns 1,2, and hwy
select(mpg, 1:2, hwy)
select(mpg, manufacturer:displ)
select(mpg, starts_with("m"), starts_with("c"))
select(mpg, everything(), -drv)
select(mpg, maker = manufacturer, everything())
rename(mpg, maker= manufacturer, size_eng = displ)

flights
str(flights)
flight_sml <- select(flights, year:day, ends_with("_delay"), distance, air_time)
flight_sml

#mutaute
#new set at end
#can be used with sum, subtract, means...
flight_sml

flights_snl2 <- mutate(flight_sml, gain= arr_delay - dep_delay, speed_minutes = distance/air_time, speed_mph = speed_minutes * 60) #new columns at last
select(flights_snl2, distance:speed_mph)

flight_sml
#integer %/%, and remainder %%
select(mutate(flight_sml, air_time_h = air_time %/% 60, air_time_min = air_time%%60), 6:9)
transmute(flight_sml, air_time_h = air_time %/% 60, air_time_min = air_time%%60) #only new variable are shown

#group by
#collapse aggregate functions of a data set

flight_sml
flight_sml_by_date <- group_by(flight_sml, year, month, day)
flight_sml_by_date
summarize(flight_sml_by_date, delay_day = mean(dep_delay, na.rm = T))
summarize(flight_sml_by_date, count = n(), delay_day = mean(dep_delay, na.rm = T))

#group by destination
str(flights)
flight_dest <- group_by(flights, dest)
 
#
delay_dest <- summarise(flight_dest, num_flight = n(), avg_dist = mean(distance), avg_delay = mean(arr_delay))
delay_dest

#subset, filter rows
flight_delay <- filter(delay_dest, num_flight > 20, dest != 'HNL')
flight_delay

#PIPES 
#tool from magrittr
#express sequence of multiple operations
#tpipe #%>% passes the result of the left expression

flight_delay <- flights %>%
  group_by(dest) %>%
  summarise(num_flight = n(),
            avg_dist = mean(distance),
            avg_delay = mean(arr_delay)) %>%
    filter(num_flight > 20,
           dest != 'HNL') 

flight_delay

#sample_n() and sample_frac()
#with replacement, returned to the sample
flights %>%sample_n(100)

#data manipulation in R with sqldf(select)
sqldf("select manufacturer, cyl, hwy from mpg limit 30")