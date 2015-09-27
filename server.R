library(shiny)
library('datasets')
data(mtcars)
data<-mtcars
fit3<- lm(mpg~wt+qsec+factor(am),data=data)
summary(fit3)
shinyServer(
  function(input,output){
    
   
    #output$pred<-predict(fit3,data.frame(wt = input$wt,am=input$wt))
    output$plot<-renderPlot({
      plot(mpg~wt,data=data,col=factor(data$am))
      wt<-input$wt
      pred<-predict(fit3,data.frame(wt = input$wt,qsec=input$qsec,am=factor(input$am)))
      lines(c(wt,wt),c(0,200),col="green",lwd=2)
      lines(c(0,6),c(pred,pred),col="green",lwd=2)
      output$pred<-renderPrint({predict(fit3,data.frame(wt = input$wt,qsec=input$qsec,am=factor(input$am)))[[1]]})
      
    })
    
    
    
    }
  )