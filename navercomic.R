# navercomic
site <- "https://comic.naver.com/genre/bestChallenge.nhn?&page="
text <- NULL; comicName<-NULL; comicSummary<-NULL; comicGrade<-NULL; allPage <- NULL

for(i in 1:124){
  url <- paste(site, i, sep="")
  text <- read_html(url)

  #제목
  nodes <- html_nodes(text, "div.challengeInfo > h6 > a")
  comicName <- html_text(nodes, trim=TRUE)
  
  #내용
  nodes <- html_nodes(text, "div.challengeInfo > div.summary")
  comicSummary <- html_text(nodes)
  
  #평점
  nodes <- html_nodes(text, "div.challengeInfo > div.rating_type > strong")
  comicGrade <- html_text(nodes)
  
  page <- data.frame(comicName, comicSummary, comicGrade)
  allPage <- rbind(allPage, page)
}

View(allPage)
write.csv(allPage, "navercomic.csv")

