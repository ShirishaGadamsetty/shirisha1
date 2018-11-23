#TUTORIAL : BUILD WEBAPP IN R USING SHINY
install.packages("shiny")

library(shiny)
#The first simple shiny app with basic layout
ui = fluidPage(sidebarLayout(sidebarPanel("Welcome to Shiny App"),
                             mainPanel("This is main Panel")))
server = function(input, output) {  }
shinyApp(ui, server)

#Adding a title to your App!
ui =  fluidPage(titlePanel("My favorite novels:"),
                sidebarLayout(sidebarPanel(),
                              mainPanel()))
server = function(input, output) {
}
shinyApp(ui, server)

#Creating a hyperlink
ui =  fluidPage(sidebarLayout(sidebarPanel(
  a("Click here!", href = "http://www.listendata.com/")),
  mainPanel()))
server = function(input, output) {}
shinyApp(ui, server)

#Modifying the text presentation using HTML tags.
ui =  fluidPage(titlePanel("My favorite novels:"),
                sidebarLayout(sidebarPanel(
                  ("My favorite novels are:"),
                  br(),
                  h4(strong("The Kiterunner"), "a novel by", em("Khaled Hoseinni")),
                  h3(strong("Jane Eyre"), "a novel by", code("Charolette Bronte")),
                  strong(
                    "The diary of a young girl",
                    "by",
                    span("Anne Frank", style = "color:blue")
                  ),
                  div(strong("A thousand splendid suns"), "by Khaled Hoseinni", style = "color: red")
                ),
                mainPanel()))
server = function(input, output) { }
shinyApp(ui, server)

#HelpText and TextInput
ui =  fluidPage(sidebarLayout(
  sidebarPanel(helpText("This questionnaire is subject to privacy."),
               
               textInput(inputId = "name", label = "Enter your name.")
  ),
  
  mainPanel()
  
))
server = function(input, output) { }
shinyApp(ui, server)


#Adding SliderInput
ui =  fluidPage(sidebarLayout(
  sidebarPanel(
    helpText("This questionnaire is subject to privacy."),
    
    textInput(inputId = "name", label = "Enter your name."),
    sliderInput(
      inputId = "age",
      label = "What is your age?",
      min = 1,
      max = 100,
      value = 25
    )
  ),
  
  mainPanel()
  
))
server = function(input, output) { }
shinyApp(ui, server)


#RadioButtons, NumericInput and CheckBoxInput
ui =  fluidPage(sidebarLayout(
  sidebarPanel(
    radioButtons(
      inputId = "month",
      label = "In which month are you born?",
      choices = list(
        "Jan - March" = 1,
        "April - June" = 2,
        "July - September" = 3,
        "October - November" = 4
      ),
      selected = 1
    ),
    
    numericInput(
      inputId = "children_count",
      label = "How many children do you have?",
      value = 2,
      min = 0,
      max = 15
    ),
    
    selectInput(
      inputId  = "smoker",
      label = "Are you a smoker?",
      choices = c("Yes", "No", "I smoke rarely"),
      selected = "Yes"
    ),
    
    checkboxInput(
      inputId = "checkbox",
      label = "Are you a human?",
      value = FALSE
    ),
    
    checkboxGroupInput(
      inputId = "checkbox2",
      label = "2 + 2 = ?",
      choices = list(4, "Four", "IV", "None of the above")
    )
    
  ),
  
  mainPanel()
  
))
server = function(input, output) { }
shinyApp(ui, server)


#Dealing with dates
ui = fluidPage(dateInput(
  "bday",
  label = h3("Enter your Date of Birth"),
  value = "1985-01-01"
),
verbatimTextOutput("text"))

server = function(input, output) {
  output$text <- renderPrint({
    paste(input$bday, "was a blessed day!")
    
  })
}
shinyApp(ui, server)

#Viewing Data
ui =  fluidPage(titlePanel("Viewing data"),
                
                sidebarLayout(sidebarPanel(
                  selectInput(
                    inputId  = "specie",
                    label = "Select the flower specie",
                    choices = c("setosa", "versicolor", "virginica"),
                    selected = "setosa"
                  )
                ),
                
                mainPanel(tableOutput("data")))) 



server = function(input, output) {
  output$data  = renderTable({
    iris[iris$Species == input$specie, ]
  })
}
shinyApp(ui, server)
