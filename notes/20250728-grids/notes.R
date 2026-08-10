
library(ggplot2)
library(ggsketch)

line <- data.frame(
  x = 1,
  xend = 9,
  y = 1,
  yend = 1
)

ggplot(line) +
  geom_sketch_segment(
    aes(
      x = x,
      y = y,
      xend = xend,
      yend = yend
    ),
    linewidth = 12,
    colour = "black",
    medium = "brush",
    roughness = 2,
    bowing = 0.3,
    n_passes = 3,
    seed = 42
  ) +
  coord_cartesian(
    xlim = c(0, 10),
    ylim = c(0, 2)
  ) +
  theme_void()
