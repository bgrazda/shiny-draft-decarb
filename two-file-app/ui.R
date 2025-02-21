ui <- navbarPage(
  title = 'LTER Animal Data Explorer',
  
  # (Page 1) intro tabPanel ----
  tabPanel(title = 'About this App',
           
           # Intro text fluid row ----
           fluidRow(
             
             # use columns to create white space on sides
             column(1),
             column(10, includeMarkdown("text/about.md")),
             column(1)

             
           ), # END intro text fluidRow
           
           hr(),
           
           # footer text ---
           includeMarkdown('text/footer.md')
           
           
  ),   # END (Page 1) intro tabPanel

  
  # (Page 2) data viz tabPanel
  tabPanel(title = 'Explore the Data',
           
           
           # tabsetPanel to contain tabs for data viz ----
           tabsetPanel(
             
             # trout tabPanel ----
             tabPanel(title = 'Trout',
                      
                      # trout sidebarLayout ----
                      sidebarLayout(
                        sidebarPanel(
                          
                          # channel type pickerInput ---
                          pickerInput(inputId = 'channel_type_input',
                                      label = 'Select channel type(s):',
                                      choices = unique(clean_trout$channel_type),
                                      selected = c('cascade', 'pool'),
                                      multiple = TRUE,
                                      options = pickerOptions(actionsBox = TRUE)), # END trout pickerInput
                          
                          # section checkboxGroupButtons----
                          checkboxGroupButtons(
                            inputId = 'section_input',
                            label = 'Select a sampling section(s):',
                            choices = c('clear cut forest', 'old growth forest'),
                            selected = c('clear cut forest', 'old growth forest'),
                            justified = TRUE,
                            checkIcon = list(
                              yes = icon('check', lib = 'font-awesome'),
                              no = icon('xmark')
                            )
                          ) # END checkbox group buttons
                          
                        ),# END trout sidebarPanel
                        
                        # trout mainPanel
                        mainPanel(
                          
                          # Trout scatterplot output ----
                          plotOutput(outputId = 'trout_scatterplot_output') |> 
                            withSpinner(color = 'cornflowerblue', type = '4')
                          
                        ) # END trout mainPanel 
                      ) # END trout sidebar layout
                      
             ), # END trout tabPanel
             # penguin tabPanel
             tabPanel(title = 'Penguin',
                      
                      sidebarLayout(
                        
                        sidebarPanel(
                          
                          pickerInput(inputId = 'island_type_input',
                                      label = 'Select your island(s)',
                                      choices = unique(island_df$island),
                                      selected = c('Dream', 'Biscoe'),
                                      multiple = TRUE,
                                      options = pickerOptions(actionsBox = TRUE)),
                          # slider input number of bins input
                          sliderInput(inputId = 'bins_input',
                                      label = 'Select number of bins',
                                      min = 1, max = 100, value = 25)
                          
                          # Penguin input here
                        ), # END trout sidebarpanel
                        mainPanel(
                          # Call output from server
                          plotOutput(outputId = 'penguin_hist_output') |> 
                            withSpinner(color = 'hotpink', type = 6)
                          
                        ) # END trout mainpanel
                        
                      ) # END penguin sidebar Layout
             ) # END penguin tabPanel
           ) # END tabsetPanel
           
  ) # End (PAGE 2) data viz tabPanel
  
  
) # End ui
