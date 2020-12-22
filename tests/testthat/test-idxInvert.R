test_that("idxInvert returns correct indicies of a square matrix", {
  expect_equal(idxInvert(m=matrix(11:14, nrow=2, ncol=2), idx=1), 2:4)
  expect_equal(idxInvert(m=matrix(11:14, nrow=2, ncol=2), idx=c(1)), 2:4)
  expect_equal(idxInvert(m=matrix(11:14, nrow=2, ncol=2), idx=1:2), 3:4)
})

test_that("idxInvert works with the size of a square matrix", {
  expect_equal(idxInvert(m=2, idx=1), 2:4)
  expect_equal(idxInvert(m=2, idx=c(1)), 2:4)
  expect_equal(idxInvert(m=2, idx=1:2), 3:4)
})

test_that("idxInvert works with the dimensions of a square matrix", {
  expect_equal(idxInvert(m=c(2,2), idx=1), 2:4)
  expect_equal(idxInvert(m=c(2,2), idx=c(1)), 2:4)
  expect_equal(idxInvert(m=c(2,2), idx=1:2), 3:4)
})

test_that("idxInvert errors on non-square matricies", {
  expect_error(idxInvert(m=matrix(11:16, nrow=2, ncol=3), idx=1), 'returns a square object')
  expect_error(idxInvert(m=c(2,3), idx=c(1)), 'dimensions of a square matrix.')
})

test_that("idxInvert with non-sensical object for m", {
  expect_error(idxInvert(m="string", idx=1), 'returns a square object')
})