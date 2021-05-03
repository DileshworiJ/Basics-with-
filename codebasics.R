#optimizing
if(!require(tidyverse)){
  install.packages("tidyverse")
  library(tidyverse)
}

as.integer(1.5)
a<-as.numeric(15L)
a
as.character(50.56)
as.numeric("dilu")
c(TRUE, FALSE, TRUE, TRUE)
c(5, 3L, 50.7)  #vector coerces to common data type
#c("C", "Clein", 5, 50.6, TRUE)
list(5, 3L, 50.7) #doesn't coerce

#fafctor
data <- c("East", "west", "East", "North", 
          "North", "East", "West", "west")
Level_data <- c("East", "west", "North", "South")
factor(data)
factor(data, levels = Level_data)
parse_factor(data, levels = Level_data)

segment <- c("b", "b", "b", NA, "a", "a")
number <- seq(1,6)
df<-data.frame(segment, number)
df

data(package = "ggplot2")
ggplot2::mpg
mpg
df <- tibble(x =1:5, y=1, z= x-lag(x),
             '2000' = c(NA, NaN, 56, 5L, 56.6))
df

df$'2000'
head(mtcars)
as_tibble(mtcars, rownames = "model")
df
#count of z and x in df tibble
count(df, z, x)

mpg
count(mpg, manufacturer, displ)
lag(df$x, n=2, default = 0)
lead(df$x, n=2, default = 0)
df

stats::lag(df$x)

tribble(
  ~x, ~y, ~z,
  #--,--,---
  4,50, NA,
  6,4.6,5,
)

mpg
table(mpg$manufacturer, mpg$class, mpg$drv)
