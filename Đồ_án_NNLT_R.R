confraw <- read.csv("https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_confirmed_global.csv")
str(confraw) 
draw <- read.csv("https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_deaths_global.csv")
recoraw <- read.csv("https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_recovered_global.csv")

library(tidyr)
library(dplyr)

confirmed <- confraw %>% gather(key="date", value="confirmed", -c(Country.Region, Province.State, Lat, Long)) %>% 
  group_by(Country.Region, date) %>% summarize(confirmed=sum(confirmed))
deaths <- draw %>% gather(key="date", value="deaths", -c(Country.Region, Province.State, Lat, Long)) %>% 
  group_by(Country.Region, date) %>% summarize(deaths=sum(deaths))
recovered <- recoraw %>% gather(key="date", value="recovered", -c(Country.Region, Province.State, Lat, Long)) %>%
  group_by(Country.Region, date) %>% summarize(recovered=sum(recovered))
summary(confirmed)  
# D??? li???u cu???i cùng: k???t h???p c??? ba
country <- full_join(confirmed, deaths) %>% full_join(recovered)
# Bi???n ngày
str(country) # ki???m tra kí t??? ngày
country$date <- country$date %>% sub("X", "", .) %>% as.Date("%m.%d.%y")
str(country) 
#T???o bi???n m???i: s??? ngày
country <- country %>% group_by(Country.Region) %>% mutate(cumconfirmed=cumsum(confirmed),
                                                           days = date - first(date) + 1)
# tong hop o cap do the gioi
world <- country %>% group_by(date) %>% summarize(confirmed=sum(confirmed), cumconfirmed=sum(cumconfirmed), deaths=sum(deaths), recovered=sum(recovered)) %>% mutate(days = date - first(date) + 1)
#Trích xu???t qu???c gia c??? th???: US, Italy
US <- country %>% filter(Country.Region=="US")
italy <- country %>% filter(Country.Region=="Italy")


library(ggplot2)
#plot1
# Các trý???ng h???p th??? gi???i xác nh???n trên toàn c???u
ggplot(world, aes(x=date, y=confirmed)) + geom_bar(stat="identity", width=0.1) +
  theme_classic() +
  labs(title = "Covid-19 Global Confirmed Cases", x= "Date", y= "Daily confirmed cases") +
  theme(plot.title = element_text(hjust = 0.5))
#plot2
# the gioi xac nhan voi so luong tren thang log10
ggplot(world, aes(x=days, y=confirmed)) + geom_line() +
  theme_classic() +
  labs(title = "Covid-19 Global Confirmed Cases", x= "Days", y= "Daily confirmed cases  (log scale)") +
  theme(plot.title = element_text(hjust = 0.5)) +
  scale_y_continuous(trans="log10")
#plot3
# the gioi xac nhan tu vong va phuc hoi
str(world)
world %>% gather("Type", "Cases", -c(date, days)) %>%
  ggplot(aes(x=days, y=Cases, colour=Type)) + geom_bar(stat="identity", width=0.1, fill="white") +
  theme_classic() +
  labs(title = "Covid-19 deaths and recovered", x= "Days", y= "Daily cases") +
  theme(plot.title = element_text(hjust = 0.1))
# plot4
#US xac nhan truog hop mac covid 19
ggplot(US, aes(x=date, y=confirmed)) + geom_bar(stat="identity", width=0.1) + 
  theme_classic() +
  labs(title = "Covid-19 Confirmed Cases in US", x= "Date", y= "Daily confirmed cases") +
  theme(plot.title = element_text(hjust = 0.5))
#plot5
#Italy xac nhan truong hop mac covid 19
ggplot(italy, aes(x=date, y=confirmed)) + geom_bar(stat="identity", width=0.2) +
  theme_classic() +
  labs(title = "Covid-19 Confirmed Cases in Italy", x= "Date", y= "Daily confirmed cases") +
  theme(plot.title = element_text(hjust = 0.5))
#plot6
#Bieu do line the gioi xac nhan tren toan cau
ggplot(world, aes(x=days, y=confirmed)) + geom_line() +
  theme_classic() +
  labs(title = "Covid-19 Global Confirmed Cases", x= "Days", y= "Daily confirmed cases") +
  theme(plot.title = element_text(hjust = 0.5))
#plot7
#bieu do line truong hop tý vong và phuc hoi
world %>% gather("Type", "Cases", -c(date, days)) %>%
  ggplot(aes(x=days, y=Cases, colour=Type)) + geom_line() +
  theme_classic() +
  labs(title = "Covid-19 Global Cases", x= "Days", y= "Daily cases") +
  theme(plot.title = element_text(hjust = 0.5))
#plot8
# Bieu do barchart ket hop smooth the gioi xac nhan tren toan cau
ggplot(world, aes(x=days, y=confirmed)) + geom_smooth() + geom_bar(stat="identity", width=0.1) +
theme_classic() +
  labs(title = "Covid-19 Global Confirmed Cases", x= "Days", y= "Daily confirmed cases") +
  theme(plot.title = element_text(hjust = 0.5))
#plot9
# bieu do boxplot
ggplot(world, aes(x=days, y=confirmed))  + geom_boxplot() +
  theme_classic() +
  labs(title = "Covid-19 Global Confirmed Cases", x= "Days", y= "Daily confirmed cases") +
  theme(plot.title = element_text(hjust = 0.5))
#plot10
#bieu do duoc xac nhan theo quoc gia doi voi
#cac quoc gia duoc chon co so luong tren thang log(10)
countryselection <- country %>% filter(Country.Region==c("US", "Italy", "China", "France", "United Kingdom", "Germany"))
ggplot(countryselection, aes(x=days, y=confirmed, colour=Country.Region)) + geom_line(size=1) +
  theme_classic() +
  labs(title = "Covid-19 Confirmed Cases by Country", x= "Days", y= "Daily confirmed cases (log scale)") +
  theme(plot.title = element_text(hjust = 0.5)) +
  scale_y_continuous(trans="log10")


