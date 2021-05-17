setwd("C://Users//Admin//Downloads")
DS <- read.table('Vegetation2.txt', header = TRUE)
names(DS)
str(DS)
#Biến Species (loài) từ cột thứ 5 đến 9 trong biến DS
Species <- DS[,5:9]
names(Species)
str(Species)
#Kiểm tra dimensions - chiều của biến Species
n <- dim(Species)
n
sum(Species[1,], na.rm = TRUE)
sum(Species[2,], na.rm = TRUE)

TA <- vector(length = n[1])
for (i in 1:n[1]){
  TA[i] <- sum(Species[i,], na.rm = TRUE)
}
TA
#Hàm rowSums: tính toán tổng của các cột ở trong hàng
#tham số na.rm=TRUE => Loại bỏ các giá trị rỗng
TA02 <- rowSums(Species,na.rm = TRUE)
TA02
#Đi vào chi tiết tại từng vị trí quan sát
sum(Species[1,]>0, na.rm = TRUE)
Richness <- vector(length = n[1])
for (i in 1:n[1]){
  Richness[i] <- sum(Species[i,]>0, na.rm = TRUE)
}  
Richness

Richness02 <- rowSums(Species>0, na.rm = TRUE)
Richness02
# Chỉ số đa dạng loài
#H - sum biến chạy từ i -> m của biến p: xác xuất * log10 p
RS <- rowSums(Species, na.rm=TRUE)
prop <- Species / RS
H <- -rowSums(prop * log10(prop), na.rm= TRUE)
H
# Kết hợp lại hết những gì đã làm vô 1 hàm 
Index.function <-function(Spec, Choice){
  if (Choice=="Richness") {
    Index <- rowSums(Species>0, na.rm = TRUE)
  }
  if (Choice=="Total Abundance") {
    Index <- rowSums(Species, na.rm = TRUE)
  }
  if (Choice=="Shannon") {
    RS <- rowSums(Species, na.rm=TRUE)
    prop <- Species / RS
    Index <- -rowSums(prop * log10(prop), na.rm= TRUE)
  }
  list(Index=Index, MyChoice= Choice)
}


Index.function(Species,"Shannon")
Index.function(Species,"Total Abundance")
Index.function(Species,"Richness")



