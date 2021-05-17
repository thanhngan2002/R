setwd("C://Users//Admin//Downloads")
DS <- read.table('Vegetation2.txt', header = TRUE)
names(DS)
str(DS)
# Bi???n Species (loài) t??? c???t th??? 3 d???n 76 trong bi???n DS
Species <- DS[,5:9]
names(Species)
str(Species)
# Ki???m tra dimensions - chi???u c???a bi???n Species
n <- dim(Species)
n
sum(Species[1,], na.rm = TRUE)
sum(Species[2,], na.rm = TRUE)

TA <- vector(length = n[1])
for (i in 1:n[1]){
  TA[i] <- sum(Species[i,], na.rm = TRUE)
}
TA
#Hàm rowSums: tính toán t???ng c???a các c???t ??? trong b???ng
# Tham s??? na.rm =  TRUE => lo???i b??? các giá tr??? r???ng
TA02 <- rowSums(Species,na.rm = TRUE)
TA02
# Ði vào chi ti???t t???i t???ng v??? trí quan sát
sum(Species[1,]>0, na.rm = TRUE)
Richness <- vector(length = n[1])
for (i in 1:n[1]){
  Richness[i] <- sum(Species[i,]>0, na.rm = TRUE)
}  
Richness

Richness02 <- rowSums(Species>0, na.rm = TRUE)
Richness02
# Ch??? s??? ða d???ng loài
#H - sum bi???n ch???y t??? i -> m c???a bi???n p: xác xu???t * log10 p
RS <- rowSums(Species, na.rm=TRUE)
prop <- Species / RS
H <- -rowSums(prop * log10(prop), na.rm= TRUE)
H
# K???t h???p l???i h???t nh???ng g?? ð?? làm vô 1 hàm 
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

