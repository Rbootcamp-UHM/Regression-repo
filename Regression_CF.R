plotwithreg <- function(x, y, title, cxlab, cylab) {

plot(x, y, pch=10, col=iris$Species, main=title, xlab=cxlab, ylab=cylab)
lengths.lm <- lm(y~x) 
coef(lengths.lm)
b <- coef(lengths.lm)
int <- b[1]
slope <- b[2]
abline(lengths.lm, col="blue")

yhat <- slope*x + int
points(x, yhat)
segments(x, y, x, yhat)

error <- yhat - y #error in y from actual point to point on regression line
error^2
sse <- sum(error^2)
sse #obtain sum of squared errors

text(7.5,2, paste("sse=", sse))
text(7.5,1.5, paste("slope=", slope))
text(7.5,1, paste("intercept=", int))
legend("topleft", legend=levels(iris$Species), col= c(1,2,3), pch=10)
}

#rename vectors
Slength <- iris$Sepal.Length
Plength <- iris$Petal.Length

#set your x, y, and labels
x <- Slength
y <- Plength
plotwithreg(Slength, Plength, "Sepal and Petal Morph", "Sepal Length", "Petal Length")


#My function
Species <- iris$Species
Plength <- iris$Petal.Length
Pwidth <- iris$Petal.Width
norm <- function(x=Species, y, title, cxlab, cylab) {
y <- y/leng
plot(Species, y, main=title, xlab=cxlab, ylab=cylab, col= c(5,6,7))

}
leng <- Plength
norm(Species, Pwidth, "Normalized Petal Widths to Lengths", "Species", "Petal")