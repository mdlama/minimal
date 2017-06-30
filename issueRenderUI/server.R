library(shiny)

shinyServer(function(input, output, session) {
  volumes <- c('Home' = normalizePath("~"))
  
  output$shinyFilesButton <- renderUI({
    shinyFiles::shinyFilesButton(
      id = 'serveruploadfile',
      label = 'File select',
      title = 'Please select a file',
      multiple = FALSE
    )
  })
  
  shinyFiles::shinyFileChoose(
    input = input,
    id = 'serveruploadfile',
    roots = volumes,
    session = session,
    restrictions = system.file(package = 'base'),
    filetypes = c('csv')
  )
  
  filename <- reactive({
    req(input$serveruploadfile) # https://shiny.rstudio.com/articles/req.html
    
    as.character(shinyFiles::parseFilePaths(volumes, input$serveruploadfile)$datapath)
  })
  
  output$filepaths <- renderPrint({
    filename()
  })
  
  output$tbl = DT::renderDataTable(read.csv(filename()))
})
