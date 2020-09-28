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

#1-8


######### 문제1 #########
mpg <- as.data.frame(ggplot2::mpg)

# 1-1
str(mpg)

# 1-2
dim(mpg)

# 1-3
# head(mpg, 10)
mpg %>% head(10)

# 1-4
# tail(mpg, 10)
mpg %>% tail(10)

# 1-5
View(mpg)

# 1-6
summary(mpg)

# 1-7
# table(mpg$manufacturer)
mpg %>% 
  group_by(manufacturer) %>% 
  tally

# 1-8
mpg %>% 
  group_by(manufacturer) %>% 
  summarise(mf_n=n())


######### 문제2 #########
# 2-1
mpg <- mpg %>% rename(city = cty, highway = hwy)

# 2-2
mpg %>% head


######### 문제3 #########
# 3-1
midwest <- as.data.frame(ggplot2::midwest)
str(midwest)
dim(midwest)
summary(midwest)
# 3-2
midwest %>% rename(total=poptotal,asian=popasian) -> midwest
# 3-3
midwest %>% mutate(prob_asian = asian/total*100) -> midwest
# 3-4
midwest %>% 
  mutate(mean_asian=mean(prob_asian),
         size_asian=ifelse(prob_asian > mean_asian,"large","small"))

######### 문제4 #########
# 4-1
mpg <- as.data.frame(ggplot2::mpg)
mpg %>% mutate(catDispl = ifelse(displ <= 4, "배기량4이하", "배기량5이상")) %>%
  group_by(catDispl) %>% summarise(mean_hwy = mean(hwy))


# 4-2
mpg %>%
  filter(manufacturer %in% c("audi", "toyota")) %>% 
  group_by(manufacturer) %>% 
  summarise(mean_cty = mean(cty)) 


# 4-3
mpg %>% 
  filter(manufacturer %in% c("chevrolet","ford","honda")) %>% 
  group_by(manufacturer) %>% 
  summarise(mean_hwy=mean(hwy))


######### 문제5 #########
# 5-1
mpg %>% 
  select(class,city) -> mpg_sub
head(mpg_sub)

# 5-2
mpg %>% 
  filter(class %in% c("suv","compact")) %>% 
  group_by(class) %>% 
  summarise(mean_cty=mean(city))



######### 문제6 #########
# audi 모델 중 hwy연비가 좋은 모델

mpg <- as.data.frame(ggplot2::mpg)

mpg %>% filter(manufacturer == 'audi') %>%
  group_by(model) %>% summarise(mean_hwy_audi = mean(hwy)) %>%
  arrange(desc(mean_hwy_audi))



# audi중 hwy연비가 좋은 자동차의 데이터

mpg %>% filter(manufacturer == 'audi') %>%
  arrange(desc(hwy)) %>% head(5)