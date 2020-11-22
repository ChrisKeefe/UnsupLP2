#' PCA
#'
#' Performs Principal Components Analysis (PCA) of a given feature matrix, using
#'   Singular Value Decomposition (SVD). Principal components are ordered by
#'   weight, allowing the projection of data onto some user-selected number of
#'   principal components, where PC1 is the line that describes the most
#'   variance in the data, PC2 the second-most variance, etc. This property
#'   makes PCA a valuable tool for dimensionality reduction and
#'   plotting/interrogation of high-dimensional data.
#'
#'   By default, this implementation performs centering but not scaling of data.
#'   If your data requires scaling, see `?scale`.
#'
#' @param data.matrix An N x M matrix, containing N rows (observations) and M
#'   columns (data features)
#'
#' @return A **list** containing the following results:
#'
#' \item{`center`}{a length-M named vector representing the column means of the
#'   input data after centering}
#' \item{`rotation`}{an MxM dataframe of PCA loadings}
#' \item{`x`}{an NxM dataframe of Principal Component vectors}
#'
#' @export
#'
#' @examples
#' # Compute principal coordinates of the (unlabeled) iris data
#' iris.fit <- PCA(iris[1:4])
#' iris.pcs <- as.data.frame(iris.fit[["x"]])
#'
#' # re-apply labels...
#' iris.pcs[, "species"] <- iris[5]
#'
#' # ... then plot a 2D projection of the data
#' spec.names <- iris.pcs$species
#' plot(iris.pcs$PC1, iris.pcs$PC2, col=spec.names, xlab="PC1", ylab="PC2")
#' legend("bottom", legend=levels(spec.names), pch=16, col=unique(spec.names))
#'
PCA <- function(data.matrix){
  # standardize the columns
  my.center <- scale(data.matrix, center = TRUE, scale=FALSE)
  center.means <- attributes(my.center)[['scaled:center']]

  # calculate svd
  svd.res <- svd(my.center)

  # capture rotation and x matrices
  rotation <- svd.res$v
  x <- svd.res[["u"]] %*% diag(svd.res[["d"]])

  # rename x and rotation dfs
  rotation <- as.data.frame(rotation)
  names(rotation) <- paste0("PC", seq.int(ncol(data.matrix)))
  x <- as.data.frame(x)
  names(x) <- paste0("PC", seq.int(ncol(data.matrix)))

  return(list("center"=center.means, "rotation"=rotation,
              "x"=x))
}
