library(ggplot2)
library(dplyr)
library(ambient)

# Data
set.seed(42)
n <- 1000
x <- seq(0, 10, length.out = n)

# Funktion til et strøg
make_stroke <- function(offset = 0, alpha = 0.1, freq = 0.5, amp = 0.2) {
  noise <- gen_perlin(x = x, y = offset, frequency = freq)
  tibble(
    x = x,
    ymin = -0.3 + noise * amp,
    ymax =  0.3 + noise * amp,
    alpha = alpha
  )
}

# Liste af strøg
stroke_list <- list(
  make_stroke(0.0, alpha = 0.2),
  make_stroke(0.5, alpha = 0.1),
  make_stroke(1.0, alpha = 0.1),
  make_stroke(1.5, alpha = 0.05),
  make_stroke(2.0, alpha = 0.05)
)

# Start ggplot-objekt
p <- ggplot()

# Tilføj hvert lag med geom_ribbon separat
for (stroke in stroke_list) {
  p <- p + geom_ribbon(
    data = stroke,
    aes(x = x, ymin = ymin, ymax = ymax),
    fill = "red",
    alpha = unique(stroke$alpha)  # alpha må ikke være i aes()
  )
}

# Tema og visning
p +
  coord_fixed(ratio = 0.2) +
  theme_void()
