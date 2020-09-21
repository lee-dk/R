library(RSelenium)
remDr <- remoteDriver(remoteServerAddr = "localhost" , port = 4445, browserName = "chrome")
remDr$open()
site <- 'http://gs25.gsretail.com/gscvs/ko/products/event-goods'
remDr$navigate(site)

pageLink <- remDr$findElements(using='css',"#TWO_TO_ONE")
remDr$executeScript("arguments[0].click();",pageLink)
Sys.sleep(1)
pageLink <- NULL
pageLink_next <- NULL
goodsname <- NULL
goodsprice <- NULL
curr_PageOldNum <- 0
repeat{
  goodsnodes <- remDr$findElements(using='css', '#contents > div.cnt > div.cnt_section.mt50 > div > div > div:nth-child(5) > ul > li > div > p.tit')
  goodsnames <- sapply(goodsnodes, function(x) {x$getElementText()})
  #print(goodsnames)
  goodsname <- append(goodsname, unlist(goodsnames))
  
  goodsnodes <- remDr$findElements(using='css', '#contents > div.cnt > div.cnt_section.mt50 > div > div > div:nth-child(5) > ul > li > div > p.price > span')
  goodsprices <- sapply(goodsnodes, function(x) {x$getElementText()})
  #print(goodsprices)
  goodsprices <- gsub("[^0-9]", "", goodsprices)
  goodsprice <- append(goodsprice, unlist(goodsprices))
  
  
  pageLink_next <- remDr$findElements(using='css',"#contents > div.cnt > div.cnt_section.mt50 > div > div > div:nth-child(5) > div > a.next")#다음버튼
  remDr$executeScript("arguments[0].click();",pageLink_next)
  Sys.sleep(2)
  
  curr_PageElem <- remDr$findElement(using='css','#contents > div.cnt > div.cnt_section.mt50 > div > div > div:nth-child(5) > div > span > a.on')
  curr_PageNewNum <- as.numeric(curr_PageElem$getElementText())
  cat(paste(curr_PageOldNum,'페이지 \n'))
  if(curr_PageNewNum == curr_PageOldNum)  {
    cat("종료\n")
    break; 
  }
  curr_PageOldNum <- curr_PageNewNum;
  
}
df <- data.frame(goodsname, goodsprice)
write.csv(df, 'gs25_twotoone.csv')
