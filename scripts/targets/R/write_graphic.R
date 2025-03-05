write_graphic <- function(graphic, filename) {
  ggsave(graphic, file = filename)
  
  return(filename) # must return the filename for targets pipeline
}
