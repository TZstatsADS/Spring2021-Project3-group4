######################################
### Cross Validation for gbm model ###
######################################

### Author: Yushi Pan
### Project 3


cv.function <- function(features, labels, K, n.trees, shrink, depth, reweight = FALSE){
  ### Input:
  ### - features: feature data frame
  ### - labels: label data vector
  ### - K: a number stands for K-fold CV
  ### - n.trees, shrink, depth: tuning parameters 
  ### - reweight: sample reweighting 
  
  set.seed(2020)
  n <- dim(features)[1]
  n.fold <- round(n/K, 0)
  s <- sample(n) %% K + 1
  cv.error <- rep(NA, K)
  cv.AUC <- rep(NA, K)
  
  for (i in 1:K){
    ## create features and labels for train/test
    feature_train <- features[s != i,]
    feature_test <- features[s == i,]
    label_train <- labels[s != i]
    label_test <- labels[s == i]
    
    ## sample reweighting
    weight_train <- rep(NA, length(label_train))
    weight_test <- rep(NA, length(label_test))
    for (v in unique(labels)){
      weight_train[label_train == v] = 0.5 * length(label_train) / length(label_train[label_train == v])
      weight_test[label_test == v] = 0.5 * length(label_test) / length(label_test[label_test == v])
    }
    
    
    ## model training
    if (reweight){
      model_train <- train(feature_train, label_train, w = weight_train, n.trees, shrink, depth)
    } else {
      model_train <- train(feature_train, label_train, w = NULL, n.trees, shrink, depth)
    }
    
    ## make predictions
    prob_pred <- test(model_train, feature_test, pred.type = 'response')
    label_pred <- ifelse(prob_pred >= 0.5, 2, 1)
    
    cv.error[i] <- 1 - sum(weight_test * (label_pred == label_test)) / sum(weight_test)
    #cv.error[i] <- mean(label_pred != label_test)
    tpr.fpr <- WeightedROC(prob_pred, label_test, weight_test)
    #tpr.fpr <- roc(label_pred, label_test)
    cv.AUC[i] <- WeightedAUC(tpr.fpr)
    #cv.AUC[i] <- tpr.fpr$auc
  }
  return(c(mean(cv.error),sd(cv.error),mean(cv.AUC),sd(cv.AUC)))
}