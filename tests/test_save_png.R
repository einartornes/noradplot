library(noradplot)
library(ggplot2)
library(svglite)

ggnorad()

ggplot(mpg, aes(displ, hwy, color = class)) +
  geom_point() +
  scale_color_norad() +
  labs(title = "This is the title",
       subtitle = "This is the slightly longer subtitle",
       caption = "This is the caption")

# These should look the same
ggsave("tests/test_save_png.png", width = 6, height = 4)
ggsave("tests/test_save_png.svg", width = 6, height = 4)
