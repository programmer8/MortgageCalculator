
shinyUI(
    
    pageWithSidebar(

        headerPanel("Mortgage Calculator"),
        
        sidebarPanel(
            numericInput('LoanAmount', 'Amount:', 100000),
            
            selectInput('InterestRate', 'Interest Rate (% APR):', 
                        choices = list(0.00, 0.25, 0.50, 0.75,
                                       1.00, 1.25, 1.50, 1.75,
                                       2.00, 2.25, 2.50, 2.75,
                                       3.00, 3.25, 3.50, 3.75,
                                       4.00, 4.25, 4.50, 4.75,
                                       5.00, 5.25, 5.50, 5.75,
                                       6.00, 6.25, 6.50, 6.75,
                                       7.00, 7.25, 7.50, 7.75,
                                       8.00, 8.25, 8.50, 8.75,
                                       9.00, 9.25, 9.50, 9.75, 10.00) , selected = 4.00),
            
            radioButtons('LoanTerm', 'Term of Loan:',
                         choices = list("30 Yrs" = 360, "20 Yrs" = 240,
                                        "15 Yrs" = 180), selected = 360)
            
#             submitButton('Submit')
        ),
        
        mainPanel(
            tabsetPanel(
                tabPanel("Documentation",
                    br(), br(),
                    p("This Shiny app is a simple Mortgage Calculator. There"),
                    p("are three input values required (on the left sidebar) -"),
                    p("a loan amount, an interest rate, and a loan term. This"),
                    p("app will determine the required fixed monthly payments"),
                    p("to satisfy the loan. (Click on the 'Calculator' tab to"),
                    p("see the results.)")),
                
                tabPanel("Calculator", 
                    h3('Monthly Payment:'),
                    br(),
                    h4(textOutput("line1")),
                    h4(textOutput("line2")),
                    h4(textOutput("line3")),
                    
                    h4('then the monthly loan payment will be:'),
                    verbatimTextOutput("LoanPayment"))
            )
        )
    )
)