server <- function(input,output){
  
  output$boxplot <- renderPlotly({
    plot1 <- score %>% 
      ggplot(aes(x = variable,y = value)) +
      geom_boxplot(aes(fill = variable)) +
      labs(title = "Distribution of Score in General",
           x = "") +
      theme_minimal() +
      theme(axis.text.x = element_text(angle = 90),
            legend.position='none')
    
    ggplotly(plot1)
  })
  
  #plot for the 1st tab in 2nd page
  output$plot_2 <- renderPlotly({
    plot2 <- studpf %>%
      melt(id.vars = "gender", measure.vars = c("math score","reading score","writing score")) %>% 
      filter(gender == input$gender) %>% 
      ggplot(aes(x = value)) +
      geom_histogram(bins = input$bins_1, aes(fill = variable)) +
      facet_grid(. ~ variable) +
      labs(title = "Distribution of Score by Gender") +
      theme_minimal() +
      theme(legend.position='none') +
      scale_fill_brewer(palette = "Set2")
    
    ggplotly(plot2)
  })
  
  #plot for the 2nd tab in 2nd page
  output$plot_3 <- renderPlotly({
    plot3 <- studpf %>%
      melt(id.vars = "lunch", measure.vars = c("math score","reading score","writing score")) %>% 
      filter(lunch == input$lunch) %>% 
      ggplot(aes(x = value)) +
      geom_histogram(bins = input$bins_2, aes(fill = variable)) +
      facet_grid(. ~ variable) +
      labs(title = "Distribution of Score by Type of Lunch") +
      theme_minimal() +
      theme(legend.position='none') +
      scale_fill_brewer(palette = "Set2")
    
    ggplotly(plot3)
  })
  
  #plot for the 3rd tab in 2nd page
  output$plot_4 <- renderPlotly({
    plot4 <- studpf %>%
      melt(id.vars = "test preparation course", measure.vars = c("math score","reading score","writing score")) %>% 
      filter(`test preparation course` == input$test_preparation_course) %>% 
      ggplot(aes(x = value)) +
      geom_histogram(bins = input$bins_3, aes(fill = variable)) +
      facet_grid(. ~ variable) +
      labs(title = "Distribution of Score by Test Preparation") +
      theme_minimal() +
      theme(legend.position='none') +
      scale_fill_brewer(palette = "Set2")
    
    ggplotly(plot4)
  })
  
  #plot for the 4th tab in 2nd page
  output$plot_5 <- renderPlotly({
    plot5 <- studpf %>%
      melt(id.vars = "race/ethnicity", measure.vars = c("math score","reading score","writing score")) %>% 
      filter(`race/ethnicity` == input$`race/ethnicity`) %>% 
      ggplot(aes(x = value)) +
      geom_histogram(bins = input$bins_4, aes(fill = variable)) +
      facet_grid(. ~ variable) +
      labs(title = "Distribution of Score by Race/Ethnicity") +
      theme_minimal() +
      theme(legend.position='none') +
      scale_fill_brewer(palette = "Set2")
    
    ggplotly(plot5)
  })
  
  #plot for the 5th tab in 2nd page
  output$plot_6 <- renderPlotly({
    plot6 <- studpf %>%
      melt(id.vars = "parental level of education", measure.vars = c("math score","reading score","writing score")) %>% 
      filter(`parental level of education` == input$parental_level_of_education) %>% 
      ggplot(aes(x = value)) +
      geom_histogram(bins = input$bins_5, aes(fill = variable)) +
      facet_grid(. ~ variable) +
      labs(title = "Distribution of Score by Parental Level of Education") +
      theme_minimal() +
      theme(legend.position='none') +
      scale_fill_brewer(palette = "Set2")
    
    ggplotly(plot6)
  })
  
  output$image_1 <- renderImage({
    filename <- normalizePath(file.path("OIP-removebg-preview.png"))
    list(src = filename)   
  }, deleteFile = FALSE)
  
}