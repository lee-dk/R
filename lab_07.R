#문제1
countEvenOdd <- function(...){
  num <- c(...)
  numlist <- list(1,2)
  a <- 0; b <- 0;
  for(i in num){
    if(i %% 2 == 0) {
      numlist[[1]][a+1] <- i
      a<-a+1
    }else if(i %% 2 == 1){
      numlist[[2]][b+1] <- i
      b<-b+1
    }
  }
  names(numlist) <- c("even","odd")
  
  cat("짝수의 갯수 : ", a, "\n홀수의 갯수 : ", b, "\n")
  return(numlist)
}
countEvenOdd(2,3,5,6,8)
countEvenOdd(15,33,46,76,88,23,51)

#문제2
vmSum <- function(data){
  sum <- 0
  if(is.vector(data)){
    if(is.vector(data) && !is.numeric(data)){
      print("벡터가 맞긴한데유..숫자만 전달하세유")
      return(0)
    }
    else {
      for(x in data){
        sum <- sum + x
        }
      return(sum)
    }
  }
  else{
    result <- "벡터만 전달하세유~!"
    return(result)
  }
}
vmSum(c(1,5,9,7,11,35))
vmSum(c(1,5,9,"7",11,35))
vmSum(mean)
vmSum(list())

#문제3
vmSum2 <- function(data){
  sum <- 0
  if(is.vector(data)){
    if(is.vector(data) && !is.numeric(data)){
      warning("벡터가 맞긴한데유..숫자만 전달하세유")
      return(0)
    }
    else {
      for(x in data){
        sum <- sum + x
      }
      return(sum)
    }
  }
  else{
    stop("벡터만 전달하세유~!")
  }
}
vmSum2(c(1,5,9,7,11,35))
vmSum2(c(1,5,9,"7",11,35))
vmSum2(mean)

#문제4
mySum <- function(arg_v){
  count <- 0
  even_sum <- 0; odd_sum <- 0
  if(any(is.na(arg_v))){
    arg_v[is.na(arg_v)] <- sort(arg_v[1])
    cat("NA를 최소값으로 변경 후 : ",arg_v, "\n")
    warning("NA를 최저값으로 변경하여 처리함!!")
    return(mySum(arg_v))
  }
  else if(is.vector(arg_v) && !is.list(arg_v)){
    for(data in arg_v){
      count <- count + 1
      if(count %% 2 == 1){
        odd_sum <- odd_sum + data
      }
      else if(count %% 2 == 0){
        even_sum <- even_sum + data
      }
    }
    sum_list <- list(even_sum, odd_sum)
    names(sum_list) <- c("evenSum","oddSum")
    return(sum_list)
  }
  else if(is.null(arg_v)){
    return()
  }
  else{
    stop("벡터만 처리가능!!!")
  }
}
mySum(c(1,5,9,7,11,35))
mySum(list())
mySum(c(1,10,20,NA,40,90))
mySum(NULL)

#문제5.....못하겠다..
func <- function(...){
  print(...)
}
func(c(1,2,3,4,5,6))

myExpr <- function(func_arg){
  func_v <- c()
  if(!is.function(func_arg)){
    stop("함수아니야!!수행안해!!!!!!!!!")
  }else
    for (data in func_arg) {
      func_v <- data
    }
    return(func_v)
}
myExpr(func())
myExpr(c(1,2,3))


#문제6
createVector1 <- function(...){
  data <- c(...)
  if(is.null(data)) return()
  else if (any(is.na(data))) return(NA)
  else if(is.vector(data)) return(data)
}
createVector1(1,2,"3",4,5,"육", T)
createVector1(1,2,"3",NA,5,"육")
createVector1()


#문제7
createVector2 <- function(...){
  result <- list(1,2)
  data <- c(...)
  if(is.null(data)){
    return()
  }
  else if(is.vector(data)  && !is.list(data)) result <- list(data)
  else if(is.data.frame(data)) result <- list(data)
  else if(is.list(data)) result <- list(data)
  else if(is.matrix(data)) result <- list(data)
  else if(is.array(data)) result <- list(data)
  else if(is.function(data)) result <- list(data)
  return(result)
}
createVector2()
createVector2(100, 200, 300, 400)
createVector2(LETTERS)
name <- c('Apple','Banana','Peach','Berry')
qty <- c(5,2,7,9)
createVector2(data.frame(name,qty))
createVector2(matrix(1:6))
createVector2(list(7,13,17))
createVector2(array(1:30, dim=c(2,3,5)))
