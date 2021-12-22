
# Load packages -----------------------------------------------------------

library(dplyr)
library(googlesheets4)
library(glue)






# Load data ---------------------------------------------------------------


#This is a publicly accessible sheet, therefore no need to googlesheets4 authorisation

gs4_deauth()

books_source <- read_sheet("https://docs.google.com/spreadsheets/d/1vufdtrIzF5wbkWZUG_HGIBAXpT1C4joPx2qTh5aYzDg")




# Create book content -----------------------------------------------------


  for (entry in 1:nrow(books_source)) {
    
    chapter
    
    glue("The chapter is {chapter}, the book is {title")
  }
