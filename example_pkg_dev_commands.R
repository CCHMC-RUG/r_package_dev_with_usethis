## create package
usethis::create_package("mypackage")
# show files pane

## write function
usethis::use_r("make_sum")
# creates file in R/
make_sum <- function(a, b) {
  a + b
}
devtools::load_all()
make_sum(1,2)
devtools::check()
# or use check in the build pane in Rstudio

## description file
# show file
usethis::use_package("dplyr")

## documenting functions
# code -> insert roxygen skeleton
# fill in skeleton
devtools::document()
# show man/
devtools::load_all()
?make_sum

## testing
usethis::use_testthat()
usethis::use_test() # while in .R file

test_that("make_sum() returns a number", {
  expect_type(make_sum(1, 2), "double")
})

test_that("make_sum() errors if input is not a number", {
  expect_error(make_sum("a", 2))
})

# run test in console or
devtools::test()
devtools::check()
