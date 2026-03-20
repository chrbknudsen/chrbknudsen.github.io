

library(tibble)
library(ggplot2)
library(ggalt)

points <- tribble(
  ~color, ~x, ~y,
  "red",   63.0, 739.0,
  "red",  135.0, 740.0,
  "red",  225.5, 742.0,
  "red",  283.0, 732.0,
  "red",  361.0, 829.0,
  "red",  419.0, 787.0,
  "red",  532.5, 764.5,
  "red",  588.5, 705.0,
  "red",  704.0, 815.0,
  "red",  758.0, 744.0,
  "red",  869.0, 740.0,
  "red",  952.0, 727.5,
  "red", 1042.0, 858.0,
  "red", 1137.0, 776.0,
  "red", 1192.0, 754.0,
  "red", 1295.0, 789.0,
  "red", 1363.3, 615.3,
  "red", 1429.0, 743.0,
  "red", 1539.0, 695.0,
  "red", 1599.5, 715.0,
  "red", 1659.5, 723.5,
  "red", 1770.0, 757.0,
  "red", 1849.0, 753.0,

  "blue",   63.0, 700.0,
  "blue",  135.0, 700.0,
  "blue",  225.5, 700.0,
  "blue",  283.0, 707.0,
  "blue",  361.0, 622.0,
  "blue",  419.0, 653.0,
  "blue",  532.0, 675.0,
  "blue",  588.0, 732.0,
  "blue",  704.0, 628.0,
  "blue",  758.0, 697.0,
  "blue",  869.0, 699.0,
  "blue",  952.0, 712.0,
  "blue", 1042.0, 585.0,
  "blue", 1137.0, 665.5,
  "blue", 1192.0, 685.5,
  "blue", 1296.0, 652.0,
  "blue", 1363.0, 818.0,
  "blue", 1429.3, 687.7,
  "blue", 1539.0, 743.0,
  "blue", 1599.5, 723.0,
  "blue", 1659.0, 716.0,
  "blue", 1770.0, 684.0,
  "blue", 1849.0, 699.5
)

points |> 
  ggplot(aes(x,y,color = color, group=color)) +
  geom_point() +
  geom_xspline(spline_shape = -0.25) +
  theme_void()
  theme(legend.position = "none")
ggsave("test-13.png")
  

ggalt::geom_xspline()


library(ggplot2)
library(ggalt)

ggplot(mtcars, aes(wt, drat, color =am)) +
  geom_point() 

hist(mtcars$mpg)

print(p)
png("test.png", width = 1200, height = 800, res = 150)
print(p)
dev.off()
dev.list(

)
while (!is.null(dev.list())) dev.off()
dev.list()
