superstore<-read.csv("C:/Users/ashra/Desktop/SDBI Stuff/R/Sample - Superstore.csv")
View(superstore)
str(superstore)
colSums(is.na(superstore))
summary(superstore)
install.packages("tidyverse")
library(tidyverse)
tibble::as_tibble(superstore)
glimpse(superstore)
str(superstore)
superstore$Category<-as.factor(superstore$Category)
str(superstore)
#q1
superstore  %>% group_by(Category) %>% summarise(n=n(),Product_Total=sum(Sales))


#q2
superstore$Ship.Mode<-as.factor(superstore$Ship.Mode)
superstore %>% group_by(Ship.Mode) %>% count(Order.ID) 

#q3
superstore %>% group_by(Sub.Category) %>% summarise(n=n(),Average_Profit= mean(Profit))


#q4
superstore %>% group_by(State) %>% summarise(n=n(),Total_Sales= sum(Sales))  %>% arrange(desc(Total_Sales)) %>% head(1)

#q5
superstore %>% group_by(Product.Name) %>% summarise(n=n(),Total_Sales = sum(Sales)) %>% arrange(desc(n))
superstore %>% count(Product_Name) %>% arrange(desc(n)) %>% head(1)

#q6
superstore %>% summarise(Unique_Customers = n_distinct(Customer.ID))

#q7
superstore %>% group_by(Segment) %>% summarise(n=n(),Total_Disc= sum(Discount))

#q8
superstore %>% group_by(Region) %>% summarise(n=n(), Total_Profit= sum(Profit)) %>%  arrange(desc(Total_Profit)) %>% head(1)

#9
superstore %>% mutate(Order_Date = as.Date(Order.Date,format = "%m/%d/%y"),
                      
                      Ship_Date = as.Date(Ship.Date, format = "%m/%d/%y"),
                      Shiiping_Duration = as.numeric(difftime(Ship_Date, Order_Date, units = "days")))

#10
superstore %>% group_by(Customer.Name) %>% summarise(n=n(),Total_Sales=sum(Sales)) %>% arrange(desc(Total_Sales)) %>% head(5)

#11
superstore %>% group_by(Order.ID) %>% summarise(n=n(),Average_Disc=mean(Discount))

#12
superstore %>% mutate(Order_Year = format(as.Date(Order.Date,format = "%m/%d/%y"),"%Y")) %>% count(Order_Year)

#14
superstore %>% group_by(Region) %>% summarise(n=n(),Total_Sales=sum(Sales))

#15
superstore %>% group_by(Order.ID) %>% filter(Discount>0.20) %>% select(Order.ID,Customer.Name,Sales,Discount)
superstore %>% filter(Discount>0.20) %>% count()
#16
superstore %>% group_by(Category) %>% summarise(n=n(), Avg_Qty=mean(Quantity))

#17
superstore %>% group_by(Ship.Mode) %>% filter(Ship.Mode=="Second Class")

#18
superstore %>% count(City) %>% arrange(desc(n)) %>% head(3)

#19
superstore %>% group_by(Order.ID) %>% filter(Profit<0) %>% select(Customer.Name,Sales,Discount,Profit)
superstore %>% filter(Profit<0) %>% count()

#20
superstore %>% filter(Category=="Furniture") %>% summarise(n=n(),Median_Sales=median(Sales)) 







superstore %>% mutate(Profit = replace(Profit,Profit < 0 ,0))

superstore %>% mutate(Ship_Mode =replace(Ship.Mode,Ship.Mode=="Standard Class", "Standard Shipping"))

data1 <- subset(superstore,select = -Discount)
names(data1)

data1 <- subset(superstore,select = -c(Discount,Profit))
names(data1)

#MOst Profitable product within each sub-category
superstore %>% group_by(Sub.Category,Product.Name) %>% summarise(Total_Profit = sum(Profit)) %>% arrange(Sub.Category, desc(Total_Profit)) %>% group_by(Sub.Category) %>% slice(1)
superstore %>% group_by(Sub.Category,Product.Name) %>% summarise(Total_Profit = sum(Profit)) %>% arrange(Sub.Category, desc(Total_Profit)) %>% group_by(Sub.Category) %>% top_n (1)


superstore %>% mutate(Order_Date = as.Date(Order.Date, format = "%m/%d/%y")) %>% arrange(Order_Date) %>% group_by(Category) %>% mutate(Cumulative_Sales = cumsum(Sales)) %>% select(Order_Date,Category,Cumulative_Sales)
  