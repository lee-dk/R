# dplyr 패키지 실습(3)

library(dplyr)
str(ggplot2::mpg)
mpg <- as.data.frame(ggplot2::mpg)

#7
#7-1
mpgcopy <- mpg
mpgcopy <- mpgcopy %>% mutate(total = cty+hwy)
head(mpgcopy)

#7-2
mpgcopy <- mpgcopy %>% mutate(mean = total/2)
head(mpgcopy)

#7-3
mpgcopy %>% arrange(desc(mean)) %>% head(3)

#7-4
mpg %>% mutate(total = cty+hwy, mean = total/2) %>% 
  arrange(desc(mean)) %>% head(3)
#----------------------------------------


#8
#8-1
mpg %>% group_by(class) %>% summarise(mean_class = mean(cty))

#8-2
mpg %>% group_by(class) %>% 
  summarise(mean_class = mean(cty)) %>% 
  arrange(desc(mean_class))

#8-3
mpg %>% group_by(manufacturer) %>% 
  summarise(mean_hwy = mean(hwy)) %>% 
  arrange(desc(mean_hwy)) %>% 
  head(3)

#8-4
mpg %>% filter(class == "compact") %>% 
  group_by(manufacturer) %>% 
  count(manufacturer) %>% 
  arrange(desc(n))
mpg %>% 
  filter(class=="compact") %>% 
  group_by(manufacturer) %>% 
  summarise(commpact=n()) %>% 
  arrange(desc(commpact))
#----------------------------------------


#9
fuel <- data.frame(fl= c("c","d","e","p","r"),
                   price_fl = c(2.35, 2.38, 2.11, 2.76, 2.22)
)
fuel
#9-1
mpg <- left_join(mpg, fuel, by = "fl")

#9-2
mpg %>% select("model", "fl", "price_fl") %>% head(5)
#----------------------------------------

View(mpg)

#10
#10-1
midwest<-as.data.frame(ggplot2::midwest)
midwestchild<-midwest %>% 
  mutate(childratio=(poptotal-popadults)*100/poptotal)

midwestchild %>% 
  select(county,popadults,poptotal,childratio) %>% 
  head(10)



#10-2
midwestchild %>% 
  arrange(desc(childratio)) %>% 
  head(5)

#10-3
midwestchild %>% 
  mutate(childrank=ifelse(childratio>=40,'large',ifelse(childratio>=30,'middle','small'))) %>% 
  group_by(childrank) %>% 
  summarise(county.cnt=n())

#10-4
midwestchild %>% 
  mutate(asianratio=(popasian*100)/poptotal) %>% 
  arrange(asianratio) %>% 
  select(state,county,asianratio) %>% 
  head(10)
#----------------------------------------


#11
mpg <- as.data.frame(ggplot2::mpg)
mpg[c(65, 124, 131, 153, 212), "hwy"] <- NA
#11-1
table(is.na(mpg$drv))
table(is.na(mpg$hwy))

#11-2
mpg %>% filter(!is.na(hwy)) %>% 
  group_by(drv) %>% summarise(drv_hwy = mean(hwy))
#----------------------------------------


#12
mpg <- as.data.frame(ggplot2::mpg)
mpg[c(10, 14, 58, 93), "drv"] <- "k"
mpg[c(29, 43, 129, 203), "cty"] <- c(3, 4, 39, 42)
#12-1
table(mpg$drv)
mpg$drv <- ifelse(mpg$drv %in% c("k"), NA, mpg$drv)
table(mpg$drv)

#12-2
boxplot(mpg$cty)
boxplot(mpg$cty)$stats
mpg$cty <- ifelse(mpg$cty < 9 | mpg$cty > 26, NA, mpg$cty)
boxplot(mpg$cty)

View(mpg)

#12-3
mpg %>% filter(!is.na(drv) & !is.na(cty)) %>% 
  group_by(drv) %>% 
  summarise(drv_cty = mean(cty, na.rm = T))