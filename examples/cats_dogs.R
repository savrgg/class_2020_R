# This code is an example of AI with 

library(ggplot2)
library(readr)
library(keras)
library(imager)
library(reticulate)
library(magick)
use_condaenv('r-reticulate')
library(tensorflow)

cats<- list.files(path = "data/dogs-vs-cats/train/", pattern = "cat.+")
dogs<- list.files(path = "data/dogs-vs-cats/train/", pattern = "dog.+")

size = 150
channels = 3

train <- c(cats[1:3000],dogs[1:3000])
train <- sample(train)

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

test_prep <- function(images, size, channels){
  
  count<- length(images)
  master_array <- array(NA, dim=c(count,size, size, channels))
  
  for (i in seq(length(images))) {
    ### load jpeg into imageR
    img <- image_load(path = paste("data/dogs-vs-cats/test/", images[i], sep=""), target_size = c(size,size))
    img_arr <- image_to_array(img)
    img_arr <- array_reshape(img_arr, c(1, size, size, channels))
    master_array[i,,,] <- img_arr
  }
  return(master_array)
}

x_test <- test_prep(list.files(path = "data/dogs-vs-cats/test/"), size, channels)

conv_base <- application_inception_v3(
  weights = "data/inception_v3_weights_tf_dim_ordering_tf_kernels_notop.h5",
  include_top = FALSE,
  input_shape = c(size, size, channels)
)

train_datagen <- image_data_generator(rescale = 1/255)           
batch_size = 50

extract_features <- function(x, y, sample_count, test = FALSE) {
  features <- array(0, dim = c(sample_count, 3, 3, 2048))
  labels <- array(0, dim = c(sample_count))
  
  generator <- flow_images_from_data(
    x = x, 
    y = y,
    generator = train_datagen,                                                                                       
    batch_size = batch_size
  )
  
  i <- 0
  while(TRUE) {
    batch <- generator_next(generator)
    inputs_batch <- batch[[1]]
    labels_batch <- batch[[2]]
    features_batch <- conv_base %>% predict(inputs_batch)
    index_range <- ((i * batch_size)+1):((i + 1) * batch_size)
    features[index_range,,,] <- features_batch
    labels[index_range] <- labels_batch
    i <- i + 1
    print(i)
    rm(inputs_batch)
    rm(features_batch)
    rm(index_range)
    rm(batch)
    gc()
    if (i * batch_size >= sample_count)
      break                                              
  }
  rm(generator)
  rm(inputs_batch)
  rm(features_batch)
  rm(index_range)
  rm(batch)
  gc()
  list(
    features = features,
    labels = labels
  )
}

id <- list.files(path = "data/dogs-vs-cats/test/")
id<- gsub("dog.|cat.|.jpg", "", id)

x_train <- train_prep(train, size, channels)
y_train <- as.numeric(grepl("dog.", train, ignore.case = TRUE))

train <- extract_features(x_train, y_train, 6000)

#rm(x_train)
gc()


reshape_features <- function(features) {
  array_reshape(features, dim = c(nrow(features), 3 * 3 * 2048))
}
train$features <- reshape_features(train$features)
# validation$features <- reshape_features(validation$features)

model <- keras_model_sequential() %>%
  layer_dense(units = 256, activation = "relu",
              input_shape = 3 * 3 * 2048) %>%
  layer_dropout(rate = 0.5) %>%
  layer_dense(units = 1, activation = "sigmoid")

model %>% compile(
  loss = "binary_crossentropy",
  optimizer = optimizer_rmsprop(lr = 1e-4),
  metrics = c("accuracy")
)

model %>% fit(
  train$features, train$labels,
  epochs = 10
  #   ,
  #   validation_data = list(validation$features, validation$labels)
)

gc()

predict_test <- function(ts,id, size){
  print(size)
  predictions <- c()
  ids <- c()
  i <- 0
  for(i in 0:4){
  
    x <- ts[(i*size+1):((i+1)*size),,,]
    iid <- id[(i*size+1):((i+1)*size)]
    test <- extract_features(x,iid, size)
    ids <- c(ids, test$labels)
    test <- reshape_features(test$features)
    prediction <- model %>% predict(test)
    predictions <- c(predictions, prediction)
    i <- i+1
    rm(x)
    rm(iid)
    rm(prediction)
    rm(test)
    gc()
    if((i * size) >= length(id)){
      break
    }
  }
  list(
    predictions = predictions,
    ids = ids
  )
}


pred <- predict_test(ts = x_test, id = id, size = 2500)


i = 1899
name <- paste0("data/dogs-vs-cats/test/",pred$ids[i],".jpg")
name <- "data/dogs-vs-cats/delfin0_0.jpg"
img <- magick::image_read(name)
ifelse(round(pred$predictions[i],digits = 0) == 1, "perro", "gato")
plot(img)



library(tidyverse)

pred %>% data.frame() %>% 
  select(ids, predictions) %>% 
  set_names("id","label") %>% 
  write.csv("submission.csv", row.names = F)

