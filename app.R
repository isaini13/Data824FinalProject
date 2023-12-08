#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
#

library(shiny)
library(leaflet)
library(ggplot2)
library(DT)
library(readxl)
library(dplyr)
# Load the dataset
data <- read_excel("C:/Users/laksh/Downloads/KansasCounties.xlsx")
datatable(data[1:10, ])

# Define UI for application
ui <- fluidPage(
  titlePanel("Kansas Counties Visualization"),
  
  tabsetPanel(
    tabPanel("Area Chart", plotOutput("areaChart")),
    tabPanel("Timeline", plotOutput("timeline")),
    tabPanel("County Seat Table", DTOutput("table")),
    tabPanel("Kansas Counties Heatmap", plotOutput("heatmap")),
    tabPanel("Comparative Analysis", 
             sidebarLayout(
               sidebarPanel(
                 selectInput("selectedCounties", "Select Counties:",
                             choices = data$County,
                             selected = NULL,
                             multiple = TRUE)
               ),
               mainPanel(
                 plotOutput("comparisonPlot")
                 # You can also add a tableOutput here if you want to show data in a table format
               )
             )
    )
))


# Define server logic required to draw a histogram
server <- function(input, output) {
  # Area Chart
  output$areaChart <- renderPlot({
    ggplot(data, aes(x = reorder(County, Area), y = Area)) +
      geom_bar(stat = "identity") +
      theme_minimal() +
      coord_flip() +
      labs(x = "County", y = "Area (sq miles)", title = "Area by County")
  })
  
  # Timeline
  output$timeline <- renderPlot({
    # Prepare the data for plotting
    timeline_data <- data %>%
      group_by(Established) %>%
      summarise(Count = n()) %>%
      arrange(Established) %>%
      mutate(CumulativeCount = cumsum(Count))
    
    # Plot the timeline using ggplot
    ggplot(timeline_data, aes(x = Established, y = CumulativeCount)) +
      geom_line() +
      theme_minimal() +
      labs(x = "Year Established", y = "Cumulative Number of Counties",
           title = "Timeline of Kansas County Establishment")
  })
  
  # County Seat Table
  output$table <- renderDT({
    datatable(data)
  })
  
  output$heatmap <- renderPlot({
    ggplot(data, aes(x = factor(Established), y = reorder(County, Area), fill = Area)) +
      geom_tile() +
      scale_fill_gradient(low = "blue", high = "red") +
      labs(x = "Year Established", y = "County", fill = "Area (sq miles)") +
      theme_minimal() +
      theme(axis.text.x = element_text(angle = 90, hjust = 1))
  })
  
  # Comparative Analysis
  output$comparisonPlot <- renderPlot({
    # Filter data based on selected counties
    filtered_data <- data[data$County %in% input$selectedCounties, ]
    
    # Create a comparison plot
    ggplot(filtered_data, aes(x = County, y = Area, fill = County)) +
      geom_bar(stat = "identity") +
      theme_minimal() +
      labs(x = "County", y = "Area (sq miles)", title = "Comparative Analysis of County Areas")
  })
  
}


# Run the application 
shinyApp(ui = ui, server = server)

