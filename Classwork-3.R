a<- c(3,6,6,7,8,9)
median(a)
b<- c(9,12,14,15,17)
median(b)

C<-c(3,7,9,12,14,15,17,18,40)
median(C)
sort(C)

N <-100000
a <-rnorm(N)
b <- rnorm(N)
c <- a * b
c
X <- rnorm(5, sd=1)

x <-rnorm(10)
plot(x)
hist(x)

x <-rnorm(80000)
boxplot(x)