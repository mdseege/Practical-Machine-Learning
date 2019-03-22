install.packages("caret")
install.packages("generics")
install.packages("MASS")
library(MASS)
library(caret)
library(generics)
library(tidyverse)
not_any_na <- function(x) all(!is.na(x))

test.csv <- read_csv('pml-testing.csv')
train.csv <- read_csv('pml-training.csv')

training <- train.csv %>% select_if(not_any_na)
testing <- test.csv %>% select_if(not_any_na)

###################

?train
set.seed(32343)
train.lda <- train(classe ~ .,
                   method = "lda",
                   data = training)

train.lda <- train(classe ~ .,
                   data = training,
                   method = "glm")


str(training)
pred.lda <- predict(train.lda, testing)

confusionMatrix(pred.rf, testing)
?train
rftrain <-train(diagnosis ~.,
                method = 'rf',
                data = training)
rfpred <- predict(rftrain, testing)
