###########################################################
######## Train an lda model with training features ########
###########################################################

train <- function(train_data) {
  #library("MASS")
  model <- lda(label_train ~ ., data=train_data)
  return(model)
}