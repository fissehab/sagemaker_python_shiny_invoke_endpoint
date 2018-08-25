library(shiny)
library(reticulate)
use_python("/Users/fberhane/anaconda3/bin/python", required=TRUE)

source_python("predict_end_point.py")



shinyServer(function(input, output) {
    
    
    selected = reactive({
        z = c(input$season,input$holiday, input$workingday, input$weather, input$temp, input$atemp, input$humidity, input$windspeed, input$year, input$month, input$day, input$dayofweek, input$hour)
        as.numeric(z)
    })
    
    
 
output$selected_values = renderTable({
                   input$go
                  isolate(selected())
        
    })
    output$text <- renderText({
        input$go
        paste0("SageMaker Endpoint Prediction = ",isolate(expm1(as.numeric(predict_end_point(selected())))))
       
    })
    
    output$features = renderPrint({
        paste0(selected(), collapse=",")
    })
})

