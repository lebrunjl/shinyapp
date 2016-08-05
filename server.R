# Defines the server logic required.
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