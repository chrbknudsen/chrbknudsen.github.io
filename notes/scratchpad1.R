#install.packages("deldir")
library(ggplot2)
library(deldir)

set.seed(1)
x <- rnorm(50)
y <- rnorm(50)

tesselation <- deldir(x, y)
tiles <- tile.list(tesselation)

s <- seq(0, 2 * pi, length.out = 3000)
circle <- list(x = 0.5 * (1 + cos(s)),
               y = 0.5 * (1 + sin(s)))

points <- data.frame(x=x, y=y)
colors <- hcl.colors(50, "viridis")

g <- ggplot(points, aes(x = x, y = y))
for (i in 1:50)
  g <- g + geom_polygon(data = data.frame(x = tiles[[i]]$x,
                                          y = tiles[[i]]$y,
                                          density = 1/tiles[[i]]$area), 
                        aes(fill = density))

g