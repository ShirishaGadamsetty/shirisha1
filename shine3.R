

library(shiny)
library(dplyr)
library(readr)
load(url("http://s3.amazonaws.com/assets.datacamp.com/production/course_4850/datasets/movies.Rdata"))
# UI
ui <- fluidPage(
  sidebarLayout(
    
    # Input(s)
    sidebarPanel(
      
      # Select filetype
      radioButtons(inputId = "filetype",
                   label = "Select filetype:",
                   choices = c("csv", "tsv"),
                   selected = "csv"),
      
      # Select variables to download
      checkboxGroupInput(inputId = "selected_var",
                         label = "Select variables:",
                         choices = names(movies),
                         selected = c("title"))
      
    ),
    
    # Output(s)
    mainPanel(
      HTML("Select filetype and variables, then download and/or view the data."),
      br(), ,
      downloadButton(outputId = "download_data", label = "Download data"),
      br(), br(),
      DT::dataTableOutput(outputId = "moviestable")
    )
  )
)
shinyApp(ui = ui, server = server)
