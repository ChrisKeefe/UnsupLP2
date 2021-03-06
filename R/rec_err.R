#' REC_ERR
#'
#' Calculates reconstruction error (RE) of PCA for a feature matrix.
#'
#' @param data.mat An N x M matrix, containing N rows (observations) and M
#'   columns (data features)
#' @param n.components An integer representing the number of principal
#'   components to calculate and measure RE for. Must not exceed M.
#'
#' @return a two-column dataframe of rec.error data by number of PCs.
#' @export
#'
#' @examples
#' # Prep data
#' unlabeled.iris.data <- iris[1:4]
#' num.vars <- ncol(unlabeled.iris.data)
#'
#' # Compute RE on the unlabeled iris data
#' rec.err.df <- compute.rec.err(unlabeled.iris.data, num.vars)
#'
#' # Plot RE over model complexity
#' plot(rec.err.df$n.principal.components, rec.err.df$rec.error,
#'      xlab="# PCs", ylab="Reconstruction Err")
compute.rec.err <- function(data.mat, n.components){
  if (n.components > nrow(data.mat) | n.components < 1){
    stop("Invalid argument: n.components must be between 1 and the number of variables in data.mat")
  }

  data.mat <- as.matrix(data.mat)
  subset.fit <- PCA(data.mat)
  data.mean <- matrix(colMeans(data.mat), nrow=nrow(data.mat),
                      ncol=ncol(data.mat), byrow=TRUE)
  prev.fit <- data.mean
  fit.list <- list()
  rec.err.list <- list()

  for (n.pcs in 1:n.components){
    rotation.mat <- matrix(subset.fit[["rotation"]][, n.pcs], nrow=nrow(data.mat),
                           ncol=ncol(data.mat), byrow = TRUE)
    lambda.vec <- subset.fit[["x"]][, n.pcs]

    # Compute reconstruction error
    prev.fit <- prev.fit + rotation.mat * lambda.vec
    fit.list[[paste(n.pcs)]] <- prev.fit
    rec.err.list[[paste(n.pcs)]] <- sum((data.mat - prev.fit)^2)
  }

  data.frame(n.principal.components=1:n.components,
             rec.error=c(t(do.call(rbind, rec.err.list))))
}
