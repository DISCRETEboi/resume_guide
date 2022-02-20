library(shiny)
library(markdown)

themes <- c("blue", "yellow", "green", "red", "black")
class <- c("Programming", "Tools/Technologies", "Industry Knowledge",
           "Packages/Modules", "Other Skills", "Soft Skills")

ui <- fluidPage(style = "padding-left: 40px;",
  fluidRow(h3("CHOOSE YOUR PREFERRED THEME"),
           radioButtons("theme", "What colour scheme do you like?", themes)
           ),
  
  hr(),
  
  fluidRow(h3("INPUT YOUR NAMES"),
    column(4,
           textInput("f_n", "First name"),
           style = "padding-left:0px"
           ),
    column(4,
           textInput("m_n", "Middle name"),
           style = "padding-left:0px"
          ),
    column(4,
           textInput("l_n", "Last name"),
           style = "padding-left:0px"
          ),
    ),
  
  hr(),
  
  fluidRow(h3("INPUT YOUR CONTACT DETAILS"),
    column(4,
           textInput("phone", "Phone number"),
           textInput("github", "Github profile link"),
           style = "padding-left:0px"
           ),
    column(4,
           textInput("email", "Email"),
           textInput("LinkedIn", "LinkedIn profile link"),
           style = "padding-left:0px"
           ),
    column(4,
           textInput("location", "Location"),
           textInput("other_profile", "Other profile"),
           style = "padding-left:0px"
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
           actionButton("add_new", "Submit & add New", width = "155px",
                        style = "color:white; background-color:blue",
                        icon = icon("plus")
                        ),
           style = "padding-left:0px"
           ),
    column(10,
           p('Click "Submit & add New" to add new experience (Re-enter after the text box refrehes)',
             style = "color: red")
           )
  ),
  
  hr(),
  
  fluidRow(h3("ENTER YOUR SKILLS"),
           selectInput("class", "Class of skill", choices = class),
           selectInput("sub_class", "Sublass of skill", choices = NULL),
           actionButton("add_new", "Submit & add New", width = "155px",
                        style = "color:white; background-color:blue",
                        icon = icon("plus")
                        )
           ),
  
  hr(),
  
  includeMarkdown("Resume_2_2.md"),
  
  hr()
  
)

server <- function(input, output, session) {
  
}

shinyApp(ui, server)
