#[문제1]-랜덤으로 숫자를 뽑고 숫자에 해당하는 알파벳을 원소값으로 구성된 벡터
v <- sample(1:26, 10)
v_alpha <- function(x){
  return(LETTERS[x])
}
result <- sapply(v, v_alpha)
v; result
