#
#
# This is a Shiny web application to reveal the regression bias introduced by only considering one variable
# The dataset is from the CAR package (mtcars). The dependent variable is miles per gallon
# the explaining variables are weight, transmission mode (automatic or manual) and
# the number of seconds from start to reaching one quarter mile. We first find the coefficient
# for weight alone and then add the other two variables to illustrate the change in the
# regression coefficient for weight.

library(shiny)
install.packages("car")
library(car)

# Defines the UI for the application that lets the reader choose between one or multiple variables
ui <- shinyUI(fluidPage(
        
        # Application title
        titlePanel("Explaining miles per gallon (mpg) with car characteristics"),
        
        # Selection boxes to explore choice 
        sidebarLayout(
                sidebarPanel(
                        h4('See how adding variables changes the value of the weight coefficient'),
                        selectInput("regression",label="Choose the variable:",
                                    choices=c("weight","weight & transmission & acceleration"),
                                    selected="weight"),
                        submitButton(text="update")
                ),
                
                # Show the intercept and regression coefficients
                mainPanel(
                        h4('Intercept and coefficients'),
                        verbatimTextOutput("summary"),
                        h4('wt: loss in mpg for each extra 1000 pounds in weight'),
                        h4('am: gain in mpg for manual transmission'),
                        h4('qsec: fuel saving in mpg for each extra second to reach quarter mile')
                )
        )
))
##Defines the server logic required.
require("car")
library(car)
server <- shinyServer(function(input, output) {
        
        output$summary <- renderPrint({
                # calculate coefficients of linear regression for one or several variables according to user choice
                if(input$regression=="weight")
                        fit<-lm(mpg ~ wt,data=mtcars)
                else if(input$regression=="weight & transmission & acceleration")
                        fit<-lm(mpg ~ wt+am+qsec,data=mtcars)
                coef(fit)
                
        }) 
})
# Run the application 
shinyApp(ui = ui, server = server)

