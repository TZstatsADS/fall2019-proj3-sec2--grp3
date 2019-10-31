########################################
### Classification with testing data ###
########################################

test_mlp <- function(model, test_df){
  
  ### Input: 
  ###  - the fitted classification model using training data
  ###  - processed features from testing images 
  ### Output: training model specification

  input_test = normalizeData(test_df)
  pred <- predict(model, input_test)
  pred <- encodeClassLabels(pred)
  
  return(pred)
}
