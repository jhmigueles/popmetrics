test_that("maxth identification works", {
  vector = 1:1000
  mx = maxth(x = vector, k = 1, epoch = 60, consecutive = FALSE)
  expect_equal(mx, 1000)
  mx = maxth(x = vector, k = 5, epoch = 60, consecutive = FALSE)
  expect_equal(mx, 996)
  mx = maxth(x = vector, k = 5, epoch = 10, consecutive = TRUE)
  expect_equal(mx, 986)
})
