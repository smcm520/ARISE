###############################
#     ITEM RESPONSE THEORY    #
#         MUSE DATA           #
#     AGENCY - Leadership     #
###############################

#**************************************************************************************
#############################
# Install Relevant Packages # 
#############################
#install.packages('mirt')
library("mirt")

#**************************************************************************************
#############
# Load Data #
#############
#Load full data set
Lead_original = read.csv("museEFA_Lead_R.csv")
# Remove index items for full set of scale items only
Lead_full = Lead_original[c(22:30)]

nrow(Lead_full)
names(Lead_full)

#**************************************************************************************

########################
# ITEM-RESPONSE THEORY # 
########################
ncol(Lead_full)
model.gpcm <- 'Lead = 1-9' 
results.gpcm <- mirt(data= Lead_full, model=model.gpcm, itemtype="graded", SE=TRUE, verbose=FALSE,technical = list(removeEmptyRows=TRUE)) 
coef.gpcm <- coef(results.gpcm, IRTpars=TRUE, simplify=TRUE) 
items.gpcm <- as.data.frame(coef.gpcm$items) 
print(items.gpcm)

# OCC
plot(results.gpcm, type = 'trace', main = "", par.settings = simpleTheme(lty=1:4,lwd=2), auto.key=list(points=FALSE,lines=TRUE, columns=4))

# IICs
Theta <- matrix(seq(-4,4, by = .1))
extr.1 <- extract.item(results.gpcm, 1)
info.1 <- iteminfo(extr.1, Theta)
extr.2 <- extract.item(results.gpcm, 2)
info.2 <- iteminfo(extr.2, Theta)
extr.3 <- extract.item(results.gpcm, 3)
info.3 <- iteminfo(extr.3, Theta)
extr.4 <- extract.item(results.gpcm, 4)
info.4 <- iteminfo(extr.4, Theta)
extr.5 <- extract.item(results.gpcm, 5)
info.5 <- iteminfo(extr.5, Theta)
extr.6 <- extract.item(results.gpcm, 6)
info.6 <- iteminfo(extr.6, Theta)
extr.7 <- extract.item(results.gpcm, 7)
info.7 <- iteminfo(extr.7, Theta)
extr.8 <- extract.item(results.gpcm, 8)
info.8 <- iteminfo(extr.8, Theta)
extr.9 <- extract.item(results.gpcm, 9)
info.9 <- iteminfo(extr.9, Theta)

plot(0, 0, pch = "", xlim=c(-4,4), ylim=c(0,12), xlab="Theta", ylab="",main='Item information')
lines(Theta, info.1, type = 'l',col=1)
lines(Theta, info.2, type = 'l',col=2)
lines(Theta, info.3, type = 'l',col=3)
lines(Theta, info.4, type = 'l',col=4)
lines(Theta, info.5, type = 'l',col=5)
lines(Theta, info.6, type = 'l',col=6)
lines(Theta, info.7, type = 'l',col=7)
lines(Theta, info.8, type = 'l',col=8)
lines(Theta, info.9, type = 'l',col=1,lty=2)
legend("topleft",legend=c("Item 13","Item 14","Item 15","Item 16","Item 17","Item 18","Item 19","Item 20","Item 21"), col=c(1,2,3,4,5,6,7,8,1),lty=c(1,1,1,1,1,1,1,1,2),cex=0.6)

# Test information
info.test <- testinfo(results.gpcm, Theta)
plot(Theta, info.test, type = 'l',lty=2,main = 'Test information', ylab = 'Information')

#**************************************************************************************

#############
# CITATIONS # 
#############
citation("mirt")

