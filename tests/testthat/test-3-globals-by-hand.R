# not all test environments have Hadoop installed

context("Simple globals by hand works for displays")

vdbPath <- file.path(tempdir(), "vdb")

# divide the ddf by the variable "site"
bySite <- divide(barley, by = "site")

# simple dotplot panel function
pf <- function(x)
  dotplot(variety ~ yield, data = x, pch=globalPCH)

# simple cognostics function
cf <- function(x) {
  list(
    meanYield = cogMean(x$yield, desc = "mean yield"),
    range = cogRange(x$yield, desc = "yield range"),
    # min = min(x$yield),
    min = cog(min(x$yield), desc = "min yield"),
    max = cog(max(x$yield), desc = "min yield")
  )
}

test_that("global saving for all displays works", {
  vdbConn(vdbPath, autoYes = TRUE)
	globalPCH = 21
	data(iris)
	garbage = iris
	saveGlobals(globalPCH,garbage)
	 makeDisplay(bySite,
	    name = "variety_vs_yield",
	    desc = "test display with barley data",
	    panelFn = pf, cogFn = cf,
	    width = 400, height = 400,
	    lims = list(x = "same", y = "free", detect.globals=FALSE)
  	)
	rm(globalPCH)
	# view()
  expect_true(file.exists(file.path(vdbPath, "displays", "common", "variety_vs_yield", "displayObj.Rdata")))
  expect_true(file.exists(file.path(vdbPath, "globals.Rdata")))
 })
