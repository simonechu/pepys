#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinythemes)
library(ggplot2)
library(gt)
library(tidyverse)

# Importing plots

jan1665_topten <- read_rds("./jan1665_topten.rds")
jan1665_ot <- read_rds("./jan1665_ot.rds")
feb1665_topten <- read_rds("./feb1665_topten.rds")
feb1665_ot <- read_rds("./feb1665_ot.rds")
mar1665_topten <- read_rds("./mar1665_topten.rds")
mar1665_ot <- read_rds("./mar1665_ot.rds")
apr1665_topten <- read_rds("./apr1665_topten.rds")
apr1665_ot <- read_rds("./apr1665_ot.rds")
may1665_topten <- read_rds("./may1665_topten.rds")
may1665_ot <- read_rds("./may1665_ot.rds")
jun1665_topten <- read_rds("./jun1665_topten.rds")
jun1665_ot <- read_rds("./jun1665_ot.rds")
jul1665_topten <- read_rds("./jul1665_topten.rds")
jul1665_ot <- read_rds("./jul1665_ot.rds")
aug1665_topten <- read_rds("./aug1665_topten.rds")
aug1665_ot <- read_rds("./aug1665_ot.rds")
sep1665_topten <- read_rds("./sep1665_topten.rds")
sep1665_ot <- read_rds("./sep1665_ot.rds")
oct1665_topten <- read_rds("./oct1665_topten.rds")
oct1665_ot <- read_rds("./oct1665_ot.rds")
nov1665_topten <- read_rds("./nov1665_topten.rds")
nov1665_ot <- read_rds("./nov1665_ot.rds")
dec1665_topten <- read_rds("./dec1665_topten.rds")
dec1665_ot <- read_rds("./dec1665_ot.rds")
jan1666_topten <- read_rds("./jan1666_topten.rds")
jan1666_ot <- read_rds("./jan1666_ot.rds")
feb1666_topten <- read_rds("./feb1666_topten.rds")
feb1666_ot <- read_rds("./feb1666_ot.rds")
mar1666_topten <- read_rds("./mar1666_topten.rds")
mar1666_ot <- read_rds("./mar1666_ot.rds")
apr1666_topten <- read_rds("./apr1666_topten.rds")
apr1666_ot <- read_rds("./apr1666_ot.rds")
may1666_topten <- read_rds("./may1666_topten.rds")
may1666_ot <- read_rds("./may1666_ot.rds")
jun1666_topten <- read_rds("./jun1666_topten.rds")
jun1666_ot <- read_rds("./jun1666_ot.rds")
jul1666_topten <- read_rds("./jul1666_topten.rds")
jul1666_ot <- read_rds("./jul1666_ot.rds")
aug1666_topten <- read_rds("./aug1666_topten.rds")
aug1666_ot <- read_rds("./aug1666_ot.rds")
sep1666_topten <- read_rds("./sep1666_topten.rds")
sep1666_ot <- read_rds("./sep1666_ot.rds")
oct1666_topten <- read_rds("./oct1666_topten.rds")
oct1666_ot <- read_rds("./oct1666_ot.rds")
nov1666_topten <- read_rds("./nov1666_topten.rds")
nov1666_ot <- read_rds("./nov1666_ot.rds")
dec1666_topten <- read_rds("./dec1666_topten.rds")
dec1666_ot <- read_rds("./dec1666_ot.rds")
plaguecount <- read_rds("./plague_count_by_month.rds")
deathcount <- read_rds("./death_count_by_month.rds")
fiftytop <- read_rds("./all_entries_top.rds")
allentriesposneg <- read_rds("./all_entries_posneg.rds")
allentriesnet <- read_rds("./net_sent.rds")
net1667 <- read_rds("./net_sent_67.rds")
net1664 <- read_rds("./net_sent_64.rds")
posneg1664 <- read_rds("./all_entries_posneg_64.rds")
posneg1667 <- read_rds("./all_entries_posneg_67.rds")
top1664 <- read_rds("./all_entries_top_64.rds")
top1667 <- read_rds("./all_entries_top_67.rds")

# Define UI for application
ui <- fluidPage(theme = shinytheme("sandstone"),

   # Application title
   tabsetPanel(
     
     tabPanel("Pepys's Diary by Month During the Great Plague",
              
              h1("The Emotional World of Samuel Pepys, 1665-66"),
              sidebarLayout(
                sidebarPanel(selectInput(inputId = "diary_month",
                                         label = "Select a Month",
                                         choices = c("January 1665", "February 1665", "March 1665", 
                                                     "April 1665", "May 1665", "June 1665",
                                                     "July 1665", "August 1665", "September 1665",
                                                     "October 1665", "November 1665", "December 1665",
                                                     "January 1666", "February 1666", "March 1666",
                                                     "April 1666", "May 1666", "June 1666", 
                                                     "July 1666", "August 1666", "September 1666",
                                                     "October 1666", "November 1666", "December 1666"),
                                         multiple = FALSE, 
                                         selected = "January 1665"),
                             h4("Notes")),
                
                # I had the selector appear in the sidebar, because that made the most sense. 
                # I also thought it would be cool to include a note or two in the sidebar with
                # each plot, just to add a bit of context. 
                
                mainPanel(plotOutput("topten"), 
                          br(),
                          plotOutput("ot")))),
     
                # These are the graphs I wanted to include. 
     
     tabPanel("All Entries (1665-66)",
              
              h1("Analysis of Pepys's Entries, 1665-66"),
              plotOutput("plg_cnt"), 
              br(),
              h5("Note: months that are not included on the plot had zero instances of the word 'plague'."),
              br(),
              plotOutput("dth_cnt"),
              br(),
              h5("While there were fewer mentions of the word 'death' than 'plague' overall, it's interesting to note"),
              h5("that Pepys mentioned 'death' at least once every month, even before the plague grabbed his attention."),
              br(),
              br(),
              plotOutput("allentries_pn"),
              br(),
              br(),
              plotOutput("net"),
              br(),
              br(),
              tableOutput("topfifty")),
     
     tabPanel("Before and After the Height of the Plague",
              
              h1("How do Pepys's Entries 1665-66 Compare to Entries Before and After?"),
              sidebarLayout(
                sidebarPanel(selectInput(inputId = "ba",
                                         label = "Select a Year",
                                         choices = c("1664", "1667"),
                                         multiple = FALSE, 
                                         selected = "1664")),
                
                # I had the selector appear in the sidebar, because that made the most sense. 
                # I also thought it would be cool to include a note or two in the sidebar with
                # each plot, just to add a bit of context. 
                
                mainPanel(plotOutput("ba_all"), 
                          br(),
                          plotOutput("ba_net"),
                          br(),
                          tableOutput("ba_top")))),
     
     tabPanel("About",
              h1("About"), tags$p("This app, which presents a sentiment analysis of Samuel Pepys's diary, was made for ANTHRO 1270 at Harvard. The text for the diary entries were taken from the", tags$a("Diary of Samuel Pepys.", href = "https://www.pepysdiary.com/"), "Thanks for reading! - Simone Chu"))
   )
   # I used the tags$p to include text instead of assigning it an output because this was
   # the best way I could find to include hyperlinks in text. 
)


# Define server logic 
server <- function(input, output) {
  
  output$net <- renderPlot({ allentriesnet 
    })
  
  output$plg_cnt <- renderPlot({ plaguecount
    })
  
  output$dth_cnt <- renderPlot({ deathcount
  })
  
  output$topfifty <- render_gt({ fiftytop
  })
  
  output$allentries_pn <- renderPlot({ allentriesposneg
  })
  
  output$topten <- renderPlot({
    if (input$diary_month == "January 1665") {
      jan1665_topten
    }
    
    else if (input$diary_month == "February 1665") {
      feb1665_topten
    }
    
    else if (input$diary_month == "March 1665") {
      mar1665_topten
    }
    
    else if (input$diary_month == "April 1665") {
      apr1665_topten
    }
    
    else if (input$diary_month == "May 1665") {
      may1665_topten
    }
    
    else if (input$diary_month == "June 1665") {
      jun1665_topten
    }
    
    else if (input$diary_month == "July 1665") {
      jul1665_topten
    }
    
    else if (input$diary_month == "August 1665") {
      aug1665_topten
    }
    
    else if (input$diary_month == "September 1665") {
      sep1665_topten
    }
    
    else if (input$diary_month == "October 1665") {
      oct1665_topten
    }
    
    else if (input$diary_month == "November 1665") {
      nov1665_topten
    }
    
    else if (input$diary_month == "December 1665") {
      dec1665_topten
    }
    
    else if (input$diary_month == "January 1666") {
      jan1666_topten
    }
    
    else if (input$diary_month == "February 1666") {
      feb1666_topten
    }
    
    else if (input$diary_month == "March 1666") {
      mar1666_topten
    }
    
    else if (input$diary_month == "April 1666") {
      apr1666_topten
    }
    
    else if (input$diary_month == "May 1666") {
      may1666_topten
    }
    
    else if (input$diary_month == "June 1666") {
      jun1666_topten
    }
    
    else if (input$diary_month == "July 1666") {
      jul1666_topten
    }
    
    else if (input$diary_month == "August 1666") {
      aug1666_topten
    }
    
    else if (input$diary_month == "September 1666") {
      sep1666_topten
    }
    
    else if (input$diary_month == "October 1666") {
      oct1666_topten
    }
    
    else if (input$diary_month == "November 1666") {
      nov1666_topten
    }
    
    else if (input$diary_month == "December 1666") {
      dec1666_topten
    }
  }) 
  
  output$ba_all <- renderPlot({
    if (input$ba == "1664") {
      posneg1664
    }
    
    else if (input$ba == "1667") {
      posneg1667
    }
  }) 
  
  output$ba_net <- renderPlot({
    if (input$ba == "1664") {
      net1664
    }
    
    else if (input$ba == "1667") {
      net1667
    }
  }) 
  
  output$ba_top <- render_gt({
    if (input$ba == "1664") {
      top1664
    }
    
    else if (input$ba == "1667") {
      top1667
    }
  }) 
  
  output$ot <- renderPlot({
    if (input$diary_month == "January 1665") {
      jan1665_ot
    }
    
    else if (input$diary_month == "February 1665") {
      feb1665_ot
    }
    
    else if (input$diary_month == "March 1665") {
      mar1665_ot
    }
    
    else if (input$diary_month == "April 1665") {
      apr1665_ot
    }
    
    else if (input$diary_month == "May 1665") {
      may1665_ot
    }
    
    else if (input$diary_month == "June 1665") {
      jun1665_ot
    }
    
    else if (input$diary_month == "July 1665") {
      jul1665_ot
    }
    
    else if (input$diary_month == "August 1665") {
      aug1665_ot
    }
    
    else if (input$diary_month == "September 1665") {
      sep1665_ot
    }
    
    else if (input$diary_month == "October 1665") {
      oct1665_ot
    }
    
    else if (input$diary_month == "November 1665") {
      nov1665_ot
    }
    
    else if (input$diary_month == "December 1665") {
      dec1665_ot
    }
    
    else if (input$diary_month == "January 1666") {
      jan1666_ot
    }
    
    else if (input$diary_month == "February 1666") {
      feb1666_ot
    }
    
    else if (input$diary_month == "March 1666") {
      mar1666_ot
    }
    
    else if (input$diary_month == "April 1666") {
      apr1666_ot
    }
    
    else if (input$diary_month == "May 1666") {
      may1666_ot
    }
    
    else if (input$diary_month == "June 1666") {
      jun1666_ot
    }
    
    else if (input$diary_month == "July 1666") {
      jul1666_ot
    }
    
    else if (input$diary_month == "August 1666") {
      aug1666_ot
    }
    
    else if (input$diary_month == "September 1666") {
      sep1666_ot
    }
    
    else if (input$diary_month == "October 1666") {
      oct1666_ot
    }
    
    else if (input$diary_month == "November 1666") {
      nov1666_ot
    }
    
    else if (input$diary_month == "December 1666") {
      dec1666_ot
    }
  })
}

# Run the application 
shinyApp(ui = ui, server = server)

