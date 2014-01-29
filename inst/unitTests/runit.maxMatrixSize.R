### --- Test setup ---

if(FALSE) {
	## Not really needed, but can be handy when writing tests
	library("RUnit")
	library("PCIT")
}

### --- Test functions ---

test.maxMatrixSize <- function() {
	#res <- inspect(maxMatrixSize(1, units='GB'), track=track)
	res <- maxMatrixSize(1, units='GB')
	checkEquals(res, 6688)
}
