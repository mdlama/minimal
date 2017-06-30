library(shiny)

shinyServer(function(input, output, session) {
  volumes <- c('Home' = normalizePath("~"))
  
  shinyFiles::shinyFileChoose(
    input = input,
    id = 'serveruploadfile',
    roots = volumes,
    session = session,
    restrictions = system.file(package = 'base'),
    filetypes = c('csv')
  )
  
  serverFilename <- reactive({
    req(input$serveruploadfile) # https://shiny.rstudio.com/articles/req.html
    
    as.character(shinyFiles::parseFilePaths(volumes, input$serveruploadfile)$datapath)
  })
  
  clientFilename <- reactive({
    req(input$clientuploadfile)
    
    input$clientuploadfile$datapath
  })
  
  output$serverfilepath <- renderPrint({
    cat(paste0("Server: ", serverFilename()))
  })

  output$clientfilepath <- renderPrint({
    cat(paste0("Client: ", clientFilename()))
  })
  
  output$serverTbl = DT::renderDataTable(read.csv(serverFilename()),
                                         server = FALSE)

  output$clientTbl = DT::renderDataTable(read.csv(clientFilename()),
                                         server = FALSE)
})
