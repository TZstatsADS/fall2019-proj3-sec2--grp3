########################
### Cross Validation ###
########################

### Author: Chengliang Tang
### Project 3

cv.function <- function(train_df,nodesize = c(64,32), learnPara = 0.05,K){
  ### Input:
  ### - train data frame
  ### - K: a number stands for K-fold CV
  ### - tuning parameters 
  
  n <- dim(train_df)[1]
  n.fold <- round(n/K, 0)
  set.seed(0)
  s <- sample(rep(1:K, c(rep(n.fold, K-1), n-(K-1)*n.fold)))  
  cv.error <- rep(NA, K)
  
  for (i in 1:K){
    train.data <- train_df[s != i,]
    test.data <- train_df[s == i,] 
    face = face(train.data,test.data)
    model <- mlp(face$inputsTrain, face$targetsTrain, size=nodesize, learnFuncParams=learnPara, 
                 maxit=50, inputsTest=face$inputsTest, targetsTest=face$targetsTest)
    pred = encodeClassLabels(predict(model,face$inputsTest))
   
    error <- mean(pred != test.data$emotion_idx) 
    print(error)
    cv.error[i] <- error
    
  }			
  return(c(mean(cv.error),sd(cv.error)))
}