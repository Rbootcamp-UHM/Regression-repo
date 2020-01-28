#setwd("C:/Users/hille/Documents/Rbootcamp_S2020/Regression-repo/")

#Housekeeping
iris <- read.csv("iris.csv")	# Fisherʻs iris dataset
dim(iris)	# dimensions
names(iris) <- c("sepalL", "sepalW",  "petalL", "petalW", "species")
species <- iris$species

color <- rep("purple", 150)
color[species == "versicolor"] <- "blue"
color[species == "virginica"] <- "orange"

#Setting up the default parameters
x <- iris$petalL
y <- iris$sepalW
fit <- lm( y ~ x )  #fitting the linear model
b <- coef( fit ) #grabbing the coefficients
int <- b[1] #intercept
slope <- b[2] #slope
slope
yhat <- slope*x + int #the fitted values
error <- yhat - y
sse <- sum(error^2)
sse

#plots the data points with the line of best fit 
lineplot <- function(x=iris$petalL, y=iris$sepalW, cint=int, cslope=slope, ccol=color, cpch=16, cxlab="Petal Length", cylab="Sepal Width") {
	yhat <- cslope*x + cint
	error <- yhat - y
	sse <- sum(error^2)
	print(paste("SSE:", round(sse, 5)))
	cylim <- c( min(c(y,yhat)), max(c(y,yhat)))
	plot(x, y, col=ccol, pch=cpch, xlab=cxlab, ylab=cylab, ylim=cylim)
	abline(cint, cslope) # drawing the regression line on the plot
	points(x, yhat, pch=7)  # adding the fitted points
	segments(x, y, x, yhat, col="black", lty=2 )
	legend('top', legend = levels(species), col = c("purple", "blue", "orange"), cex = .8, pch = 19)
	text(6,4.4, paste("SSE:", round(sse, 3)))
	text(6,4.25, paste("slope:", round(cslope, 3)))
	text(6,4.1, paste("y-int:", round(cint, 3)))
}

lineplot() #This plots the best fit line by default
lineplot(cint=3.5) #This increases the y intercept; best fit slope
lineplot(cint=3.2) #This decreases the y intercept; best fit slope
lineplot(cslope=-.2) #This decreases the slope; best fit y intercept
lineplot(cslope=-.4) #This decreases the slope even further; best fit y intercept
lineplot(cint=4, cslope=-.3) #This changes both the slope AND the y intercept 

#MY FUNCTION
logtransform <- function(x=iris$petalL, y=iris$sepalW, ccol=color, cpch=16) {
	x <- log(x)
	y <- log(y)
	logfit <- lm(y ~ x)
	plot(x, y, col=ccol, pch=cpch)
	abline(logfit)
}

logtransform(iris$petalW, iris$petalL)
logtransform(iris$petalL, iris$sepalL)

m <- matrix(data=c(1:100), ncol=10, nrow=10)
logtransform(m[,1], m[,2])
logtransform(m[,1], m[,10])