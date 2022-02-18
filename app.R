library(shiny)

themes <- c("blue", "yellow", "green", "red", "black")

ui <- fluidPage(
  fluidRow(h3("CHOOSE YOUR PREFERRED THEME"),
    radioButtons("theme", "What colour scheme do you like?", themes),
    style = "padding-left: 15px;"
  ),
  
  hr(),
  
  fluidRow(h3("INPUT YOUR NAMES"),
    column(4,
           textInput("f_n", "First name")
           ),
    column(4,
           textInput("m_n", "Middle name")
          ),
    column(4,
           textInput("l_n", "Last name")
          ),
    style = "padding-left: 15px;"
    ),
  
  hr(),
  
  fluidRow(h3("INPUT YOUR CONTACT DETAILS"),
    column(4,
           textInput("phone", "Phone number"),
           textInput("github", "Github profile link")
           ),
    column(4,
           textInput("email", "Email"),
           textInput("LinkedIn", "LinkedIn profile link")
           ),
    column(4,
           textInput("location", "Location"),
           textInput("other_profile", "Other profile")
           ),
    style = "padding-left: 15px;"
  ),
  
  hr(),
  
  fluidRow(h3("ENTER A SHORT DECRIPTION OF YOU"),
           textAreaInput("summary", "Summary", rows = 6, width = "700px"),
           style = "padding-left: 15px;"
           ),
  
  hr()
)

server <- function(input, output, session) {
  
}

shinyApp(ui, server)
