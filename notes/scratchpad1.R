#install.packages("deldir")

# voronoi-tesselering. Vi har et antal punkter. Og nu deler vi disse punkter op,
# så alle punkter i et bestemt område er tættere på hinanden end andre punkter.

library(ggplot2)
library(deldir)

set.seed(1)
tiler <- 10
x <- rnorm(tiler)
y <- rnorm(tiler)

tesselation <- deldir(x, y)
tiles <- tile.list(tesselation)

s <- seq(0, 2 * pi, length.out = 3000)
circle <- list(x = 0.5 * (1 + cos(s)),
               y = 0.5 * (1 + sin(s)))

points <- data.frame(x=x, y=y)
colors <- hcl.colors(50, "viridis")

g <- ggplot(points, aes(x = x, y = y))
for (i in 1:tiler)
  g <- g + geom_polygon(data = data.frame(x = tiles[[i]]$x,
                                          y = tiles[[i]]$y,
                                          density = 1/tiles[[i]]$area), 
                        aes(fill = tiles[[i]]$ptNum))

g
library(tidyverse)
tiles_df <- lapply(tiles, function(tile){
  data.frame(x=tile$x, y = tile$y)
}) %>% 
  bind_rows(.id = "tile_id")

ggplot(tiles_df, aes(x = x, y = y, group = tile_id)) +
  geom_polygon(fill = "lightblue", color = "black") +
  theme_minimal() +
  ggtitle("Voronoi Diagram") 

ggplot(tiles_df, aes(x = x, y = y, group = tile_id, fill = tile_id)) +
  geom_polygon(color = "black") +
  theme_minimal() +
  ggtitle("Voronoi Diagram") 
