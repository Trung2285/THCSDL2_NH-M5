
-- Bổ sung ràng buộc cho bảng DonDatHang kiểm tra ngày giao hàng và ngày chuyển hàng 
ALTER TABLE DonDatHang
	ADD CONSTRAINT CK_DonDatHang_Dates CHECK (ngayGiaoHang >= ngayDatHang AND ngayChuyenHang >= ngayDatHang);
