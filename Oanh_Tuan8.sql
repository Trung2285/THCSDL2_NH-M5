--a)Cập nhật lại giá trị trường NGAYCHUYENHANG của những bản ghi có NGAYCHUYENHANG chưa xác định (NULL)
-- trong bảng DONDATHANG bằng với giá trị của trường NGAYDATHANG.
UPDATE DonDatHang
SET ngayChuyenHang = ngayDatHang
WHERE ngayChuyenHang IS NULL;

--b) Tăng số lượng hàng của những mặt hàng do Nhà Cung Cấp A cung cấp lên gấp đôi.
UPDATE MatHang 
SET soLuong= soLuong*2
FROM NhaCungCap ncc
WHERE ncc.maCT=MatHang.CTNo
	and tenCongTy = N'Nhà Cung Cấp A'

--c) Cập nhật giá trị của trường NOIGIAOHANG trong bảng DONDATHANG bằng địa chỉ của khách hàng 
--đối với những đơn đặt hàng chưa xác định được nơi giao hàng (giá trị trường NOIGIAOHANG bằng NULL).
UPDATE DonDatHang
SET noiGiaoHang=kh.diaChi
FROM KhachHang kh
WHERE kh.maKH=DonDatHang.KHNo
  
--d) Cập nhật lại dữ liệu trong bảng KHACHHANG sao cho nếu tên công ty và tên giao dịch của khách hàng trùng với 
--tên công ty và tên giao dịch của một nhà cung cấp nào đó thì địa chỉ, điện thoại, fax và e-mail phải giống nhau.
UPDATE KhachHang
SET diaChi=ncc.diaChi, fax=ncc.FAX,Email=ncc.Email
FROM NhaCungCap ncc
WHERE KhachHang.tenCongTy=ncc.tenCongTy and KhachHang.tenGiaoDich=ncc.tenGiaoDich

--e) Tăng lương lên gấp rưỡi cho những nhân viên bán được số lượng hàng nhiều hơn 100 trong năm 2022.
UPDATE NhanVien
SET luongCoBan=luongCoBan*1.5
WHERE maNV in(
	SELECT ddh.NVNo
	FROM ChiTietDatHang ct, DonDatHang ddh
	WHERE ct.HDNo=ddh.soHoaDon and YEAR(ddh.ngayDatHang)=2022
	GROUP BY ddh.NVNo
	HAVING sum(soLuong)>100)

--f) Tăng phụ cấp lên bằng 50% lương cho những nhân viên bán được hàng nhiều nhất.
UPDATE NhanVien
SET phuCap=luongCoBan/2
WHERE maNV in(
	SELECT ddh.NVNo
	FROM  ChiTietDatHang ct, DonDatHang ddh
	WHERE ct.HDNo=ddh.soHoaDon 
	GROUP BY ddh.NVNo
	HAVING SUM(soLuong) in (
		SELECT TOP 1 SUM(soLuong) Tong
		FROM ChiTietDatHang ct, DonDatHang ddh
		WHERE  ct.HDNo=ddh.soHoaDon 
		GROUP BY ddh.NVNo
		ORDER BY Tong desc))

--g) Giảm 25% lương của những nhân viên trong năm 2023 không lập được bất kỳ đơn đặt hàng nào.
UPDATE NhanVien
SET luongCoBan=luongCoBan-luongCoBan*0.25
WHERE maNV not in(
	SELECT ddh.NVNo
	FROM ChiTietDatHang ct, DonDatHang ddh
	WHERE ct.HDNo=ddh.soHoaDon and YEAR(ddh.ngayDatHang)=2023 )
	
--select*from NhanVien