#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
library(shiny)
library(ggplot2)

df1 <- co2_data %>%
  group_by(year) %>% 
  summarize(country = country, co2 = co2, year = year) 

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  navbarPage("CO2 Emissions",
    tabPanel("Overview",
    h2("Introduction"),
    p("Climate change remains as a prominent issue that our world fights everyday. The challenges
       of fighting this battle is that not enough people are aware of all these CO2 emissions polluting
       the earth. The purpose of this assignment is to compare and analyze the amount of CO2 emissions 
       by country. I chose to include all of the countries inside the dataset to give a widerange of data
      to compare to see side by side. It's really eye opening to be able to be able to see the difference
      between countries nearby each other to see how much more or less the rates of CO2 emissions are released.")),
  
  tabPanel("Country vs CO2 Emissions",
           h3("Countries and their CO2 Emissions"),
           sidebarPanel(selectInput(inputId = "sel_country",
                                    label = "Select Country",
                                    choices = df1$country, multiple = TRUE)),
           mainPanel(plotOutput("plot")),
           
  ))))
