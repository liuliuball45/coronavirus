# Module UI
  
#' @title   mod_world_ui and mod_world_server
#' @description  A shiny Module.
#'
#' @param id shiny id
#' @param input internal
#' @param output internal
#' @param session internal
#'
#' @rdname mod_world
#'
#' @keywords internal
#' @export 
#' @importFrom shiny NS tagList 
mod_world_ui <- function(id){
  ns <- NS(id)

  f7Card(
    title = "Confirmed Cases - Worldwide",
    echarts4r::echarts4rOutput(ns("world"), height = "70vh")
  )
}
    
# Module Server
    
#' @rdname mod_world
#' @export
#' @keywords internal
    
mod_world_server <- function(input, output, session, df){
  ns <- session$ns

  output$world <- echarts4r::renderEcharts4r({
    df %>% 
      dplyr::filter(date == max(date)) %>%
      echarts4r::e_country_names(country_iso2c, country) %>% 
      dplyr::group_by(country) %>% 
      dplyr::summarise(cases = sum(cases, na.rm = TRUE)) %>% 
      dplyr::ungroup() %>% 
      echarts4r::e_charts(country) %>% 
      echarts4r::e_map(
        cases, 
        itemStyle = list(
          areaColor = "#242323"
        ),
        label = list(
          emphasis = list(
            color = "#ffffff",
            fontSite = 15
          )
        )
      ) %>% 
      echarts4r::e_visual_map(cases, textStyle = list(color = "#fff")) %>% 
      echarts4r::e_theme(theme)
  })
}
    
## To be copied in the UI
# mod_world_ui("world_ui_1")
    
## To be copied in the server
# callModule(mod_world_server, "world_ui_1")
 
