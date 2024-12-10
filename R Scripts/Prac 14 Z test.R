hd<- read.csv("C:/Users/ashra/Desktop/SDBI Stuff/R/heart_cleveland_upload.csv")
library(BSDA)

str(hd)
colSums(is.na(hd))
hdy <- subset(hd, condition == 1) 
hdn <- subset(hd, condition == 0)  

z_test_hd<- z.test(
  x=hdy$chol,
  y=hdn$chol,
  alternative = "two.sided",
  mu= 0,
  sigma.x=sd(hdy$chol),
  sigma.y=sd(hdn$chol)
)

z_test_hd


sd_hdy<- sd(hdy$chol)
sd_hdn<- sd(hdn$chol)

sd_hdn
sd_hdy

mean_chol<- mean(hd$chol)
median_chol<- median(hd$chol)

mean_chol
median_chol


library(modeest)
mode_condition <- mfv(hd$condition)
mode_condition

