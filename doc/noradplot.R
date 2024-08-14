## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  dev = "svglite"
)

## ----setup--------------------------------------------------------------------
library(ggplot2)
library(noradplot)

ggnorad("default")


## -----------------------------------------------------------------------------
ggnorad("default")

ggplot(mpg, aes(displ, hwy, color = class)) + 
  geom_point() +
  scale_color_norad() +
  labs(title = "Displacement and highway mileage",
       subtitle = "By vehicle class",
       caption = "Source: mpg dataset from ggplot2 package")

## -----------------------------------------------------------------------------
ggplot(mpg, aes(class)) + 
  geom_bar() +
  scale_y_continuous(expand = expansion(mult = c(0, 0.05))) +
  labs(title = "Number of vehicles",
       subtitle = "By vehicle class",
       caption = "Source: mpg dataset from ggplot2 package")

## ----message=FALSE------------------------------------------------------------
library(dplyr)

df <- tibble("temp" = as.numeric(nhtemp), "time" = as.numeric(time(nhtemp))) 

df |> 
  ggplot(aes(time, temp)) + 
  geom_line() +
  scale_color_norad() +
  labs(title = "New Haven temperature",
       subtitle = "Data for 1912-1971",
       caption = "Source: nhtemp dataset from datasets package")

## -----------------------------------------------------------------------------
ggplot(mpg, aes(displ, hwy, color = class)) + 
  geom_point() +
  scale_color_norad() +
  labs(title = "Displacement and highway mileage",
       subtitle = "By vehicle class",
       caption = "Source: mpg dataset from ggplot2 package") +
  facet_wrap(~class)

