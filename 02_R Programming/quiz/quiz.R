sum(is.na(data[[1]]))

sum(data[[1]][is.na(data[[1]]) == FALSE])/(153-37)

new1 = subset(data, Ozone > 31 & Temp > 90, select = Solar.R)
mean(new1[[1]])

new2 = subset(data, Month == 6, select = Temp)
mean(new2[[1]])

new3 = subset(data, Month == 5 & !is.na(Ozone), select = Ozone)
max(new3[[1]])
