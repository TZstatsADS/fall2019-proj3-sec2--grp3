face <- function(train_df,test_df){
  train_feature <- as.matrix(train_df[,-which(names(train_df) == 'emotion_idx')])
  test_feature<- as.matrix(test_df[,-which(names(test_df) == 'emotion_idx')])
  train_target <- decodeClassLabels(train_df$emotion_idx)
  test_target <- decodeClassLabels(test_df$emotion_idx)
  face <- list("inputsTrain" = train_feature, "targetsTrain" = train_target, "inputsTest" = test_feature,"targetsTest" = test_target)
  face <- normTrainingAndTestSet(face)
  
  return(face)
}