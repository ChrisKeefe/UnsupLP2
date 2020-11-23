test_that("PCA output is well-formed", {
  test.data <- iris[1:4]
  result <- PCA(test.data)

  # result is a list
  expect_equal(typeof(list()), typeof(result))

  # center is a vector of floats
  expect_equal(typeof(result$center), "double")
  expect_equal(length(result$center), ncol(test.data))

  # x is NxM (N=observations, M=variables)
  expect_equal(ncol(test.data), ncol(result$x))
  expect_equal(nrow(test.data), nrow(result$x))

  # rotation is MxM
  expect_equal(ncol(test.data), ncol(result$rotation))
  expect_equal(ncol(test.data), nrow(result$rotation))

  # PC labels are correct
  expect_equal("PC1", names(result$x[1]))
  expect_equal("PC4", names(result$rotation[4]))
})
