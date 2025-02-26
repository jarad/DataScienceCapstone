library("ggplot2")

create_graphic <- function(file = "graphic.png", .clarity = NULL) {
  d <- readr::read_csv("combined.csv") 
  
  if (!is.null(.clarity)) {
    d |> dplyr::filter(clarity == .clarity)
  }
  
  g <- ggplot(d, 
         aes(
           x = carat,
           y = price,
           shape = cut,
           color = color, 
         )) +
    geom_point() +
    scale_x_log10() +
    scale_y_log10() 
  
  ggsave(plot = g,
         filename = file)
}

