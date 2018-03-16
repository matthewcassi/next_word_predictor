prediction5 <- function(input, dfbi, dfword){
  input <- strsplit(input, " ")
  input <- unlist(input)
  len <- length(input)
  words <- ""
  
  if(len >= 2){
    words <- paste(input[len-1])
    #words <- tokenizeText(newInput)
    dfbi1 <- dplyr::filter(dfbi, start == words)
    dfbi1 <- dfbi1[with(dfbi1, order(-prob)), ]
    if(nrow(dfbi1) >= 1){
      return(dfbi1$end[1])
    }
    
    if(nrow(dfbi1) < 1){
      return(dfword$end[1])
    }
  } else{
    return(dfword$end[1])
  }
  
}

testPred5 <- function(sentence, df2, df1){
  input <- strsplit(sentence, " ")
  input <- unlist(input)
  len <- length(input)
  
  count <- 0
  
  if(len > 0){
    endWord <- input[len]
  } else {
    endWord <- ""
  }
  
  
  pred <- prediction5(sentence, df2, df1)
  
  if(endWord == pred){
    count <- count + 1
    return(count)
  } else {
    return(count)
  }
}

count <- 0
number <- 0

for(i in sampleData){
  correct <- testPred5(i, df2, df1)
  number <- number + 1
  print(number)
  count <- count + correct
}

print(count)
print(count/number)