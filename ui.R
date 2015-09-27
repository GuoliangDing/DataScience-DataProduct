library(shiny)
shinyUI (
    pageWithSidebar (
        # Application title
        headerPanel ("Central Limit Theorem"),
        
        sidebarPanel (
            numericInput('n', 'Sample Size', 40, min = 10, max= 100, step = 10),
            numericInput('lambda', 'lambda', 0.2, min = 0.1, max= 0.5, step = 0.1),
            numericInput('sim_num', 'Number of Simulation', 500, min = 100, max= 1000, step = 100),
            submitButton('Submit')
        ),
        mainPanel (
            plotOutput("phonePlot") 
        )
    )
    
)