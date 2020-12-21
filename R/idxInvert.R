idxInvert <- function(m, idx) {
	if (methods::is(m, "numeric")) {
		nNodes <- m
	} else {
		nNodes <- tryCatch(
			{
				nrow(m)
			},
			error = function(cond) {
				message("ERROR: argument 'm' must be a numeric OR an object on which nrow() can be performed.")
				message(cond)
				return(FALSE)
			}
		)
	}
	
	return(setdiff(1:(nNodes^2), idx))
}
