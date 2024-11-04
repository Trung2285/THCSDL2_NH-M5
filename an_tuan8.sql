
--b) Tăng số lượng hàng của những mặt hàng do công ty VINAMILK cung cấp lên gấp đôi.
update MatHang
set soLuong = soLuong * 2
where CTNo = N'CT0003';

--c) Cập nhật giá trị của trường NOIGIAOHANG trong bảng DONDATHANG bằng địa chỉ của
--khách hàng đối với những đơn đặt hàng chưa xác định được nơi giao hàng (giá trị trường NOIGIAOHANG bằng NULL).
update DonDatHang
set noiGiaoHang = (
        						SELECT diaChi
        						FROM KhachHang
        						WHERE KhachHang.maKH = DonDatHang.KHNo
					      )
where	 noiGiaoHang is null;
