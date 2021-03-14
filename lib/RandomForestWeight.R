### Random Forest with Weight ross Validation
cv.randomForestWeight.function <- function(features, labels, K, ntree, reweight = TRUE){
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
    
    ## sample reweighting
    weight_train <- rep(NA, length(label_train))
    weight_test <- rep(NA, length(label_test))
    for (v in unique(labels)){
      weight_train[label_train == v] = 0.5 * length(label_train) / length(label_train[label_train == v])
      weight_test[label_test == v] = 0.5 * length(label_test) / length(label_test[label_test == v])
    }
    
    ## model training
    model_train <- train_randomForest(feature_train, label_train, ntree=ntree)
    
    ## make predictions
    label_pred <- test_randomForest(model_train, feature_test)
    #label_pred <- ifelse(label_pred == 2, 0, 1)
    prob_pred <- test_randomForest(model_train, feature_test)
    
    cv.error[i] <- sum(weight_test *(label_pred != label_test))/sum(weight_test)
    #label_pred2<-ifelse(label_pred== 2, 1, 0)
    #tpr.fpr <- WeightedROC(prob_pred, label_test, weight_test)
    #cv.AUC[i] <- WeightedAUC(tpr.fpr)
  }
  return(c(mean(cv.error),sd(cv.error)))
}

