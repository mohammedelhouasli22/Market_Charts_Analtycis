rm(list=ls())
library(quantmod)
library(ggplot2)

Google <- getSymbols("GOOG", src = "yahoo", from = "2016-08-21", to = "2021-08-21", auto.assign = FALSE)
head(Google)
tail(Google)
ggplot(Google,
       aes(x = index(Google), y = Google[,4])) + geom_line(color = "Turquoise") + ggtitle("Google Closing Price") + xlab("Date") + ylab("Price") + theme(plot.title = element_text(hjust = 0.5)) + scale_x_date(date_labels = "%b %y", date_breaks = "6 months")

plot(Google$GOOG.Close,ylab = "Price", type = "l", main = "Google Closing Price")

Microsoft <- getSymbols("MSFT", src = "yahoo", from = "2016-08-21", to = "2021-08-21", auto.assign = FALSE)
plot(Microsoft$MSFT.Close, ylab="Price", type = "l", main= "Microsoft Closing Price")


par(mfrow=c(2,1))
plot(Google$GOOG.Close,ylab="Price",type = "l",main="Google Closing Price")
plot(Microsoft$MSFT.Close,ylab="Price",type="l",main="Microsoft Closing Price")
cor(Google$GOOG.Close,Microsoft$MSFT.Close)

TCS <- getSymbols("TCS.NS", src = "yahoo", from = "2016-08-21", to = "2021-08-21", auto.assign= FALSE)
Infosys <- getSymbols("INFY.NS",src = "yahoo", from = "2016-08-21", auto.assign = FALSE)
Wipro <- getSymbols("WIPRO.NS", src = "yahoo", from = "2016-08-21", to = "2021-08-21", auto.assign = FALSE)


par(mfrow=c(3,1))
plot(TCS$TCS.NS.Close, ylab="Price",type="l", main="TCS Closing Price")
plot(Infosys$INFY.NS.Close,ylab="Price",type="l", main="Infosys Closing Price")
plot(Wipro$WIPRO.NS.Close, ylab="Price", type = "l", main="Wipro Closing Price")


stock_data <- data.frame(TCS$TCS.NS.Close,Infosys$INFY.NS.Close,Wipro$WIPRO.NS.Close)
round(cor(stock_data, use = "complete.obs"),2)