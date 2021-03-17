# parameter tuning: degree of polynomial in svm model
# Author: Serena Yuan
# project 3 

svm_polynomial_best_degree <- function(dat_train, K) {

  cv.acc <- rep(NA, K)
  for (i in 1:K){
    sclass = svm(formula=label~., data=dat_train, type="C", kernel="polynomial", degree=i)

    ypred <- predict(sclass, testset) 
    tab_svm <- table(ypred, dat_test$label)
    n1 <- tab_svm[1]
    n2 <- tab_svm[2]
    n3 <- tab_svm[3]
    n4 <- tab_svm[4]
    num <- n1+n4
    den <- n1+n2+n3+n4
    acc <- num/den
    cv.acc[i] <- acc

  }
  return(cv.acc) # choose the k with max accuracy
 }
  
