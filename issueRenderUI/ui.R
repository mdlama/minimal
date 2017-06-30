library(shiny)

shinyUI(fluidPage(
  h2('Minimal shinyFiles example'),
  
  uiOutput('shinyFilesButton'),
  
  verbatimTextOutput(outputId = 'filepaths')
))