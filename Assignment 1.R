#Question 1
# Assign numbers
a<- 7
b <- 12
c <- 5

# Addition
add <- a + b + c

# Calculating average 
average <- add / 3
average

#Question 2
# First name
first_name <- "Chanakya"

# Printing welcome message
message <- paste("Welcome to R,", first_name)
print(message)

#Question 3
# Define the variables
x <- 7
y <- 12
z <- 4

if (x > y & x > z) {
  print("x is bigger than y and z")
} else if (x > y) {
  print("x is bigger than y but not z")
} else if (x > z) {
  print("x is bigger than z but not y")
} else {
  print("x is not bigger than y or z")
}
