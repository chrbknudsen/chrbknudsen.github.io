library(ggplot2)

make_brush_segment <- function(
    x, y, xend, yend,
    width = 0.25,
    n = 120,
    raggedness = 0.08,
    seed = NULL
) {

  if (!is.null(seed))
    set.seed(seed)

  dx <- xend - x
  dy <- yend - y

  len <- sqrt(dx^2 + dy^2)

  # Enhedsvektor langs linjen
  ux <- dx / len
  uy <- dy / len

  # Enhedsvektor vinkelret på linjen
  nx <- -uy
  ny <-  ux

  # placering af de enkelte "penselhår"
  offset <- runif(n, -width / 2, width / 2)

  # nogle penselhår starter/slutter tidligere end andre
  start_trim <- runif(n, 0, raggedness * len)
  end_trim   <- runif(n, 0, raggedness * len)

  # mest variation ude ved kanten af penslen
  edge <- abs(offset) / (width / 2)

  start_trim <- start_trim * (0.3 + edge)
  end_trim   <- end_trim   * (0.3 + edge)

  data.frame(
    x = x +
      ux * start_trim +
      nx * offset,

    y = y +
      uy * start_trim +
      ny * offset,

    xend = xend -
      ux * end_trim +
      nx * offset,

    yend = yend -
      uy * end_trim +
      ny * offset,

    linewidth = runif(n, 0.25, 0.8),
    alpha = runif(n, 0.65, 1)
  )
}


brush <- make_brush_segment(
  x = 1,
  y = 1,
  xend = 9,
  yend = 1,
  width = 0.35,
  n = 150,
  raggedness = 0.10,
  seed = 42
)

ggplot(brush) +
  geom_segment(
    aes(
      x = x,
      y = y,
      xend = xend,
      yend = yend,
      linewidth = linewidth,
      alpha = alpha
    ),
    colour = "black",
    lineend = "butt"
  ) +
  scale_linewidth_identity() +
  scale_alpha_identity() +
  coord_cartesian(
    xlim = c(0, 10),
    ylim = c(0, 2)
  ) +
  theme_void()
