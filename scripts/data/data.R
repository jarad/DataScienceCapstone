# Purpose: Compare different data file storage options
# Author:  Jarad Niemi
# Date:    2025-04-11
################################################################################

library("ggplot2")    # for diamonds data
library("arrow")      # parquet/feather files
library("readr")      # read_csv

library("rbenchmark") # for read-time comparisons


# Plain text files
write.csv(  diamonds, file = "diamonds.csv")
write.table(diamonds, file = "diamonds.txt", )

# Binary files (R specific)
saveRDS(diamonds, file = "diamonds.rds")   # or use readr::read_rds
save(   diamonds, file = "diamonds.rdata") # can save any type of object

# Binary files 
write_parquet(diamonds, sink = "diamonds.parquet")
write_feather(diamonds, sink = "diamonds.feather")


################################################################################
# File size

d <- data.frame(
  type = c("csv","txt","rds","rdata","parquet","feather"),
  size = c(
    file.info("diamonds.csv"    )$size,
    file.info("diamonds.txt"    )$size,
    file.info("diamonds.rds"    )$size,
    file.info("diamonds.rdata"  )$size,
    file.info("diamonds.parquet")$size,
    file.info("diamonds.feather")$size
  )
)

################################################################################
# Read time

time <- benchmark(
  ".csv"    = read.csv(    "diamonds.csv"),
  "_csv"    = read_csv(    "diamonds.csv"), 
  "txt"     = read_table(  "diamonds.txt"),
  "rds"     = readRDS(     "diamonds.rds"),
  "rdata"   = load(        "diamonds.rdata"),
  "parquet" = read_parquet("diamonds.parquet"),
  "feather" = read_feather("diamonds.feather"),
  
  replications = 1000,
  columns = c("test", "replications", "elapsed",
              "relative", "user.self", "sys.self")
)

################################################################################
# Storing other objects

m <- lm(price ~ ., data = diamonds)

# rds can store any type of object (but only 1)
saveRDS(m, file = "diamonds_model.rds")
diamonds_model <- readRDS("diamonds_model.rds") # send to object

saveRDS(list(diamonds_model = m, diamonds = diamonds), file = "diamonds_and_model.rds")
diamonds_list  <- readRDS("diamonds_and_model.rds")
names(diamonds_list)

# rdata can store multiple objects
save(diamonds_model, diamonds, file = "diamonds_and_model.rdata")
rm(diamonds_model, diamonds)
ls() 
load("diamonds_and_model.rdata")
ls()
