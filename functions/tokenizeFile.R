tokenizeFile <- function(file) {
      words <- VCorpus(
            VectorSource(file))
      words <- tm_map(words, content_transformer(tolower))
      words <- tm_map(words, removePunctuation)
      words <- tm_map(words, removeNumbers)
      words <- tm_map(words, stripWhitespace)
      return(words)
}

tokenizeText <- function(input){
  tokenized <- tokenizeFile(input)
  backString <- as.character(tokenized[[1]]$content)
  return(backString)
}