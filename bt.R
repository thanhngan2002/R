#1
answer <- 0
for (j in 3:5){ answer <- j+answer }
answer
answer <- 10
for (j in 3:5){ answer <- j+answer }
answer
answer <- 10
for (j in 3:5){ answer <- j+answer }
answer
#2
help(prod)
prod(3:5,10)
#3
su <- 0
for (i in 1:100){su <- su +i}
su
sum(1:100)
#4
p<-1
for (i in 1:50){p <- p * i}
p
prod(1:50,na.rm = FALSE )
#5
radius <- c(3:20)
volume <- (4*pi*(radius)^3)/3
conversion <- data.frame(radius=radius, volume=volume)
print(conversion)
#6
tinting <- conversion
sapply(tinting, factor)
sapply(tinting[, 1:2], levels)
sapply(tinting[, 1:2], ordered)
