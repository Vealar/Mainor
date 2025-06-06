library(readxl)
library(urca)
library(tseries)

usa_data <- read_excel("data_cts_intentional_homicide.xlsx", sheet = "США")
japan_data <- read_excel("data_cts_intentional_homicide.xlsx", sheet = "Япония")

y_usa <- usa_data$Value
y_japan <- japan_data$Value

dy_usa <- diff(y_usa)
dy_japan <- diff(y_japan)




adf_usa_y <- ur.df(y_usa, type = "trend", lags = 3)
summary(adf_usa_y)

adf_usa_dy <- ur.df(dy_usa, type = "trend", lags = 3)
summary(adf_usa_dy)


pp_usa_y <- ur.pp(y_usa, type = "Z-tau", model = "trend", lags = "short")
summary(pp_usa_y)

pp_usa_dy <- ur.pp(dy_usa, type = "Z-tau", model = "trend", lags = "short")
summary(pp_usa_dy)


kpss.test(y_usa, null = "Trend")
kpss.test(dy_usa, null = "Trend")





# ADF
adf_japan_y <- ur.df(y_japan, type = "trend", lags = 3)
summary(adf_japan_y)

adf_japan_dy <- ur.df(dy_japan, type = "trend", lags = 3)
summary(adf_japan_dy)

# PP
pp_japan_y <- ur.pp(y_japan, type = "Z-tau", model = "trend", lags = "short")
summary(pp_japan_y)

pp_japan_dy <- ur.pp(dy_japan, type = "Z-tau", model = "trend", lags = "short")
summary(pp_japan_dy)

# KPSS
kpss.test(y_japan, null = "Trend")
kpss.test(dy_japan, null = "Trend")
