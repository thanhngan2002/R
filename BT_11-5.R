setwd("C://Users//Admin//Downloads")
Owls<-read.table(file = "Owls.txt", header = TRUE, dec = ".")
names(Owls)
str(Owls)
unique(Owls$Nest) 

AllNests<- unique(Owls$Nest)
for (i in 1:27) {
  Nest.i <- AllNests[i]
  Owls.i<- Owls[Owls$Nest==Nest.i,]
  YourFileName<-paste(Nest.i, ".jpg",sep = "")
  jpeg(file=YourFileName)
  plot(x=Owls.i$SiblingNegotiation,
       y=Owls.i$ArrivalTime,
       xlab="SiblingNegotiation",
       main=Nest.i,
       ylab= "ArrivalTime")
  dev.off()
}
ifelse(Owls$FoodTreatment == "Satiated",
       Owls$NestNight <- paste(Owls$Nest, "1",sep = "_"),
       Owls$NestNight <- paste(Owls$Nest, "2",sep = "_"))


