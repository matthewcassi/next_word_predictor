Next Word Predictor
========================================================
author: Matt Cassi
date: 10/4/2016
autosize: true
transition: rotate

Next Word Predictor App
========================================================
- The Next Word Predictor App is easy to use and efficiently provides predictions!

Directions:

1. Type in a word or phrase, without curse words
2. Select the number of predictions (if you select 5, you will see the top 5 predictions for the next word)
3. Press the "Predict Next Word" button

The Application will then show you the input and print out the predicted word or words

[Link to the Next Word Predictor](https://mcassi17.shinyapps.io/NextWordPredictor/)

Data Analysis
========================================================
- Task: Develop a Next Word Predictor using data from HC Corpa
- Analyzed data from [HC Corpa](https://d396qusza40orc.cloudfront.net/dsscapstone/dataset/Coursera-SwiftKey.zip) by splitting the text into sentences, lowercasing sentences, removing sentences with [cursewords](https://github.com/LDNOOBW/List-of-Dirty-Naughty-Obscene-and-Otherwise-Bad-Words/blob/master/en), removing numbers, punctuation, and whitespace
- Split sentences into the most frequent [ngrams](https://english.boisestate.edu/johnfry/files/2013/04/bigram-2x2.pdf): 4 grams (4 word combinations), 3 grams (3 word combinations), 2 grams (2 word combinations), and 1 grams (most frequent words)
- Split the 4 grams, 3 grams, and 2 grams into the last word and the remaining words (3 for the 4 gram, 2 for the 3 gram, and 1 for the 2 gram) for prediction purposes
- Built multiple algorithms to predict the next word by matching word combinations


Algorithm Explanation
========================================================
incremental: true
* The Next Word Predictor uses a [Stupid Backoff algorithm](https://www.quora.com/What-is-backoff-in-NLP) to determine the next word of a phrase or sentence
  + Split the input phrase into the last 3 words, 2 words, and/or 1 word depending on the length of the phrase
  + Make the phrase lowercase, remove punctuation, remove numbers, and strip whitespace
  + Match the last 3 word combination to the 4 grams data frame and add that to a results data frame
  + Match the last 2 word combination to the 3 grams data frame, multiply conditional probabilities by 0.4, and add that to a results data frame
 
  
Algorithm Explanation Continued
========================================================
incremental: true
  + Match the last word to the 2 grams data frame, multiply conditional probabilities by 0.4^2, and add that to a results data frame 
  + Mutliply conditional probabilities of the most frequent words by 0.4^3 and add the top 5 to the results data frame
  + Remove duplicate predictions from the results data frame
  + Order the data frame by the highest conditional probabilities and return the top predictions (specified by the number of predicitons selected in the application)

Algorithm Performance
========================================================
- 5 Algorithms were tested with 2000 samples: Standard Backoff, Stupid Backoff, Using only the 4 gram, Using only the 3 gram, and Using only the 2 gram

Algorithm        | Percent Correct
---------------- | -------------
[Stupid Backoff algorithm](https://www.quora.com/What-is-backoff-in-NLP)   | 17.15%
[Backoff](https://en.wikipedia.org/wiki/Katz%27s_back-off_model)          | 17.00%
[4 gram](https://web.stanford.edu/~jurafsky/slp3/4.pdf)           | 10.45%
[3 gram](https://web.stanford.edu/~jurafsky/slp3/4.pdf)           | 9.95%
[2 gram](https://web.stanford.edu/~jurafsky/slp3/4.pdf)           | 5.15%

- The Stupid Backoff algorithm performed better over the 2000 samples and was chosen as the algorithm for the application because of this
