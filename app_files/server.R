options(shiny.maxRequestSize=30*1024^2)
df4 <- readRDS("df4small.RDS")
df3 <- readRDS("df3small.RDS")
df2 <- readRDS("df2small.RDS")
df1 <- readRDS("df1small.RDS")
source("tokenizeFile.R")

prediction <- function(input, dfquad, dftri, dfbi, dfword, num){
#prediction <- function(input, dfquad, dftri, dfbi, dfword){
  input <- strsplit(input, " ")
  input <- unlist(input)
  len <- length(input)
  words3 <- ""
  words2 <- ""
  words1 <- ""
  words <- ""

  if(len >= 3){
    words3 <- paste(input[len-2], input[len-1], input[len])
    words3 <- tokenizeText(words3)
    words2 <- paste(input[len-1], input[len])
    words2 <- tokenizeText(words2)
    words1 <- input[len]
    words1 <- tokenizeText(words1)
  } else if(len == 2){
    words2 <- paste(input[len-1], input[len])
    words2 <- tokenizeText(words2)
    words1 <- input[len]
    words1 <- tokenizeText(words1)
  } else if(len == 1){
    words1 <- input[len]
    words1 <- tokenizeText(words1)
  } else{
      return('No Input Provided. Type in a Sentence!')
  }

  
  dfquad1 <- dplyr::filter(dfquad, start == words3)
  dfquad1 <- dfquad1[with(dfquad1, order(-prob)), ]
  
  dftri1 <- dplyr::filter(dftri, start == words2)
  dftri1$prob <- 0.4*dftri1$prob
  dftri1 <- dftri1[with(dftri1, order(-prob)), ]
  
  dfbi1 <- dplyr::filter(dfbi, start == words1)
  dfbi1$prob <- 0.4*0.4*dfbi1$prob
  dfbi1 <- dfbi1[with(dfbi1, order(-prob)), ]
  
  dfword$prob <- 0.4*0.4*0.4*dfword$prob
  dfword <- dfword[with(dfword, order(-prob)), ]
  
  results <- rbind(dfquad1, dftri1, dfbi1)
  results <- results[,c(2,3)]
  results <- rbind(results, dfword[1:5,])
  results <- results[!duplicated(results$end),]
  results <- results[with(results, order(-prob)), ]
  if(num == 1){
    return(results$end[1])
  } else{
    return(results$end[1:num])
  }
}

shinyServer(
  function(input, output) {
    #output$sentence <- renderPrint({input$sentence})
    output$prediction <- renderPrint({
      input$button
      isolate(
        prediction(input$sentence, df4, df3, df2, df1, input$numPredictions)
        #prediction(input$sentence, df4, df3, df2, df1)
      )
    })
  }
)