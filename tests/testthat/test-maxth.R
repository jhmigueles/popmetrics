test_that("maxth identification works", {
  vector = 1:3000
  mx = maxth(x = vector, k = 1, epoch = 60, consecutive = FALSE)
  expect_equal(mx, 3000)
  mx = maxth(x = vector, k = 5, epoch = 60, consecutive = FALSE)
  expect_equal(mx, 2996)
  mx = maxth(x = vector, k = 5, epoch = 10, consecutive = TRUE)
  expect_equal(mx, 2971)
})
