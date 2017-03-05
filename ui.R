df.countries <- read.csv("WorldIncarcerationRates.csv", header = TRUE, stringsAsFactors = FALSE)

shinyUI(pageWithSidebar(
    headerPanel("\"Degrees of Freedom\""),
    sidebarPanel(
        helpText("Select a country from each dropdown list and click the Compare! button to compare the incarceration rates of two different countries."),
        selectInput("country1", "Country 1:",
                    df.countries$Country, selected = "United States"),
        selectInput("country2", "Country 2:",
                    df.countries$Country),
        actionButton("goButton", "Compare!")
    ),
    mainPanel(
        h3("Rates of Incarceration (per 100,000 people in population)*"),
        br(),
        htmlOutput('country1'),
        htmlOutput('country2'),
        br(),
        htmlOutput('statement'),
        br(),
        htmlOutput('footer')
    )
))
