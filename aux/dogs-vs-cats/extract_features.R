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