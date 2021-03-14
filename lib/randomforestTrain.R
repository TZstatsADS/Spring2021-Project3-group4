### create a random forest model with training
train_randomForest <- function(features, labels, ntree){
  labels <- as.factor(as.character(labels))
  model <- randomForest(features, labels, ntree=ntree)
  return(model)
}
