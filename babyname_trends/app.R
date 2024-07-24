library(shiny)
library(babynames)
library(ggplot2)

ui <- fluidPage(
  titlePanel("Baby Names Trends"),
  sidebarLayout(
  sidebarPanel(textInput("name", "Enter Name", "Julie")),
  mainPanel(plotOutput("trend"))
))

server <- function(input, output) {
  output$trend <- renderPlot({
    data_name <- subset(babynames, name == input$name)
    ggplot(data_name, aes(year, prop, color = sex)) + geom_line()
  })
}

shinyApp(ui = ui, server = server)