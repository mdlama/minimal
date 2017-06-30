library(shiny)
library(shinyFiles)

shinyServer(function(input, output, session) {
  volumes <- c('Home' = normalizePath("~"))
  
  output$shinyFilesButton <- renderUI({
    shinyFilesButton(
      id = 'serveruploadfile',
      label = 'File select',
      title = 'Please select a file',
      multiple = FALSE
    )
  })
  
  shinyFileChoose(
    input = input,
    id = 'serveruploadfile',
    roots = volumes,
    session = session,
    restrictions = system.file(package = 'base'),
    filetypes = c('csv')
  )

  output$filepaths <- renderPrint({
    req(input$serveruploadfile) # https://shiny.rstudio.com/articles/req.html
    
    as.character(shinyFiles::parseFilePaths(volumes, input$serveruploadfile)$datapath)
  })
})
