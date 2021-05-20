setwd("C://Users//Admin//Downloads")
#Bai Tap 1
#a
BFCases = read.table(file = 'BirdFluCases.txt',sep="\t", header=TRUE)
names(BFCases)
str(BFCases)
Cases =rowSums(BFCases[,2:16])
names(Cases)=BFCases[,1]
Cases
par(mfrow=c(2,2),mar=c(3,3,2,1))
pie(Cases,main="Ch???t m???i nãm")
#b
Cases1=colSums(BFCases[2:16],na.rm=TRUE)
Cases1
pie(Cases1,main="Ch???t m???i qu???c gia")
#Bai Tap 2
veg = read.table('vegetation2.txt',header=TRUE)
veg.M <-tapply(veg$R, 
               INDEX=veg$Transect, 
               FUN=mean)
veg.sd <-tapply(veg$R, 
                INDEX=veg$Transect, 
                FUN=sd)
MSD <- cbind(veg.M, veg.sd)
MSD
barplot(veg.M)
bp <- barplot(veg.M, xlab="Transect",
              ylim = c(0,20),
              ylab="R",
              col=rainbow(9)
)
arrows(bp, veg.M, 
       bp, veg.M+veg.sd,
       lwd=1.5,
       angle=90,
       length=0.1
)
box()
veg.le <- tapply(veg$R,
                 INDEX=veg$Transect,
                 FUN=length)
#se= standard error= 
#ð??? l???ch chu???n / cãn b???c hai c???a kích thý???c m???u
#
veg.se <- veg.sd/sqrt(veg.le)
veg.se
stripchart(veg$R~veg$Transect,
           vert=TRUE,
           pch=1,
           method="jitter",
           jit=0.05,
           xlab="R",
           ylab="Transect")
points(1:8, veg.M, pch=16,
       cex=1.5)
arrows(1:8, veg.M,
       1:8, veg.M+veg.se,
       lwd=1.5,
       angle=90,
       length = 0.1)
arrows(1:8, veg.M,
       1:8, veg.M-veg.se,
       lwd=1.5,
       angle=90,
       length = 0.1)

