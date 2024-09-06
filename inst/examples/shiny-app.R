options(shiny.launch.browser = .rs.invokeShinyWindowExternal)

library(shiny)

ui <- fluidPage(
  titlePanel("Cron Expression Input Widget"),
  sidebarLayout(
    sidebarPanel(
      shinycroneditor::croneditor(inputId = "cron", label = "Kies verversingsinterval", schedule = "0 1 2 3 4", language = "nl-NL")
    ),
    mainPanel(
      verbatimTextOutput("cronExpression")
    )
  )
)

server <- function(input, output, session) {
  output$cronExpression <- renderPrint({
    input$cron
  })
  
  # observe({
  #   invalidateLater(10000, session)
  #   updateCronInputWidget(session, "cronInput", value = "*/5 * * * *")
  # })
}

shinyApp(ui, server)