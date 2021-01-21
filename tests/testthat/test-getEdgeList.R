test_that("getEdgeList returns edges from upper triangle of matrix with dimnames", {
  l <- c('g1','g2','g3')
  m.in <- matrix(1:(length(l)^2), nrow=3, ncol=3, dimnames=list(l,l))
  diag(m.in) <- 0

  m.out <- data.frame(
    From   = c('g1', 'g1', 'g2'),
    To     = c('g2', 'g3', 'g3'),
    Weight = c(4, 7, 8)
  )

  expect_equal(getEdgeList(m=m.in), m.out)
})
