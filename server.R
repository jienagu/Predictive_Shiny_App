#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)

calschool<-readRDS("calschool.rds")
# Define server logic required to draw a histogram
shinyServer(function(input, output) {


  output$plot1 <- renderPlot({
    cal_fit<-lm(readscr ~ computer+ mealpct+compstu+elpct+mathscr+expnstu+avginc,  data = calschool)
    computer<-input$computer
    mealpct<-input$mealpct
    compstu<-input$compstu
    elpct<-input$elpct
    mathscr<-input$mathscr
    expnstu<-input$expnstu
    avginc<-input$avginc
    new_obs<-data.frame(computer,mealpct,compstu,elpct,mathscr,expnstu,avginc)
    prediction<-predict(cal_fit, new_obs,interval = "prediction")
    dens <- density(calschool$readscr)
    dd <- with(dens,data.frame(x,y))
    ggp1<-qplot(x,y,data=dd,geom="line")+
      geom_ribbon(data=subset(dd,x>prediction[2] & x<prediction[3]),aes(ymax=y),ymin=0,
                  fill="blue",colour=NA,alpha=0.5)+ 
      geom_text(mapping=aes(x2,y2,label = text2), data=data.frame(x2=prediction[1]+23, y2=0.01, text2=paste("Estimated Reading score:", round(prediction[1]) ) ), size=6)+
      geom_vline(aes(xintercept=prediction[1]),   # Ignore NA values for mean
                 color="red", linetype="dashed", size=1)+ xlab("Reading Score")+ylab("Density plot")+ theme_classic()
    ggp1
    
  })
  
})
