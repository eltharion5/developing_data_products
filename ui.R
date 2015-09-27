library(shiny)

shinyUI(pageWithSidebar(
  headerPanel("MPG predictor for \"mtcars\" dataset"),
  sidebarPanel(
    sliderInput('wt','WEIGHT: (lb/1000)',value=3,min=0,max=6,step=0.1),
    sliderInput('qsec','QSEC: 1/4 mile time',value=18,min=14,max=23,step=0.1),
    radioButtons('am','automatic or manual',c('Automatic'=0,'Manual'=1)),
    h3('Predicted mpg (Miles/(US) gallon):'),
    verbatimTextOutput('pred')
    ),
  mainPanel(
    h4('Graphical result'),
    plotOutput('plot')
    )
  ))

