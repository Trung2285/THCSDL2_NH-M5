
--b) Tăng số lượng hàng của những mặt hàng do công ty VINAMILK cung cấp lên gấp đôi
UPDATE NhaCungCap
SET maCT = 'VNM'
WHERE maCT = 'CT0001';

UPDATE NhaCungCap
SET tenCongTy = 'VINAMILK'
WHERE tenCongTy = N'Nhà Cung Cấp A';

UPDATE MatHang
SET soLuong = soLuong * 2
WHERE CTNo = 'VNM';

--c) Cập nhật giá trị của trường NOIGIAOHANG trong bảng DONDATHANG bằng địa chỉ của
--khách hàng đối với những đơn đặt hàng chưa xác định được nơi giao hàng (giá trị trường NOIGIAOHANG bằng NULL).
update DonDatHang
set noiGiaoHang = (
 			SELECT diaChi
        		FROM KhachHang
        		WHERE KhachHang.maKH = DonDatHang.KHNo
		  )
where	 noiGiaoHang is null;
