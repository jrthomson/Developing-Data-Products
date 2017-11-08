#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
shinyUI(pageWithSidebar(
        headerPanel("Mortgage Payment Calculator"),
        sidebarPanel(
                h3('Inputs'),
                numericInput('mort','Mortgage Amount (between $1,000 to $10,000,000 by %1,000s)', 100000, min=1000, max=10000000,step=1000),
                sliderInput('rate','Annual Interest Rate (between 1% and 10.0%, increments of 0.25%)', 6.0, min=1.0, max=10.0,step=0.25),
                sliderInput('term','Ammortization period (between 1 and 30 years, increments of 1 year)', 30, min=1, max=30, step=1),
                submitButton("Run")
        ),
        mainPanel(
                tabsetPanel(type = "tabs",
                        tabPanel("Output",
                                h3('Output'),
                                p('The monthly payment is:'),
                                textOutput("pmt")
                                ),
                        tabPanel("Documentation",
                                h3('Documentation'),
                                p('This application calculates monthly mortgage payments. It takes three inputs:'),
                                p('- mortgage amount'),
                                p('- annual interest rate'),
                                p('- ammortization period in year'),
                                p('Use Time Value of Money (TVM) package to calculate paymets (divided by twelve to get monthly payments)'),
                                p('Use "formatC" function to limit the output to two decimal places')
                                ))
)))