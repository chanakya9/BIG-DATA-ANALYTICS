#ASSIGNMENT-5
# read a csv file
stats <- read.csv(file.choose())
stats
# answer 1:Show the data of France
stats[stats$Country.Name =="France",]
stats
#answer 2: Showing the countries with birthrate >20 and High income
data<- stats[stats$Birth.rate > 20 & stats$Income.Group == "High income", ]
print(data)

# answer 3:Show the data of the country with the highest internet users
max_internet_user_country <- stats[stats$Internet.users == max(stats$Internet.users,na.rm = TRUE), ]
print(max_internet_user_country)

#answer 4:Average birth Rate
Avg_birthrate <- mean(stats$Birth.rate, na.rm = TRUE)
print(Avg_birthrate)

#answer 5:tandard Deviation of birthrate
SD_birthrate <- sd(stats$Birth.rate, na.rm = TRUE)
print(SD_birthrate)

# answer 6: Countries whose birth rate is two SDs above the mean
countries_above_2SDs <- stats[stats$Birth.rate > (Avg_birthrate + 2*SD_birthrate), ]
print(countries_above_2SDs)

#answer 7: IQR of the birthrate 
Iqr_birthrate <- IQR(stats$Birth.rate, na.rm = TRUE)
print(Iqr_birthrate)