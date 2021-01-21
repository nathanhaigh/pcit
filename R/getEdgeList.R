getEdgeList <- function(m, rm.zero=TRUE) {
	nNodes <- unique(dim(m))
	
	if (length(nNodes)!=1) {
		stop("ERROR: 'm' must have the same number of rows as columns.")
	}

	from_idx <- vector(
		mode   = 'integer',
		length = ((nNodes^2)-nNodes) / 2
	)
	to_idx <- vector(
		mode   = 'integer',
		length = ((nNodes^2)-nNodes) / 2
	)
	weight <- vector(
		mode   = 'numeric',
		length = ((nNodes^2)-nNodes) / 2
	)

	result <- .Fortran(
		'getedgelist',
		mat      = as.single(m),
		nGenes   = as.integer(nNodes),
		from_idx = as.integer(from_idx),
		to_idx   = as.integer(to_idx),
		weight   = as.single(weight)
	)

	if (length(dimnames(m))==2) {
		# Both row and column names provided
		edgeList <- data.frame(
			From   = rownames(m)[result$from_idx],
			To     = colnames(m)[result$to_idx],
			Weight = as.vector(result$weight)
		)
	} else if (length(dimnames(m))==0) {
		edgeList <- data.frame(
			From   = as.vector(result$from_idx),
			To     = as.vector(result$to_idx),
			Weight = as.vector(result$weight)
		)
	} else {
		stop("ERROR: 'm' must have both col and row names or neither.")
	}

	if (rm.zero==TRUE) {
		edgeList <- edgeList[edgeList$Weight != 0,]
	}

	return(edgeList)
}
