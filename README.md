
# noradplot <img src="man/figures/sticker.png" align="right" width="120"/>

## Overview

Norads colour palette and plot style for creating ggplot2 graphics.

- Use `ggnorad()` to add Norad plot style

- Use `scale_*` functions to add norad colour palette

## Examples

### Default theme, suitable for reports

``` r
library(ggplot2)
library(noradplot)

ggnorad("default")

ggplot(mpg, aes(displ, hwy, color = class)) + 
  geom_point() +
  scale_color_norad() +
  labs(title = "This is the title",
       subtitle = "This is the slightly longer subtitle",
       caption = "This is the caption")
```

![](man/figures/README-example1-1.svg)<!-- -->

### Colorful theme, suitable for presentations

``` r
ggnorad(style = "biglight1")

gdppc <- data.frame(gdppc = c(18195, 7312, 2036),
                    incomegroup = c("Higher middle-income", "Lower middle-income", "Low-income"))

ggplot(gdppc, aes(reorder(incomegroup, -gdppc), gdppc)) + 
  geom_col(width = 0.9, fill = norad_cols("lightgreen")) +
  scale_y_continuous(expand = expansion(c(0, 0.1)), labels = scales::label_comma(big.mark = " ")) +
  geom_text(aes(x = incomegroup, y = 0, vjust = 0, label = paste0(format(round(gdppc, 1), big.mark = " "))),
            size = 36, family = "Norad Display", color = norad_cols("green")) +
  labs(title = "GDP per Capita – 2021", x = NULL, y = NULL,
       subtitle = "US Dollar*") +
  coord_cartesian(clip = "off") +
  theme(axis.line.x = element_blank(), axis.text.x = element_text(face = "bold"))
```

![](man/figures/README-example2-1.svg)<!-- -->

``` r
ggnorad(style = "biglight2")

ggplot(gdppc, aes(reorder(incomegroup, -gdppc), gdppc)) + 
  geom_col(width = 0.9, fill = norad_cols("orange")) +
  scale_y_continuous(expand = expansion(c(0, 0.1)), labels = scales::label_comma(big.mark = " ")) +
  geom_text(aes(x = incomegroup, y = 0, vjust = 0, label = paste0(format(round(gdppc, 1), big.mark = " "))),
            size = 36, family = "Norad Display", color = norad_cols("blue")) +
  labs(title = "GDP per Capita – 2021", x = NULL, y = NULL,
       subtitle = "US Dollar*") +
  coord_cartesian(clip = "off") +
  theme(axis.line.x = element_blank(), axis.text.x = element_text(face = "bold"))
```

![](man/figures/README-example3-1.svg)<!-- -->

``` r
ggnorad(style = "bigdark")
#> Warning in ggnorad(style = "bigdark"): This style is high contrast. Use
#> additional visual elements with care.

ggplot(gdppc, aes(reorder(incomegroup, -gdppc), gdppc)) + 
  geom_col(width = 0.9, fill = norad_cols("lightgreen")) +
  scale_y_continuous(expand = expansion(c(0, 0.1)), labels = scales::label_comma(big.mark = " ")) +
  labs(title = "GDP per Capita – 2021", x = NULL, y = NULL,
       subtitle = "US Dollar*") +
  coord_cartesian(clip = "off") +
  theme(axis.line.x = element_blank(), axis.text.x = element_text(face = "bold"))
```

![](man/figures/README-example4-1.svg)<!-- -->

``` r
library(sf)
#> Linking to GEOS 3.11.0, GDAL 3.5.3, PROJ 9.1.0; sf_use_s2() is TRUE

ggnorad(style = "maplight")
data(world_map)
world_map <- st_transform(world_map, "+proj=robin +lon_0=0 +x_0=0 +y_0=0 +R=6371000 +units=m +no_defs +type=crs")
world_map <- world_map[world_map$admin != "Antarctica", ]
world_map$rand <- runif(nrow(world_map), 1, 1000)

ggplot(world_map) + 
  geom_sf(aes(fill = rand)) +
  scale_fill_norad_binned() +
  guides(fill = guide_colorsteps(title = "Random number", show.limits = TRUE)) +
  theme(legend.position = c(0.15, 0.3),
        legend.title = element_text(margin = margin(0, 0, 5, 0, "pt")))
#> Warning: A numeric `legend.position` argument in `theme()` was deprecated in ggplot2
#> 3.5.0.
#> ℹ Please use the `legend.position.inside` argument of `theme()` instead.
#> This warning is displayed once every 8 hours.
#> Call `lifecycle::last_lifecycle_warnings()` to see where this warning was
#> generated.
```

![](man/figures/README-example5-1.svg)<!-- -->

``` r
library(sf)

ggnorad(style = "mapdark")

ggplot(world_map) + 
  geom_sf(aes(fill = rand)) + 
  scale_fill_norad_binned("browns") +
  guides(fill = guide_colorsteps(title = "Random number", show.limits = TRUE)) +
  theme(legend.position = c(0.15, 0.3),
        legend.title = element_text(margin = margin(0, 0, 5, 0, "pt")))
```

![](man/figures/README-example6%7D-1.svg)<!-- -->

## Credits

Based on Simon Jackson’s blog post: Creating corporate colour palettes
for ggplot2, BBC BBC Visual and Data Journalism cookbook for R graphics:
<https://bbc.github.io/rcookbook/> and Meghan Halls blog post Creating
Custom colour palettes for ggplot2:
<https://meghan.rbind.io/blog/2022-10-11-creating-custom-color-palettes-with-ggplot2/>
