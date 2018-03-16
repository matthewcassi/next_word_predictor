source('C:/Users/mcassi/Desktop/R Stuff/createNgrams.R')
combo1 <- readRDS("combo1.RDS")
wordContent1 <- createVector(combo1)
saveRDS(wordContent1, "wordContent1.RDS")
remove(combo1)

df1.1 <- createUnigram(wordContent1)
saveRDS(df1.1, "df1_1.RDS")
remove(df1.1)

df2.1 <- createbigram(wordContent1)
saveRDS(df2.1, "df2_1.RDS")
remove(df2.1)

df3.1 <- createTrigram(wordContent1)
saveRDS(df3.1, "df3_1.RDS")
remove(df3.1)

df4.1 <- createQuadgram(wordContent1)
saveRDS(df4.1, "df4_1.RDS")
remove(df4.1)

remove(wordContent1)

## 2
combo2 <- readRDS("combo2.RDS")
wordContent2 <- createVector(combo2)
saveRDS(wordContent2, "wordContent2.RDS")
remove(combo2)

df1.2 <- createUnigram(wordContent2)
saveRDS(df1.2, "df1_2.RDS")
remove(df1.2)

df2.2 <- createbigram(wordContent2)
saveRDS(df2.2, "df2_2.RDS")
remove(df2.2)

df3.2 <- createTrigram(wordContent2)
saveRDS(df3.2, "df3_2.RDS")
remove(df3.2)

df4.2 <- createQuadgram(wordContent2)
saveRDS(df4.2, "df4_2.RDS")
remove(df4.2)

remove(wordContent2)

## 3
combo3 <- readRDS("combo3.RDS")
wordContent3 <- createVector(combo3)
saveRDS(wordContent3, "wordContent3.RDS")
remove(combo3)

df1.3 <- createUnigram(wordContent3)
saveRDS(df1.3, "df1_3.RDS")
remove(df1.3)

df2.3 <- createbigram(wordContent3)
saveRDS(df2.3, "df2_3.RDS")
remove(df2.3)

df3.3 <- createTrigram(wordContent3)
saveRDS(df3.3, "df3_3.RDS")
remove(df3.3)

df4.3 <- createQuadgram(wordContent3)
saveRDS(df4.3, "df4_3.RDS")
remove(df4.3)

remove(wordContent3)

## 4
combo4 <- readRDS("combo4.RDS")
wordContent4 <- createVector(combo4)
saveRDS(wordContent4, "wordContent4.RDS")
remove(combo4)

df1.4 <- createUnigram(wordContent4)
saveRDS(df1.4, "df1_4.RDS")
remove(df1.4)

df2.4 <- createbigram(wordContent4)
saveRDS(df2.4, "df2_4.RDS")
remove(df2.4)

df3.4 <- createTrigram(wordContent4)
saveRDS(df3.4, "df3_4.RDS")
remove(df3.4)

df4.4 <- createQuadgram(wordContent4)
saveRDS(df4.4, "df4_4.RDS")
remove(df4.4)

remove(wordContent4)

## 5
combo5 <- readRDS("combo5.RDS")
wordContent5 <- createVector(combo5)
saveRDS(wordContent5, "wordContent5.RDS")
remove(combo5)

df1.5 <- createUnigram(wordContent5)
saveRDS(df1.5, "df1_5.RDS")
remove(df1.5)

df2.5 <- createbigram(wordContent5)
saveRDS(df2.5, "df2_5.RDS")
remove(df2.5)

df3.5 <- createTrigram(wordContent5)
saveRDS(df3.5, "df3_5.RDS")
remove(df3.5)

df4.5 <- createQuadgram(wordContent5)
saveRDS(df4.5, "df4_5.RDS")
remove(df4.5)

remove(wordContent5)

## 6
combo6 <- readRDS("combo6.RDS")
wordContent6 <- createVector(combo6)
saveRDS(wordContent6, "wordContent6.RDS")
remove(combo6)

df1.6 <- createUnigram(wordContent6)
saveRDS(df1.6, "df1_6.RDS")
remove(df1.6)

df2.6 <- createbigram(wordContent6)
saveRDS(df2.6, "df2_6.RDS")
remove(df2.6)

df3.6 <- createTrigram(wordContent6)
saveRDS(df3.6, "df3_6.RDS")
remove(df3.6)

df4.6 <- createQuadgram(wordContent6)
saveRDS(df4.6, "df4_6.RDS")
remove(df4.6)

remove(wordContent6)

# 7
combo7 <- readRDS("combo7.RDS")
wordContent7 <- createVector(combo7)
saveRDS(wordContent7, "wordContent7.RDS")
remove(combo7)

df1.7 <- createUnigram(wordContent7)
saveRDS(df1.7, "df1_7.RDS")
remove(df1.7)

df2.7 <- createbigram(wordContent7)
saveRDS(df2.7, "df2_7.RDS")
remove(df2.7)

df3.7 <- createTrigram(wordContent7)
saveRDS(df3.7, "df3_7.RDS")
remove(df3.7)

df4.7 <- createQuadgram(wordContent7)
saveRDS(df4.7, "df4_7.RDS")
remove(df4.7)

# 8
combo8 <- readRDS("combo8.RDS")
wordContent8 <- createVector(combo8)
saveRDS(wordContent8, "wordContent8.RDS")
remove(combo8)

df1.8 <- createUnigram(wordContent8)
saveRDS(df1.8, "df1_8.RDS")
remove(df1.8)

df2.8 <- createbigram(wordContent8)
saveRDS(df2.8, "df2_8.RDS")
remove(df2.8)

df3.8 <- createTrigram(wordContent8)
saveRDS(df3.8, "df3_8.RDS")
remove(df3.8)

df4.8 <- createQuadgram(wordContent8)
saveRDS(df4.8, "df4_8.RDS")
remove(df4.8)

remove(wordContent8)

# 9
combo9 <- readRDS("combo9.RDS")
wordContent9 <- createVector(combo9)
saveRDS(wordContent9, "wordContent9.RDS")
remove(combo9)

df1.9 <- createUnigram(wordContent9)
saveRDS(df1.9, "df1_9.RDS")
remove(df1.9)

df2.9 <- createbigram(wordContent9)
saveRDS(df2.9, "df2_9.RDS")
remove(df2.9)

df3.9 <- createTrigram(wordContent9)
saveRDS(df3.9, "df3_9.RDS")
remove(df3.9)

df4.9 <- createQuadgram(wordContent9)
saveRDS(df4.9, "df4_9.RDS")
remove(df4.9)

remove(wordContent9)

# 10
combo10 <- readRDS("combo10.RDS")
wordContent10 <- createVector(combo10)
saveRDS(wordContent10, "wordContent10.RDS")
remove(combo10)

df1.10 <- createUnigram(wordContent10)
saveRDS(df1.10, "df1_10.RDS")
remove(df1.10)

df2.10 <- createbigram(wordContent10)
saveRDS(df2.10, "df2_10.RDS")
remove(df2.10)

df3.10 <- createTrigram(wordContent10)
saveRDS(df3.10, "df3_10.RDS")
remove(df3.10)

df4.10 <- createQuadgram(wordContent10)
saveRDS(df4.10, "df4_10.RDS")
remove(df4.10)

remove(wordContent10)

# 11
combo11 <- readRDS("combo11.RDS")
wordContent11 <- createVector(combo11)
saveRDS(wordContent11, "wordContent11.RDS")
remove(combo11)

df1.11 <- createUnigram(wordContent11)
saveRDS(df1.11, "df1_11.RDS")
remove(df1.11)

df2.11 <- createbigram(wordContent11)
saveRDS(df2.11, "df2_11.RDS")
remove(df2.11)

df3.11 <- createTrigram(wordContent11)
saveRDS(df3.11, "df3_11.RDS")
remove(df3.11)

df4.11 <- createQuadgram(wordContent11)
saveRDS(df4.11, "df4_11.RDS")
remove(df4.11)

remove(wordContent11)

# 12
combo12 <- readRDS("combo12.RDS")
wordContent12 <- createVector(combo12)
saveRDS(wordContent12, "wordContent12.RDS")
remove(combo12)

df1.12 <- createUnigram(wordContent12)
saveRDS(df1.12, "df1_12.RDS")
remove(df1.12)

df2.12 <- createbigram(wordContent12)
saveRDS(df2.12, "df2_12.RDS")
remove(df2.12)

df3.12 <- createTrigram(wordContent12)
saveRDS(df3.12, "df3_12.RDS")
remove(df3.12)

df4.12 <- createQuadgram(wordContent12)
saveRDS(df4.12, "df4_12.RDS")
remove(df4.12)

remove(wordContent12)

# 13
combo13 <- readRDS("combo13.RDS")
wordContent13 <- createVector(combo13)
saveRDS(wordContent13, "wordContent13.RDS")
remove(combo13)

df1.13 <- createUnigram(wordContent13)
saveRDS(df1.13, "df1_13.RDS")
remove(df1.13)

df2.13 <- createbigram(wordContent13)
saveRDS(df2.13, "df2_13.RDS")
remove(df2.13)

df3.13 <- createTrigram(wordContent13)
saveRDS(df3.13, "df3_13.RDS")
remove(df3.13)

df4.13 <- createQuadgram(wordContent13)
saveRDS(df4.13, "df4_13.RDS")
remove(df4.13)

remove(wordContent13)

# 14
combo14 <- readRDS("combo14.RDS")
wordContent14 <- createVector(combo14)
saveRDS(wordContent14, "wordContent14.RDS")
remove(combo14)

df1.14 <- createUnigram(wordContent14)
saveRDS(df1.14, "df1_14.RDS")
remove(df1.14)

df2.14 <- createbigram(wordContent14)
saveRDS(df2.14, "df2_14.RDS")
remove(df2.14)

df3.14 <- createTrigram(wordContent14)
saveRDS(df3.14, "df3_14.RDS")
remove(df3.14)

df4.14 <- createQuadgram(wordContent14)
saveRDS(df4.14, "df4_14.RDS")
remove(df4.14)

remove(wordContent14)

# 15
combo15 <- readRDS("combo15.RDS")
wordContent15 <- createVector(combo15)
saveRDS(wordContent15, "wordContent15.RDS")
remove(combo15)

df1.15 <- createUnigram(wordContent15)
saveRDS(df1.15, "df1_15.RDS")
remove(df1.15)

df2.15 <- createbigram(wordContent15)
saveRDS(df2.15, "df2_15.RDS")
remove(df2.15)

df3.15 <- createTrigram(wordContent15)
saveRDS(df3.15, "df3_15.RDS")
remove(df3.15)

df4.15 <- createQuadgram(wordContent15)
saveRDS(df4.15, "df4_15.RDS")
remove(df4.15)

remove(wordContent15)