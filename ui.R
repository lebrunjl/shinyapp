library(shiny)
shinyUI(fluidPage(
        # Defines the UI for the application that draws the histogram of old faithful delay between eruptions        
        # Application title
        titlePanel("Waiting for the Old Faithful Geyser"),
        
        # Sidebar with a slider input to enter the number of columns 
        sidebarLayout(
                sidebarPanel(
                        h4('slide the ruler to set out the number of columns in the histogram'),
                        sliderInput("numcol",
                                    "Number of columns:",
                                    min = 1,
                                    max = 40,
                                    value = 15)
                ),
                
                # Show a histogram plot of the distribution of waiting time for old faithful eruptions
                mainPanel(
                        plotOutput("histplot")
                )
        )
))
