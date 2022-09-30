ui <- dashboardPage(
  dashboardHeader(disable = T),
  dashboardSidebar(
    sidebarMenu(
      menuItem(text = "Data Overview",tabName = "pertama",icon = icon("search")),
      menuItem(text = "Distribution of Score",tabName = "kedua", icon = icon("chart-bar")),
      menuItem(text = "About the Author",tabName = "ketiga",icon = icon("user"))
    )
  ),
  dashboardBody(
    tabItems(
      tabItem(tabName = "pertama",
              fluidPage(
                fluidRow(
                  box(width = 12,title = "Student Performance Analysis",solidHeader = T,status = "primary",
                      tags$p("The data we use in this analysis comes from",
                             tags$a(href = "https://www.kaggle.com/spscientist/students-performance-in-exams","Kaggle"),
                             ". This data set consists of the Marks secured by the high school students from the United States in various subjects.
                             The purpose of this analysis is to understand the influence of the parents background, test preparation, and several other factors on
                             students performance in exam."),
                      tags$br(),
                      tags$h4(tags$u("Details of The Categorical Data Fields")),
                      tags$br(),
                      column(width = 6,
                             infoBox(width = 12,title = "race/ethnicity ",
                                     tags$ul(
                                       tags$li("group A"),
                                       tags$li("group B"),
                                       tags$li("group C"),
                                       tags$li("group D"),
                                       tags$li("group E")),
                                     icon = icon("smile-beam"),color = "olive"),
                             infoBox(width = 12,
                                     title = "parental level of education",
                                     tags$ul(
                                       tags$li("associate's degree"),
                                       tags$li("bachelor's degree"),
                                       tags$li("high school"),
                                       tags$li("master's degree"),
                                       tags$li("some college"),
                                       tags$li("some high school")),
                                     icon = icon("graduation-cap"),color = "navy")
                      ),
                      column(width = 6,
                             infoBox(width = 12, "gender",
                                     tags$ul(
                                       tags$li("female"),
                                       tags$li("male")
                                     ),
                                     icon = icon("venus-mars")),
                             infoBox(width = 12,"lunch",
                                     tags$ul(
                                       tags$li("free/reduced"),
                                       tags$li("standard")
                                     ),
                                     icon = icon("utensils"),color = "red"),
                             infoBox(width = 12,"test preparation course",
                                     tags$ul(
                                       tags$li("completed"),
                                       tags$li("none")
                                     ),
                                     icon = icon("file-alt"),color = "yellow"))
                  )
                )
              )),
      tabItem(tabName = "kedua",
              fluidPage(
                fluidRow(
                  plotlyOutput(outputId = "boxplot")
                ),
                tags$br(),
                fluidRow(
                  box(width = 12, height = 600,
                      tabBox(width = 12,
                             id = "tabset1", height = "500px",
                             tabPanel("gender",
                                      fluidRow(
                                        column(width = 3,
                                               selectInput(inputId = "gender",label = "Select gender:",choices = levels(studpf$gender),selected = "female",width = 130)),
                                        column(width = 9,
                                               sliderInput(inputId = "bins_1",label = "Choose an interval:",min = 0,max = 100,value = 30,width = 350)),
                                      ),
                                      tags$br(),
                                      fluidRow(
                                        plotlyOutput(outputId = "plot_2")
                                      )),
                             tabPanel("lunch",
                                      fluidRow(
                                        column(width = 3,
                                               selectInput(inputId = "lunch",label = "Type of lunch:",choices = levels(studpf$lunch),selected = "free/reduced",width = 130)),
                                        column(width = 9,
                                               sliderInput(inputId = "bins_2",label = "Choose an interval:",min = 0,max = 100,value = 30,width = 350))
                                      ),
                                      tags$br(),
                                      fluidRow(
                                        plotlyOutput(outputId = "plot_3")
                                      )),
                             tabPanel("test preparation course",
                                      fluidRow(
                                        column(width = 3,
                                               selectInput(inputId = "test_preparation_course",label = "Test preparation course:",choices = levels(studpf$`test preparation course`),selected = "completed",width = 150)),
                                        column(width = 9,
                                               sliderInput(inputId = "bins_3",label = "Choose an interval:",min = 0,max = 100,value = 30,width = 350))
                                      ),
                                      tags$br(),
                                      fluidRow(
                                        plotlyOutput(outputId = "plot_4")
                                      )),
                             tabPanel("race/ethnicity",
                                      fluidRow(
                                        column(width = 3,
                                               selectInput(inputId = "race/ethnicity",label = "Select race/ethnicity:",choices = levels(studpf$`race/ethnicity`),selected = "group A",width = 140)),
                                        column(width = 9,
                                               sliderInput(inputId = "bins_4",label = "Choose an interval:",min = 0,max = 100,value = 30,width = 350))
                                      ),
                                      tags$br(),
                                      fluidRow(
                                        plotlyOutput(outputId = "plot_5")
                                      )),
                             tabPanel("parental level of education",
                                      fluidRow(
                                        column(width = 3,
                                               selectInput(inputId = "parental_level_of_education",label = "Parental level of education:",choices = levels(studpf$`parental level of education`),selected = "associate's degree",width = 170)),
                                        column(width = 9,
                                               sliderInput(inputId = "bins_5",label = "Choose an interval:",min = 0,max = 100,value = 30,width = 350))
                                      ),
                                      tags$br(),
                                      fluidRow(
                                        plotlyOutput(outputId = "plot_6")
                                      ))
                      ))
                )
              )),
      tabItem(tabName = "ketiga",
              fluidPage(
                column(width = 6,
                       imageOutput(outputId = "image_1")),
                column(width = 6,
                       box(width = 12,title = "About Me",status = "primary",
                           tags$p("Hello, I'm Nisa! I'am a Computer Science student at IPB University.
                                  This dashboard was created as part of the Capstone Project which is 
                                  the final assessment of the Data Visualization Specialization at Algoritma Academy."),
                           tags$p("I am a data enthusiast and still in the learning process. If you 
                                  want to see the results of my other data analysis, you can see it in my",
                                  tags$a(href = "https://rpubs.com/nisa_basalamah","RPubs"),
                                  "account. If you wish, you can leave comments or suggestions in
                                  the comments section. Thank you")
                       )
                )
              ))
    )
  )
)