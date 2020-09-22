#[문제2] - 행단위로 읽어서 리턴하기기
read_memo <- readLines("memo.txt", encoding = "UTF-8")
read_memo[1] <- gsub("[&,$,!,#,@,%]", "", read_memo[1]) # 특수문자 제거
read_memo <- gsub("e", "E", read_memo) # e를 대문자 E로 변경
read_memo <- gsub("[0-9]", "", read_memo) # 숫자 제거
read_memo[4] <- gsub("[R,Analysis,Big,Data]", "", read_memo[4]) #특정 문자열 제거
read_memo[5] <- gsub("[!,<,>]", "", read_memo[5])
read_memo[7] <- gsub("YOU", "you", read_memo[7])
read_memo[7] <- gsub("OK", "ok", read_memo[7])
read_memo[-(8:10)]

write(read_memo, "memo_new.txt")
