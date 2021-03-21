#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinydashboard)
library(shinyjs)

# Define UI for application that draws a histogram
shinyUI(dashboardPage(
  dashboardHeader(title = "Data Analytics"),
  dashboardSidebar(),
  dashboardBody(
    h4("Descriptive, Inferential and Predictive Analytics using California Test Score Data Set"),
    helpText("This approach helps us to have descrivptive, inferential and predictive analytics for the reading score in Califoria."),
    helpText("This dataset is from a cross-section study during 1998 to 1999, which includes 420 observations in US."),
    helpText("Reference:Stock, James H. and Mark W. Watson (2003) Introduction to Econometrics, Addison-Wesley Educational Publishers, chapter 4-7."),
    fluidRow(
      column(6,
      numericInput("computer", "Number of computers:", 90, min=20, max=500) ,
      numericInput("mealpct", "Percent qualifying for reduced-price lunch:", 60, min=1, max=100),
      numericInput("compstu", "Computer per student:", 0.5, min=0.00001, max=2),
      numericInput("avginc", "District average income ($10000):", 10, min=1, max=100)
      ),
      column(6,
             numericInput("elpct", "Percent of English learners:", 60, min=0, max=100),
             numericInput("mathscr", "Average math score:", 700, min=550, max=725),
             numericInput("expnstu", "Expenditure per student:", 5800, min=1000, max=10000) 
      )
    ),
    # Boxes need to be put in a row (or column)
      
      
      plotOutput("plot1"),
    helpText("By Jiena McLellan (jiena@vet.ksu.edu)")
    
  )
))
