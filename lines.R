help(lines)
"Thêm các đoạn đường được kết nối vào một lô đất
Sự miêu tả
Một hàm tổng quát lấy các tọa độ được đưa ra theo nhiều cách khác nhau và nối các điểm tương ứng với các đoạn thẳng.
Sử dụng"
lines(x, ...)

## Default S3 method:
lines(x, y = NULL, type = "l", ...)
"Tranh Luận
x,y   tọa độ các vectơ của các điểm tham gia.
type  ký tự chỉ kiểu của plot; thực sự là bất kỳ loại nào như trong plot.default.
......"
"Chi tiết
Các tọa độ có thể được truyền trong cấu trúc biểu đồ (danh sách với các thành phần x và y), ma trận hai cột, chuỗi thời gian, .... Xem xy.coords. Nếu được cung cấp riêng, chúng phải có cùng chiều dài.
Các tọa độ có thể chứa các giá trị NA. Nếu một điểm chứa NA trong giá trị x hoặc y của nó, nó sẽ bị bỏ qua khỏi biểu đồ và các đường không được vẽ đến hoặc từ các điểm đó. Do đó, các giá trị bị thiếu có thể được sử dụng để đạt được ngắt dòng.
Đối với type = "h", col có thể là một vector và sẽ được tái chế khi cần thiết.
lwd có thể là một vectơ: phần tử đầu tiên của nó sẽ áp dụng cho các dòng nhưng toàn bộ vectơ cho các biểu tượng (được tái chế khi cần thiết)."
"Người giới thiệuu
Becker, R. A., Chambers, J. M. and Wilks, A. R. (1988) The New S Language. Wadsworth & Brooks/Cole."
"các ví dụ"
# draw a smooth line through a scatter plot
plot(cars, main = "Stopping Distance versus Speed")
lines(stats::lowess(cars))
