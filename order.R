help(order)
"Sự miêu tả
order trả về một hoán vị sắp xếp lại đối số đầu tiên của nó thành thứ tự tăng dần hoặc giảm dần, phá vỡ mối quan hệ bằng các đối số khác. sort.list cũng làm như vậy, chỉ sử dụng một đối số.
Xem các ví dụ để biết cách sử dụng các hàm này để sắp xếp các khung dữ liệu, v.v.
Sử dụng"
order(..., na.last = TRUE, decreasing = FALSE,
      method = c("auto", "shell", "radix"))

sort.list(x, partial = NULL, na.last = TRUE, decreasing = FALSE,
          method = c("auto", "shell", "quick", "radix"))
"Tranh luận
...
một chuỗi các vectơ số, phức, ký tự hoặc lôgic, tất cả đều có cùng độ dài hoặc một đối tượng R được phân loại.
x
một vector nguyên tử cho các phương thức "shell" và "quick". Khi x là đối tượng R không phải nguyên tử, các phương thức "tự động" và "cơ số" mặc định có thể hoạt động nếu thứ tự (x, ..) có.
partial
vectơ của các chỉ số để sắp xếp từng phần. (Các giá trị không phải NULL không được triển khai.)
decreasing
hợp lý. Thứ tự sắp xếp nên tăng hay giảm? Đối với phương thức "cơ số", đây có thể là một vectơ có độ dài bằng số đối số trong .... Đối với các phương thức khác, nó phải có độ dài bằng một.
na.last
để kiểm soát việc đối xử với NAs. Nếu TRUE, các giá trị bị thiếu trong dữ liệu được đặt cuối cùng; nếu FALSE, chúng được đặt trước; nếu NA, chúng sẽ bị xóa (xem phần "Lưu ý".)
method
phương pháp được sử dụng: cho phép các kết quả phù hợp từng phần. Giá trị mặc định ("tự động") ngụ ý "cơ số" cho các vectơ số ngắn, vectơ số nguyên, vectơ logic và hệ số. Nếu không, nó bao hàm "shell". Để biết chi tiết về các phương thức "shell", "quick" và "radix", hãy xem phần trợ giúp để sắp xếp."
"Chi tiết
Trong trường hợp liên kết trong vectơ đầu tiên, các giá trị trong vectơ thứ hai được sử dụng để phá vỡ các ràng buộc. Nếu các giá trị vẫn bị ràng buộc, các giá trị trong các đối số sau này được sử dụng để phá vỡ ràng buộc (xem ví dụ đầu tiên). Loại được sử dụng là ổn định (ngoại trừ method = "quick"), vì vậy mọi ràng buộc chưa được giải quyết sẽ được giữ nguyên theo thứ tự ban đầu của chúng.
Các giá trị phức tạp được sắp xếp đầu tiên theo phần thực, sau đó là phần ảo.
Ngoại trừ phương thức "cơ số", thứ tự sắp xếp cho các vectơ ký tự sẽ phụ thuộc vào trình tự đối chiếu của ngôn ngữ được sử dụng: xem So sánh.
Phương pháp "shell" nói chung là đặt cược an toàn nhất và là phương pháp mặc định, ngoại trừ các thừa số ngắn, vectơ số, vectơ số nguyên và vectơ logic, trong đó "cơ số" được giả định. Phương pháp "cơ số" sắp xếp ổn định các vectơ logic, số và ký tự trong thời gian tuyến tính. Nó hoạt động tốt hơn các phương pháp khác, mặc dù có những lưu ý (xem phần sắp xếp). Phương thức "quick" cho sort.list chỉ được hỗ trợ cho số x với na.last = NA, không ổn định và chậm hơn "cơ số".
một phần = NULL được hỗ trợ để tương thích với các triển khai khác của S, nhưng không có giá trị nào khác được chấp nhận và việc sắp xếp luôn hoàn tất.
Đối với một đối tượng R được phân lớp, thứ tự sắp xếp được lấy từ xtfrm: như trang trợ giúp của nó ghi chú, điều này có thể chậm trừ khi một phương thức phù hợp đã được xác định hoặc is.numeric (x) là đúng. Đối với các yếu tố, điều này sắp xếp theo mã nội bộ, đặc biệt thích hợp cho các yếu tố có thứ tự.
Giá trị
Một vectơ số nguyên trừ khi bất kỳ đầu vào nào có 2 ^ 31 phần tử trở lên, khi nó là một vectơ kép.
Cảnh báo
Trong sử dụng theo chương trình, không an toàn khi đặt tên cho các đối số ..., vì tên có thể khớp với các đối số điều khiển hiện tại hoặc trong tương lai, chẳng hạn như giảm dần. Một thực tế không an toàn đôi khi gặp phải là gọi do.call ('order', df_obj) trong đó df_obj có thể là một khung dữ liệu: sao chép df_obj và xóa bất kỳ tên nào, chẳng hạn như sử dụng unname.
Ghi chú
sort.list có thể bị gọi nhầm như một phương thức để sắp xếp với đối số danh sách: nó đưa ra một thông báo lỗi phù hợp cho danh sách x.
Có một sự khác biệt lịch sử về hành vi đối với na.last = NA: sort.list xóa các NA và sau đó tính thứ tự giữa các phần tử còn lại: order tính thứ tự giữa các phần tử không phải NA của vectơ ban đầu. Như vậy"
x[order(x, na.last = NA)]
zz <- x[!is.na(x)]; zz[sort.list(x, na.last = NA)]
cả hai sắp xếp các giá trị không phải NA của x.

Trước R 3.3.0 method = "radix" chỉ được hỗ trợ cho các số nguyên có phạm vi nhỏ hơn 100.000.
"Người giới thiệu
Becker, R. A., Chambers, J. M. and Wilks, A. R. (1988) The New S Language. Wadsworth & Brooks/Cole.
Knuth, D. E. (1998) The Art of Computer Programming, Volume 3: Sorting and Searching. 2nd ed. Addison-Wesley."
"các ví dụ"
require(stats)

(ii <- order(x <- c(1,1,3:1,1:4,3), y <- c(9,9:1), z <- c(2,1:9)))
## 6  5  2  1  7  4 10  8  3  9
rbind(x, y, z)[,ii] # shows the reordering (ties via 2nd & 3rd arg)

## Suppose we wanted descending order on y.
## A simple solution for numeric 'y' is
rbind(x, y, z)[, order(x, -y, z)]
## More generally we can make use of xtfrm
cy <- as.character(y)
rbind(x, y, z)[, order(x, -xtfrm(cy), z)]
## The radix sort supports multiple 'decreasing' values:
rbind(x, y, z)[, order(x, cy, z, decreasing = c(FALSE, TRUE, FALSE),
                       method="radix")]

## Sorting data frames:
dd <- transform(data.frame(x, y, z),
                z = factor(z, labels = LETTERS[9:1]))
## Either as above {for factor 'z' : using internal coding}:
dd[ order(x, -y, z), ]
## or along 1st column, ties along 2nd, ... *arbitrary* no.{columns}:
dd[ do.call(order, dd), ]

set.seed(1)  # reproducible example:
d4 <- data.frame(x = round(   rnorm(100)), y = round(10*runif(100)),
                 z = round( 8*rnorm(100)), u = round(50*runif(100)))
(d4s <- d4[ do.call(order, d4), ])
(i <- which(diff(d4s[, 3]) == 0))
#   in 2 places, needed 3 cols to break ties:
d4s[ rbind(i, i+1), ]

## rearrange matched vectors so that the first is in ascending order
x <- c(5:1, 6:8, 12:9)
y <- (x - 5)^2
o <- order(x)
rbind(x[o], y[o])

## tests of na.last
a <- c(4, 3, 2, NA, 1)
b <- c(4, NA, 2, 7, 1)
z <- cbind(a, b)
(o <- order(a, b)); z[o, ]
(o <- order(a, b, na.last = FALSE)); z[o, ]
(o <- order(a, b, na.last = NA)); z[o, ]


##  speed examples on an average laptop for long vectors:
##  factor/small-valued integers:
x <- factor(sample(letters, 1e7, replace = TRUE))
system.time(o <- sort.list(x, method = "quick", na.last = NA)) # 0.1 sec
stopifnot(!is.unsorted(x[o]))
system.time(o <- sort.list(x, method = "radix")) # 0.05 sec, 2X faster
stopifnot(!is.unsorted(x[o]))
##  large-valued integers:
xx <- sample(1:200000, 1e7, replace = TRUE)
system.time(o <- sort.list(xx, method = "quick", na.last = NA)) # 0.3 sec
system.time(o <- sort.list(xx, method = "radix")) # 0.2 sec
##  character vectors:
xx <- sample(state.name, 1e6, replace = TRUE)
system.time(o <- sort.list(xx, method = "shell")) # 2 sec
system.time(o <- sort.list(xx, method = "radix")) # 0.007 sec, 300X faster
##  double vectors:
xx <- rnorm(1e6)
system.time(o <- sort.list(xx, method = "shell")) # 0.4 sec
system.time(o <- sort.list(xx, method = "quick", na.last = NA)) # 0.1 sec
system.time(o <- sort.list(xx, method = "radix")) # 0.05 sec, 2X faster
