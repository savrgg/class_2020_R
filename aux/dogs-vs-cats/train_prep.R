train_prep <- function(images, size, channels){
  
  count<- length(images)
  master_array <- array(NA, dim=c(count,size, size, channels))
  
  for (i in seq(length(images))) {
    img <- image_load(path = paste("data/dogs-vs-cats/train/", images[i], sep=""), target_size = c(size,size))
    img_arr <- image_to_array(img)
    img_arr <- array_reshape(img_arr, c(1, size, size, channels))
    master_array[i,,,] <- img_arr
  }
  return(master_array)
}