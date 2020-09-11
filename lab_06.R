#문제1
exam1 <- function(){
  return(print(paste(LETTERS,letters,sep="")))
}; exam1()

#문제2
exam2 <- function(num){
  return(sum(1:num))
}; exam2(10);exam2(5)

#문제3
exam3 <- function(num1, num2){
  if(num1 > num2){
    return(num1 - num2)
  }else if(num2 > num1){
    return(num2 - num1)
  }else{
    return(0)
  }
} 
exam3(10,3)
exam3(7,15)
exam3(9,9)

#문제4
exam4 <- function(a,b,c){
  return(switch(EXPR=b, "+"=a+c, "-"=a-c, "*"=a*c,
                "%/%"=
                  if(a==0){
                    cat("오류1")
                  }else{
                    a%/%c
                  },
                "%%"=
                  if(a==0){
                    cat("오류2")
                  }else{
                    a%%c
                  },
                if(!(b=="+" | b=="-" | b=="*" | b=="%/%" | b=="%%")){
                  cat("규격의 연산자만 전달하세요\n")
                }
                  ))
  
}
exam4(1,"+",2)
exam4(3,"-",4)
exam4(5,"*",6)
exam4(7,"%/%",8)
exam4(0,"%/%",8)
exam4(9,"%%",10)
exam4(0,"%%",10)
exam4(11,"+-",12)

#문제5
exam5 <- function(x,y="#"){
  if(x > 0){
    for(i in 1:x){
      cat(y, sep = "")
    }
  }else if(x < 0){
    return()
  }
  
}
exam5(5)
exam5(7,"@")
exam5(-3)


#문제6
exam6 <- function(...){
  score<-c(...)
  for(i in score){
    if(is.na(i)){
      print("NA 는 처리불가")
    }else if(i>=85 && i<=100){
      level <- "상"
    }else if(i>=70){
      level <- "중"
    }else{
      level <- "하"
    }
    print(paste(i, "점은", result, "등급입니다.", sep=""))
  }
}
exam6(80, 50, 70, 66, NA, 35)
