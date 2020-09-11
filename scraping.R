url <- "http://unico2013.dothome.co.kr/crawling/exercise_bs.html"
text <- read_html(url); text

title <- html_text(nodes); title

nodes_a <- html_nodes(text, "a") %>% html_attr("href"); nodes_a
html_attr(html_nodes(text, "a"), "href")

nodes_img <- html_nodes(text, "img") %>% html_attr("src"); nodes_img

nodes_h2_1 <- html_nodes(text, "h2:nth-of-type(1)"); nodes_h2_1

nodes_ul <- html_nodes(text, "ul>li:nth-child(3)"); nodes_ul
html_text(html_nodes(text,"ul>[style$=green]"))

nodes_h2_2 <- html_nodes(text, "h2:nth-of-type(2)"); nodes_h2_2

nodes_ol <- html_nodes(text, "ol>li"); nodes_ol

nodes_table <- html_text(html_nodes(text, "table *")); nodes_table

html_text(html_nodes(text, "tr[class=name]"))
html_text(html_nodes(text, "td#target"))
