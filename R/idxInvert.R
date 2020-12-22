idxInvert <- function(m, idx) {
	if (methods::is(m, "numeric")) {
		if (length(m)==1) {
			nNodes <- m
		} else if (length(m)==2 & m[1]==m[2]) {
			nNodes <- m[1]
		} else {
			stop("ERROR: when providing the size of a matrix using 'm', it must be a single numeric or the dimensions of a square matrix.")
		}
	} else {
		nNodes <- unique(dim(m))

		if (length(nNodes)!=1) {
			stop("ERROR: argument 'm' must be the dimentions or size of a square matrix on an object on which dim() returns a square object.")
		}
	}
	
	return(setdiff(1:(nNodes^2), idx))
}
