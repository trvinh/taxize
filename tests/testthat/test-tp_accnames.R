context("tp_accnames")

test_that("tp_accnames returns the correct class", {
  skip_on_cran() # uses secrets
  vcr::use_cassette("tp_accnames", {
    out <- suppressMessages(tp_accnames(id = 25503923))
  }, preserve_exact_body_bytes = TRUE)

  if ("Error" %in% names(out)) skip("error in tp_accnames call - skipping")

  expect_that(out, is_a("list"))
  expect_that(out$synonyms, is_a("data.frame"))
  expect_that(out$acceptednames, is_a("data.frame"))
  expect_that(out$reference, is_a("data.frame"))
  
	expect_is(out$reference$referenceid, "integer")
	expect_that(out$reference$abbreviatedtitle, is_a("character"))
})
