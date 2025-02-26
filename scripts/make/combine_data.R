# Combine all data sets into 1
combine_data <- function() {
  dplyr::bind_rows(
    readr::read_csv("Fair.csv"),
    readr::read_csv("Good.csv"),
    readr::read_csv("Ideal.csv"),
    readr::read_csv("Premium.csv"),
    readr::read_csv("VeryGood.csv"),
  ) |>
    readr::write_csv(file = "combined.csv")
}

combine_data()
