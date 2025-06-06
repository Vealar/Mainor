usa_data <- read_excel("data_cts_intentional_homicide.xlsx", sheet = "США")
japan_data <- read_excel("data_cts_intentional_homicide.xlsx", sheet = "Япония")

install.packages("strucchange") #установить пакет для анализа структурных сдвигов
library(strucchange)

sctest(usa_data$Value~usa_data$Year, type="Chow", point=20)

sctest(japan_data$Value~japan_data$Year, type="Chow", point=20)