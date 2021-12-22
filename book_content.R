
# Load packages -----------------------------------------------------------

library(dplyr)
library(googlesheets4)
library(glue)
library(rmarkdown)
library(readr)






# Load data ---------------------------------------------------------------


#This is a publicly accessible sheet, therefore no need to googlesheets4 authorisation

gs4_deauth()

books_source <- read_sheet("https://docs.google.com/spreadsheets/d/1vufdtrIzF5wbkWZUG_HGIBAXpT1C4joPx2qTh5aYzDg")




# Create book content -----------------------------------------------------


 prep_booksource <- books_source %>% 
  # mutate(content_markdown = glue('## {title}  [{author1}]({bio1}) [{author2}]({bio2}) [{author3}]({bio3}) {others}  {description}  {paid} {amount_usd}  {link}',
  #                                .na = ""))

mutate(content_markdown = glue("## {title}",
                               "[{author1}]({bio1})",
                               "[{author2}]({bio2})",
                               "[{author3}]({bio3})",
                               "{others} ",
                               "{description}",
                               "{paid} {amount_usd}",
                               "{link}",
                               .na = "", 
                               sep = "  "))

chapters <- books_source %>% 
  select(chapters) %>% 
  distinct(chapters) %>% 
  pull() 


markdown_content <-  ""

 for (chapter in chapters) {
   
   
   
   chapter_content <- prep_booksource %>% 
     filter(chapters == chapter) %>% 
     select(content_markdown)
   
   markdown_content <- paste(markdown_content, "#", chapter,chapter_content, sep = "  ")
   
   
 }

write.table(markdown_content)

