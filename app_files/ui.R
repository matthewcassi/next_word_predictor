library(shiny)
library(shinythemes)
library(tm)
library(dplyr)
library(tidyr)

shinyUI(
  
  fluidPage(theme = shinytheme("united"),
    headerPanel("Next Word Predictor"),
    sidebarLayout(position = "left",
    sidebarPanel(
        textInput('sentence', 'Sentence without the Final Word'),
        selectInput('numPredictions', label = 'Number of Predicted Words', 
                   choices = list("1 Word" = 1, "2 Words" = 2, "3 Words" = 3, "4 Words" = 4, "5 Words" = 5)),
        actionButton('button', 'Predict Next Word', 
                     style="color: #fff; background-color: #337ab7; 
                     border-color: #2e6da4"),
        p(),
        p(),
        p(strong("Directions:")),
        p("1. Enter in a phrase with the last word omitted."),
        p("2. Select the number of words you want predicted."),
        p("3. Click the Predict Next Word button."),
        p("The application will then provide the selected number of predictions for the 
          next word")
        ),
    mainPanel(
      #h4("You're Input Text"),
      #verbatimTextOutput("sentence"),
      h4('Top Prediction(s) for the Next Word'),
      verbatimTextOutput("prediction")
    )
    )
  )
)
