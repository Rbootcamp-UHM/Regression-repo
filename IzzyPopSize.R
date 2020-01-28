############################################################
#This function IS AWESOME. You input your population size, and you'll get out the dP/dt or change in population over time
# change=252642.5 #(dP/dt)...change in population size
# r=0.2311 #intrinsic rate of increase (real number)
# P=POP #  #population
# P0=900000#initial population
# K=1072764 #carrying capacity

ChangeinPOPsize <- function(P=10^6, r=0.2311, P0=9*10^5, K=1072764) { 

change <- (r*P*((1-(P0-P)/K)))
return(change)
}

############################################################
## demonstration of change in rate of population growth dNdT with P

P <- 1:1000*1000  # set up input population sizes
dNdT <- ChangeinPOPsize(P=P, K=10000)

plot(x=P, y=dNdT, type="l")
title("K=10,000")

############################################################
## demonstration of dNdT with P and K and 3D graphics

P <- 1:1000*1000 # set up P and K over a range
K <- 10:500*1000
# P <- 1:10 test values for input matrix below
# K <- 3:6  test values

lP <- length(P) # below we set up an input matrix
lK <- length(K)
input <- data.frame(P=rep(P, times=lK), K=rep(K, each=lP))
dNdT <- ChangeinPOPsize( P=input$P, K=input$K)

# install.packages("plot3D", dependencies=T)
# install.packages("rgl", dependencies=T)
# install.packages("plot3Drgl", dependencies=T)

require(plot3D) # fancy 3D plotting
require(plot3Drgl) # interactive 3D plotting space

scatter3D(x=input$P, y=input$K, z=dNdT)
plotrgl()
