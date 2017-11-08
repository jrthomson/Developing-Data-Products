#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(scales)
library(tvm)
shinyServer(
        function(input, output){ 
                output$omort <- renderText({input$mortt})
                output$orate <- renderText({input$rate})
                output$oterm <- renderText({input$term})
                # Use Time Value of Money (TVM) package to calculate paymets
                output$pmt <- renderText({formatC(pmt(amt = input$mort, maturity = input$term, rate = input$rate/100)/12, digits =2, format = "f")})
                }
)