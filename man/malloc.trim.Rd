\name{malloc.trim}
\alias{malloc.trim}
\title{
Request memory release from the system.
}
\description{
See \code{malloc_trim} function in your OS for details - it requests
the OS memory subsystem to return any unused memory to use for the OS.
This functionality is only supported by GNU C library.
}
\usage{
malloc.trim(pad = 0L)
}
\arguments{
  \item{pad}{
    amount of memory (in bytes) to retain for future allocation requests
  }
}
\details{
This function is merely a direct call to \code{malloc_trim} in glibc,
it does not trigger garbage collection, so in most cases you should
call \code{gc()} first for this to have a meaningful effect of
reclaiming memory.
}
\note{
By default this function is called by \code{free()} on a large enough
block so in general there is no need to call this function directly. It
is only meant for diagnostic purposes. Also note that glibc uses
chunked allocation, so it will not release chunks that are not
entriely unused - in the worst case scenario it is possible that no
memory can be reclaimed even if most of it is unused.
}
\value{
Logical, \code{TRUE} if memory was reclaimed, \code{FALSE} otherwise.
}
\author{
Simon Urbanek
}
\seealso{
\code{\link{gc}}, \code{\link{mallinfo}}
}
\examples{
a <- rnorm(1e7)
mallinfo()
rm(a)
gc()
malloc.trim()
mallinfo()
}
\keyword{sysdata}
