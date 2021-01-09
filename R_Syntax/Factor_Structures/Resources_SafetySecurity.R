###############################
# EXPLORATORY FACTOR ANALYSIS #
#        MUSE DATA            #
#      RESOURCES - SS       #
###############################

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
SS_original = read.csv("museEFA_SS_R.csv")
SS_full = SS_original[c(1:15,21:37)]
SS_R2 = SS_full[c(1:19,21:22,24,26,28:32)]
SS_R3 = SS_full[c(1:7,9:19,21:22,24,26,28:31)]

names(SS_full)
names(SS_R3)
nrow(SS_full)

sjt.itemanalysis(SS_full)

#**************************************************************************************

#######################################
# Determine Optimal Number of Factors # 
#######################################
# FROM MPLUS
mplus.view.plots('R_SS_2020-03-30.gh5')
mplus.plot.eigenvalues('R_SS_2020-04-01.gh5')

# R FUNCTIONS
ev <- eigen(cor(na.omit(SS_full)))
ap <- parallel(subject=nrow(SS_full),var=ncol(SS_full),rep=100,cent=.05)
nS <- nScree(x=ev$values, aparallel=ap$eigen$qevpea)
plotnScree(nS)

# R FUNCTIONS
fa.parallel(SS_full,n.obs=NULL,fm="wls",fa="both",main="Parallel Analysis Scree Plots",
n.iter=75,error.bars=FALSE,se.bars=FALSE,SMC=FALSE,ylabel=NULL,show.legend=TRUE,
sim=TRUE,quant=.95,cor="cor",use="pairwise",plot=TRUE,correct=.5)

#**************************************************************************************

########################
# ITEM-RESPONSE THEORY # 
########################
library(ltm)
#install.packages('mirt')
library("mirt")


grm.fit<-grm(SS_full)

ncol(SS_full)
model.gpcm <- 'SS = 1-32' 
results.gpcm <- mirt(data= SS_full, model=model.gpcm, itemtype="graded", SE=TRUE, verbose=FALSE,technical = list(removeEmptyRows=TRUE)) 
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
extr.8 <- extract.item(results.gpcm, 4)
info.8 <- iteminfo(extr.8, Theta)
extr.9 <- extract.item(results.gpcm, 5)
info.9 <- iteminfo(extr.9, Theta)
extr.10 <- extract.item(results.gpcm, 6)
info.10 <- iteminfo(extr.10, Theta)
extr.11 <- extract.item(results.gpcm, 7)
info.11 <- iteminfo(extr.11, Theta)
extr.12 <- extract.item(results.gpcm, 8)
info.12 <- iteminfo(extr.12, Theta)
extr.13 <- extract.item(results.gpcm, 9)
info.13 <- iteminfo(extr.13, Theta)
extr.14 <- extract.item(results.gpcm, 10)
info.14 <- iteminfo(extr.14, Theta)
extr.15 <- extract.item(results.gpcm, 11)
info.15 <- iteminfo(extr.15, Theta)
extr.4 <- extract.item(results.gpcm, 12)
info.4 <- iteminfo(extr.4, Theta)
extr.5 <- extract.item(results.gpcm, 13)
info.5 <- iteminfo(extr.5, Theta)
extr.6 <- extract.item(results.gpcm, 14)
info.6 <- iteminfo(extr.6, Theta)
extr.7 <- extract.item(results.gpcm, 15)
info.7 <- iteminfo(extr.7, Theta)
extr.21 <- extract.item(results.gpcm, 16)
info.21 <- iteminfo(extr.21, Theta)
extr.22 <- extract.item(results.gpcm, 17)
info.22 <- iteminfo(extr.22, Theta)
extr.23 <- extract.item(results.gpcm, 18)
info.23 <- iteminfo(extr.23, Theta)
extr.24 <- extract.item(results.gpcm, 19)
info.24 <- iteminfo(extr.24, Theta)
extr.25 <- extract.item(results.gpcm, 20)
info.25 <- iteminfo(extr.25, Theta)
extr.26 <- extract.item(results.gpcm, 21)
info.26 <- iteminfo(extr.26, Theta)
extr.27 <- extract.item(results.gpcm, 22)
info.27 <- iteminfo(extr.27, Theta)
extr.28 <- extract.item(results.gpcm, 23)
info.28 <- iteminfo(extr.28, Theta)
extr.29 <- extract.item(results.gpcm, 24)
info.29 <- iteminfo(extr.29, Theta)
extr.30 <- extract.item(results.gpcm, 25)
info.30 <- iteminfo(extr.30, Theta)
extr.31 <- extract.item(results.gpcm, 26)
info.31 <- iteminfo(extr.31, Theta)
extr.32 <- extract.item(results.gpcm, 27)
info.32 <- iteminfo(extr.32, Theta)
extr.33 <- extract.item(results.gpcm, 28)
info.33 <- iteminfo(extr.33, Theta)
extr.34 <- extract.item(results.gpcm, 29)
info.34 <- iteminfo(extr.34, Theta)
extr.35 <- extract.item(results.gpcm, 30)
info.35 <- iteminfo(extr.35, Theta)
extr.36 <- extract.item(results.gpcm, 31)
info.36 <- iteminfo(extr.36, Theta)
extr.37 <- extract.item(results.gpcm, 32)
info.37 <- iteminfo(extr.37, Theta)

plot(0, 0, pch = "", xlim=c(-4,4), ylim=c(0,7), xlab="Theta", ylab="",main='Item information')
lines(Theta, info.1, type = 'l',col=1)
lines(Theta, info.2, type = 'l',col=2)
lines(Theta, info.3, type = 'l',col=3)
lines(Theta, info.8, type = 'l',col=4)
lines(Theta, info.9, type = 'l',col=5)
lines(Theta, info.10, type = 'l',col=6)
lines(Theta, info.11, type = 'l',col=7)
lines(Theta, info.12, type = 'l',col=8)
lines(Theta, info.13, type = 'l',col=1,lty=2)
lines(Theta, info.14, type = 'l',col=2, lty =2)
lines(Theta, info.15, type = 'l',col=3, lty =2)
lines(Theta, info.4, type = 'l',col=4, lty =2)
lines(Theta, info.5, type = 'l',col=5, lty =2)
lines(Theta, info.6, type = 'l',col=6, lty =2)
lines(Theta, info.7, type = 'l',col=7, lty =2)
lines(Theta, info.21, type = 'l',col=8, lty =2)
lines(Theta, info.22, type = 'l',col=1, lty =3)
lines(Theta, info.23, type = 'l',col=2, lty =3)
lines(Theta, info.24, type = 'l',col=3, lty =3)
lines(Theta, info.25, type = 'l',col=4, lty =3)
lines(Theta, info.26, type = 'l',col=5, lty =3)
lines(Theta, info.27, type = 'l',col=6, lty =3)
lines(Theta, info.28, type = 'l',col=7, lty =3)
lines(Theta, info.29, type = 'l',col=8, lty =3)
lines(Theta, info.30, type = 'l',col=1, lty =4)
lines(Theta, info.31, type = 'l',col=2, lty =4)
lines(Theta, info.32, type = 'l',col=3, lty =4)
lines(Theta, info.33, type = 'l',col=4, lty =4)
lines(Theta, info.34, type = 'l',col=5, lty =4)
lines(Theta, info.35, type = 'l',col=6, lty =4)
lines(Theta, info.36, type = 'l',col=7, lty =4)
lines(Theta, info.37, type = 'l',col=8, lty =4)
legend("topleft",legend=c("Item 1","Item 2","Item 3","Item 8","Item 9","Item 10","Item 11","Item 12","Item 13","Item 14","Item 15", "Item 4","Item 5","Item 6","Item 7","Item 21", "Item 22", "Item 23", "Item 24", "Item 25", "Item 26", "Item 27", "Item 28", "Item 29", "Item 30", "Item 31", "Item 32", "Item 33", "Item 34", "Item 35", "Item 36", "Item 37"), col=c(1,2,3,4,5,6,7,8,1,2,3,4,5,6,7,8,1,2,3,4,5,6,7,8,1,2,3,4,5,6,7,8),lty=c(1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,3,3,3,3,3,3,3,3,4,4,4,4,4,4,4,4),cex=0.6)


# Test information
info.test <- testinfo(results.gpcm, Theta)
plot(Theta, info.test, type = 'l',lty=2,main = 'Test information', ylab = 'Information')


#**************************************************************************************


#############
# CITATIONS # 
#############

citation("GPArotation")
citation("psych")