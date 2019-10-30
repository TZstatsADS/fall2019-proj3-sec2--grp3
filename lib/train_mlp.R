###########################################################
### Train a classification model with training features ###
###########################################################
train_mlp <- function(train_df = dat_train, test_df = dat_test, nodesize = c(64,32), learnPara = 0.05){
  ### Train a classfication model using processed features from training images
  
  ### Input:
  ### - a data frame containing features and labels
  ### - a parameter list
  ### Output: trained model
  face <- function(train_df,test_df){
    train_feature <- as.matrix(train_df[,-which(names(train_df) == 'emotion_idx')])
    test_feature<- as.matrix(test_df[,-which(names(test_df) == 'emotion_idx')])
    train_target <- decodeClassLabels(train_df$emotion_idx)
    test_target <- decodeClassLabels(test_df$emotion_idx)
    face <- list("inputsTrain" = train_feature, "targetsTrain" = train_target, "inputsTest" = test_feature,"targetsTest" = test_target)
    face <- normTrainingAndTestSet(face)
    
    return(face)
  }
  
  face = face(train_df,test_df)
  
  model <- mlp(face$inputsTrain, face$targetsTrain, size=nodesize, learnFuncParams=learnPara, 
               maxit=50, inputsTest=face$inputsTest, targetsTest=face$targetsTest)

  
  return(model)
}

