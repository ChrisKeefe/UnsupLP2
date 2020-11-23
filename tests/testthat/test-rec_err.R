test_that("RE output is well-formed", {
  # Compute RE...
  test.data <- iris[1:4]
  num.vars <- ncol(test.data)
  result <- compute.rec.err(test.data, num.vars)

  # result is an Mx2 dataframe (M=num.variables)
  expect_equal(typeof(data.frame()), typeof(result))
  expect_equal(2, ncol(result))
  expect_equal(ncol(test.data), nrow(result))

  # labels are correct
  expect_equal(c("n.principal.components", "rec.error"), names(result))
})

test_that("RE catches invalid num.components arg", {
  test.data <- iris[1:4]
  not.enough.vars <- 0
  too.many.vars <- 999999
  expect_error(compute.rec.err(test.data, too.many.vars), "Invalid argument")
  expect_error(compute.rec.err(test.data, not.enough.vars), "Invalid argument")
})
