library(ggplot2)
library(tidyverse)

options(scipen=999) # to turn off the scientific notation

midwest
str(midwest)


ggplot(midwest,aes(x=area,y=poptotal))
ggplot(midwest,aes(x=area,y=poptotal)) + geom_point()
ggplot(midwest,aes(x=area,y=poptotal)) + geom_point() + geom_smooth(method= 'lm')
ggplot(midwest,aes(x=area,y=poptotal)) + geom_point() + geom_smooth(method= 'lm')+ xlim(c(0,0.1)) + ylim(c(0,1000000))
g = ggplot(midwest,aes(x=area,y=poptotal)) + geom_point() + geom_smooth(method = 'lm')
g1= g + coord_cartesian(xlim=c(0,0.1), ylim=c(0,1000000))
plot(g1)

ggplot(midwest,aes(x=area,y=poptotal)) + geom_point()+ 
  geom_smooth(method= 'lm')+ xlim(c(0,0.1)) + ylim(c(0,1000000))+
  ggtitle("Area Vs Population", subtitle = "From midwest dataset") +
  xlab("Area") + ylab("Population")


ggplot(midwest,aes(x=area,y=poptotal)) + geom_point(col="red",size= 3)+ 
  geom_smooth(method= 'lm')+ xlim(c(0,0.1)) + ylim(c(0,1000000))+
  ggtitle("Area Vs Population", subtitle = "From midwest dataset") +
  xlab("Area") + ylab("Population")

ggplot(midwest,aes(x=area,y=poptotal)) + geom_point(aes(col=state),size= 3)+ 
  geom_smooth(method= 'lm')+ xlim(c(0,0.1)) + ylim(c(0,1000000))+
  ggtitle("Area Vs Population", subtitle = "From midwest dataset") +
  xlab("Area") + ylab("Population")

ggplot(midwest,aes(x=area,y=poptotal)) + geom_point(aes(col=state),size= 3)+ 
  geom_smooth(method= 'lm')+ xlim(c(0,0.1)) + ylim(c(0,1000000))+
  ggtitle("Area Vs Population", subtitle = "From midwest dataset") +
  xlab("Area") + ylab("Population")+ scale_x_continuous(breaks = seq(0,0.1,0.01)) # start end jump

ggplot(midwest,aes(x=area,y=poptotal)) + geom_line(aes(col=state), size = 3)+ 
  xlim(c(0,0.1)) + ylim(c(0,1000000))+
  ggtitle("Area Vs Population", subtitle = "From midwest dataset") +
  xlab("Area") + ylab("Population")+ scale_x_continuous(breaks = seq(0,0.1,0.01))

ggplot(midwest,aes(x=poptotal)) + geom_histogram()

ggplot(mtcars,aes(x=disp)) + geom_boxplot()

ggplot(mtcars,aes(x=hp)) + geom_density()

ggplot(mtcars,aes(x=hp,y=disp)) + geom_point() + geom_line()

ggplot(mpg,aes(y=class)) + geom_bar(aes(fill = drv))


                                    