setwd("C://Users//Admin//Downloads")
Owls<-read.table(file = "Owls.txt", header = TRUE, dec = ".")# Đọc dòng đầu tiên trong file
names(Owls)# Hỏi trong cột dữ liệu có những cột nào và tên gì
str(Owls) # Kiểm tra định dạng các biến trong Owls
unique(Owls$Nest) # Trích xuất dữ liệu từ Nest

AllNests<- unique(Owls$Nest)
for (i in 1:27) # Dùng vòng lặp for trong các giá trị từ 1 đến 27
  Nest.i <- AllNests[i]# Đặt Nest.i bằng AllNest
  Owls.i<- Owls[Owls$Nest==Nest.i,]
  YourFileName<-paste(Nest.i, ".jpg",sep = "")
  jpeg(file=YourFileName)
  plot(x=Owls.i$SiblingNegotiation,
       y=Owls.i$ArrivalTime,
       xlab="SiblingNegotiation",
       main=Nest.i,
       ylab= "ArrivalTime")
  dev.off()

ifelse(Owls$FoodTreatment == "Satiated",
       Owls$NestNight <- paste(Owls$Nest, "1",sep = "_"),
       Owls$NestNight <- paste(Owls$Nest, "2",sep = "_"))
# Tạo một biến phân loại mới xác định các quan sát từ một đêm duy nhất tại một tổ cụ thể.
