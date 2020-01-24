#########
###HW2###
#########

read.csv("iris.csv") #read in data set

iris #to look at the dataset

dim(iris) #to look at the dimensions.150 by 5.

names (iris) #to look at all the names

names(iris) <- c("sepalL", "sepalW",  "petalL", "petalW", "species") #rename

names(iris) #to check to see if I did it right

x <- iris$sepalL #rename what I plan on using for my regression

x #check to make sure it works

y <- iris$petalL #rename what I plan on using for my regression

y #check

fit <- lm(y ~x) #two things are happening here. One the lm function is showing me the intercept and slope of my regression,and I renamed these coefficients fit

fit #check

b <- coef( fit ) # grabs the coefficients 

b #checking my work

int <- b[1] # grabbing and renaming JUST the intercept

slope <- b[2] #grabbing and renaming JUST the slope

plot(x, y) # plotting x and y, Sepal Length and Petal Length LEAVE THIS WINDOW OPEN

abline(fit) #adding a regression line



######################
###regression error###
######################

yhat <- slope*x + int # the fitted values

points( x, yhat, pch=3)  # adding the fitted points

i=150 #made i =150

segments( x[i], y[i], x[i], yhat[i], col="red" ) #created some lines... but the next line of code...

segments( x, y, x, yhat, col="red", lty=2 ) #created lines and made them red and segmented

error <- yhat - y #named error the error

error #to check

sse <- sum((error)^2) #named the sum of all errors squared (sse)

text( 5, 7, paste("SSE:111.4592")) #added sum of all error squared

text(5, 6.5, paste("intercept=-7.101443 ")) #added Y intercept text

text(5, 6, paste("slope=1.858433 ")) #added slope text




#########################
###wrap in custom code###
#########################

customplot <- function(x=iris$sepalL, y=iris$petalL, newint=int, newslope=slope) {
	yhat <- newslope*x + newint
	error <- yhat - y
	sse <- sum(error^2)
	plot(x, y)
	abline(newint, newslope) 
	points(x, yhat, pch=3)
	segments(x, y, x, yhat,col="red", lty=2)
	text(5,7, paste("SSE:", sse))
	text(5,6.5, paste("slope:", slope))
	text(5,6, paste("intercept:", int))
	print(customplot)
}

customplot() #checking to make sure it works! It does!

customplot(newslope=3) #slope is not in the right place, moved up

customplot(newslope=2) #slope is not in the right place, moved up

customplot(newslope=1) # slope is not in the right place, all the way down

customplot(newint=-1) #slope barely even on the graph!All the way on the top

customplot(newint=-8) #below the correct place! 

customplot(newslope=2, newint=-7) #slope above the correct place




#################
###MY FUNCTION###
#################

izzysfunction <- function( x ) { #this is a crazy function with no real purpose, but to practice function creation
  return ( (x*x/2+7-12)/1 )
}

absolutevalue <- function(y) { #this is an absolute value function
  y= if (y<1)return (y*-1) else y
  print(y)
}

absolutevalue2 <- function(y) { #this is another absolute value function
y = if (y<1) y*-1 else y 
print(y) 
}

ChangeinPOPsize <- function(POP) { #This function IS AWESOME. You input your population size, and you'll get out the dP/dt or change in population over time

#change=252642.5 #(dP/dt)...change in population size
r=0.2311 #intrinsic rate of increase (real number)
P=POP #=1000000  #population
P0=900000#initial population
K=1072764 #carrying capacity

change <- (r*P*((1-(P0-P)/K)))
print(change)
}
