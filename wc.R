#파일 읽기
yes24_data <- readLines("yes24.txt")
word_data <- extractNoun(yes24_data)
word <- unlist(word_data)
cdata <- unlist(word)
cdata

#단어 카운트
cdata <- Filter(function(x) {nchar(x) >= 2} ,cdata)
wordcount <- table(cdata) 
#wordcount <- head(sort(wordcount, decreasing=T))


result <- wordcloud2(wordcount, fontFamily = "나눔고딕", size=0.8,
                     color="random-light", backgroundColor="black")#, shape = 'star')
result

#library("htmlwidgets")
saveWidget(result,"wc.html",title="WORDCLOUD 실습", selfcontained = F)


#test
remotes::install_github( "lchiffon/wordcloud2", upgrade = "never", INSTALL_opts=c("--no-multiarch"))
test <- letterCloud(wordcount, word="명견만리", 
                    wordSize=2, fontFamily='나눔고딕')
test
