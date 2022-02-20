library(shiny)

themes <- c("blue", "yellow", "green", "red", "black")

ui <- fluidPage(style = "padding-left: 40px;",
  fluidRow(h3("CHOOSE YOUR PREFERRED THEME"),
    radioButtons("theme", "What colour scheme do you like?", themes),
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
  ),
  
  hr(),
  
  fluidRow(h3("ENTER A SHORT DESCRIPTION OF YOU"),
           textAreaInput("summary", "Summary", rows = 6, width = "700px"),
           ),
  
  hr(),
  
  fluidRow(h3("ENTER YOUR INDUSTRY EXPERIENCE"),
           textInput("title", "Job title"),
           textAreaInput("desc", "Job description", rows = 4, width = "400px")
           ),
  fluidRow(
    column(2,
           actionButton("add_new", "Add New", width = "140px")
           ),
    column(5,
           p('Click "Add New" to add new experience (Re-enter after the text box refrehes)',
             style = "color: red")
           )
  ),
  br(),
  fluidRow(
    column(2,
           actionButton("finish_submit", "Finish and Submit", width = "140px")
           ),
    column(5,
           p('Click "Finish and Submit" to submit all experiences and proceed',
             style = "color: red")
           )
  ),
  
  hr()
)

server <- function(input, output, session) {
  
}

shinyApp(ui, server)
