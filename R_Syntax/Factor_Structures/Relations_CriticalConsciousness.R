######################################
#   EXPLORATORY FACTOR ANALYSIS 	 #
#            MUSE DATA           	 #
#      RESOURCES - Crit. Cons.       #
######################################

#**************************************************************************************

#############################
# Install Relevant Packages # 
#############################
#install.packages('psych')
#install.packages('GPArotation')
#install.packages('nFactors')
#install.packages('lavaan')
#install.packages('semTools')
#install.packages('paran')
#install.packages('ggplot2')
library(psych)
library(GPArotation)
library(nFactors)
library(lavaan)
library(semTools)
library(paran)
library(psychometric)
library(sjPlot)

#PREP TO READ MPLUS OUTPUT
#install.packages("BiocManager")
#BiocManager::install("rhdf5")
source("/Users/Shauna/Documents/Emory/Work_MUSE/Analysis/EFA_Scripts/mplus.R")

#**************************************************************************************

#############
# Load Data #
#############
#Load full data set
CC_original = read.csv("museEFA_CC_R.csv")
# Removing CC20 and CC21 apriori before EFA analysis
CC_full = CC_original[c(1:19,22:23)]
# Removing #CC07 and CC09
CC_R2 = CC_original[c(1:6,8,10:19,22:23)]
# Removing CC12
CC_R3 = CC_original[c(1:6,8,10:11, 13:19,22:23)]
# Removing CC23
CC_R4 = CC_original[c(1:6,8,10:11, 13:19,23)]


names(CC_original)
names(CC_R4)
nrow(CC_full)

sjt.itemanalysis(CC_full)

#**************************************************************************************

#######################################
# Determine Optimal Number of Factors # 
#######################################
# FROM MPLUS
mplus.view.plots('R_CC_2020-03-30.gh5')
mplus.plot.eigenvalues('R_CC_2020-03-30.gh5')

# R FUNCTIONS
ev <- eigen(cor(na.omit(CC_full)))
ap <- parallel(subject=nrow(CC_full),var=ncol(CC_full),rep=100,cent=.05)
nS <- nScree(x=ev$values, aparallel=ap$eigen$qevpea)
plotnScree(nS)

# R FUNCTIONS
fa.parallel(CC_full,n.obs=NULL,fm="wls",fa="both",main="Parallel Analysis Scree Plots",
n.iter=75,error.bars=FALSE,se.bars=FALSE,SMC=FALSE,ylabel=NULL,show.legend=TRUE,
sim=TRUE,quant=.95,cor="cor",use="pairwise",plot=TRUE,correct=.5)

#**************************************************************************************

########################
# ITEM-RESPONSE THEORY # 
########################
library(ltm)
#install.packages('mirt')
library("mirt")


grm.fit<-grm(CC_full)

ncol(CC_full)
model.gpcm <- 'CC = 1-21' 
results.gpcm <- mirt(data= CC_full, model=model.gpcm, itemtype="graded", SE=TRUE, verbose=FALSE,technical = list(removeEmptyRows=TRUE)) 
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
extr.10 <- extract.item(results.gpcm, 10)
info.10 <- iteminfo(extr.10, Theta)
extr.11 <- extract.item(results.gpcm, 11)
info.11 <- iteminfo(extr.11, Theta)
extr.12 <- extract.item(results.gpcm, 12)
info.12 <- iteminfo(extr.12, Theta)
extr.13 <- extract.item(results.gpcm, 13)
info.13 <- iteminfo(extr.13, Theta)
extr.14 <- extract.item(results.gpcm, 14)
info.14 <- iteminfo(extr.14, Theta)
extr.15 <- extract.item(results.gpcm, 15)
info.15 <- iteminfo(extr.15, Theta)
extr.16 <- extract.item(results.gpcm, 16)
info.16 <- iteminfo(extr.16, Theta)
extr.17 <- extract.item(results.gpcm, 17)
info.17 <- iteminfo(extr.17, Theta)
extr.18 <- extract.item(results.gpcm, 18)
info.18 <- iteminfo(extr.18, Theta)
extr.19 <- extract.item(results.gpcm, 19)
info.19 <- iteminfo(extr.19, Theta)
extr.23 <- extract.item(results.gpcm, 20)
info.23 <- iteminfo(extr.23, Theta)
extr.24 <- extract.item(results.gpcm, 21)
info.24 <- iteminfo(extr.24, Theta)

plot(0, 0, pch = "", xlim=c(-4,4), ylim=c(0,4), xlab="Theta", ylab="",main='Item information')
lines(Theta, info.1, type = 'l',col=1)
lines(Theta, info.2, type = 'l',col=2)
lines(Theta, info.3, type = 'l',col=3)
lines(Theta, info.4, type = 'l',col=4)
lines(Theta, info.5, type = 'l',col=5)
lines(Theta, info.6, type = 'l',col=6)
lines(Theta, info.7, type = 'l',col=7)
lines(Theta, info.8, type = 'l',col=8)
lines(Theta, info.9, type = 'l',col=1,lty=2)
lines(Theta, info.10, type = 'l',col=2, lty =2)
lines(Theta, info.11, type = 'l',col=3, lty =2)
lines(Theta, info.12, type = 'l',col=4, lty =2)
lines(Theta, info.13, type = 'l',col=5, lty =2)
lines(Theta, info.14, type = 'l',col=6, lty =2)
lines(Theta, info.15, type = 'l',col=7, lty =2)
lines(Theta, info.16, type = 'l',col=8, lty =2)
lines(Theta, info.17, type = 'l',col=1, lty =3)
lines(Theta, info.18, type = 'l',col=2, lty =3)
lines(Theta, info.19, type = 'l',col=3, lty =3)
lines(Theta, info.23, type = 'l',col=4, lty =3)
lines(Theta, info.24, type = 'l',col=5, lty =3)
legend("topleft",legend=c("Item 1","Item 2","Item 3","Item 4","Item 5","Item 6","Item 7","Item 8","Item 9","Item 10","Item 11","Item 12","Item 13","Item 14","Item 15","Item 16","Item 17","Item 18","Item 19","Item 23","Item 24"), col=c(1,2,3,4,5,6,7,8,1,2,3,4,5,6,7,8,1,2,3,4,5),lty=c(1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,3,3,3,3,3),cex=0.6)


# Test information
info.test <- testinfo(results.gpcm, Theta)
plot(Theta, info.test, type = 'l',lty=2,main = 'Test information', ylab = 'Information')



#**************************************************************************************


#############
# CITATIONS # 
#############

citation("GPArotation")
citation("psych")
citation("mirt")