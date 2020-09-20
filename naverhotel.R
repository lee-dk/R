library(RSelenium) #해결 못함....
remDr <- remoteDriver(remoteServerAddr = "localhost" , port = 4445, browserName = "chrome")
remDr$open()
url<-'https://hotel.naver.com/hotels/item?hotelId=hotel:Shilla_Stay_Yeoksam&destination_kor=%EC%8B%A0%EB%9D%BC%EC%8A%A4%ED%85%8C%EC%9D%B4%20%EC%97%AD%EC%82%BC&rooms=2'
remDr$navigate(url)
Sys.sleep(3)
pageLink <- NULL
reple <- NULL
curr_PageOldNum <- 0
repeat{
  doms <- remDr$findElements(using = "css selector", "div.review_desc > p")
  Sys.sleep(1)
  reple_v <- sapply(doms, function (x) {x$getElementText()})
  print(reple_v)
  reple <- append(reple, unlist(reple_v))
  cat("현재까지", length(reple), "개의 댓글 추출\n")
  pageLink <- remDr$findElements(using='css',".hotel_used_review.ng-isolate-scope > div.review_ta.ng-scope > div.paginate > a.direction.next")
  remDr$executeScript("arguments[0].click();",pageLink)
  Sys.sleep(2)
  
  if(length(reple) == 40)  {  # 알듯하면서 못하겠어요ㅠㅠ
    cat("종료\n")
    break; 
  }
}
cat("총 ",length(reple), "개의 댓글 추출\n")
write(reple,"naverhotel.txt")
