-- Nhập dữ liệu cho bảng MatHang
INSERT INTO LoaiHang( maLH,tenLH)
VALUES ('LH00000001',N'Mỹ Phẩm'),
		('LH00000002',N'Đồ dùng văn phòng'),
		('LH00000003',N'Đồ sinh hoạt cá nhân'),
		('LH00000004',N'Thẻ cào điện thoại'),
		('LH00000005',N'Giấy'),
		('LH00000006',N'Đồ đông lạnh'),
		('LH00000007',N'Đồ ăn nhanh'),
		('LH00000008', N'Sữa'),
		('LH00000009',N'Đồ uống'),
		('LH00000010', N'Gia vị');
-- Nhập dữ liệu cho bảng MatHang
INSERT INTO MatHang(maHang,tenHang,CTNo,LHNo,soLuong,donViTinh,giaHang)
VALUES ('MH00000001',N'Sữa chua uống Yakut','1234567890','LH00000008',10,N'Chai',25000),
		('MH00000002',N'Vinamilk','1234567890','LH00000008',5,N'Két',435000),
		('MH00000003',N'Cocacola lon','1234567890','LH00000009',10,N'Két',300000),
		('MH00000004',N'Chả cá viên','1234567890','LH00000006',20,N'Gói',55000),
		('MH00000005',N'Bánh mì hoa cúc','1234567890','LH00000007',20,N'Gói',27000),
		('MH00000006',N'Giấy ăn','1234567890','LH00000005',50,N'Hộp',20000),
		('MH00000007',N'Bút','1234567890','LH00000002',20,N'Hộp',65000),
		('MH00000008',N'Sổ','1234567890','LH00000002',50,N'Quyển',30000),
		('MH0000009',N'Hạt nêm Knorr','1234567890','LH00000010',70,N'Gói',35000),
		('MH00000010',N'Muối I-ốt','1234567890','LH00000010',70,N'Gói',5000);