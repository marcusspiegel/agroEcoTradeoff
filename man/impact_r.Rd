% Generated by roxygen2 (4.1.0): do not edit by hand
% Please edit documentation in R/impact_r.R
\name{impact_r}
\alias{impact_r}
\title{Calculates impacts of cropland conversions}
\usage{
impact_r(conv, carbon, pot_yield, div_list, crop_frac, cropnames, ha)
}
\arguments{
\item{conv}{Raster* of cropland conversions}

\item{carbon}{RasterBrick of veg and soil carbon stocks}

\item{pot_yield}{RasterBrick of potential crop yields (modified as needed)}

\item{div_list}{list of diversity rasters}

\item{crop_frac}{Raster* of cropland fractions}

\item{cropnames}{Vector of crop names in analysis}

\item{ha}{Pixel area}
}
\description{
Calculates impacts of cropland conversions
}
\details{
Calculates summary statistics of the impacts of cropland
conversions, including total tons carbon lost, carbon loss/ton crop yield,
total area converted per crop, total area loss of PAs, mean diversity of
converted pixels, mean diversity/ton crop yield
}
\note{
Some estimate of fragmentation might be useful here. I have to fix
impacts to not double-count where winter-crops are grown (wheat here)
}

