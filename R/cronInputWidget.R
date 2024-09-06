#' #' Create the cron input widget
#' #' 
#' #' @param inputId The ID of the input element.
#' #' @param color The color of the widget.
#' #' @param width Optional: the width of the widget
#' #' @param height Optional: the height of the element
#' #' @param elementId Optional: the ID of where to render the element
#' #' @export
#' cronInputWidget <- function(color = "d58512", width = NULL, height = NULL, elementId = NULL) {
#'   
#'     # forward options using x
#'     x = list(
#'       color = color
#'     )
#' 
#'     # create widget
#'     htmlwidgets::createWidget(
#'       name = 'cronInputWidget',
#'       x,
#'       width = width,
#'       height = height,
#'       package = 'cronInputWidget',
#'       elementId = elementId
#'     )
#' }
#' 
#' 
#' #' Bind the output of the cron input widget to Shiny's output variable
#' #' 
#' #' @param outputId The ID of the element.
#' #' @param width The width of the widget
#' #' @param height The height of the element
#' #' @export
#' cronInputWidgetOutput <- function(outputId, width = '100%', height = 'auto') {
#'   htmlwidgets::shinyWidgetOutput(outputId, 'cronInputWidget', width, height, package = 'cronInputWidget')
#' }
#' 
#' #' Render a cronInputWidget
#' #' 
#' #' @param outputId The ID of the element.
#' #' @param width The width of the widget
#' #' @param height The height of the element
#' #' @export
#' renderCronInputWidget <- function(expr, env = parent.frame(), quoted = FALSE) {
#'   if (!quoted) { expr <- substitute(expr) } # force quoted
#'   htmlwidgets::shinyRenderWidget(expr, cronInputWidgetOutput, env, quoted = TRUE)
#' }
#' 
#' 
#' #' #' Update an existing cron input widget.
#' #' #' 
#' #' #' @param session The session object for the R Shiny instance. Defaults to the default reactive domain.
#' #' #' @param inputId The ID of the input element to change.
#' #' #' @param value The new value to set the cron input element to.
#' #' #' @export
#' #' updateCronInputWidget <- function(session, inputId, value) {
#' #'   # This function sends an update message to the widget, changing its value
#' #'   session$sendInputMessage(inputId, list(value = value))
#' #' }