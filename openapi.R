#openapi

#[OPEN API 실습 1]
searchUrl<- "https://openapi.naver.com/v1/search/blog.xml"
Client_ID <- "izGsqP2exeThwwEUVU3x"
Client_Secret <- "WrwbQ1l6ZI"

query <- URLencode(iconv("맛집","euc-kr","UTF-8"))
url <- paste0(searchUrl, "?query=", query, "&display=100")
doc <- GET(url, add_headers("Content_Type" = "application/xml",
                            "X-Naver-client-Id" = Client_ID, "X-naver-Client-Secret" = Client_Secret))

doc2 <- htmlParse(doc, encoding="UTF-8")
text<- xpathSApply(doc2, "//item/description", xmlValue)
text
text <- gsub("</?b>", "", text)
text <- gsub("&.+t;", "", text)
text; write.table(text, "naverblog.txt")


#[OPEN API 실습 2]
library(rtweet) 
appname <- "edu_data_collection"
api_key <- "RvnZeIl8ra88reu8fm23m0bST"
api_secret <- "wTRylK94GK2KmhZUnqXonDaIszwAsS6VPvpSsIo6EX5GQLtzQo"
access_token <- "959614462004117506-dkWyZaO8Bz3ZXh73rspWfc1sQz0EnDU"
access_token_secret <- "rxDWfg7uz1yXMTDwijz0x90yWhDAnmOM15R6IgC8kmtTe"
twitter_token <- create_token(
  app = appname,
  consumer_key = api_key,
  consumer_secret = api_secret,
  access_token = access_token,
  access_secret = access_token_secret)

key <- "코로나"
key <- enc2utf8(key)
result <- search_tweets(key, n=100, token = twitter_token)
str(result)
result$retweet_text
content <- result$retweet_text   
content <- gsub("[^0-9ㄱ-힣]", " ", content)  #숫자나 한글이 아니면 공백으로 변경
content[is.na(content)] <- "" #NA 제거
content; write.table(content, "twitter.txt")


#[OPEN API 실습 3]
library(XML)
API_key  <- "%2BjzsSyNtwmcqxUsGnflvs3rW2oceFvhHR8AFkM3ao%2Fw50hwHXgGyPVutXw04uAXvrkoWgkoScvvhlH7jgD4%2FRQ%3D%3D"
bus_No <- "360"
url <- paste("http://ws.bus.go.kr/api/rest/busRouteInfo/getBusRouteList?ServiceKey=", API_key, "&strSrch=", bus_No, sep="")
doc <- xmlParse(url, encoding="UTF-8")
top <- xmlRoot(doc)
top
df <- xmlToDataFrame(getNodeSet(doc, "//itemList"))
df <- df[1, c("busRouteId", "length", "stStationNm", "edStationNm", "term")]
names(df) <- c("노선ID", "노선길이(Km)", "기점", "종점", "배차간격(분)")
str(df)


#[OPEN API 실습 4]_json형식으로...
searchUrl<- "https://openapi.naver.com/v1/search/news.xml"
Client_ID <- "izGsqP2exeThwwEUVU3x"
Client_Secret <- "WrwbQ1l6ZI"
query <- URLencode(iconv("빅데이터","euc-kr","UTF-8"))
url <- paste0(searchUrl, "?query=", query, "&display=100")
doc <- GET(url, add_headers("Content_Type" = "application/xml",
                            "X-Naver-client-Id" = Client_ID, "X-naver-Client-Secret" = Client_Secret))

doc2 <- htmlParse(doc, encoding="UTF-8")
news<- xpathSApply(doc2, "//item/description", xmlValue); 
news
news <- gsub("</?b>", "", news)
news <- gsub("&.+t;", "", news)
news; write.table(news, "navernews.txt")