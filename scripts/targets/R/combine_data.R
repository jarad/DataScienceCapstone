combine_data <- function(fair_csv, 
                         good_csv,
                         ideal_csv,
                         premium_csv,
                         verygood_csv) {
  dplyr::bind_rows(
    read.csv(fair_csv),
    read.csv(good_csv),
    read.csv(ideal_csv),
    read.csv(premium_csv),
    read.csv(verygood_csv),
  ) 
}
