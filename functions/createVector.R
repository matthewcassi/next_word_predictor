createVector <- function(data){
  indSent <- unlist(strsplit(data, "(?<!Mr|Mrs|Dr|Ms|St)[?!.]", perl = TRUE))
  
  hasProfanity <- rep(FALSE,length(indSent)) 
  for (s in 1:length(indSent)) {
    for (p in 1:length(badWords)) {
      if (grepl(badWords[p],indSent[s])) {
        hasProfanity[s] <- TRUE
        break
      }
    }
  }
  
  indSent <- indSent[!hasProfanity]
  indSent <- indSent[nchar(indSent)>0]
  
  words <- VCorpus(VectorSource(indSent))
  words <- tm_map(words, content_transformer(tolower))
  words <- tm_map(words, removePunctuation)
  words <- tm_map(words, removeNumbers)
  words <- tm_map(words, stripWhitespace)
  
  wordContent <- character(length(words$content))
  for(i in 1:length(words)) wordContent[[i]] <- words[[i]]$content
  
  return(wordContent)
}