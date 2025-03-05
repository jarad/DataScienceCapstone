create_graphic <- function(combined, .clarity = NULL) {
  if (!is.null(.clarity)) {
    combined <- combined |> dplyr::filter(clarity == .clarity)
  }
  
  ggplot(combined, 
         aes(
           x     = carat,
           y     = price,
           shape = cut,
           color = color, 
         )) +
    geom_point() +
    scale_x_log10() +
    scale_y_log10() 
}
