
output$aimplot <- renderPlot({

    source("./codes/aim.R", local = TRUE)
    dataim <- readRDS("./data/bdraim.RDS")
    dataim$Andel <- as.integer(dataim$Andel)

    source("./codes/mutate-when.R")

    dataim <- dataim %>%
        mutate_when(file == "Oslo", list(region = 1),
                    file == "Elverum", list(region = 18),
                    file == "Harstad", list(region = 15),
                    file == "Molde", list(region = 3),
                    file == "NDS", list(region = 4))
    select <- as.integer(input$sykehus)
    dataim <- filter(dataim, region == select)
    dataim <- select(dataim, c(1,2))
    dataim$Variabel <- as.character(dataim$Variabel)
    aim(dataim, size = 10)

})
