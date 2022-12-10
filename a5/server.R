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
library(dplyr)
library(plotly)
library(tidyr)

co2_data <- read.csv("https://nyc3.digitaloceanspaces.com/owid-public/data/co2/owid-co2-data.csv")
df1 <- co2_data %>%
  group_by(year) %>% 
  summarize(country = country, co2 = co2, year = year) 

shinyServer(function(input, output) {

  output$plot <- renderPlot({
    ggplot(data()) +
      geom_point(mapping = aes(x = year, y = co2, color = country), size = 3) + 
      labs(
        title = "Countries and Their CO2 Emissions",
        caption = ("Countries and their CO2 emissions by year"),
        scale_fill_brewer(palette("Set3"))
      )
  })
  
  data <- reactive({
    req(input$sel_country)
    df1_short <- df1 %>% 
    filter(country %in% input$sel_country)
    
  })

})
