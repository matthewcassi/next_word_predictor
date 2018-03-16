library(stringi)
library(tm)
library(ngram)
library(ggplot2)
library(wordcloud)
library(NLP)
library(openNLP)
library(qdap)
library(RWeka)
library(slam)
library(rpart)
library(ngram)

## Read in lines from each of the datasets
twitter <- readLines('en_US.twitter.txt')
blogs <- readLines('en_US.blogs.txt')
news <- readLines('en_US.news.txt')
## Determine the length of each vector
twitSize <- file.size('en_US.twitter.txt')/(1024^2)
twitLines <- length(twitter)
twitWords <- sum(stri_count_words(twitter))
blogSize <- file.size('en_US.blogs.txt')/(1024^2)
blogLines <- length(blogs)
blogWords <- sum(stri_count_words(blogs))
newsSize <- file.size('en_US.news.txt')/(1024^2)
newsLines <- length(news)
newsWords <- sum(stri_count_words(news))

textTable <- data.frame(File = c("Twitter", "Blog", "News"),
                        Size = c(twitSize, blogSize, newsSize),
                        Lines = c(twitLines, blogLines, newsLines),
                        Words = c(twitWords, blogWords, newsWords), row.names = NULL)
kable(head(textTable), format = "markdown")
## Set the seed so this is reproducible. Take a small sample from each of the datasets
set.seed(2112)
smallTwitter <- sample(twitter, length(twitter)*.0025)
smallBlogs <- sample(blogs, length(blogs)*.0025)
smallNews <- sample(news, length(news)*.0025)
## Remove the large files from memory
remove(twitter)
remove(blogs)
remove(news)
## View the top of each of the small datasets
head(smallTwitter)
head(smallBlogs, n=3)
head(smallNews, n=2)
## Combine the three small datasets and look at the top of the dataset
smallCombo <- paste(smallBlogs, smallTwitter, smallNews, collapse = "")
head(smallCombo)
## read in the badwords list and view the contents
## https://github.com/LDNOOBW/List-of-Dirty-Naughty-Obscene-and-Otherwise-Bad-Words/blob/master/en
badWords <- readLines("./badwords.txt")
length(badWords)
class(badWords)
## Encode the text so there are no chinese characters in the data set
Encoding(smallCombo) <- "latin1"
smallCombo <- iconv(smallCombo, "latin1", "ASCII", sub="")
## Split each line into sentences based on punctuation
sent_token_annotator <- Maxent_Sent_Token_Annotator()
sent_token_annotator
smallCombo <- as.String(smallCombo)
a1 <- NLP::annotate(smallCombo, sent_token_annotator)
smallCombo <- smallCombo[a1]
## Tokenize the text. Tokenize file takes in a file and badwords file, creates a corpus off of it,
## removes punctuation, removes numbers, removes bad words, sets everything to lower case, removes
## white space, and sets it as a plain text document.
tokenCombo <- tokenizeFile(smallCombo, badWords)

##Unigram Analysis

## Creates a document term matrix off of the tokenized text
dtmCombo <- DocumentTermMatrix(tokenCombo)
## Sums up the frequencies of the words in the Document Term Matrix
freqCombo <- col_sums(dtmCombo)

## Orders the data so the most frequent terms are on top
ordCombo <- order(freqCombo,decreasing=TRUE)
freqCombo[head(ordCombo)]
freqCombo[tail(ordCombo)]


findFreqTerms(dtmCombo,lowfreq=1000)

## Creates a data frame from the list of frequent terms in the text
df1 <- data.frame(term=names(freqCombo),occurrences=freqCombo)
## Plots the data frame using a histogram
unigram <- ggplot(subset(df1, freqCombo>2500), aes(term, occurrences)) + 
      geom_bar(aes(fill = "blue"), stat="identity") +
      theme(axis.text.x=element_text(angle=45, hjust=1)) +
      ggtitle("Most Frequent Words")
unigram
## Creates a word cloud of all the frequent terms in the data
wordcloud(names(freqCombo),freqCombo,min.freq=1000,
          colors=brewer.pal(3,"Set1"))

## Creates two functions to get the bigrams and trigrams from the data
BigramTokenizer <- function(x) NGramTokenizer(x, Weka_control(min = 2, max = 2))
TrigramTokenizer <- function(x) NGramTokenizer(x, Weka_control(min = 3, max = 3))
QuadgramTokenizer <- function(x) NGramTokenizer(x, Weka_control(min = 4, max = 4))
PentagramTokenizer <- function(x) NGramTokenizer(x, Weka_control(min = 5, max = 5))

## Creates a term document matrix of the bigrams
tdmComboBigram <- TermDocumentMatrix(Corpus(VectorSource(tokenCombo)), 
                          control = list(tokenize = BigramTokenizer))
freqComboBigram <- row_sums(tdmComboBigram)

df2 <- data.frame(term=names(freqComboBigram),occurrences=freqComboBigram, 
                            row.names = NULL)
bigram <- ggplot(subset(df2, freqComboBigram>700), aes(term, occurrences)) + 
  geom_bar(aes(fill = "blue"), stat="identity") +
  theme(axis.text.x=element_text(angle=45, hjust=1)) +
  ggtitle("Most Frequent Bigrams")
bigram

##Creates a term document matrix of the trigrams in the data
tdmComboTrigram <- TermDocumentMatrix(Corpus(VectorSource(tokenCombo)), 
                               control = list(tokenize = TrigramTokenizer))
freqComboTrigram <- row_sums(tdmComboTrigram)
df3 <- data.frame(term=names(freqComboTrigram),occurrences=freqComboTrigram, 
                             row.names = NULL)
trigram <- ggplot(subset(df3, freqComboTrigram>75), aes(term, occurrences)) + 
  geom_bar(aes(fill = "blue"), stat="identity") +
  theme(axis.text.x=element_text(angle=45, hjust=1)) +
  ggtitle("Most Frequent Trigrams")
trigram

##Quadgrams
tdmComboQuadgram <- TermDocumentMatrix(Corpus(VectorSource(tokenCombo)), 
                                      control = list(tokenize = QuadgramTokenizer))
freqComboQuadgram <- row_sums(tdmComboQuadgram)
df4 <- data.frame(term=names(freqComboQuadgram),occurrences=freqComboQuadgram, 
                              row.names = NULL)
quadgram <- ggplot(subset(df4, freqComboQuadgram>45), aes(term, occurrences)) + 
  geom_bar(aes(fill = "blue"), stat="identity") +
  theme(axis.text.x=element_text(angle=45, hjust=1)) +
  ggtitle("Most Frequent Quadgrams")
quadgram


# tdmComboPentagram <- TermDocumentMatrix(Corpus(VectorSource(tokenCombo)), 
#                                        control = list(tokenize = PentagramTokenizer))
# freqComboPentagram <- row_sums(tdmComboPentagram)
# comboDFPentagram <- data.frame(term=names(freqComboPentagram),occurrences=freqComboPentagram)
# pentagram <- ggplot(subset(comboDFPentagram, freqComboPentagram>31), aes(term, occurrences)) + 
#   geom_bar(aes(fill = "blue"), stat="identity") +
#   theme(axis.text.x=element_text(angle=45, hjust=1)) +
#   ggtitle("Most Frequent Pentagrams")
# pentagram

df4$term <- as.character(df4$term)
df4$end <- df4$term
df4 <- df4 %>% separate(col = end, into = c('first', 'second', 'third', 'end'), sep = "\\s")
df4 <- df4 %>% unite(start, first, second, third, sep = " ")

df3$term <- as.character(df3$term)
df3$end <- df3$term
df3 <- df3 %>% separate(col = end, into = c('first', 'second', 'third'), sep = "\\s")
df3 <- df3 %>% unite(start, first, second, sep = " ")

df2$bigrams <- as.character(df2$bigrams)
df2$end <- df2$bigrams
df2 <- df2 %>% separate(col = end, into = c('start', 'end'), sep = "\\s")