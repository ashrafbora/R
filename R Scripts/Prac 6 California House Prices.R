chp<-read.csv("C:/Users/ashra/Desktop/SDBI Stuff/R/California_Houses.csv")
View(chp)
str(chp)
cor(chp)

mod1<-lm(chp$Tot_Bedrooms~chp$Households)
print(mod1)
bedroom=-1.389+household*1.080
bedroom=-1.389+177*1.080
print(bedroom)
plot(chp$Tot_Bedrooms,chp$Households)
abline(mod1,col="red")

mod2<-lm(chp$Median_House_Value~chp$Median_Income)
print(mod2)
mhouseprice=45086+mincome*41794
mhouseprice=45086+8.3252*41794
print(mhouseprice)
plot(chp$Median_House_Value,chp$Median_Income)
abline(mod2)


mod3<-lm(chp$Population~chp$Tot_Rooms)
print(mod3)
population=252.7508+trooms*0.4449
population=252.7508+880*0.4449
print(population)
plot(chp$Population,chp$Tot_Rooms,col="light blue")
abline(mod3)
