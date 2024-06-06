#install.packages("deldir")

# voronoi-tesselering. Vi har et antal punkter. Og nu deler vi disse punkter op,
# så alle punkter i et bestemt område er tættere på hinanden end andre punkter.
# det har praktiske anvendelser - det ligger eksempelvis og gemmer sig nedenunder
# k-means clustering. Økologer lader til at bruge det til at modellere - og dermed
# forstå - hvordan dyrs territorier fungerer. Og byplanlæggere til 
# at afgøre hvilke optageområder der er for hospitaler, skoler etc.

library(ggplot2)
library(deldir)
library(tidyverse)

set.seed(42)
tiler <- 50
x <- rnorm(tiler)
y <- rnorm(tiler)

tesselation <- deldir(x, y)
tiles <- tile.list(tesselation)


points <- data.frame(x=x, y=y)
colors <- hcl.colors(50, "Mako")

paletter <- hcl.pals()


tiles_df <- lapply(tiles, function(tile){
  data.frame(x=tile$x, y = tile$y)
}) %>% 
  bind_rows(.id = "tile_id")

farver <- tibble(farve = paletter)

tiles_df %>% 
ggplot(aes(x = x, y = y, group = tile_id, fill = tile_id)) +
  geom_polygon() +
  theme_minimal() +
  coord_polar(start = 0.47) +
  theme(legend.position = "none" ,
        axis.text = element_blank(),
        axis.title = element_blank(),
        axis.line = element_blank(),
        axis.ticks = element_blank(),
        panel.grid = element_blank()) +
  scale_fill_manual(values = hcl.colors(50, "Purp")) +
  theme(legend.position = "none")

farver <- tibble(palet_name = c("YlOrRd", "Purp")) %>% 
    mutate(noget = map(palet_name, ~hcl.colors(50, .)))

theme(legend.position = "none" ,
      axis.text = element_blank(),
      axis.title = element_blank(),
      axis.line = element_blank(),
      axis.ticks = element_blank(),
      panel.grid = element_blank())  +

tiles_df <- crossing(tiles_df, farver)
tiles_df 
