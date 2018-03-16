library(stringi)
library(tm)
library(slam)
library(tidyr)
library(dplyr)
library(quanteda)
set.seed(1988)
twitter <- readLines('en_US.twitter.txt')
blogs <- readLines('en_US.blogs.txt')
news <- readLines('en_US.news.txt')
smallTwitter <- sample(twitter, length(twitter)*.75)
smallBlogs <- sample(blogs, length(blogs)*.75)
smallNews <- sample(news, length(news)*.75)
remove(twitter)
remove(blogs)
remove(news)
smallCombo <- c(smallBlogs, smallTwitter, smallNews)
remove(smallTwitter)
remove(smallBlogs)
remove(smallNews)
badWords <- readLines("./badwords.txt")
badWords <- paste("\\b",badWords,"\\b", sep="")
Encoding(smallCombo) <- "latin1"
smallCombo <- iconv(smallCombo, "latin1", "ASCII", sub="")

## Split into 2 data sets
numExamples1 <- length(smallCombo)
num1 <- round(0.5 * numExamples1)
num2 <- numExamples1 - num1
s1 <- sample(numExamples1)
indices1 <- s1[1:num1]
indices2 <- s1[(num1 + 1):numExamples1]
combo1 <- smallCombo[indices1]
combo2 <- smallCombo[indices2]

## Split into 4 data sets
numExamples2 <- length(combo1)
num3 <- round(0.5 * numExamples2)
num4 <- numExamples2 - num3
s2 <- sample(numExamples2)
indices3 <- s2[1:num3]
indices4 <- s2[(num3 + 1):numExamples2]
combo3 <- combo1[indices3]
combo4 <- combo1[indices4]

numExamples3 <- length(combo2)
num5 <- round(0.5 * numExamples3)
num6 <- numExamples3 - num5
s3 <- sample(numExamples3)
indices5 <- s3[1:num5]
indices6 <- s3[(num5 + 1):numExamples3]
combo5 <- combo2[indices5]
combo6 <- combo2[indices6]

# Split into 8 data sets
numExamples4 <- length(combo3)
num7 <- round(0.5 * numExamples4)
num8 <- numExamples4 - num7
s4 <- sample(numExamples4)
indices7 <- s4[1:num7]
indices8 <- s4[(num7 + 1):numExamples4]
combo7 <- combo3[indices7]
combo8 <- combo3[indices8]

numExamples5 <- length(combo4)
num9 <- round(0.5 * numExamples5)
num10 <- numExamples5 - num9
s5 <- sample(numExamples5)
indices9 <- s5[1:num9]
indices10 <- s5[(num9 + 1):numExamples5]
combo9 <- combo4[indices9]
combo10 <- combo4[indices10]

numExamples6 <- length(combo5)
num11 <- round(0.5 * numExamples6)
num12 <- numExamples6 - num11
s6 <- sample(numExamples6)
indices11 <- s6[1:num11]
indices12 <- s6[(num11 + 1):numExamples6]
combo11 <- combo5[indices11]
combo12 <- combo5[indices12]

numExamples7 <- length(combo6)
num13 <- round(0.5 * numExamples7)
num14 <- numExamples7 - num13
s7 <- sample(numExamples7)
indices13 <- s7[1:num13]
indices14 <- s7[(num13 + 1):numExamples7]
combo13 <- combo6[indices13]
combo14 <- combo6[indices14]

#split into 16 sets (combo 7 to combo 14)
numExamples8 <- length(combo7)
num15 <- round(0.5 * numExamples8)
num16 <- numExamples8 - num15
s8 <- sample(numExamples8)
indices15 <- s8[1:num15]
indices16 <- s8[(num15 + 1):numExamples8]
combo15 <- combo7[indices15]
combo16 <- combo7[indices16]

numExamples9 <- length(combo8)
num17 <- round(0.5*numExamples9)
num18 <- numExamples9 - num17
s9 <- sample(numExamples9)
indices17 <- s9[1:num17]
indices18 <- s9[(num17 + 1):numExamples9]
combo17 <- combo8[indices17]
combo18 <- combo8[indices18]

numExamples10 <- length(combo9)
num19 <- round(0.5*numExamples10)
num20 <- numExamples10 - num19
s10 <- sample(numExamples10)
indices19 <- s10[1:num19]
indices20 <- s10[(num19 + 1):numExamples10]
combo19 <- combo9[indices19]
combo20 <- combo9[indices20]

numExamples11 <- length(combo10)
num21 <- round(0.5 * numExamples11)
s11 <- sample(numExamples11)
indices21 <- s11[1:num21]
indices22 <- s11[(num21 + 1):numExamples11]
combo21 <- combo10[indices21]
combo22 <- combo10[indices22]

numExamples12 <- length(combo11)
num23 <- round(0.5*numExamples12)
s12 <- sample(numExamples12)
indices23 <- s12[1:num23]
indices24 <- s12[(num23 + 1):numExamples12]
combo23 <- combo11[indices23]
combo24 <- combo11[indices24]

numExamples13 <- length(combo12)
num25 <- round(0.5*numExamples13)
s13 <- sample(numExamples13)
indices25 <- s13[1:num25]
indices26 <- s13[(num25 + 1):numExamples13]
combo25 <- combo12[indices25]
combo26 <- combo12[indices26]

numExamples14 <- length(combo13)
num27 <- round(0.5* numExamples14)
s14 <- sample(numExamples14)
indices27 <- s14[1:num27]
indices28 <- s14[(num27 + 1):numExamples14]
combo27 <- combo13[indices27]
combo28 <- combo13[indices28]

numExamples15 <- length(combo14)
num29 <- round(0.5*numExamples15)
s15 <- sample(numExamples15)
indices29 <- s15[1:num29]
indices30 <- s15[(num29 + 1):numExamples15]
combo29 <- combo14[indices29]
combo30 <- combo14[indices30]

saveRDS(combo15, "combo1.RDS")
saveRDS(combo16, "combo2.RDS")
saveRDS(combo17, "combo3.RDS")
saveRDS(combo18, "combo4.RDS")
saveRDS(combo19, "combo5.RDS")
saveRDS(combo20, "combo6.RDS")
saveRDS(combo21, "combo7.RDS")
saveRDS(combo22, "combo8.RDS")
saveRDS(combo23, "combo9.RDS")
saveRDS(combo24, "combo10.RDS")
saveRDS(combo25, "combo11.RDS")
saveRDS(combo26, "combo12.RDS")
saveRDS(combo27, "combo13.RDS")
saveRDS(combo28, "combo14.RDS")
saveRDS(combo29, "combo15.RDS")
saveRDS(combo30, "combo16.RDS")
