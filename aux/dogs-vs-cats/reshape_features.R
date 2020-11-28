reshape_features <- function(features) {
  array_reshape(features, dim = c(nrow(features), 3 * 3 * 2048))
}