-- Nh?p d? li?u cho b?ng LoaiHang
INSERT INTO LoaiHang( maLH,tenLH)
VALUES ('LH00000001',N'M? Ph?m'),
		('LH00000002',N'�? d�ng v�n ph?ng'),
		('LH00000003',N'�? sinh ho?t c� nh�n'),
		('LH00000004',N'Th? c�o �i?n tho?i'),
		('LH00000005',N'Gi?y'),
		('LH00000006',N'�? ��ng l?nh'),
		('LH00000007',N'�? �n nhanh'),
		('LH00000008', N'S?a'),
		('LH00000009',N'�? u?ng'),
		('LH00000010', N'Gia v?');
--Nh?p d? li?u cho b?ng MatHang
INSERT INTO MatHang(maHang,tenHang,CTNo,LHNo,soLuong,donViTinh,giaHang)
VALUES ('MH00000001',N'S?a chua u?ng Yakut','1234567890','LH00000008',10,N'Chai',25000),
		('MH00000002',N'Vinamilk','1234567890','LH00000008',5,N'K�t',435000),
		('MH00000003',N'Cocacola lon','1234567890','LH00000009',10,N'K�t',300000),
		('MH00000004',N'Ch? c� vi�n','1234567890','LH00000006',20,N'G�i',55000),
		('MH00000005',N'B�nh m? hoa c�c','1234567890','LH00000007',20,N'G�i',27000),
		('MH00000006',N'Gi?y �n','1234567890','LH00000005',50,N'H?p',20000),
		('MH00000007',N'B�t','1234567890','LH00000002',20,N'H?p',65000),
		('MH00000008',N'S?','1234567890','LH00000002',50,N'Quy?n',30000),
		('MH0000009',N'H?t n�m Knorr','1234567890','LH00000010',70,N'G�i',35000),
		('MH00000010',N'Mu?i I-?t','1234567890','LH00000010',70,N'G�i',5000);
