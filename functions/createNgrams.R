createUnigram <- function(data){
  unigrams <- dfm(data, ngrams = 1)
  uniFreq <- colSums(unigrams)
  uniFreqOrd <- sort(uniFreq, decreasing=TRUE)
  df1 <- data.frame(unigram = names(uniFreqOrd), freq = uniFreqOrd, row.names = NULL)
  df1 <- df1 %>% mutate(prob = freq/sum(freq))
  return(df1)
}

createbigram <- function(data){
  bigrams <- dfm(data, ngrams = 2)
  biFreq <- colSums(bigrams)
  biFreqOrd <- sort(biFreq, decreasing=TRUE)
  df2 <- data.frame(bigram = names(biFreqOrd), freq = biFreqOrd, row.names = NULL)
  return(df2)
}

createTrigram <- function(data){
  trigrams <- dfm(data, ngrams = 3)
  triFreq <- colSums(trigrams)
  triFreqOrd <- sort(triFreq, decreasing=TRUE)
  df3 <- data.frame(trigram = names(triFreqOrd), freq = triFreqOrd, row.names = NULL)
  return(df3)
}

createQuadgram <- function(data){
  quadgrams <- dfm(data, ngrams = 4)
  quadFreq <- colSums(quadgrams)
  quadFreqOrd <- sort(quadFreq, decreasing=TRUE)
  df4 <- data.frame(quadgram = names(quadFreqOrd), freq = quadFreqOrd, row.names = NULL)
  df4$quadgram <- as.character(df4$quadgram)
  df4$end <- df4$quadgram
  df4 <- df4 %>% separate(col = end, into = c('first', 'second', 'third', 'end'), sep = "_")
  df4 <- df4 %>% unite(start, first, second, third, sep = " ")
  df4 <- df4 %>% group_by(start) %>% mutate(total = sum(freq))
  df4 <- df4 %>% mutate(prob = freq/total)
  return(df4)
}