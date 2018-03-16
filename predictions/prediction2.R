prediction2 <- function(input, dfquad, dfword){
  input <- strsplit(input, " ")
  input <- unlist(input)
  len <- length(input)
  words <- ""
  
  if(len >= 3){
    words <- paste(input[len-3], input[len-2], input[len-1])
    words <- tokenizeText(words)
    dfquad1 <- dplyr::filter(dfquad, start == words)
    dfquad1 <- dfquad1[with(dfquad1, order(-prob)), ]
    if(nrow(dfquad1) >= 1){
      return(dfquad1$end[1])
    }
    
    if(nrow(dfquad1) < 1){
      return(dfword$end[1])
    }
  } else{
    return(dfword$end[1])
  }
}

testPred2 <- function(sentence, df4, df1){
  input <- strsplit(sentence, " ")
  input <- unlist(input)
  len <- length(input)
  
  count <- 0
  
  if(len > 0){
    endWord <- input[len]
  } else {
    endWord <- ""
  }
  
  
  pred <- prediction2(sentence, df4, df1)
  
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
  correct <- testPred2(i, df4, df1)
  number <- number + 1
  print(number)
  count <- count + correct
}

print(count)
print(count/number)