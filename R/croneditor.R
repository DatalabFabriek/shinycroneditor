#' Cron Editor Input
#'
#' This function creates a cron editor input widget in Shiny.
#'
#' @param inputId The input ID for the cron editor.
#' @param schedule Initial schedule value (optional, default is "* * * * *").
#' @param label The label for the cron editor input.
#' @param language The language for the UI, can be one of en-US or nl-NL
#'
#' @return A UI element for Shiny.
#' @export
croneditor <- function(inputId, schedule = "* * * * *", label = NULL, language = "en-US") {
  schedule <- schedule
  
  # UI element for the cron editor
  shiny::tagList(
    shiny::tags$div(
      id = "inputId",
      class = "form-group shiny-input-container",
      if (!is.null(label)) shiny::tags$label(`for` = inputId, label),
      
      htmltools::tag("cron-expression-input", list(height="34px", width="250px", color="d585812", hotValidate="true", value = schedule))
    ),
    # Include dependencies
    shiny::includeScript(system.file(paste0("www/lib/cron-expression-input/languages/", language, ".js"), package = "shinycroneditor")),
    shiny::includeCSS(system.file("www/lib/cron-expression-input/cron-expression-input.min.css", package = "shinycroneditor")),
    shiny::includeScript(system.file("www/lib/cron-expression-input/cron-expression-input.min.js", package = "shinycroneditor")),
    shiny::includeScript(system.file("www/shinycroneditor.js", package = "shinycroneditor")),
  )
}

#' Update Cron Editor Value
#'
#' @param session Shiny session object.
#' @param inputId The input ID for the cron editor.
#' @param schedule New schedule value to set.
#'
#' @export
updateCronEditor <- function(session = shiny::getDefaultReactiveDomain(), inputId, schedule) {
  session$sendCustomMessage("update-cron-editor", list(id = inputId, schedule = schedule))
}
