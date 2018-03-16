prediction <- function(input, dfquad, dftri, dfbi, dfword){
  input <- strsplit(input, " ")
  input <- unlist(input)
  len <- length(input)
  words3 <- ""
  words2 <- ""
  words1 <- ""
  words <- ""
  
  if(len >= 4){
    words3 <- paste(input[len-3], input[len-2], input[len-1])
    #words3 <- tokenizeText(newInput)
    words2 <- paste(input[len-2], input[len-1])
    #words2 <- tokenizeText(newInput2)
    words1 <- input[len-1]
    #words1 <- tokenizeText(words1)
  } else if(len == 3){
    words2 <- paste(input[len-2], input[len-1])
    #words2 <- tokenizeText(newInput2)
    words1 <- input[len-1]
    #words1 <- tokenizeText(words1)
  } else if(len == 2){
    words1 <- input[len-1]
    #words1 <- tokenizeText(words1)
  } else if(len == 1 || len == 0) {
    return("the")
  } else{
    #words <- tokenizeText(input)
    return("the")
  }

  dfquad1 <- dplyr::filter(dfquad, start == words3)
  dfquad1 <- dfquad1[with(dfquad1, order(-prob)), ]
  if(nrow(dfquad1) >= 1){
    return(dfquad1$end[1])
  }
  if(nrow(dfquad1) < 1){
    dftri1 <- dplyr::filter(dftri, start == words2)
    dftri1 <- dftri1[with(dftri1, order(-prob)), ]
    if(nrow(dftri1) >= 1){
      return(dftri1$end[1])
    }
  }
  if(nrow(dftri1) < 1){
    dfbi1 <- dplyr::filter(dfbi, start == words1)
    dfbi1 <- dfbi1[with(dfbi1, order(-prob)), ]
      if(nrow(dfbi1) >= 1) {
        return(dfbi1$end[1])
      }
  }
  if(nrow(dfbi1) < 1){
    return(dfword$end[1])
  }
}

testPred <- function(sentence, df4, df3, df2, df1){
  input <- strsplit(sentence, " ")
  input <- unlist(input)
  len <- length(input)
  
  count <- 0
  
  if(len > 0){
    endWord <- input[len]
  } else {
    endWord <- ""
  }
  
  
  pred <- prediction(sentence, df4, df3, df2, df1)
  
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
  correct <- testPred(i, df4, df3, df2, df1)
  number <- number + 1
  print(number)
  count <- count + correct
}

print(count)
print(count/number)