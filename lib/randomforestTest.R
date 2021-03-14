###prediction with test
test_randomForest <- function(model, features){
  return(predict(model, features))}