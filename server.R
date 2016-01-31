library(lubridate)
library(ggplot2)

function(input, output) 
{
  
  #   output$Monthly.Expense.Retirement = renderText(input$n*(1+input$Inflation.Rate/100)^(year(input$Retirement.Date)-year(Sys.Date())))
  #   output$Annual.Expense.pretax = renderText(output$Monthly.Expense.Retirement*12*1.3)
  observeEvent(input$do,{
  output$Corpus.Required = renderText(input$n*(1+input$Inflation.Rate/100)^(year(input$Retirement.Date)-year(Sys.Date()))*12*1.3/(input$FDInterest/100))
  
  output$plot = renderPlot(
    {
      Corpusyearly <- data.frame(x = numeric(0), y = numeric(0))
      k=1
      for (i in year(Sys.Date()):year(input$Retirement.Date))
      {
        
        Corpusyearly[k,] = data.frame(i,input$n*(1+input$Inflation.Rate/100)^(i-year(Sys.Date()))*12*1.3/(input$FDInterest/100))
        k=k+1
      }
      options(scipen = 3)
      ggplot(Corpusyearly,aes(x,y/1000000))+geom_line()+xlab("Year of Possible Retirement")+ylab("Amount of Corpus Required in Millions")+ggtitle("Amount of Corpus required with time")+theme_bw()+geom_point()
    }
  )
  }
  )
  }