library(shiny)
library(ggplot2)
set.seed(3)

# Define a server for the Shiny app
shinyServer(function(input, output) {
    
    # Fill in the spot we created for a plot
    output$phonePlot <- renderPlot({
        
        # Render a barplot
        lambda <- input$lambda
        n <- input$n
        sim_num <- input$sim_num
        means <- colMeans(replicate(sim_num, rexp(n, lambda)))
        data_means <- data.frame(mean_value = means)
        range <- max(data_means$mean_value) - min(data_means$mean_value)
        theo_var <- 1 / lambda / sqrt(n)
        ggplot(data_means, aes(x = mean_value)) +
            geom_histogram(aes(y=..density..), binwidth = range/30) +
            geom_density(colour="red") +
            stat_function(fun = dnorm, colour = "blue", arg = list(mean = 1 / lambda, sd = theo_var))
    })
})