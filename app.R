library(shiny)
library(markdown)

themes <- c("blue", "yellow", "green", "red", "black")
#themes_icon <- 
class <- c("Programming", "Tools/Technologies", "Industry Knowledge",
           "Packages/Modules", "Other Skills", "Soft Skills")

ui <- fluidPage(style = "padding-left: 40px;",
  fluidRow(h3("CHOOSE YOUR PREFERRED THEME", style = "color: #005090"),
           radioButtons("theme", "What colour scheme do you like?", themes)
           ),
  
  hr(),
  
  fluidRow(h3("INPUT YOUR NAMES", style = "color: #005090"),
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
  
  fluidRow(h3("INPUT YOUR CONTACT DETAILS", style = "color: #005090"),
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
  
  fluidRow(h3("ENTER A SHORT DESCRIPTION OF YOU", style = "color: #005090"),
           textAreaInput("summary", "Summary", rows = 6, width = "700px"),
           ),
  
  hr(),
  
  fluidRow(h3("ENTER YOUR INDUSTRY EXPERIENCE", style = "color: #005090"),
           textInput("title", "Job title"),
           textAreaInput("desc", "Job description", rows = 4, width = "400px"),
           actionButton("add_new_1", "Submit & add New", width = "155px",
                        style = "color:white; background-color:#005090",
                        icon = icon("plus-circle")
                        ),
           br(), br(),
           p('Click "Submit & add New" to add new experience (Re-enter after the text box refrehes)',
             style = "color: red"
             )
           ),
  
  hr(),
  
  fluidRow(h3("ENTER YOUR SKILLS", style = "color: #005090"),
           selectInput("class", "Class of skill", choices = class),
           selectInput("sub_class", "Sublass of skill", choices = NULL),
           actionButton("add_new_2", "Submit & add New", width = "155px",
                        style = "color:white; background-color:#005090",
                        icon = icon("plus-circle")
                        )
           ),
  
  br(), br(), #hr(style = "border-top: 1px solid #005090"),
  
  fluidRow(
    column(4, offset = 4,
      actionButton("generate", "GENERATE RESUME", width = "300px", height = "120px",
                   style = "color:white; background-color:#005090; font-weight:bold",
                   icon = icon("file-text")
      )
    ),
    style = "background-color: #e4e8eb"
  ),
  
  fluidRow(
    column(8, offset = 2,
           includeMarkdown("Resume_2_2.md"),
           #style = "height: 500px"
           style = "border: 3px solid #005090"
           ),
    style = "background-color: #e4e8eb; padding-top: 50px; padding-bottom: 50px"
  ),
  
  hr()
  
)

server <- function(input, output, session) {
  
}

shinyApp(ui, server)
