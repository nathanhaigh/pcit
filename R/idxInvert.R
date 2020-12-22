idxInvert <- function(m, idx) {
	if (methods::is(m, "numeric")) {
		if (length(m)==1) {
			nNodes <- m
		} else if (length(m)==2 & m[1]==m[2]) {
			nNodes <- m[1]
		} else {
			stop("ERROR: when providing the size of a matrix using 'm', it must be a single numeric or the dimensions of a square matrix.")
		}
	} else if (length(unique(dim(m)))!=1) {
		stop("ERROR: when providing the actual matrix using 'm', it must be square.")
	} else {
		nNodes <- tryCatch(
			{
				nrow(m)
			},
			error = function(cond) {
				stop("ERROR: argument 'm' must be a numeric OR an object on which nrow() can be performed.")
			}
		)
	}
	
	return(setdiff(1:(nNodes^2), idx))
}
