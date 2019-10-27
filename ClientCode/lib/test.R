########################################
### Classification with testing data ###
########################################

test <- function(client_model, dat_test){
  
  ### Input: 
  ###  - the fitted classification model using training data
  ###  - processed features from testing images 
  ### Output: training model specification
  
  ### load libraries
  library("e1071")
  
  ### extract model and n.trees parameter
  model <- client_model$model
  n.trees <- client_model$n.trees

  ### make predictions
  pred_vals <- predict.gbm(object=model, newdata=dat_test, n.trees=n.trees,type="response")
  print(head(pred_vals))
  pred <- apply(pred_vals,1,which.max)
  return(pred)
}
