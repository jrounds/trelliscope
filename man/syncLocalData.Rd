% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/webSync.R
\name{syncLocalData}
\alias{syncLocalData}
\title{Sync localDisk Objects to VDB}
\usage{
syncLocalData(vdbConn = getOption("vdbConn"), rsync = NULL)
}
\arguments{
\item{vdbConn}{VDB connection settings}

\item{rsync}{location of rsync binary}
}
\description{
Sync localDisk data that is used for VDB displays located throughout the system to a 'data' directory inside the VDB - useful for collecting data before syncing with a web server, and used inside of \code{\link{webSync}}.
}
\author{
Ryan Hafen
}
\seealso{
\code{\link{webSync}}, \code{\link{webConn}}
}

