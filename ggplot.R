##asking for help
?sin
?require
help("require")
help.search("require")
??require

sin(3)
pi
sin(pi/2)
sin(pi)
x <- 1
x
help.search("<-")
v <- c(1,3,5)
v2 <- c('r', 's')
v2
?rep
help.search("rep")
rep(v, times=3)
rep(v, each=2)
rep(v, each=2, times=3)
seq(1,6)
seq(1,6,length.out = 5)


a <- c(1,3,7)
b <- c(5,13,8,2,4)
a+b
ls() ##list of varibles in global environemtn
rm(v) ##remove
ls()
rm(list = ls())
ls()
setwd("")
getwd()


##installation of tidyverse and opening up the library
if(!require(tidyverse)){
  install.packages("tidyverse")
  library(tidyverse)
}


##to access the dataset in ggplot2 package
data(package = "ggplot2")

##to access documentation
?mpg

ggplot2::mpg
mpg

##first samples of the dataset
head(mpg)

##showing hidden datatype, the type of variables with summary
str(mpg)

##scatter plot with ggplot2
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy))

##mapping color or shape
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y= hwy, color = class, shape = class))

##simple scatter plot
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy), shape = 12)

?geom_point

# Take care of which variable you use
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, size = class)) #be careful!!

#Binary mapping
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, color = displ <3))

#using letter as shapes
#simple scatter plot
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy), shape = 'A')


###
#Facets
###

ggplot(mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_wrap(~ class, nrow = 3)

###
#GRid function, plotting with two formulas
ggplot(mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(drv ~ cyl)

ggplot(mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(cyl ~ .)

