
library(shiny)
library(shinydashboard)

ui <- dashboardPage(
    dashboardHeader(title = "Split app files"),
    dashboardSidebar(
        sidebarMenu(
            menuItem("indikator", tabName = "indikator", icon = icon("hotel")),
            menuItem("Tab 3", tabName = "tab3", icon = icon("user")))),
    ## include the UI for each tab
    dashboardBody( tabItems(
        tabItem(
            tabName = "indikator",
            fluidRow(
                box(width = 12, source(file.path("ui", "aim.R"),  local = TRUE)$value))),
        tabItem(
            tabName = "tab3",
            fluidRow(
                box(width = 8, source(file.path("ui", "tab2.R"),  local = TRUE)$value)))))
)

server <- function(input, output, session) {
    ## Include the logic (server) for each tab
    source(file.path("server", "aim.R"),  local = TRUE)$value
    source(file.path("server", "tab2.R"),  local = TRUE)$value
}

shinyApp(ui = ui, server = server)
