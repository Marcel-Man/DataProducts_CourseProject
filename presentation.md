Regression Line and Confidence Interval of mtcars dataset
========================================================
author: Marcel Man
date: 2020-09-04
autosize: true

Summary
========================================================
The application uses the mtcars dataset and tries to shows the regression line of mpg and its confidence interval under different scenarios. 

```r
head(mtcars)
```

```
                   mpg cyl disp  hp drat    wt  qsec vs am gear carb
Mazda RX4         21.0   6  160 110 3.90 2.620 16.46  0  1    4    4
Mazda RX4 Wag     21.0   6  160 110 3.90 2.875 17.02  0  1    4    4
Datsun 710        22.8   4  108  93 3.85 2.320 18.61  1  1    4    1
Hornet 4 Drive    21.4   6  258 110 3.08 3.215 19.44  1  0    3    1
Hornet Sportabout 18.7   8  360 175 3.15 3.440 17.02  0  0    3    2
Valiant           18.1   6  225 105 2.76 3.460 20.22  1  0    3    1
```

Inputs
========================================================
The available input options of the application are:
- Confidence Interval of the regression line
- Number of cylinders in the mtcar dataset

Output
========================================================
With the selected input, the application plots a scatter plot of the data points, and the regression line with the confidence interval in the dataset. Then we use ggplot to use the datapoints, regression line and confidence interval.


```r
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
```


Appendix
========================================================
For more details on the application please visit <https://marcelman.shinyapps.io/DataProducts_CourseProject/>.


