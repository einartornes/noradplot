
#' Function for using Norad's theme in ggplot2 graphics
#'
#'@export

theme_norad <- function() {
  sans <- "Norad Sans"
  serif <- "Norad Serif"
  arial <- "Arial"

  showtext::showtext_auto()
  showtext::showtext_opts(dpi = 300)

  ggplot2::theme_classic() +
    ggplot2::theme(
      # General text
      text = ggplot2::element_text(
        family = arial, # default unless otherwise stated (like in plot.title)
        size = 12
      ),
      # Plot title and subtitle
      plot.title.position = "panel",
      plot.title = ggplot2::element_text(
        family = sans,
        face = "bold",
      ),
      plot.subtitle = ggplot2::element_text(
        family = sans,
      ),
      # Plot caption
      plot.caption = ggplot2::element_text(
        family = sans,
        margin = ggplot2::margin(t = 10)
      ),
      # Legend
      legend.text = ggplot2::element_text(
        family = sans,
      ),
      legend.title = ggplot2::element_text(
        family = sans,
      ),
      legend.position = "right",
      legend.justification = "top",
      legend.margin = ggplot2::margin(r = 30),
      legend.text.align = 0,
      legend.background = ggplot2::element_blank(),
      # Axes
      axis.text = ggplot2::element_text(
        color = "black"
      ),
      axis.title = ggplot2::element_text(
        family = sans,
      ),
      axis.title.y = ggplot2::element_text(hjust = 1),
      axis.title.x = ggplot2::element_text(hjust = 1),
      strip.background = ggplot2::element_rect(fill = "transparent", linewidth = rel(1)),
      strip.clip = "off" # Prevents strip outline form being clipped
    )
}

#' Function for using Norad's theme in ggplot2 graphics
#'
#'@export

theme_norad_light_green <- function() {
  sans <- "Norad Sans"
  serif <- "Norad Serif"
  arial <- "Arial"

  theme_norad() +
    ggplot2::theme(
      # Plot and panel background
      panel.background = element_rect(fill = "transparent"), #transparent panel bg
      plot.background = element_rect(fill = "transparent", color = NA), #transparent plot bg
      panel.grid.major = element_blank(), #remove major gridlines
      panel.grid.minor = element_blank(), #remove minor gridlines
      legend.background = element_rect(fill = "transparent", color = NA), #transparent legend bg
      legend.box.background = element_rect(fill = "transparent", color = NA) #transparent legend panel
    )
}

#' Function for using Norad's theme in ggplot2 graphics
#'
#'@export

theme_norad_big_light_1 <- function() {
  sans <- "Norad Sans"
  serif <- "Norad Serif"
  display <- "Norad Display"
  arial <- "Arial"

  showtext::showtext_auto()
  showtext::showtext_opts(dpi = 300)

  theme_norad() +
    ggplot2::theme(
      # General text
      text = ggplot2::element_text(
        color = norad_cols("green")
      ),
      # Axes
      axis.text = ggplot2::element_text(
        color = norad_cols("green")
      ),
      axis.line = ggplot2::element_line(color = norad_cols("green")),
      axis.ticks = ggplot2::element_blank(),
      # Facet labels
      strip.text = ggplot2::element_text(
        color = norad_cols("lightgreen")
      ),
      strip.background = ggplot2::element_rect(
        fill = norad_cols("green"),
        color = NA
      ),
      # Plot and panel background
      plot.background = ggplot2::element_rect(
        fill = "#eff6ea"
      ),
      panel.background = ggplot2::element_blank(),
      # Plot margin
      plot.margin = ggplot2::margin(5, 5, 5, 5, "mm")
    )
}

#' Function for using Norad's theme in ggplot2 graphics
#'
#'@export

theme_norad_big_dark <- function() {
  sans <- "Norad Sans"
  serif <- "Norad Serif"
  display <- "Norad Display"

  theme_norad_big_light_1() +
    ggplot2::theme(
      text = ggplot2::element_text(
        color = norad_cols("lightgreen")
      ),
      plot.background = ggplot2::element_rect(
        fill = "#1b3a1c"
      ),
      panel.background = ggplot2::element_blank(),
      axis.text = ggplot2::element_text(
        color = norad_cols("lightgreen")
      ),
      axis.line = ggplot2::element_line(
        color = norad_cols("lightgreen")
      ),
      strip.text = ggplot2::element_text(
        color = norad_cols("green")
      ),
      strip.background = ggplot2::element_rect(
        fill = norad_cols("lightgreen")
      )
    )
}

#' Function for using Norad's theme in ggplot2 graphics
#'
#'@export

theme_norad_big_light_2 <- function() {
  sans <- "Norad Sans"
  serif <- "Norad Serif"
  display <- "Norad Display"

  theme_norad_big_light_1() +
    ggplot2::theme(
      text = ggplot2::element_text(
        color = norad_cols("blue")
      ),
      plot.background = ggplot2::element_rect(
        fill = "#eee8e7"
      ),
      panel.background = ggplot2::element_blank(),
      axis.text = ggplot2::element_text(
        color = norad_cols("blue")
      ),
      axis.line = ggplot2::element_line(
        color = norad_cols("blue")
      ),
      strip.text = ggplot2::element_text(
        color = norad_cols("blue")
      ),
      strip.background = ggplot2::element_rect(
        fill = norad_cols("darkred"),
      )
    )
}

#' Function for using Norad's theme in ggplot2 graphics
#'
#'@export

theme_norad_map_light <- function() {
  sans <- "Norad Sans"
  serif <- "Norad Serif"
  display <- "Norad Display"

  showtext::showtext_auto()
  showtext::showtext_opts(dpi = 300)

  ggplot2::theme_void() +
    ggplot2::theme(
      plot.background = ggplot2::element_rect(fill = "#eff6ea", color = NA),
      plot.margin = ggplot2::margin(5, 5, 5, 5, "mm"),
      legend.margin = ggplot2::margin(5, 5, 5, 5, "mm"),
      plot.caption = ggplot2::element_text(hjust = 0),
      text = ggplot2::element_text(
        color = norad_cols("green"),
        family = sans,
        size = 12),
      panel.border = element_blank()
    )
}

#' Function for using Norad's theme in ggplot2 graphics
#'
#'@export

theme_norad_map_dark <- function() {
  sans <- "Norad Sans"

  theme_norad_map_light() +
    ggplot2::theme(
      plot.background = ggplot2::element_rect(fill = "#1b3a1c"),
      text = ggplot2::element_text(color = norad_cols("lightgreen"))
    )
}

#' @examples
#' ggplot(mtcars, aes(factor(cyl), mpg)) +
#' geom_bar(aes(fill = factor(cyl)), stat = "identity") +
#'   theme_norad()
#'
#' ggplot(mtcars, aes(factor(cyl), mpg)) +
#' geom_bar(aes(fill = factor(cyl)), stat = "identity") +
#'   theme_norad()
