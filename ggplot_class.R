#installing and loading tidyverse package
install.packages("tidyverse")
library(tidyverse)

#optimizing
if(!require(tidyverse)){
  install.packages("tidyverse")
  library(tidyverse)
}

#getting your data
data(package = "ggplot2")
?mpg

#table format
ggplot2::mpg
mpg
head(mpg, 10)

#structure function type of attribite
str(mpg)

#simple scatter plot
ggplot(data = mpg) +
  geom_point(mapping = aes(x=displ, y= hwy))

#mapping color or shape
ggplot(data = mpg) +
  geom_point(mapping = aes(x=displ, y= hwy, color = class, shape = class))

#simple scatter plot
ggplot(data = mpg) +
  geom_point(mapping = aes(x=displ, y= hwy), color = "red", shape = "circle")

?geom_point

#take care of which variable to use
ggplot(data = mpg)+
  geom_point(mapping = aes(x=displ, y= hwy, size = class)) #be careful

#binary apping
ggplot(data = mpg) +
  geom_point(mapping = aes(x=displ, y= hwy, color = displ<3))

#using letter as shape
ggplot(data = mpg) +
  geom_point(mapping = aes(x=displ, y= hwy), shape = "A")

#FAcets
ggplot(mpg)+
  geom_point(mapping = aes(x=displ, y =hwy))+
  facet_wrap(~class)

?facet_wrap

ggplot(mpg)+
  geom_point(mapping = aes(x=displ, y =hwy))+
  facet_wrap(~class, nrow=3)

ggplot(mpg)+
  geom_point(mapping = aes(x=displ, y =hwy))+
  facet_grid(drv~cyl)

ggplot(mpg)+
  geom_point(mapping = aes(x=displ, y =hwy))+
  facet_grid(.~cyl)

ggplot(mpg)+
  geom_point(mapping = aes(x=displ, y =hwy))+
  facet_grid(cyl~.)

ggplot(data = mpg) + geom_point(mapping = aes(x = drv, cyl)) + facet_grid(drv ~ cyl)

#other geometric functions
ggplot(mpg)+
  geom_smooth(mapping = aes(x = displ, y = hwy, linetype = drv, color = drv))

ggplot(mpg)+
  geom_smooth(mapping = aes(x = displ, y= hwy, linetype = drv, color = drv), show.legend = FALSE, se = FALSE)
  geom_point(mapping = aes(x=displ, y= hwy, color= drv))

ggplot(mpg)+
  geom_point(mapping = aes(x = displ, y = hwy))

#combining geometiries
ggplot(mpg, mapping = aes(x = displ, y = hwy, color = drv))+
  geom_point()+
  geom_smooth(mapping = aes(linetype = drv))

#meaningful variables
#for box plot x should be discrete and y continuous
 #example of ovrriding statistics
ggplot(mpg) + 
  geom_bar(mmapping = aes(x = class, fill = class))

ggplot(mpg)+
  stat_summary(mapping = aes(x = class, y = hwy), fun.min = min, fun.max =max, fun = median)

ggplot(mpg) + 
  geom_bar(mapping = aes(x = class, y= stat(prop), group = 1))

#posiition adjustment
#drive attention to certain properties of the data
#stack bar
ggplot(mpg) +
  geom_bar(mapping = aes(x = class, fill = factor(year)), position = "fill")

#separate bars as per the age  
ggplot(mpg) +
  geom_bar(mapping = aes(x = class, fill = factor(year)), position = "dodge")

ggplot(mpg, mapping = aes(cty, hwy, color = class))+
  geom_point()

#putting noise in global measure is better
ggplot(mpg, mapping = aes(cty, hwy, color = class))+
  geom_point(position = "jitter")

ggplot(mpg, mapping = aes(cty, hwy, color = class))+
  geom_point()+
  geom_jitter()
 
str(mpg)     

#coordinate system
ggplot(mpg)+
  geom_boxplot(mapping = aes(x= class, y=hwy))+
  coord_flip()

ggplot(mpg)+
  geom_bar(mapping = aes(x = manufacturer, fill = class), position = "fill") + coord_flip()

ggplot(mpg)+
  geom_boxplot(mapping = aes(x = class, y =hwy)) +
  coord_cartesian(ylim = c(15, 35))

#not use piecharts
ggplot(mpg)+
  geom_bar(mapping = aes(x = class, fill = class), width = 1) +coord_polar()

