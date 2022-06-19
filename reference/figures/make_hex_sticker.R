library(hexSticker)
library(ggplot2)

## Temporary version

p <- ggplot(data.frame()) +
  geom_blank() +
  theme_transparent()

col_light <- "#e6e6ff"
col_med <- "#9999ff"
col_dark <- "#4d4dff"

sticker(
  p,
  package = "OAButils",
  p_size = 20,
  p_color = col_light,
  p_x = 1,
  p_y = 1,
  h_fill = col_med,
  h_color = col_light,
  filename = "man/figures/OAButils.png"
)
