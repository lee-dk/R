#문제1
grade <- sample(1:6,1)
if (grade > 3) {
  cat("***",grade,"학년은 고학년입니다***","\n")
}else{
  cat("***",grade,"학년은 저학년입니다***","\n")
}

#문제2
choice <- sample(1:5,1)
if(choice == 1){
  result <- 300 + 50
}else if(choice == 2){
  result <- 300 - 50
}else if(choice == 3){
  result <- 300 * 50
}else if(choice == 4){
  result <- 300 / 50
}else if(choice == 5){
  result <- 300 %% 50
}; cat("추출값 : ",choice,"\n결과값 : ",result)

#문제3
count <- sample(3:10,1)
deco <- sample(1:3,1)
if(deco == 1){
  for(i in 1:count){
    cat("*")
  }
}else if(deco == 2){
  for(i in 1:count){
    cat("$")
  }
}else if(deco == 3){
  for(i in 1:count){
    cat("#")
  }
}

#문제4
score <- as.character(sample(0:100,1))
level <- switch(EXPR=score,
                "90"=,"91"=,"92"=,"93"=,"94"=,"95"=,"96"=,"97"=,"98"=,"99"=,"100"="A등급",
                "80"=,"81"=,"82"=,"83"=,"84"=,"85"=,"86"=,"87"=,"88"=,"89"="B등급",
                "70"=,"71"=,"72"=,"73"=,"74"=,"75"=,"76"=,"77"=,"78"=,"79"="C등급",
                "60"=,"61"=,"62"=,"63"=,"64"=,"65"=,"66"=,"67"=,"68"=,"69"="D등급", "F등급"
                ); cat(score,"점은 ",level,"입니다")

#문제5
alpha <- 
  for(i in 1:26){
    cat('"',LETTERS[i],letters[i],'"',sep="", end=", ")
  }
