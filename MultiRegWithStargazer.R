library(stargazer)  # Load library

# Function ----------------------------------------------------------------

Regress <- function(data, DV, eq.IVs, OutcomeLabel){
  
  equations <- paste0(DV, " ~ ", eq.IVs) # Create equations 
  RegResults <- list()  # Create an empty list that stores all regression results
  LogLike <- c("Log Likelihood")  # Storing log-likelihood of all regression results
  
  for(i in 1:length(equations)){
    reg <- lm(formula = equations[i], data = data)
    reg$AIC <- AIC(reg) # Include Akaike Inf. Crit.
    reg$BIC <- BIC(reg) # Include Bayesian Inf. Crit.
    RegResults[[paste0(OutcomeLabel, "_", ifelse(i<10, paste0(0, i), i))]] <- reg
    LogLike <- append(x = LogLike, values = round(logLik(reg),2))
  }
  
  # Export RegResults as doc 
  return(stargazer(RegResults, 
                   type = 'html', 
                   out = paste0("Regression_Results_", OutcomeLabel, ".doc"), add.lines = list(LogLike))
         )
}


# Example -----------------------------------------------------------------

npk <- datasets::npk # Using R Datasets (Classical N, P, K Factorial Experiment)

DV = 'yield'  # Set dependent variable

# Create a list of equations with independent variables
# Here 1st equation is block, 2nd with N, 3rd with block and N
eq.IVs <- c("block",
            'N',
            'block + N'
            )

RegressionTable <- Regress(data = npk, DV = DV, eq.IVs = eq.IVs, OutcomeLabel = "NPK")
