library(shiny)

shinyUI(fluidPage(

    titlePanel("Regression Line and Confidence Interval of mtcars dataset"),

    sidebarLayout(
        sidebarPanel(
            h4("Select confidence Interval of regression line"),
            sliderInput("conf", "Confidence Interval", min = 0, max = 1,value = 0.95),
            h4("Include cylinders in dataset:"),
            checkboxInput("four", "4", value=TRUE),
            checkboxInput("six", "6", value=TRUE),
            checkboxInput("eight", "8", value=TRUE)
        ),

        mainPanel(
            plotOutput("plot")
        )
    )
))
