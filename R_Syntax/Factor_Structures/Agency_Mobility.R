###################################
#   EXPLORATORY FACTOR ANALYSIS   #
#          MUSE DATA              #
#      RESOURCES - Mobility       #
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
Mobility_original = read.csv("museEFA_Mobility_R.csv")
Mobility_full = Mobility_original[c(1:6,13:16)]
MobilityR2 = Mobility_full[c(1:3,5:9)]

names(MobilityR2)

sjt.itemanalysis(Mobility_full)

#**************************************************************************************

#######################################
# Determine Optimal Number of Factors # 
#######################################
# FROM MPLUS
mplus.view.plots('R_Mobility_2020-04-06.gh5')
mplus.plot.eigenvalues('R_Mobility_2020-04-06.gh5')

# R FUNCTIONS
ev <- eigen(cor(na.omit(Mobility_full)))
ap <- parallel(subject=nrow(Mobility_full),var=ncol(Mobility_full),rep=100,cent=.05)
nS <- nScree(x=ev$values, aparallel=ap$eigen$qevpea)
plotnScree(nS)

# R FUNCTIONS
fa.parallel(Mobility_full,n.obs=NULL,fm="wls",fa="both",main="Parallel Analysis Scree Plots",
n.iter=75,error.bars=FALSE,se.bars=FALSE,SMC=FALSE,ylabel=NULL,show.legend=TRUE,
sim=TRUE,quant=.95,cor="cor",use="pairwise",plot=TRUE,correct=.5)


#**************************************************************************************

########################
# ITEM-RESPONSE THEORY # 
########################
library(ltm)
#install.packages('mirt')
library("mirt")

grm.fit<-grm(Mobility_full)

ncol(Mobility_full)
model.gpcm <- 'Mobility = 1-10' 
results.gpcm <- mirt(data= Mobility_full, model=model.gpcm, itemtype="graded", SE=TRUE, verbose=FALSE,technical = list(removeEmptyRows=TRUE)) 
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

plot(0, 0, pch = "", xlim=c(-4,4), ylim=c(0,10), xlab="Theta", ylab="",main='Item information')
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
legend("topleft",legend=c("Item 1","Item 2","Item 3","Item 4","Item 5","Item 6","Item 13","Item 14","Item 15","Item 16"), col=c(1,2,3,4,5,6,7,8,1,2),lty=c(1,1,1,1,1,1,1,1,2,2),cex=0.6)


# Test information
info.test <- testinfo(results.gpcm, Theta)
plot(Theta, info.test, type = 'l',lty=2,main = 'Test information', ylab = 'Information')


# Without 14
Mobility_full_no14 = Mobility_full[c(1:7,9:10)]
grm.fit.no14<-grm(Mobility_full_no14)

ncol(Mobility_full_no14)
model.gpcm.no14 <- 'Mobility = 1-9' 
results.gpcm.no14 <- mirt(data= Mobility_full_no14, model=model.gpcm.no14, itemtype="graded", SE=TRUE, verbose=FALSE,technical = list(removeEmptyRows=TRUE)) 
coef.gpcm.no14 <- coef(results.gpcm.no14, IRTpars=TRUE, simplify=TRUE) 
items.gpcm.no14 <- as.data.frame(coef.gpcm.no14$items) 
print(items.gpcm.no14)

#**************************************************************************************


#############
# CITATIONS # 
#############

citation("GPArotation")
citation("psych")