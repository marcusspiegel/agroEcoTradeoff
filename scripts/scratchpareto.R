library(agroEcoTradeoff)
#source("Rmod/tradeoff_mod2.R")
#source("Rmod/constraints_dt3.R")
#source("Rmod/convert_dt4.R")
#source("R/pareto.R")
#source("Rmod/targets2.R")
#source("Rmod/impact_dt2.R")
#source("Rmod/input_handler2.R")
#source("Rmod/fetch_inputs2.R")
#source("Rmod/yield_mod2.R")

# 2 Constraints
# Yield modification
yblist <- list(yb1 <- c(1, 1))
# Target multiplier
targ <- 3
# Refine the step interval over which to search for optimal solutions
step <- 0.25
# Pick the constraints to optimize over
cnames <- c("Ag", "C")

ot <- pareto(cnames = cnames, step = step, yblist = yblist, targ = targ)
# Plot the Pareto front
plot(ot$table$land, ot$table$carbon, xlab = "Total Area Converted (ha)", ylab = "Total Carbon Lost (t)")


# 3 Constraints
# Yield modification
yblist <- list(yb1 <- c(1, 1))
# Target multiplier
targ <- 3
# Refine the step interval over which to search for optimal solutions
step <- 0.5
# Pick the constraints to optimize over
cnames <- c("Ag", "C", "bd")

ot <- pareto(cnames = cnames, step = step, yblist = yblist, targ = targ)

# #Define Margins. 
# par(mar=c(3, 8, 3, 2) + 0.1)
# 
# #Plot the first set of bars
# barplot(ot$carbon, width = 1, space = 3, axes=F, xlab="", ylab="",col="blue", main="", xlim = c(0,195))
# axis(2, at = seq(0, signif(max(ot$carbon), digits = 1), 
#                  signif(max(ot$carbon), digits = 1)/4), col="black",lwd=2, line = -1)
# mtext(2,text="Total Carbon Lost (t)",line=0.75)
# 
# 
# 
# #Plot the second set of bars
# par(new=T)
# barplot(ot$land, width = 1, space = 3, axes=F, xlab="", ylab="",col="black", main="", xlim = c(1,196))
# axis(2, at = seq(0, signif(max(ot$land), digits = 1), 
#                  signif(max(ot$land), digits = 1)/4),lwd=2,line=2)
# mtext(2,text="Total Area Converted (ha)",line=3.75)
# 
# 
# #Plot the third set of bars
# par(new=T)
# barplot(ot$biodiversity, width = 1, space = 3, axes=F, xlab="", ylab="",col="green", main="", xlim = c(2,197))
# axis(2, at = seq(0, signif(max(ot$biodiversity), digits = 1), 
#                  signif(max(ot$biodiversity), digits = 1)/4), lwd=2,line=5)
# mtext(2,text="Total PA Loss (ha)",line=6.75)
# 
# 
# #Dummy x-axis
# axis(1, labels = FALSE, at = c(2, 204))
# mtext("",side=1,col="black",line=2)
# 
# 
# #Plot the legend
# legend(x=130,y= max(ot$biodiversity + 1000),
#        legend=c("biodiversity","land","carbon"), fill = c("green", "black", "blue"), bty = "n")



#3x3 matrix of barplots

par(mfcol = c(3,3))
par(mar=c(4, 4, 2, 2) + 0.1)

ot1 <- data.frame(ot$table)

ot1$colors <- rainbow(length(ot$table$ind))
ot1$ind <- seq(1, length(ot$table$ind))

inds <- ot1$ind
cols <- ot1$colors
ot2 <- ot1[order(ot1$carbon),]
inds2 <- ot2$ind
cols2 <- ot2$colors
ot3 <- ot1[order(ot1$biodiversity),]
inds3 <- ot3$ind
cols3 <- ot3$colors


barplot(ot1$land, names.arg = inds, ylab = "Area Converted (ha)", col = cols, main = "by Area")
barplot(ot1$carbon, names.arg = inds, ylab = "Carbon Loss (t)", col = cols)
barplot(ot1$biodiversity, names.arg = inds, ylab = "PA Loss (ha)", col = cols, xlab = "Scenario Number")

barplot(ot2$land, names.arg = inds2, col = cols2, main = "by Carbon")
barplot(ot2$carbon, names.arg = inds2, col = cols2)
barplot(ot2$biodiversity, names.arg = inds2, col = cols2, xlab = "Scenario Number")

barplot(ot3$land, names.arg = inds3, col = cols3, main = "by PA")
barplot(ot3$carbon, names.arg = inds3, col = cols3)
barplot(ot3$biodiversity, names.arg = inds3, col = cols3, xlab = "Scenario Number")