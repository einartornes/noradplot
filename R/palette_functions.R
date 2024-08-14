#' Gradient color scale constructor for Norad colors
#'
#' @param n Number of colors
#' @param color color upon which to generate gradient.
#' @export


norad_gradient <- function(n, color = norad_cols("green")) {
  stopifnot("n must be greater than one" = n > 1)
  color_high <- color
  color_high_hsl <- plotwidgets::col2hsl(color_high)
  color_low_hsl <- color_high_hsl
  color_low_hsl[3] <- 1 - (1 - color_high_hsl[3]) * 0.1 # 90 % lighter
  color_low <- plotwidgets::hsl2col(color_low_hsl)

  if (n > 2) {
    colorramp <- vector("character", length = n)
    lightness_steps <- (color_low_hsl[3] - color_high_hsl[3]) / (n - 1)
    for(i in 1:n) {
      color_hsl <- color_high_hsl
      color_hsl[3] <- color_high_hsl[3] + lightness_steps*(i - 1)
      colorramp[i] <- plotwidgets::hsl2col(color_hsl)
    }
  } else {
    colorramp <- c(color_low, color_high)
  }
  return(colorramp)
}

#' Function to extract Norad colors as hex codes
#'
#' @param ... Character names of norad_colors
#' @export

norad_cols <- function(...) {

  norad_colors <- c(
    "green" = "#03542d",
    "lightgreen" = "#b4eac9",
    "darkarmy" = "#656d3a",
    "yellow" = "#e1e11f",
    "darkred" =  "#c47521",
    "purple" =  "#cabdff",
    "blue" = "#091354",
    "pink" = "#ff8ad2",
    "darkpurple" = "#5b0337",
    "lightblue" = "#9acce8",
    "orange" = "#ffa274",
    "brown" = "#752c0c",
    "lightpink" = "#ffd2e7",
    "red" = "#ff570d",
    "lightarmy" = "#c9c7a6"
  )

  cols <- c(...)

  if (is.null(cols))
    return (norad_colors)

  norad_colors[cols]
}


#' Function to access Norad palettes
#'
#' @param palette Character name of palette in norad_palettes
#' @param ... Additional arguments (not in use)
#' @export
#'

norad_pal <- function(palette = "main", ...) {

  green_light <- "#D6FEEB" # 90 % lighter than green
  brown_light <- "#FBE6DC"
  blue_light <- "#D9DEFB"

  norad_palettes <- list(
    "main"        = norad_cols(),
    "green"       = norad_cols("green"),
    "greens"      = c(green_light, norad_cols("green")),
    "browns"      = c(brown_light, norad_cols("brown")),
    "purples"     = c(blue_light, norad_cols("blue"))
  )

  norad_palettes[[palette]]

}


#' Helper function for discrete color scales
#'
#' @param palette Character name of palette in norad_palettes
#' @param direction Integer indicating whether the palette should be reversed
#'

palette_gen <- function(palette = "main", direction = 1) {
  function(n) {
    if (n > length(norad_pal(palette)))
      warning("Not enough colors in this palette!")
    else {
      all_colors <- norad_pal(palette)
      all_colors <- unname(unlist(all_colors))
      all_colors <- if (direction >= 0) all_colors else rev(all_colors)
      color_list <- all_colors[1:n]
    }
  }
}

#' Helper function for continuous color scales
#'
#' @param palette Character name of palette in norad_palettes
#' @param direction Integer indicating whether the palette should be reversed
#' @param ... Additional arguments passed to ggplot2::colorRampPalette()
#'

palette_gen_c <- function(palette = "greens", direction = 1, ...) {
  if (!palette %in% c("greens", "browns", "purples")) {
    stop("Only 'greens', 'browns', and 'purples' palettes are supported")
  }
  pal <- norad_pal(palette)
  pal <- if (direction >= 0) pal else rev(pal)
  grDevices::colorRampPalette(pal, ...)
}

#' Discrete color scale constructor for Norad colors
#'
#' @param palette Character name of palette in norad_palettes
#' @param direction Integer indicating whether the palette should be reversed
#' @param ... Additional arguments passed to ggplot2::discrete_scale()
#' @export
#'

scale_color_norad <- function(palette = "main", direction = 1, ...) {
  ggplot2::discrete_scale(
    aesthetics = "color",
    scale_name = "norad", # Deprecated in 3.5.0, but required for version <= 3.5.0, so keep for now
    palette = palette_gen(palette, direction),
    ...
  )
}


#' Discrete fill scale constructor for Norad colors
#'
#' @param palette Character name of palette in norad_palettes
#' @param direction Integer indicating whether the palette should be reversed
#' @param ... Additional arguments passed to ggplot2::discrete_scale()
#' @export
#'

scale_fill_norad <- function(palette = "main", direction = 1, ...) {
  ggplot2::discrete_scale(
    aesthetics = "fill",
    scale_name = "norad", # Deprecated in 3.5.0, but required for version <= 3.5.0, so keep for now
    palette = palette_gen(palette, direction),
    ...
  )
}

#' Continious color scale constructor for Norad colors
#'
#' @param palette Character name of palette in norad_palettes. One of "greens", "browns", or "purples"
#' @param direction Integer indicating whether the palette should be reversed
#' @param ... Additional arguments passed to ggplot2::scale_fill_gradientn()
#' @export
#'

scale_color_norad_c <- function(palette = "greens", direction = 1, ...) {
  pal <- palette_gen_c(
    palette = palette,
    direction = direction
  )
  ggplot2::scale_color_gradientn(colors = pal(256), ...)
}

#' Continuous fill scale constructor for Norad colors
#'
#' @param palette Character name of palette in norad_palettes. One of "greens", "browns", or "purples"
#' @param direction Integer indicating whether the palette should be reversed
#' @param ... Additional arguments passed to ggplot2::scale_fill_gradientn()
#' @export
#'

scale_fill_norad_c <- function(palette = "greens", direction = 1, ...) {
  pal <- palette_gen_c(
    palette = palette,
    direction = direction
  )
  ggplot2::scale_fill_gradientn(colors = pal(256), ...)
}

#' Binned fill scale constructor for Norad colors
#'
#' @param palette Character name of palette in norad_palettes. One of "greens", "browns", or "purples"
#' @param direction Integer indicating whether the palette should be reversed
#' @param breaks How to break down continuous data into bins. Computed automatically by default.
#' @param ... Additional arguments passed to ggplot2::scale_fill_steps()
#' @export
#'

scale_fill_norad_binned <- function(palette = "greens", direction = 1, breaks = waiver(), ...) {
  pal <- norad_pal(palette)
  ggplot2::scale_fill_steps(low = pal[1], high = pal[2], ...)
}

#' Binned color scale constructor for Norad colors
#'
#' @param palette Character name of palette in norad_palettes. One of "greens", "browns", or "purples"
#' @param direction Integer indicating whether the palette should be reversed
#' @param breaks How to break down continuous data into bins. Computed automatically by default.
#' @param ... Additional arguments passed to ggplot2::scale_color_steps()
#' @export
#'

scale_color_norad_binned <- function(palette = "greens", direction = 1, breaks = waiver(), ...) {
  pal <- norad_pal(palette)
  ggplot2::scale_color_steps(low = pal[1], high = pal[2], ...)
}

#' @examples
#' ggplot(mtcars, aes(factor(cyl), mpg)) +
#' geom_bar(aes(fill = factor(cyl)), stat = "identity") +
#'   scale_fill_norad(palette = "main")
#'
#' ggplot(mtcars, aes(wt, mpg)) +
#'   geom_point(size = 4, aes(colour = hp)) +
#'   scale_color_norad_c(palette = "greenyellow")
