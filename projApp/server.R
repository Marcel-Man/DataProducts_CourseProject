library(shiny)
library(ggplot2)
data(mtcars)

shinyServer(function(input, output) {

    getData <- reactive({
        data <- mtcars
        if (input$four == FALSE) {
            data <- data[data$cyl != 4,]
        }
        if (input$six == FALSE) {
            data <- data[data$cyl != 6,]
        }
        if (input$eight == FALSE) {
            data <- data[data$cyl != 8,]
        }
        data
    })

    output$plot <- renderPlot({
        ggplot(data=getData(), aes(wt, mpg)) + geom_point(aes(color=factor(cyl))) + geom_smooth(method="lm", level=input$conf)
    })

})


