# 
# This script will provide an example of how to construct a shiny dashboard. 
#
# Author: Jarad Niemi
# Date:   2025-02-19
#
################################################################################

library("tidyverse")
library("shiny")

theme_set(theme_bw()) # I prefer this grid to the default ggplot grid

################################################################################
#
# Provide an example of interactive data analysis that may be better to build
# as a dashboard. Suppose you are interested in understand how diamond price is 
# affected by carat, cut, color, clarity, etc. We will use the 'diamonds' data
# set from the 'ggplot2' package. 
#
################################################################################
ggplot(data = diamonds, 
       mapping = aes(
         y = price
       )) +
  geom_point(
    aes(
      x = carat,
      shape = cut,
      color = color
    )
  )

# This plot is looking pretty crazy. Maybe using a logarithmic x-axis for carat 
# would help

ggplot(data = diamonds, 
       mapping = aes(
         y = price
       )) +
  geom_point(
    aes(
      x = carat,
      shape = cut,
      color = color
    )
  ) +
  scale_x_log10()

# Nope, this is worse. What about logarithmic y-axis

ggplot(data = diamonds, 
       mapping = aes(
         y = price
       )) +
  geom_point(
    aes(
      x = carat,
      shape = cut,
      color = color
    )
  ) +
  scale_y_log10()

# Somewhat better, but maybe we need both?

ggplot(data = diamonds, 
       mapping = aes(
         y = price
       )) +
  geom_point(
    aes(
      x = carat,
      shape = cut,
      color = color
    )
  ) +
  scale_x_log10() +
  scale_y_log10()

# Actualy that is pretty good, but there are still so many points it is hard
# to see what is happening. Perhaps we can filter by clarity

table(diamonds$clarity) # what values for clarity are there?

ggplot(data = diamonds |>
         filter(clarity == "VS1"), 
       mapping = aes(
         y = price
       )) +
  geom_point(
    aes(
      x = carat,
      shape = cut,
      color = color
    )
  ) +
  scale_x_log10() +
  scale_y_log10()

ggplot(data = diamonds |>
         filter(clarity %in% c("VS1", "VVS1")), 
       mapping = aes(
         y = price
       )) +
  geom_point(
    aes(
      x = carat,
      shape = cut,
      color = color
    )
  ) +
  scale_x_log10() +
  scale_y_log10()

ggplot(data = diamonds |>
         filter(grepl("VS", clarity)), 
       mapping = aes(
         y = price
       )) +
  geom_point(
    aes(
      x = carat,
      shape = cut,
      color = color
    )
  ) +
  scale_x_log10() +
  scale_y_log10()

# This is okay but maybe we should filter clarity and depth

summary(diamonds$depth)

ggplot(data = diamonds |>
         filter(grepl("VS", clarity),
                60 < depth & depth < 70) , 
       mapping = aes(
         y = price
       )) +
  geom_point(
    aes(
      x = carat,
      shape = cut,
      color = color
    )
  ) +
  scale_x_log10() +
  scale_y_log10()

# Maybe we should put depth on the x-axis instead of carat and then filter by carat

summary(diamonds$carat)

ggplot(data = diamonds |>
         filter(grepl("VS", clarity),
                1 <= carat & carat <= 3) , 
       mapping = aes(
         y = price
       )) +
  geom_point(
    aes(
      x = depth,
      shape = cut,
      color = color
    )
  ) +
  scale_x_log10() +
  scale_y_log10()

# Oops...maybe not

################################################################################
#
# I am hoping you are beginning to see that our code is getting pretty cumbersome.
# Yes there are ways we could have made it better, e.g. saving the ggplot as an
# object and adding layers and options. But it still might be better to build
# a quick dashboard. 
#
# My main goal with this dashboard is NOT to produce a good way to visualize the
# diamonds data set, but instead try to demonstrate different types of user
# inputs
#
################################################################################

library("shiny") # a reminder that we need the shiny package

ui <- fluidPage( # there are a variety of different styles of pages 
  titlePanel("Diamonds Example Dashboard"),
  
  sidebarLayout(
    sidebarPanel(
      selectInput(inputId = "xvar",
                  label = "X Axis Variable",
                  choices = setdiff(names(diamonds), "price"),
                  selected = "carat"),
      selectInput(inputId = "color",
                  label = "Color Variable",
                  choices = setdiff(names(diamonds), "price"), 
                  selected = "color"),
      selectInput(inputId = "shape",
                  label = "Shape Variable",
                  choices = setdiff(names(diamonds), "price"), 
                  selected = "cut"),
      
      checkboxInput(inputId = "logx",
                    label = "Log X Axis?"),
      checkboxInput(inputId = "logy",
                    label = "Log Y Axis?"),
      
      
      sliderInput(inputId = "depth_range",
                  label = "Depth",
                  min = 0, max = max(diamonds$depth),
                  value = c(0, max(diamonds$depth))),
      # sliderInput(inputId = "carat_lower_limit",
      #             label = "Carat (lower limit)",
      #             min = 0, max = max(diamonds$carat),
      #             value = 0),
      selectInput(inputId = "clarity_values",
                  label = "Clarity",
                  choices = levels(diamonds$clarity),
                  selected = levels(diamonds$clarity),
                  multiple = TRUE)
      
    ),
    mainPanel(
      # diamonds_plot is defined in the server function
      plotOutput(outputId = "diamonds_plot") 
    )
  )
)


# This is the backend that creates the content for the UI
server <- function(input, output) { # keep input/output
  
  diamonds_data <- reactive({
    diamonds |>
      filter(input$depth_range[1] < depth & depth < input$depth_range[2],
             # input$carat_lower_limit < carat,
             clarity %in% input$clarity_values)
      
  })
  
  # Define a function to create the plot based on user input
  plot_diamonds <- reactive({
    g <- ggplot(diamonds_data(),
                aes(
                  y = price
                )) +
      geom_point(
        aes_string(
          x     = input$xvar,
          shape = input$shape,
          color = input$color
        )
      ) 
    
    if (input$logx) g <- g + scale_x_log10()
    if (input$logy) g <- g + scale_y_log10()
    
    return(g)
  })
  
  output$diamonds_plot <- renderPlot(plot_diamonds()) # Note that plot_diamonds is a function
}

shinyApp(ui, server)
