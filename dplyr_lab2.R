str(ggplot2::mpg)
mpg <- as.data.frame(ggplot2::mpg)

#1-1
str(mpg)
#1-2
dim(mpg)
#1-3
mpg[1:10,]
head(mpg, n=10)
#1-4
tail(mpg, n=10)
#1-5
View(mpg)
#1-6

#1-7
mpg %>%
  group_by(manufacturer,model)
