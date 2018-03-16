prediction6 <- function(input, dfquad, dftri, dfbi, dfword, num){
  input <- strsplit(input, " ")
  input <- unlist(input)
  len <- length(input)
  words3 <- ""
  words2 <- ""
  words1 <- ""
  words <- ""
  
  if(len >= 4){
    words3 <- paste(input[len-3], input[len-2], input[len-1])
    words3 <- tokenizeText(words3)
    words2 <- paste(input[len-2], input[len-1])
    words2 <- tokenizeText(words2)
    words1 <- input[len-1]
    words1 <- tokenizeText(words1)
  } else if(len == 3){
    words2 <- paste(input[len-2], input[len-1])
    words2 <- tokenizeText(words2)
    words1 <- input[len-1]
    words1 <- tokenizeText(words1)
  } else if(len == 2){
    words1 <- input[len-1]
    words1 <- tokenizeText(words1)
  } else if(len == 1){
    words1 <- input[len]
    words1 <- tokenizeText(words1)
  } else if(len == 0) {
    if(num == 1){
      return(dfword$end[1])
    } else {
      return(dfword$end[1:num])
    }
  } else {
    if(num == 1){
      return(dfword$end[1])
    } else {
      return(dfword$end[1:num])
    }
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

testPred6 <- function(sentence, df4, df3, df2, df1, num){
  input <- strsplit(sentence, " ")
  input <- unlist(input)
  len <- length(input)
  
  count <- 0
  
  if(len > 0){
    endWord <- input[len]
  } else {
    endWord <- ""
  }
  
  
  pred <- prediction6(sentence, df4, df3, df2, df1, num)
  
  if(endWord == pred){
    count <- count + 1
    return(count)
  } else {
    return(count)
  }
}

# count <- 0
# number <- 0
# 
# for(i in sampleData){
#   correct <- testPred6(i, df4, df3, df2, df1, 1)
#   number <- number + 1
#   print(number)
#   count <- count + correct
# }
# 
# print(count)
# print(count/number)