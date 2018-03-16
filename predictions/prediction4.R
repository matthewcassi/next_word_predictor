prediction4 <- function(input, dftri, dfword){
  input <- strsplit(input, " ")
  input <- unlist(input)
  len <- length(input)
  words <- ""
  
  if(len >= 2){
    words <- paste(input[len-2], input[len-1])
    #words <- tokenizeText(newInput)
    dftri1 <- dplyr::filter(dftri, start == words)
    dftri1 <- dftri1[with(dftri1, order(-prob)), ]
    if(nrow(dftri1) >= 1){
      return(dftri1$end[1])
    }
    
    if(nrow(dftri1) < 1){
      return(dfword$end[1])
    }
  } else{
    return(dfword$end[1])
  }
}

testPred4 <- function(sentence, df3, df1){
  input <- strsplit(sentence, " ")
  input <- unlist(input)
  len <- length(input)
  
  count <- 0
  
  if(len > 0){
    endWord <- input[len]
  } else {
    endWord <- ""
  }
  
  
  pred <- prediction4(sentence, df3, df1)
  
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
  correct <- testPred4(i, df3, df1)
  number <- number + 1
  print(number)
  count <- count + correct
}

print(count)
print(count/number)