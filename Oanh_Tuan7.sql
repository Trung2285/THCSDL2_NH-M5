-- Nh?p d? li?u cho b?ng LoaiHang
INSERT INTO LoaiHang( maLH,tenLH)
VALUES ('LH00000001',N'M? Ph?m'),
		('LH00000002',N'Ð? dùng vãn ph?ng'),
		('LH00000003',N'Ð? sinh ho?t cá nhân'),
		('LH00000004',N'Th? cào ði?n tho?i'),
		('LH00000005',N'Gi?y'),
		('LH00000006',N'Ð? ðông l?nh'),
		('LH00000007',N'Ð? ãn nhanh'),
		('LH00000008', N'S?a'),
		('LH00000009',N'Ð? u?ng'),
		('LH00000010', N'Gia v?');
--Nh?p d? li?u cho b?ng MatHang
INSERT INTO MatHang(maHang,tenHang,CTNo,LHNo,soLuong,donViTinh,giaHang)
VALUES ('MH00000001',N'S?a chua u?ng Yakut','1234567890','LH00000008',10,N'Chai',25000),
		('MH00000002',N'Vinamilk','1234567890','LH00000008',5,N'Két',435000),
		('MH00000003',N'Cocacola lon','1234567890','LH00000009',10,N'Két',300000),
		('MH00000004',N'Ch? cá viên','1234567890','LH00000006',20,N'Gói',55000),
		('MH00000005',N'Bánh m? hoa cúc','1234567890','LH00000007',20,N'Gói',27000),
		('MH00000006',N'Gi?y ãn','1234567890','LH00000005',50,N'H?p',20000),
		('MH00000007',N'Bút','1234567890','LH00000002',20,N'H?p',65000),
		('MH00000008',N'S?','1234567890','LH00000002',50,N'Quy?n',30000),
		('MH0000009',N'H?t nêm Knorr','1234567890','LH00000010',70,N'Gói',35000),
		('MH00000010',N'Mu?i I-?t','1234567890','LH00000010',70,N'Gói',5000);
