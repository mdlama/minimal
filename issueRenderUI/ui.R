library(shiny)

shinyUI(pageWithSidebar(
  headerPanel(title = 'Minimal shinyFiles example'),
  
  sidebarPanel(
    uiOutput('shinyFilesButton')
  ),
  
  mainPanel(
    verbatimTextOutput(outputId = 'filepaths'),
    hr(),
    DT::dataTableOutput(outputId = 'tbl')
  )
))