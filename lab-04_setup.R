library(tidyverse)
library(knitr)
library(broom)



?diamonds

diamonds <- subset(diamonds, carat==0.5)
glimpse(diamonds)

count(diamonds, cut)

diamonds$cut <- factor(diamonds$cut)
diamonds$cut <- fct_recode(diamonds$cut, "GoodOrFair" = "Fair", "GoodOrFair" = "Good")

count(diamonds, cut)


ggplot(data=diamonds, mapping=aes(x=cut, y = price)) + geom_point() + 
  labs(x="Cut", y="Price", title = "Price of Diamonds by Cut")


cut <- diamonds$cut
price <- diamonds$price

tapply(price, cut, mean)
tapply(price, cut, sd)
count(diamonds, cut)

glimpse(diamonds)

ideal_diamonds <- filter(diamonds, cut == "Ideal")
hist(ideal_diamonds$price)

verygood_diamonds <- filter(diamonds, cut == "Very Good")
hist(verygood_diamonds$price)

goodorfair_diamonds <- filter(diamonds, cut == "GoodOrFair")
hist(goodorfair_diamonds$price)

premium_diamonds <- filter(diamonds, cut == "Premium")
hist(premium_diamonds$price)

var(ideal_diamonds$price)
var(verygood_diamonds$price)
var(goodorfair_diamonds$price)
var(premium_diamonds$price)