###########################################################
### Train a classification model with training features ###
###########################################################
train_mlp <- function(train_df = dat_train, test_df = dat_test, nodesize = c(64,32), learnPara = 0.05){
  ### Train a classfication model using processed features from training images
  
  ### Input:
  ### - a data frame containing features and labels
  ### - a parameter list
  ### Output: trained model
  
  
  face = face(train_df,test_df)
  
  model <- mlp(face$inputsTrain, face$targetsTrain, size=nodesize, learnFuncParams=learnPara, 
               maxit=50, inputsTest=face$inputsTest, targetsTest=face$targetsTest)

  
  return(model)
}

