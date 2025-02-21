server <- function(input, output){
  
  # build leaflet map ----
  output$lake_map_output <- renderLeaflet({
    
    filtered_lakes <- reactive({
      lake_data |>
        filter(Elevation >= input$elevation_slider_input[1] & Elevation <= input$elevation_slider_input[2])
    })
    
    
    leaflet() |> 
      addProviderTiles(providers$Esri.WorldImagery) |> 
      setView(lng = -152.048442,
              lat = 70.249234,
              zoom =6) |> 
      addMiniMap(toggleDisplay = TRUE,
                 minimized = FALSE) |> 
      addMarkers(data = filtered_lakes(),
                 lng = filtered_lakes()$Longitude,
                 lat = filtered_lakes()$Latitude,
                 popup = paste0('Site Name: ', filtered_lakes()$Site, '<br>',
                                'Elevation: ', filtered_lakes()$Elevation, ' meters above SL', '<br>',
                                'Avg Depth: ', filtered_lakes()$AvgDepth, ' meters', '<br',
                                'Avg Lake Bed Temperature: ', filtered_lakes()$AvgTemp, '°C'))
  })
  
  
output$county_map_output <- renderLeaflet({
  
  counties_input <- reactive({
    counties |>
      filter(County == input$county_input)
  })
  
  # sample California Central Coast ----
  leaflet() |>
    addProviderTiles(providers$OpenStreetMap) |>
    setView(lng = -119.698189,
            lat = 34.420830,
            zoom = 7) |>
    # addMiniMap(toggleDisplay = TRUE,
    #             minimized = FALSE) |>
    addMarkers(data = counties_input(),
               lng = counties_input()$Longitude,
               lat = counties_input()$Latitude,
               popup = paste0('County: ', counties_input()$County, '<br>',
                              '% current fossil fuel workers ____', '<br>',
                              'Projected Job Loss___', '<br',
                              'Projected Job Gain ____'))
  
})
    
    
  
  
  
  
}