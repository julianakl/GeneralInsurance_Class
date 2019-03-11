library(dplyr)
library(ggplot2)

dt_KPI <- read.csv("D:/SSA/VTA/GeneralInsurance_Class/Data/lesson2_KPI.csv")

dt_KPI_upr <- dt_KPI %>% filter_all(all_vars(!is.na(.)))

ui <- fluidPage(
  
  selectInput( "variable","Colouring Var:", 
               choices = colnames(dt_KPI_upr[1:5])),
  
  plotOutput(outputId = "chart")
)

library(shiny)

server <- function(input, output){
  
  output$chart <- renderPlot({
    
    ggplot(data = dt_KPI_upr, 
           mapping = aes_string("Premium", "Expenses", 
                                colour = input$variable)) +
      geom_point() +
      geom_smooth()
    
  })
  
}
