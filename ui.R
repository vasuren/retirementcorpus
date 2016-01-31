pageWithSidebar(
  headerPanel("Calculate your retirement Corpus!"),
  sidebarPanel(
  numericInput(inputId = "n",
               "What would be the monthly income required on retirement", value = 25000,step = 500),
  dateInput(inputId = "Retirement.Date", label = "Retirement Date",value = "2045-01-01",min = Sys.Date()),
  sliderInput(inputId = "Inflation.Rate", label="Expected Inflation Rate", min = 3, max = 15,
              value = 8, step = 0.1, round, format, locale,
              ticks = TRUE), 
  sliderInput(inputId = "FDInterest", label="Expected Interest Rate after retirement", min = 3, max = 15,
              value = 8, step = 0.1, round, format, locale,
              ticks = TRUE),
  actionButton("do", "Submit")
  ),
  mainPanel(
      h3('Amount of Corpus Required during retirement to fetch monthly income from FD is '),
  verbatimTextOutput("Corpus.Required"),
  plotOutput("plot")
  )
)