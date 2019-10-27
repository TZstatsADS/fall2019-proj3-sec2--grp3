feature <- function(input_list = fiducial_pt_list, index){
  
  ### Construct process features for training images 
  
  ### Input: a list of images or fiducial points; index: train index or test index
  
  ### Output: a data frame containing: features and a column of label
  
  ### here is an example of extracting pairwise distances between fiducial points
  ### Step 1: Write a function pairwise_dist to calculate pairwise distance of items in a vector
  #pairwise_dist <- function(vec){
  ### input: a vector(length n), output: a vector containing pairwise distances(length n(n-1)/2)
  #  return(as.vector(dist(vec)))
  #}
  
  ### Step 2: Write a function pairwise_dist_result to apply function in Step 1 to column of a matrix 
  #pairwise_dist_result <-function(mat){
  ### input: a n*2 matrix(e.g. fiducial_pt_list[[1]]), output: a vector(length n(n-1))
  #  return(as.vector(apply(mat, 2, pairwise_dist))) 
  
  #}
  
  
  eu_distance <- function(mat){
    needed_features <-c(4,8,2,6,13,17,11,15,38,19,23,25,31,27,33,50,54,59,62)
    reduced_mat <-mat[needed_features,]
    eu_distance_result <- c(dist(reduced_mat[c(1,2),]),
                            dist(reduced_mat[c(4,3),]),
                            dist(reduced_mat[c(5,6),]),
                            dist(reduced_mat[c(8,7),]),
                            dist(reduced_mat[c(11,10),]),
                            dist(reduced_mat[c(14,13),]),
                            dist(reduced_mat[c(17,16),]),
                            dist(reduced_mat[c(12,1),]),
                            dist(reduced_mat[c(15,5),]),
                            dist(reduced_mat[c(9,18),]),
                            dist(reduced_mat[c(9,19),]),
                            dist(reduced_mat[c(2,16),]),
                            dist(reduced_mat[c(6,17),])
    )
    return(eu_distance_result) 
  }
  
  
  ### Step 3: Apply function in Step 2 to selected index of input list, output: a feature matrix with ncol = n(n-1) = 78*77 = 6006
  #pairwise_dist_feature <- t(sapply(input_list[index], pairwise_dist_result))
  eu_dist_feature <- t(sapply(input_list[index], eu_distance))
  dim(eu_dist_feature) 
  #dim(pairwise_dist_feature) 
  
  ### Step 4: construct a dataframe containing features and label with nrow = length of index
  ### column bind feature matrix in Step 3 and corresponding features
  #pairwise_data <- cbind(pairwise_dist_feature, info$emotion_idx[index])
  eu_data <- cbind(eu_dist_feature, info$emotion_idx[index])
  ### add column names
  #colnames(pairwise_data) <- c(paste("feature", 1:(ncol(pairwise_data)-1), sep = ""), "emotion_idx")
  colnames(eu_data) <- c(paste("feature", 1:(ncol(eu_data)-1), sep = ""), "emotion_idx")
  ### convert matrix to data frame
  eu_data <- as.data.frame(eu_data)
  ### convert label column to factor
  eu_data$emotion_idx <- as.factor(eu_data$emotion_idx)
  
  return(feature_df = eu_data)
}