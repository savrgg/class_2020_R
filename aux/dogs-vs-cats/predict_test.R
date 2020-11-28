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