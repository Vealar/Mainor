
usa_data <- read_excel("data_cts_intentional_homicide.xlsx", sheet = "США")
japan_data <- read_excel("data_cts_intentional_homicide.xlsx", sheet = "Япония")

install.packages("DescTools")
library(DescTools)

RunsTest(usa_data$Value)

RunsTest(japan_data$Value)