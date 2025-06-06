library(readxl)
library(psych)

usa_data <- read_excel("data_cts_intentional_homicide.xlsx", sheet = "США")
japan_data <- read_excel("data_cts_intentional_homicide.xlsx", sheet = "Япония")

usa_ts <- ts(usa_data$Value, start = 1990, frequency = 1)
japan_ts <- ts(japan_data$Value, start = 1990, frequency = 1)

install.packages(c("forecast", "tseries", "ggplot2"))

library(forecast)
library(tseries)
library(ggplot2)

autoplot(usa_ts, series = "США") +
  autolayer(ma(usa_ts, 5), series = "Линия тренда") +
  ylab("Количество убийств на 100,000") + 
  xlab("Год") +
  scale_x_continuous(breaks = seq(1990, 2020, by = 5)) +
  scale_y_continuous(breaks = seq(0, 10, by = 1))

autoplot(japan_ts, series = "Япония") +
  autolayer(ma(japan_ts, 5), series = "Линия тренда") +
  ylab("Количество убийств на 100,000") + 
  xlab("Год") +
  scale_x_continuous(breaks = seq(1990, 2020, by = 5)) +
  scale_y_continuous(breaks = seq(0, 1, by = 0.1))

acf(usa_ts, main="ACF для США")
acf(usa_ts, plot = FALSE,main="ACF для США")

pacf(usa_ts, main="PACF для США")
pacf(usa_ts, plot = FALSE, main="PACF для США")

acf(japan_ts, main="ACF для Японии")
acf(japan_ts, plot = FALSE, main="ACF для Японии")

pacf(japan_ts, main="PACF для Японии")
pacf(japan_ts, plot = FALSE, main="PACF для Японии")

