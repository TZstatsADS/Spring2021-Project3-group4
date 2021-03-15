########################
### pca for lda ###
########################

### Author: Yushi Pan
### Project 3

pca_evaluation <- function(features, labels, K, num_pc) {
  
  set.seed(2021)
  n <- dim(features)[1]
  n.fold <- round(n/K, 0)
  s <- sample(n) %% K + 1
  cv.error <-rep(NA,K)
  
  for (i in 1:K){  
    ## create features and labels for train/test
    feature_train <- features[s != i,]
    feature_test <- features[s == i,]
    label_train <- labels[s != i]
    label_test <- labels[s == i]
    
    ## model training
    pca <- prcomp(feature_train)
    train_pca <- data.frame(pca$x[,1:num_pc])
    
    ## make predictions
    pred <- predict(pca, feature_test)
    test_pca <- data.frame(pred[,1:num_pc])
    
    dat_train_pca <- cbind(train_pca, label_train)
    dat_test_pca <- cbind(test_pca, label_test)
    
    lda.model.pca <- lda(label_train ~., data=dat_train_pca)
    label_pred <- predict(lda.model.pca, dat_test_pca[-dim(dat_test_pca)[2]])$class
    
    cv.error[i] <- mean(label_pred != label_test)
  }
  
  return(mean(cv.error))
  
}

