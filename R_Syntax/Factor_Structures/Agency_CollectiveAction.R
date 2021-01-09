###################################
#   EXPLORATORY FACTOR ANALYSIS   #
#          MUSE DATA              #
#      AGENCY - Coll. Action      #
###################################

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
CA_original = read.csv("museEFA_CA_R.csv")
CA_full = CA_original[c(23:33)]
CAR2 = CA_full[c(1:2,4:11)]
CAR3 = CA_full[c(1:2,4:7,9:11)]

names(CAR3)

sjt.itemanalysis(CA_full)

#**************************************************************************************

#######################################
# Determine Optimal Number of Factors # 
#######################################
# FROM MPLUS
mplus.view.plots('A_CA_2020-04-13.gh5')
mplus.plot.eigenvalues('A_CA_2020-04-13.gh5')

# R FUNCTIONS
ev <- eigen(cor(na.omit(CA_full)))
ap <- parallel(subject=nrow(CA_full),var=ncol(CA_full),rep=100,cent=.05)
nS <- nScree(x=ev$values, aparallel=ap$eigen$qevpea)
plotnScree(nS)

# R FUNCTIONS
fa.parallel(CA_full,n.obs=NULL,fm="wls",fa="both",main="Parallel Analysis Scree Plots",
n.iter=75,error.bars=FALSE,se.bars=FALSE,SMC=FALSE,ylabel=NULL,show.legend=TRUE,
sim=TRUE,quant=.95,cor="cor",use="pairwise",plot=TRUE,correct=.5)


#**************************************************************************************

########################
# ITEM-RESPONSE THEORY # 
########################
library(ltm)
#install.packages('mirt')
library("mirt")


grm.fit<-grm(CA_full)

ncol(CA_full)
model.gpcm <- 'CA = 1-11' 
results.gpcm <- mirt(data= CA_full, model=model.gpcm, itemtype="graded", SE=TRUE, verbose=FALSE,technical = list(removeEmptyRows=TRUE)) 
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

plot(0, 0, pch = "", xlim=c(-4,4), ylim=c(0,6), xlab="Theta", ylab="",main='Item information')
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
legend("topleft",legend=c("Item 12","Item 14","Item 15","Item 16","Item 17","Item 18","Item 19","Item 21","Item 22","Item 23","Item 24"), col=c(1,2,3,4,5,6,7,8,1,2,3),lty=c(1,1,1,1,1,1,1,1,2,2,2),cex=0.6)


# Test information
info.test <- testinfo(results.gpcm, Theta)
plot(Theta, info.test, type = 'l',lty=2,main = 'Test information', ylab = 'Information')


#**************************************************************************************


#############
# CITATIONS # 
#############

citation("GPArotation")
citation("psych")