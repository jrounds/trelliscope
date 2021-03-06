
# untar data if there is any
dataTar <- file.path("data.tar")
if(file.exists(dataTar)) {
  utils::untar(dataTar, exdir = getwd())
  unlink(dataTar)
}

vdbGlobalsFile <- "data/globals.Rdata"
if(file.exists(vdbGlobalsFile)) {
	message("Loading data/globals.Rdata")
	load(vdbGlobalsFile)
}

sourceAll <- function(dir) {
	f <- list.files(dir, "*.R", full.names = TRUE)

	if(length(f) == 0)
		return()

	for(f0 in f) {
		message(f0)
		try( {source(f0)} )
	}
}

sourceFiles <- "data/R"

if(dir.exists(sourceFiles)) {
	message("Sourcing data/R")
	sourceAll(sourceFiles)
}

