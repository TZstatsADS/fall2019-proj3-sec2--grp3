###########################################################
### Train a classification model with training features ###
###########################################################
train <- function(feature_df = pairwise_data, par = NULL){
  ### Train an SVM model using processed features from training images
  
  ### Input:
  ### - a data frame containing features and labels
  ### - a parameter list
  ### Output: trained model
  
  ### load libraries
  if(!require("gbm")){
    install.packages("gbm")
  }
  library(gbm)
  
  ### Train with boosted stump
  if(is.null(par)){
    t = 100
  } else {
    t = par$t
 }
  
  stump_model <- gbm(emotion_idx~., data=feature_df,
                      distribution = "multinomial",
                      n.trees = t)
  
  client_model <- list(model=stump_model,n.trees=t)

  return(client_model)
}