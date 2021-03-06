% Generated by roxygen2 (4.1.0): do not edit by hand
% Please edit documentation in R/convert_r.R
\name{convert_r}
\alias{convert_r}
\title{Land conversion module}
\usage{
convert_r(conv_prob, target, crop_frac, pot_yield, code, cropnames,
  write_out = FALSE)
}
\arguments{
\item{conv_prob}{Conversion probability brick (from \code{\link{constraints*}})}

\item{target}{Production target data.frame}

\item{crop_frac}{RasterBrick of crop allocation fraction}

\item{pot_yield}{RasterBrick of potential crop yields (modified by ybeta)}

\item{code}{Unique simulation code resulting from run_code function}

\item{cropnames}{Vector of crop names in analysis}

\item{write_out}{FALSE (default) or TRUE. If TRUE, brick is written to disk}
}
\description{
This module takes inputs from the targets and constraints
modules and determines which pixels are converted.
}
\details{
This function relies on vectorization of input rasters to rank
pixels for each crop by their conversion probability, calculate the cumulative
production from most likely to least likely to be converted, and then finding
the pixels which are less than the production target. These are marked as
converted.
}
\examples{
rc <- run_code(input_key = "ZA")
il <- fetch_inputs(input_key = "ZA", input = "R")
ybetas <- list(1, 1)
ybeta <- yield_mod_r(inlist = il[c("p_yield", "pp_curr")], ybetas = ybetas,
                     cropnames = il$cropnames)
prod_targ <- c("maize" = 2, "cassava" = 2, "ground" = 2, "cotton" = 2,
               "soy" = 2, "pulse" = 2, "sunflower" = 2, "sugarcane" = 2,
               "wheat" = 2)
target <- targets_r(prod_targ, currprod = il$currprod,
                    potprod = ybeta$pp_curr, cropnames = il$cropnames)
cbetas <- c("y_std" = 0, "C" = 1, "bd" = 1, "cost" = 1)
clist <- list("y_std" = ybeta$y_std, "C" = il$carbon_p, "bd" = il$cons_p,
              "cost" = il$cost)
conv_prob <- constraints_r(inlist = clist, cbetas = cbetas, code = rc,
                           cropnames = il$cropnames)
conv <- convert_r(conv_prob = conv_prob, target = target,
                  crop_frac = il$cropfrac, pot_yield = ybeta$p_yield,
                  code = il$code, cropnames = il$cropnames)
plot(conv)
}

