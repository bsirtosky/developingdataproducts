df.countries <- read.csv("WorldIncarcerationRates.csv", header = TRUE, stringsAsFactors = FALSE)

shinyServer(
    function(input, output) {
        output$country1 <- eventReactive(input$goButton,{
            rate1 <- df.countries[df.countries$Country==input$country1,]$IncarcerationRate
            HTML(paste("<ul><li><b>", input$country1, 
                       "</b> has an incarceration rate of <b>", 
                       rate1, "</b></li></ul>"))
            }
        )
        output$country2 <- eventReactive(input$goButton,{
            rate2 <- df.countries[df.countries$Country==input$country2,]$IncarcerationRate
            HTML(paste("<ul><li><b>", input$country2, 
                       "</b> has an incarceration rate of <b>", 
                       rate2, "</b></li></ul>"))
            }
        )
        output$statement <- eventReactive(input$goButton, {
            rate1 <- df.countries[df.countries$Country==input$country1,]$IncarcerationRate
            rate2 <- df.countries[df.countries$Country==input$country2,]$IncarcerationRate
            if (rate1 == rate2) {
                HTML(paste("<div style=\"border: 1px solid black;padding: 20px;\"><span style=\"font-size: 1.3em; font-weight:bold;\">", input$country1, 
                           "</span> incarcerates people at the same rate as <span style=\"font-size: 1.3em; font-weight:bold;\">",
                           input$country2, "</span></div>"))
            }
            else {
                if (as.numeric(rate1) > as.numeric(rate2)) {
                    HTML(paste("<div style=\"border: 1px solid black;padding: 20px;\"><span style=\"font-size: 1.3em; font-weight:bold;\">", input$country1, 
                               "</span> incarcerates people at a rate <span style=\"font-size: 1.3em; font-weight:bold; color:red;\">",
                               round(rate1/rate2, digits=1), "times</span> that of <span style=\"font-size: 1.3em; font-weight:bold;\">", 
                               input$country2, "</span></div>"))
                }
                else {
                    HTML(paste("<div style=\"border: 1px solid black;padding: 20px;\"><span style=\"font-size: 1.3em; font-weight:bold;\">", input$country2, 
                               "</span> incarcerates people at a rate <span style=\"font-size: 1.3em; font-weight:bold; color:red;\">",
                               round(rate2/rate1, digits=1), "times</span> that of <span style=\"font-size: 1.3em; font-weight:bold;\">", 
                               input$country1, "</span></div>"))
                }
            }
        }
        )
        output$footer <- eventReactive(input$goButton,{
            HTML("<hr/>* Data on International Incarceration Rates provided by <a href=\"http://www.prisonstudies.org/highest-to-lowest/prison_population_rate?field_region_taxonomy_tid=All\">World Prison Brief</a>.")
        }
        )
    }
)



