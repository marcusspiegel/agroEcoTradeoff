% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/utilities.R
\name{spatial_meta}
\alias{spatial_meta}
\title{Fetches raster meta data for study area}
\usage{
spatial_meta(input_key)
}
\arguments{
\item{input_key}{Input key (country code) passed through trademod function}
}
\description{
Fetches raster meta data for study area
}
\note{
This will likely be replaced by upgrades to dtraster package, which
will provide header data for raster tables. Currently this reads metadata
from a raster mask of the study area.
}
\keyword{internal}

