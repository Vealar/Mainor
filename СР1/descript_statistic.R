install.packages("readxl")
install.packages("psych")

library(readxl)
library(psych)

usa_data <- read_excel("data_cts_intentional_homicide.xlsx", sheet = "США")
japan_data <- read_excel("data_cts_intentional_homicide.xlsx", sheet = "Япония")

describe(usa_data$Value)
describe(japan_data$Value)