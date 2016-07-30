library(shiny)
shinyServer(function(input, output) {
        # Defines the server logic required to draw the histogram       
        output$histplot <- renderPlot({
                # generate number of columns based on input$numcol from ui.R
                x    <- faithful[, 2] 
                numcol <- seq(min(x), max(x), length.out = input$numcol + 1)
                
                # draw the histogram with the slider-specified number of columns
                hist(x, breaks = numcol, col = 'pink', border = 'white',xlab='minutes',main='Minutes between eruptions of the Geyser')
        })
})
