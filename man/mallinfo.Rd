\name{mallinfo}
\alias{mallinfo}
\title{
Query system memory allocation information.
}
\description{
This is a front-end to the memory allocation information function
\code{mallinfo} provided by GNU C Library and the SVID/XPG
standard.
}
\usage{
mallinfo()
}
\value{
A vector of named integer values as defined by the standard.
Please consult your system man page for \code{mallinfo} to interpret
the values.
}
\author{
Simon Urbanek
}
\examples{
mallinfo()
}
\keyword{sysdata}
