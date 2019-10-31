###########################################################
### Train a classification model with training features ###
###########################################################
train_mlp <- function(train_df = dat_train, nodesize = c(64,32), learnPara){
  ### Train a classfication model using processed features from training images
  
  ### Input:
  ### - a data frame containing features and labels
  ### - a parameter list
  ### Output: trained model
  
  
  train_feature <- as.matrix(train_df[,-which(names(train_df) == 'emotion_idx')])
  train_target <- decodeClassLabels(train_df$emotion_idx)
  train_feature <- normalizeData(train_feature)
  
  model <- mlp(train_feature, train_target, size=nodesize, learnFuncParams=learnPara, 
               maxit=50)

  
  return(model)
}

