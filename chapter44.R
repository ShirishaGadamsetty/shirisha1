#WEB SCRAPING WEBSITE WITH R
#Install the required packages
install.packages("rvest")
install.packages("dplyr")

#Load the required Libraries

library(rvest)
library(dplyr)

#Extract Profile IDs
text = read_html(html) %>% html_nodes(".profileContent .color11 a") %>% html_text()
profileIDs = data.frame(ID = text)

#Difference between .class and #class
#1. .class targets the following element:
<div class="class"></div>
  
#2. #class targets the following element:
  <div id="class"></div>
  
  
#How to find HTML/ CSS code of website 
  #Download Display Pic
  ID = "XXXXXXX"
text3 = read_html(html) %>% html_nodes(".vtop") %>% html_attr('src')
pic = data.frame(cbind(profileIDs, URL = text3[!is.na(text3)]))
download.file(as.character(pic$URL[match(ID, pic$ID)]), "match.jpg", mode = "wb")
# File saved as match.jpg

#Other Functions of rvest( )
url       = "http://www.google.com"
pgsession = html_session(url)            
pgform    = html_form(pgsession)[[1]]

# Set search term
filled_form = set_values(pgform, q="Datascience")
session = submit_form(pgsession,filled_form)

# look for headings of first page
session %>% html_nodes(".g .r a") %>% html_text()


