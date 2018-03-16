tokenizeText <- function(input){
  tokenized <- tokenizeFile(input, badWords)
  backString <- as.character(tokenized[[1]])
  return(backString)
}