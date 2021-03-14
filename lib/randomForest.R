### Random Forest Cross Validation
cv.randomForest.function <- function(features, labels, K, ntree, reweight = FALSE){
  ### Input:
  ### - features: feature data frame
  ### - labels: label data vector
  ### - K: a number stands for K-fold CV
  ### - ntree: Number of trees to grow. 
  ### - mtry:Number of variables randomly sampled as candidates at each split. 
  ### - reweight: sample reweighting
  
  set.seed(2020)
  n <- dim(features)[1]
  n.fold <- round(n/K, 0)
  s <- sample(n) %% K + 1
  cv.error <- rep(NA, K)
  #cv.AUC <- rep(NA, K)

  for (i in 1:K){
    ## create features and labels for train/test
    feature_train <- features[s != i,]
    feature_test <- features[s == i,]
    label_train <- labels[s != i]
    label_test <- labels[s == i]
    
    
    ## model training
    model_train <- train_randomForest(feature_train, label_train, ntree=ntree)
    
    ## make predictions
    label_pred <- test_randomForest(model_train, feature_test)
    #label_pred <- ifelse(label_pred == 2, 0, 1)
    #prob_pred <- label_pred$predictions
    
    cv.error[i] <- mean(label_pred != label_test)
    #label_pred2<-ifelse(label_pred== 2, 1, 0)
    #tpr.fpr <- WeightedROC(label_pred2, label_test)
    #cv.AUC[i] <- WeightedAUC(tpr.fpr)
  }
  return(c(mean(cv.error),sd(cv.error)))
}

