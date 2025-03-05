library("targets")
library("tarchetypes") # for tar_file

# Read in functions
tar_source() # defaults to reading R/ folder

tar_option_set(
  packages = c("dplyr",
               "ggplot2"),
  error = "null"
)


# Targets pipeline
list(
  tar_file(fair_csv,     "data/Fair.csv"),
  tar_file(good_csv,     "data/Good.csv"),
  tar_file(ideal_csv,    "data/Ideal.csv"),
  tar_file(premium_csv,  "data/Premium.csv"),
  tar_file(verygood_csv, "data/VeryGood.csv"),
  
  tar_target(combined, 
             combine_data(
               fair_csv,
               good_csv,
               ideal_csv,
               premium_csv,
               verygood_csv
             )),
  
  tar_target(all_graphic, create_graphic(combined)),
  tar_target(I1_graphic,  create_graphic(combined, "I1")),
  
  tar_file(all_graphic_png, write_graphic(all_graphic, "all.png")),
  tar_file(I1_graphic_png,  write_graphic(I1_graphic,  "I1.png"))
)
