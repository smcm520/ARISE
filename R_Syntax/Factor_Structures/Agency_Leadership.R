###############################
# EXPLORATORY FACTOR ANALYSIS #
#        MUSE DATA            #
#     AGENCY - Leadership     #
###############################

#**************************************************************************************

#############################
# Install Relevant Packages # 
#############################
# Note: install.packages commands are commented out as packages have already been installed on the operating system on which this code was developed; if running on a new system, uncomment and run all install.packages commands the first time using the code.
#install.packages('psych')
#install.packages('GPArotation')
#install.packages('nFactors')
#install.packages('sjPlot')
library(psych)
library(GPArotation)
library(nFactors)
library(sjPlot)

# Install and load Mplus packages required to read .gh5 Mplus output
# Change pathway for source files as needed
install.packages("BiocManager")
BiocManager::install("rhdf5")
source("/Users/Shauna/Documents/Emory/Work_MUSE/Analysis/EFA/mplus.R")

#**************************************************************************************

#############
# Load Data #
#############
#Load full data set
Lead_original = read.csv("museEFA_Lead_R.csv")

# Remove index items for full set of scale items only
Lead_full = Lead_original[c(22:30)]

# Remove scale items dropped after first round of item-reduction decisions
Lead_R2 = Lead_full[c(1:7,9)]

# Remove scale items dropped after second round of item-reduction decisions
Lead_R3 = Lead_R2[c(1:3,5:8)]


#**************************************************************************************

##########################
# Item-Level Information #
##########################
# Get mean (sd), % missing, skew for each scale item
# Use sjPlot package
sjt.itemanalysis(Lead_full)

#**************************************************************************************

#######################################
# Determine Optimal Number of Factors # 
#######################################
# Determine optimal number of factors with (1) scree plots and (2) parallel analysis

# Scree plot - load .gh5 files built through Mplus using rhdf5/BiocManager packages
mplus.view.plots('A_Lead_2020-04-06.gh5')
mplus.plot.eigenvalues('A_Lead_2020-04-06.gh5')

# Scree plot - use nFactors package to determine if R-built scree plot is in agreement with Mplus-built scree plot
ev <- eigen(cor(na.omit(Lead_full)))
ap <- parallel(subject=nrow(Lead_full),var=ncol(Lead_full),rep=100,cent=.05)
nS <- nScree(x=ev$values, aparallel=ap$eigen$qevpea)
plotnScree(nS)

# Parallel analysis - use psych and GPArotation packages
fa.parallel(Lead_full,n.obs=NULL,fm="wls",fa="both",main="Parallel Analysis Scree Plots",
n.iter=75,error.bars=FALSE,se.bars=FALSE,SMC=FALSE,ylabel=NULL,show.legend=TRUE,
sim=TRUE,quant=.95,cor="cor",use="pairwise",plot=TRUE,correct=.5)


#**************************************************************************************

#############
# CITATIONS # 
#############
citation("GPArotation")
citation("psych")
citation("nFactors")
citation("sjPlot")


#**************************************************************************************