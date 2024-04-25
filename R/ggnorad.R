#' Wrapper function to load Norad theme for ggplot2.
#' Also sets Norad's discrete and continuous color palettes as the default for the session.
#'
#'@param style Plot style. One of "default", "biglight1", "biglight2", "bigdark",
#' "maplight", "mapdark", or "light"
#'@param norad_colors Logical. Should Norad's color palettes be set as the default for the session? Default is TRUE.
#'@export
#'@name ggnorad

ggnorad <- function(style = "default", norad_colors = TRUE) {

  showtext::showtext_auto()

  options(scipen = 999)
  fonts_dir <- system.file("fonts", package = "noradplot")
  sysfonts::font_add(family = "Norad Sans",
                     regular = paste0(fonts_dir, "/NoradSans-Regular.otf"),
                     bold = paste0(fonts_dir, "/NoradSans-Bold.otf"),
                     italic = paste0(fonts_dir, "/NoradSans-Italic.otf"),
                     bolditalic = paste0(fonts_dir, "/NoradSans-BoldItalic.otf"))

  sysfonts::font_add(family = "Norad Serif",
                     regular = paste0(fonts_dir, "/NoradSerif-Regular.otf"),
                     bold = paste0(fonts_dir, "/NoradSerif-Bold.otf"),
                     italic = paste0(fonts_dir, "/NoradSerif-Italic.otf"),
                     bolditalic = paste0(fonts_dir, "/NoradSerif-BoldItalic.otf"))

  sysfonts::font_add(family = "Norad Display",
                     regular = paste0(fonts_dir, "/NoradDisplay-Bold.otf"),
                     bold = paste0(fonts_dir, "/NoradDisplay-Bold.otf"),
                     italic = paste0(fonts_dir, "/NoradDisplay-BoldItalic.otf"))

  sysfonts::font_add(family = "Arial",
                     regular = paste0(fonts_dir, "/arial.ttf"),
                     bold = paste0(fonts_dir, "/arialbd.ttf"),
                     italic = paste0(fonts_dir, "/ariali.ttf"),
                     bolditalic = paste0(fonts_dir, "/arialbi.ttf"))

  ggplot2::update_geom_defaults("path", list(linewidth = 1))

  if (style == "default") {
    ggplot2::theme_set(theme_norad())
  } else if (style == "light") {
    ggplot2::theme_set(theme_norad_light_green())
  }  else if (style == "biglight1") {
    ggplot2::theme_set(theme_norad_big_light_1())
  } else if (style == "biglight2") {
    ggplot2::theme_set(theme_norad_big_light_2())
  } else if (style == "bigdark") {
    warning("This style is high contrast. Use additional visual elements with care.")
    ggplot2::theme_set(theme_norad_big_dark())
  } else if (style == "maplight") {
    ggplot2::theme_set(theme_norad_map_light())
  } else if (style == "mapdark") {
    ggplot2::theme_set(theme_norad_map_dark())
  }

  if (norad_colors == TRUE) {
    options(ggplot2.discrete.colour = scale_color_norad)
    options(ggplot2.discrete.fill = scale_fill_norad)
    options(ggplot2.continuous.colour = scale_color_norad_c)
    options(ggplot2.continuous.fill = scale_fill_norad_c)
  }
}
