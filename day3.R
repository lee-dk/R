#LIST
v<-c(1,2,3)
l<-list(1,2,3) 
v
l
v[1] 
l[1] 
l[[1]] 

lds <- list(1,2,3) 
lds
lds+100
unlist(lds)
unlist(lds)+100
lds[1]
lds[1]+10
lds[[1]]+10

names(lds) <- LETTERS[1:3]
lds
lds[[2]]
lds[["B"]]
lds$B


a<-list(
  a = 1:3,
  b = "a string",
  c = pi,
  d = list(-1,-5)
)

a[1]
a[[1]] # a[["a"]]
a$a
a[[1]][1]
a$a[1]
a[1]+1
a[[1]]+1
a[[1]][2] <- 100
new_a <- unlist(a[1])
a[1]; new_a
names(a) <- NULL
names(new_a) <- NULL