# movie2
site<- "https://movie.daum.net/moviedb/grade?movieId=131576&type=netizen&page="
text <- NULL; title<-NULL; point<-NULL; review<-NULL; page=NULL
movie.review <- NULL
for(i in 1: 5) {
  url <- paste(site, i, sep="")
  text <- read_html(url)
  #제목
  nodes <- html_nodes(text, ".tit_rel")
  title <- html_text(nodes)
  #작성자
  nodes <- html_nodes(text, ".link_review em")
  name <- html_text(nodes)
  
  #평점
  nodes <- html_nodes(text, ".raking_grade em")
  point <- html_text(nodes)
  #댓글
  nodes <- html_nodes(text, ".desc_review")
  nodes <- html_text(nodes, trim=TRUE)
  review <- nodes[nchar(nodes) >= 0]
  #if(length(review) == 10) {
    page <- data.frame(point, review)
    movie.review <- rbind(movie.review, page)
  #} else {
  #  cat(paste(i," 페이지에는 리뷰글이 생략된 데이터가 있어서 수집하지 않습니다.\n"))
  #}
}
write.csv(movie.review, "daummovie2.csv")

