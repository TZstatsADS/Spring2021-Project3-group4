###############################
### Test XGBoost ##############
###############################

xgbtest <- function(model, features){
  res <- predict(model, newdata = features)
  return(res)
}
