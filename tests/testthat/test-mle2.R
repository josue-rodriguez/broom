context("mle2 tidiers")

test_that("tidy.mle2 works", {
  skip_if_not_installed("bbmle")
  
  x <- 0:10
  y <- c(26, 17, 13, 12, 20, 5, 9, 8, 5, 4, 8)
  d <- data.frame(x, y)

  fit <- bbmle::mle2(y ~ dpois(lambda = ymean),
    start = list(ymean = mean(y)), data = d
  )
  td <- tidy(fit, conf.int = TRUE)
  check_tidy(td, exp.row = 1, exp.col = 7)
})
