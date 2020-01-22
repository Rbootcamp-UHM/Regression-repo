iris <- read.csv("iris.csv")	# Fisherʻs iris dataset
dim(iris)	# dimensions
names(iris)

## Renaming iris with more convenient names
## Accessing vectors within iris, saving as separate objects

names(iris) <- c("sepalL", "sepalW",  "petalL", "petalW", "species")
species <- iris$species   
x <- iris$petalL
y <- iris$petalW


## Illustrating regression by graphing 

fit <- lm( y ~ x )  # fitting the linear model
b <- coef( fit ) # grabbing the coefficients
int <- b[1] # intercept
slope <- b[2] # slope

plot(x, y) # plotting the data points
abline(fit) # drawing the regression line on the plot
# look up help for ?abline and figure out how to use 
# abline by specify slope and intercept.

yhat <- slope*x + int # the fitted values

points( x, yhat, pch=3)  # adding the fitted points
paste("slope=", slope)  # what does this do? Look up help for paste
round(slope,3) # look up help for round
			# paste works on character objects, round on numeric
text(1,2, paste("slope=", slope)) #adding text to plot look up help for text

## if we want to draw line segments between the 150th
## point and the fitted regression value for it:
i=150
segments( x[i], y[i], x[i], yhat[i], col="red" )

## R is "vectorized": it will work on vectors all at once:
segments( x, y, x, yhat, col="red", lty=2 )


