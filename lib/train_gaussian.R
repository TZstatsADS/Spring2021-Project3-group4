# train elastic net model
# Author: Serena Yuan

train_gaussian <- function(features, labels, w=NULL, l=1) {
  model <- glmnet(features, labels, weights = w, alpha = 1, family = "gaussian", lambda = .5) # elastic net
  return(model)
}
