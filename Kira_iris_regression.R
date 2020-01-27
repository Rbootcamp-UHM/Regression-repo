iris	#making sure Iris dataset is active
names(iris)	#checking Iris names so you can rename them
names(iris) <- c("sepalL", "sepalW",  "petalL", "petalW", "species")	#Renaming iris with more convenient names

species <- iris$species   #saving specific values from the Iris dataset as variables to use later
x <- iris$petalL
y <- iris$petalW

fit <- lm( y ~ x )  	#creating variable fit for the linear model
b <- coef( fit )	 #naming b as the coefficient for the model
int <- b[1] 	#redelegating b as the intercept, such as in y=mx+b
slope <- b[2] 	#naming slope for the linear model

plot(x, y) 		#now we can plot our previously named x as petal length and y as petal width 
abline(fit) 	#abline creates a line of best fit on the plot given the slope and intercept already laid out

yhat <- slope*x + int	 #labeling the linear formula y=mx+b as yhat because y is already taken

points( x, yhat, pch=3)  #making the points that fall on the line of best fit obvious

i=150		#we now want to show the error margin between the points on contrasting sides of the line of best fit
segments( x[i], y[i], x[i], yhat[i], col="red" ) 	#we name segments as the connection between these points
segments( x, y, x, yhat, col="red", lty=2 )		#we formulate the segments and now they will appear

error <- (yhat-y)		#to calculate error between the points
sse <- sum(error^2)		#to calculate the sum of squared errors

text(2,2.5, paste("Slope:", slope))		#to add the text for slope to the graph
text(2,2.25, paste("y-int:", int))		#to add the text for y-intercept to the graph
text(2,2, paste("SSE:", sse))			#to add the text for SSE to the graph



#Function Wrap
myplot <- function(x=iris$petalL, y=iris$petalW, myint=int, myslope=slope)	{
	yhat <- myslope*x + myint
	error <- yhat - y
	sse <- sum(error^2)
	plot(x, y)
	abline(myint, myslope)
	points(x, yhat, pch=3)
	segments(x, y, x, yhat, col="red", lty=2)
	text(2,2.5, paste("Slope:", myslope))
	text(2,2.25, paste("y-int:", myint))
	text(2,2, paste("SSE:", sse))
}

myplot()
myplot(myint=4, myslope=1)
myplot(myint=1, myslope=4)
myplot(myint=0.5, myslope=0.5)
myplot(myint=5, myslope=5)
myplot(myint=0, myslope=1)


#My Function
conversionfunction <- function(x=cars$speed, y=cars$dist, conv1=1.60934, conv2=0.3048)	{
	x <- x*conv1
	y <- y*conv2
	plot(x, y)
	fit <- lm (y~x)
	abline(fit)
}

conversionfunction()		#testing function with cars data, this converts speed from miles to kilometers, and distance from feet to meters. 
conversionfunction(x=women$height, y=women$weight, conv1=2.54, conv2=0.4536)	 #using the dataset women, this converts height from inches to centimeters, and weight from pounds to kilograms
conversionfunction(x=trees$Girth, y=trees$Height, conv1=2.54, conv2=0.3048)		#using the dataset trees, this converts tree girth from inches to centimeters, and tree height from feet to meters. 