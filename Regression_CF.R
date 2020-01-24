#setwd("C:/Users/frase/Documents/Rclass/Regression-repo")

read.csv("iris.csv")

#rename vectors
Slength <- iris$Sepal.Length
Plength <- iris$Petal.Length

x <- Slength
y <- Plength
lengths.lm <- lm(y~x) 
coef(lengths.lm)
b <- coef(lengths.lm)
int <- b[1]
slope <- b[2]

plotwithreg <- function(x=Slength, y=Plength, title="Sepal and Petal Morph", cxlab="Sepal Length", cylab="Petal Length", ccol=iris$Species) {
	plot(x, y, pch=10, col=ccol, main=title, xlab=cxlab, ylab=cylab)
	abline(int, slope, col="blue")

	yhat <- slope*x + int
	points(x, yhat)
	segments(x, y, x, yhat)

	error <- yhat - y #error in y from actual point to point on regression line
	error^2
	sse <- sum(error^2)
	sse #obtain sum of squared errors

	text(7.5,2, paste("sse=", round(sse, 2)))
	text(7.5,1.5, paste("slope=", round(slope, 2)))
	text(7.5,1, paste("intercept=", round(int, 2)))
	legend("topleft", legend=levels(iris$Species), col= c(1,2,3), pch=10)
}

#plot with default values
plotwithreg()
#set your x, y, and labels
plotwithreg(Slength, Plength, "Sepal and Petal Morph", "Sepal Length", "Petal Length")

#Try it with arbitrary slopes and intercepts
slope = 2
plotwithreg(Slength, Plength, "Sepal and Petal Morph", "Sepal Length", "Petal Length")

slope = 2.5
plotwithreg(Slength, Plength, "Sepal and Petal Morph", "Sepal Length", "Petal Length")

slope = 3
plotwithreg(Slength, Plength, "Sepal and Petal Morph", "Sepal Length", "Petal Length")

slope <- b[2] #need to reset slope to observe only intercept change from dataset
int = -6
plotwithreg(Slength, Plength, "Sepal and Petal Morph", "Sepal Length", "Petal Length")

int= -5
plotwithreg(Slength, Plength, "Sepal and Petal Morph", "Sepal Length", "Petal Length")

#My function
Species <- iris$Species
Plength <- iris$Petal.Length
Pwidth <- iris$Petal.Width
x <- Species
norm <- function(x=Species, y=leng, title="Normalized Petal Widths to Lengths", cxlab="Species", cylab="Petal Width/Length") {
	y <- y/leng
	plot(x, y, main=title, xlab=cxlab, ylab=cylab, col= c(5,6,7))

}
leng <- Plength
norm(Species, Pwidth, "Normalized Petal Widths to Lengths", "Species", "Petal Width/Length")