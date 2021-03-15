###########################################################
### Train a classification model with training features ###
###########################################################

train <- function(features, labels, w = NULL, n.trees, shrink, depth){
  labels <- ifelse(labels == 2, 1, 0)
  data <- data.frame(cbind(features, labels))
  model <- gbm(labels ~ .,
               distribution = "bernoulli",
               weights = w,
               data = data,
               n.trees = n.trees,
               shrinkage = shrink,
               interaction.depth = depth,
               n.cores = NULL,
               verbose = FALSE)
  return(model)
}