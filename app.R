library(shiny)
library(markdown)
library(stringr)

themes <- c("blue", "yellow", "green", "red", "black")
#themes_icon <- 
class <- c("Programming", "Tools/Technologies", "Industry Knowledge",
           "Packages/Modules", "Other Skills", "Soft Skills")

ui <- fluidPage(style = "padding-left: 40px;",
  fluidRow(
    column(6,
           h3("CHOOSE YOUR PREFERRED THEME", style = "color: #005090"),
           radioButtons("theme", "What colour scheme do you like?", themes)
           ),
    column(6,
           img(src = "resumelogo1.png", alt = "Logo", height = 300, width = 400)
           ),
    ),
  
  hr(),
  
  fluidRow(h3("INPUT YOUR NAMES", style = "color: #005090"),
    column(4,
           textInput("f_n", "First name", value = "Abdul-Mateen"),
           style = "padding-left:0px"
           ),
    column(4,
           textInput("m_n", "Middle name", value = ""),
           style = "padding-left:0px"
          ),
    column(4,
           textInput("l_n", "Last name", value = "Qamardeen"),
           style = "padding-left:0px"
          ),
    ),
  
  hr(),
  
  fluidRow(h3("INPUT YOUR CONTACT DETAILS", style = "color: #005090"),
    column(4,
           textInput("phone", "Phone number", value = "+2347049986998"),
           textInput("github", "Github profile link", value = "https://github.com/DISCRETEboi/"),
           style = "padding-left:0px"
           ),
    column(4,
           textInput("email", "Email", value = "abdulmateen.a.q@gmail.com"),
           textInput("linkedin", "LinkedIn profile link", value = "https://www.linkedin.com/in/abdulmateenqamardeen/"),
           style = "padding-left:0px"
           ),
    column(4,
           textInput("location", "Location", value = "Lagos, Nigeria"),
           textInput("other_profile", "Other profile", value = "https://mateen.com/"),
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
           actionButton("add_new_1", "Update & Add New",
                        style = "color:white; background-color:#005090; border: 1px solid #005090;
                        background-image: linear-gradient(#1874CD, #1E90FF);",
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
           actionButton("add_new_2", "Update & Add New",
                        style = "color:white; background-color:#005090; border: 1px solid #005090;
                        background-image: linear-gradient(#1874CD, #1E90FF);",
                        icon = icon("plus-circle")
                        )
           ),
  
  br(), br(), #hr(style = "border-top: 1px solid #005090"),
  
  fluidRow(
    column(4, offset = 4,
      actionButton("generate", "GENERATE RESUME", width = "100%",
                   style = "color:white; font-weight:bold; border: 1px solid #005090;
                   background-image: linear-gradient(#1874CD, #1E90FF);",
                   icon = icon("file-text")
      )
    )
    #style = "background-color: #e4e8eb"
  ), br(),
  
  fluidRow(
    column(10, offset = 1,
           uiOutput("resume"),
           #style = "height: 500px"
           style = "border: 2px solid #005090"
           ),
    style = "background-color: #e4e8eb; padding-top: 50px; padding-bottom: 50px"
  ),

  hr()
  
)

server <- function(input, output, session) {
  markdown_text <- readLines("Resume_2_5.md")
  theme <- reactive({
    input$theme
  })
  output$resume <- renderUI({
    markdown_text <- gsub("color:.*'", paste0("color: ", theme(), "'"), markdown_text) %>%
      gsub("ABDUL-MATEEN QAMARDEEN", toupper(paste(input$f_n, input$m_n, input$l_n)), .) %>%
      gsub("\\+2347049986998", input$phone, .) %>%
      gsub("abdulmateen\\.a\\.q@gmail\\.com", input$email, .) %>%
      gsub("Lagos, Nigeria", input$location, .) %>%
      gsub("https://github.com/DISCRETEboi/", input$github, ., fixed = T) %>%
      gsub("https://www.linkedin.com/in/abdulmateenqamardeen/", input$linkedin, ., fixed = T) %>%
      gsub("https://mateen.com/", input$other_profile, ., fixed = T)
    writeLines(markdown_text, "custom.md")
    includeMarkdown("custom.md")
  })
}

shinyApp(ui, server)



















