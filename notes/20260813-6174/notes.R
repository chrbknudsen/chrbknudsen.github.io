rrev_num_large <- function(x){
  result <- strsplit(as.character(x), "")[[1]] |> as.numeric() |> 
  sort( decreasing = FALSE) 
    result |> as.character() |> paste(collapse = "") |>
     str_pad( width = 4, side = "left", pad = "0") |> 
      as.numeric()

}

rev_num_large <- function(x){
  result <- strsplit(as.character(x), "")[[1]] |> as.numeric() |> 
  sort( decreasing = TRUE) 
    result |> as.character() |> paste(collapse = "") |>
     str_pad( width = 4, side = "right", pad = "0") |> 
      as.numeric()

}

converges <- function(x, iter = 10){
  iterations <- 0
  while (x != 6174) {
    x <- rev_num_large(x) - rev_num_small(x)
    iterations <- iterations + 1
  }
  iterations

}

rev_num_large(100)
library(tidyverse)
