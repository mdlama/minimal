library(shiny)

shinyUI(pageWithSidebar(
  headerPanel(title = 'Minimal shinyFiles example'),
  
  sidebarPanel(
    tags$b("Server file select"),
    shinyFiles::shinyFilesButton(
      id = 'serveruploadfile',
      label = 'Browse...',
      title = 'Please select a file',
      multiple = FALSE
    ),
    fileInput(
      inputId = 'clientuploadfile',
      label = 'Client file select',
      accept = c("text/csv",
                 "text/comma-separated-values,text/plain",
                 ".csv"),
      multiple = FALSE
    )
  ),
  
  mainPanel(
    h2("Server information"),
    verbatimTextOutput(outputId = 'serverfilepath'),
    DT::dataTableOutput(outputId = 'serverTbl'),
    hr(),
    h2("Client information"),
    verbatimTextOutput(outputId = 'clientfilepath'),
    DT::dataTableOutput(outputId = 'clientTbl')
  )
))