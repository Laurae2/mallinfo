mallinfo <- function() .Call("R_mallinfo", PACKAGE="mallinfo")

malloc.trim <- function(pad = 0L) .Call("R_malloc_trim", pad, PACKAGE="mallinfo")

#brk <- function() .Call("R_query_brk", PACKAGE="mallinfo")

#mallopt <- function(param = c("M_MXFAST", "M_TRIM_THRESHOLD", "M_TOP_PAD", "M_MMAP_THRESHOLD", "M_MMAP_MAX", "M_CHECK_ACTION"), value)
#  .Call("R_
