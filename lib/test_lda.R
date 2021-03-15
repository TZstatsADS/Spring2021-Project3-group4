###########################################################
### Make predictions with test features for lda model ###
###########################################################

test <- function(model, test_data){
  #library("MASS")
  pred <- predict(model, test_data)
  return(pred)
}