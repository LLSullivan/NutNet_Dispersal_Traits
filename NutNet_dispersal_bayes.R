setwd("~/Dropbox/Sullivan_dissertation et al./dissertation/C4_herbivore effects on establishment/Oakridge - 2013 CHAFAS dispersal/bayes")
library(lme4)
library(lmerTest)
library(ggplot2)
library(reshape)
library(nlme)
library(reshape)
library(plyr)
library(rjags)
library(MCMCpack)

#test


##MVN model for dispersal traits by sites and species/groups.

disp_model <- "model{
	for(i in 1:Ndata){
		Y[i]~dmvnorm(MUs(trt[spp[i]]),SIGs)
		MUs(trt[spp[i]])~dmvnorm(MUg(group[spp[i]]),SIGg)
		MUg(group[spp[i]]) <- b0 + b1[group[i]] + b2[trt[i]] + b3[group[i]]*[trt[i]] + epsilon[site[i]]
		# MUg(group[spp[i]]) <- b0 + b1*group[i] + b2*trt[i] + b3*group[i]*trt[i] + epsilon[site[i]]
  	}
	
	#MUg(group(spp[i])) ~ dnorm(0, 0.0001)
	
	#coefficient non-informative priors
	
	b0 ~ dnorm(0, 0.0001)
	b1 ~ dnorm(0, 0.0001)
	b2 ~ dnorm(0, 0.0001)
	b3 ~ dnorm(0, 0.0001)
	
	#site level error term.
		for(i in 1:Nsite){
			epsilon[i] ~ dnorm(0,0.0001)
		}
}"




}"
