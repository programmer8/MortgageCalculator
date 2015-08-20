
calcLoanPayment <- function(amt, int, term) {
    
    if (int <- as.numeric(int) / 100 / 12) {
        
        intTerm = (1 + int)^as.numeric(term)
        pmt = round(as.numeric(amt) * int * intTerm / (intTerm - 1), 2)
        
    } else {
        
        pmt = round(as.numeric(amt) / as.numeric(term), 2)
    }
    
    pmt
}

shinyServer(
    function(input, output) {
        
        output$line1 <- 
            renderText({paste0("If the loan amount is $", 
                               format(input$LoanAmount, big.mark=",", trim=TRUE))})
        
        output$line2 <- 
            renderText({paste0("and the length of the loan is ", input$LoanTerm, " months")})

        output$line3 <- 
            renderText({paste0("at an annual interest rate of ", input$InterestRate, "%,")})
        
        output$LoanPayment <- 
            renderText({paste0("$ ",
                               format(calcLoanPayment(input$LoanAmount,input$InterestRate,input$LoanTerm), 
                                      big.mark=",", trim=TRUE))})
    }
)