#' DYNPROG
#'
#' Performs optimal changepoint detection, using the dynamic programming-based
#'   `Opt` algorithm described in Truong et al. (2020). Full text available at:
#'   <https://arxiv.org/pdf/1801.00718.pdf>
#'
#' @param data_vec A numeric vector of signal or time-series data with indices of length T
#' @param kmax An integer value: the maximum number of segments to be computed
#'
#' @return a matrix of cost values with K rows and T columns
#' @export
#'
#' @examples
#' # TODO: make some examples
#'
DYNPROG <- function(data_vec, kmax){
  max.index <- length(data_vec)

  # Initialize matrix and calculate first row of costs
  cost_mat <- matrix(data=NA, nrow=kmax, ncol=length(data_vec))
  sum.data <- cumsum(data_vec)
  sum.sq.data <- cumsum(data_vec^2)

  cost_mat[1,] <- sum.sq.data - (sum.data)^2 / seq_along(data_vec[1:max.index])

  # pad data to alleviate off-by-one
  sum.data <- c(0, sum.data)
  sum.sq.data <- c(0, sum.sq.data)

  # use the previous row results to find the optimal results for the current row
  for (k.segs in 2:kmax)
  {
    # inner loop calculates optimal values up to index t
    for (split.idx in k.segs:max.index){
      prev.row.min <- cost_mat[(k.segs-1), (k.segs-1):(split.idx-1)]
      last.segment.min <- (sum.sq.data[split.idx+1] - sum.sq.data[k.segs:split.idx] -
                             (sum.data[(split.idx+1)]-sum.data[k.segs:split.idx])^2 /
                             (split.idx+1-(k.segs:split.idx)))
      cost_mat[k.segs, split.idx] <- min(prev.row.min + last.segment.min)
    }
  }

  cost_mat
}
