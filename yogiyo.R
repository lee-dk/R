#cmd -> d: -> cd D:\R기반_빅데이터처리\Rexam
# -> java -Dwebdriver.chrome.driver="chromedriver.exe" -jar selenium-server-standalone-4.0.0-alpha-1.jar -port 4445

library(RSelenium)
remDr <- remoteDriver(remoteServerAddr = "localhost" , 
                      port = 4445, browserName = "chrome")

#요기요_셰플리-셰프의건강한한끼(강남)
remDr$open()
site <- 'https://www.yogiyo.co.kr/mobile/#/260443/'
remDr$navigate(site)

Sys.sleep(3)

#클린리뷰 탭 클릭
pageLink <- remDr$findElements(using='css',
                               value= paste0('#content > div.restaurant-detail.row.ng-scope > div.col-sm-8 > ul > li:nth-child(2) > a'))
remDr$executeScript("arguments[0].click();",pageLink)

#작업 디렉토리에 새폴더 생성(csv파일 저장 폴더)
#dir.create('yogiyo')

for (n in 2:11) {
  #아이디
  user_id_node <- remDr$findElements(using='css',
                                  value= paste0('#review > li:nth-child(',n,') > div:nth-child(1) > span.review-id.ng-binding'))
  users_id <- sapply(user_id_node, function(x) {x$getElementText()})
  print(users_id)
  #user_id <- append(user_id, unlist(users_id))
  
  #주문날짜
  order_date_node <- remDr$findElements(using='css',
                                     value= paste0('#review > li:nth-child(',n,') > div:nth-child(1) > span.review-time.ng-binding'))
  order_dates <- sapply(order_date_node, function(x) {x$getElementText()})
  print(order_dates)
  #order_date <- append(order_date, unlist(order_dates))
  
  #주문음식
  order_item_node <- remDr$findElements(using='css',
                                        value= paste0('#review > li:nth-child(',n,') > div.order-items.default.ng-binding'))
  order_items <- sapply(order_item_node, function(x) {x$getElementText()})
  print(order_items)
  #order_item <- append(order_item, unlist(order_items))
  
  
}
