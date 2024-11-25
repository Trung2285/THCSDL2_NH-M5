
--b) Tăng số lượng hàng của những mặt hàng do công ty VINAMILK cung cấp lên gấp đôi
UPDATE NhaCungCap
SET maCT = 'VNM'
WHERE maCT = 'CT0001';

UPDATE NhaCungCap
SET tenCongTy = 'VINAMILK'
WHERE tenCongTy = N'Nhà Cung Cấp A';

<<<<<<< HEAD
set dateformat dmy
--Thêm dữ liệu bảng KhachHang
INSERT INTO KhachHang (maKH, tenCongTy, tenGiaoDich, diaChi, Email, dienThoai, FAX) 
	VALUES	('KH0001', N'Công Ty A', N'Giao Dịch A', N'Hà Nội', 'email1@cty.com', '0123456789', '0123456780'),
			('KH0002', N'Công Ty B', N'Giao Dịch B', N'Hồ Chí Minh', 'email2@cty.com', '0123456788', '0123456781'),
			('KH0003', N'Công Ty C', N'Giao Dịch C', N'Đà Nẵng', 'email3@cty.com', '0123456787', '0123456782'),
			('KH0004', N'Công Ty D', N'Giao Dịch D', N'Hải Phòng', 'email4@cty.com', '0123456786', '0123456783'),
			('KH0005', N'Công Ty E', N'Giao Dịch E', N'Cần Thơ', 'email5@cty.com', '0123456785', '0123456784'),
			('KH0006', N'Công Ty F', N'Giao Dịch F', N'Vũng Tàu', 'email6@cty.com', '0123456784', '0123456785'),
			('KH0007', N'Công Ty G', N'Giao Dịch G', N'Bình Dương', 'email7@cty.com', '0123456783', '0123456786'),
			('KH0008', N'Công Ty H', N'Giao Dịch H', N'Đồng Nai', 'email8@cty.com', '0123456782', '0123456787'),
			('KH0009', N'Công Ty I', N'Giao Dịch I', N'Thanh Hóa', 'email9@cty.com', '0123456781', '0123456788'),
			('KH0010', N'Công Ty J', N'Giao Dịch J', N'Nghệ An', 'email10@cty.com', '0123456780', '0123456789');
--insert dữ liệu vào bảng Nhân Viên
insert into NhanVien
	values	('NV0001' , N'Lê' , N'Huy Hùng' , '20/10/2001' , '19/11/2020' , N'Quảng Nam' , '0366827182' , 5000000 , 100000),
			('NV0002', N'Nguyễn', N'Văn An', '15/02/1999', '05/06/2020', N'Hà Nội', '0377123456', 5000000, 150000),
			('NV0003', N'Trần', N'Thị Hoa', '22/11/1998', '12/01/2021', N'TP Hồ Chí Minh', '0356123456', 5200000, 200000),
			('NV0004', N'Lê', N'Thị Lan', '30/04/2001', '10/07/2019', N'Đà Nẵng', '0345123456', 5100000, 120000),
			('NV0005', N'Hoàng', N'Quang Minh', '05/08/1997', '21/03/2018', N'Hải Phòng', '0334123456', 5800000, 100000),
			('NV0006', N'Phạm', N'Văn Tuấn', '10/12/1996', '01/02/2020', N'Huế', '0323123456', 5400000, 180000),
			('NV0007', N'Vũ', N'Thị Mai', '25/09/1999', '15/08/2021', N'Cần Thơ', '0312123456', 5300000, 160000),
			('NV0008', N'Đặng', N'Hoài Nam', '12/03/1995', '11/11/2018', N'Quảng Ngãi', '0301123456', 6000000, 140000),
			('NV0009', N'Bùi', N'Thị Hương', '18/07/2000', '05/09/2021', N'Bình Dương', '0390123456', 5150000, 130000),
			('NV0010', N'Ngô', N'Văn Khang', '02/06/2002', '20/10/2022', N'Nha Trang', '0389123456', 5050000, 170000);
--thêm dữ liệu vào bảng LoaiHang
INSERT INTO DonDatHang (soHoaDon, KHNo, NVNo, ngayDatHang, ngayGiaoHang, ngayChuyenHang, noiGiaoHang) 
	VALUES	('HD0001', 'KH0001', 'NV0001', '2023-10-10', '2023-10-12', '2023-10-15', N'Hà Nội'),
			('HD0002', 'KH0002', 'NV0002', '2023-10-11', '2023-10-13', '2023-10-16', N'Hồ Chí Minh'),
			('HD0003', 'KH0003', 'NV0003', '2023-10-12', '2023-10-14', '2023-10-17', N'Đà Nẵng'),
			('HD0004', 'KH0004', 'NV0004', '2023-10-13', '2023-10-15', '2023-10-18', N'Hải Phòng'),
			('HD0005', 'KH0005', 'NV0005', '2023-10-14', '2023-10-16', '2023-10-19', N'Cần Thơ'),
			('HD0006', 'KH0006', 'NV0006', '2023-10-15', '2023-10-17', '2023-10-20', N'Vũng Tàu'),
			('HD0007', 'KH0007', 'NV0007', '2023-10-16', '2023-10-18', '2023-10-21', N'Bình Dương'),
			('HD0008', 'KH0008', 'NV0008', '2023-10-17', '2023-10-19', '2023-10-22', N'Đồng Nai'),
			('HD0009', 'KH0009', 'NV0001', '2023-10-18', '2023-10-20', '2023-10-23', N'Thanh Hóa'),
			('HD0010', 'KH0010', 'NV0001', '2023-10-19', '2023-10-21', '2023-10-24', null);
--Thêm dữ liệu vào bảng NhaCungCap
INSERT INTO NhaCungCap (maCT, tenCongTy, tenGiaoDich, diaChi, dienThoai, FAX, Email) 
	VALUES	('CT0001', N'Nhà Cung Cấp A', N'Giao Dịch A', N'Hà Nội', '0934567890', '0234567890', 'ncc1@cty.com'),
			('CT0002', N'Nhà Cung Cấp B', N'Giao Dịch B', N'Hồ Chí Minh', '0934567891', '0234567891', 'ncc2@cty.com'),
			('CT0003', N'Nhà Cung Cấp C', N'Giao Dịch C', N'Đà Nẵng', '0934567892', '0234567892', 'ncc3@cty.com'),
			('CT0004', N'Nhà Cung Cấp D', N'Giao Dịch D', N'Hải Phòng', '0934567893', '0234567893', 'ncc4@cty.com'),
			('CT0005', N'Nhà Cung Cấp E', N'Giao Dịch E', N'Cần Thơ', '0934567894', '0234567894', 'ncc5@cty.com'),
			('CT0006', N'Nhà Cung Cấp F', N'Giao Dịch F', N'Vũng Tàu', '0934567895', '0234567895', 'ncc6@cty.com'),
			('CT0007', N'Nhà Cung Cấp G', N'Giao Dịch G', N'Bình Dương', '0934567896', '0234567896', 'ncc7@cty.com'),
			('CT0008', N'Nhà Cung Cấp H', N'Giao Dịch H', N'Đồng Nai', '0934567897', '0234567897', 'ncc8@cty.com'),
			('CT0009', N'Nhà Cung Cấp I', N'Giao Dịch I', N'Thanh Hóa', '0934567898', '0234567898', 'ncc9@cty.com'),
			('CT0010', N'Nhà Cung Cấp J', N'Giao Dịch J', N'Nghệ An', '0934567899', '0234567899', 'ncc10@cty.com');
--Thêm dữ liệu vào bảng LoaiHang
INSERT INTO LoaiHang (maLH, tenLH) 
	VALUES	('LH0001', N'Điện tử'),
			('LH0002', N'Gia dụng'),
			('LH0003', N'Thời trang'),
			('LH0004', N'Thực phẩm'),
			('LH0005', N'Đồ chơi'),
			('LH0006', N'Văn phòng phẩm'),
			('LH0007', N'Thiết bị y tế'),
			('LH0008', N'Sách'),
			('LH0009', N'Đồ gỗ'),
			('LH0010', N'Hóa mỹ phẩm');
--Thêm dữ liệu vào bảng MatHang
INSERT INTO MatHang (maHang, tenHang, CTNo, LHNo, soLuong, donViTinh, giaHang) 
	VALUES	('MH0001', N'Sữa', 'CT0001', 'LH0001', 100, N'Cái', 15000000),
			('MH0002', N'Laptop', 'CT0002', 'LH0002', 50, N'Cái', 8000000),
			('MH0003', N'Áo khoác', 'CT0003', 'LH0003', 200, N'Cái', 500000),
			('MH0004', N'Tủ lạnh', 'CT0004', 'LH0004', 300, N'Thùng', 350000),
			('MH0005', N'Đồ chơi Lego', 'CT0005', 'LH0005', 100, N'Bộ', 1200000),
			('MH0006', N'Bút bi', 'CT0006', 'LH0006', 1000, N'Cây', 2000),
			('MH0007', N'Máy đo huyết áp', 'CT0007', 'LH0007', 100, N'Cái', 800000),
			('MH0008', N'Sách giáo khoa', 'CT0008', 'LH0008', 500, N'Cuốn', 50000),
			('MH0009', N'Bàn gỗ', 'CT0009', 'LH0009', 50, N'Cái', 1500000),
			('MH0010', N'Nước rửa tay', 'CT0010', 'LH0010', 200, N'Chai', 30000);
--Thêm dữ liệu vào bảng ChiTietDatHang
INSERT INTO ChiTietDatHang (HDNo, MHNo, giaBan, soLuong, mucGiamGia) 
	VALUES	('HD0001', 'MH0001', 14500000, 2, 0.05),
			('HD0002', 'MH0002', 7800000, 1, 0.03),
			('HD0003', 'MH0003', 480000, 3, 0.02),
			('HD0004', 'MH0004', 340000, 5, 0.01),
			('HD0005', 'MH0005', 1150000, 1, 0.1),
			('HD0006', 'MH0006', 1900, 50, 0.05),
			('HD0007', 'MH0007', 760000, 2, 0.04),
			('HD0008', 'MH0008', 48000, 20, 0.02),
			('HD0009', 'MH0009', 1400000, 1, 0.05),
			('HD0010', 'MH0010', 29000, 10, 0.0);
------------------------------------------------------------------------------------
---------------------------  TUẦN 8  -----------------------------------------------
------------------------------------------------------------------------------------
--a) Cập nhật lại giá trị trường NGAYCHUYENHANG của những bản ghi có NGAYCHUYENHANG
--   chưa xác định (NULL) trong bảng DONDATHANG bằng với giá trị của trường NGAYDATHANG.
UPDATE  DonDatHang
SET     ngayChuyenHang = ngayDatHang
WHERE   ngayChuyenHang is null
 
--b) Tăng số lượng hàng của những mặt hàng do công ty VINAMILK cung cấp lên gấp đôi.
UPDATE NhaCungCap
SET maCT = 'VNM'
WHERE maCT = 'CT0001';

UPDATE NhaCungCap
SET tenCongTy = N'VINAMILK'
WHERE tenCongTy = N'Nhà Cung Cấp A';

=======
>>>>>>> 679dd96f7c1fc0c2df11bbd10e4f718f534f23a9
UPDATE MatHang
SET soLuong = soLuong * 2
WHERE CTNo = 'VNM';

--c) Cập nhật giá trị của trường NOIGIAOHANG trong bảng DONDATHANG bằng địa chỉ của
--khách hàng đối với những đơn đặt hàng chưa xác định được nơi giao hàng (giá trị trường NOIGIAOHANG bằng NULL).
update DonDatHang
<<<<<<< HEAD
set noiGiaoHang = KhachHang.diaChi
from KhachHang
where DonDatHang.KHNo=KhachHang.maKH and noiGiaoHang is null;
--d) Cập nhật lại dữ liệu trong bảng KHACHHANG sao cho nếu tên công ty và tên giao dịch của khách hàng 
--trùng với tên công ty và tên giao dịch của một nhà cung cấp nào đó thì địa chỉ, điện thoại, fax và e-mail phải giống nhau.
UPDATE KhachHang
SET diaChi = nc.diaChi,
    dienThoai = nc.dienThoai,
    FAX = nc.FAX,
    Email = nc.Email
FROM NhaCungCap nc
WHERE KhachHang.tenCongTy = nc.tenCongTy
  AND KhachHang.tenGiaoDich = nc.tenGiaoDich;


--e) Tăng lương lên gấp rưỡi cho những nhân viên bán được số lượng hàng nhiều hơn 100 trong năm 2022.
UPDATE NhanVien
SET luongCoBan = luongCoBan * 1.5
WHERE maNV IN (
    SELECT DISTINCT NVNo
    FROM DonDatHang as d, ChiTietDatHang as c
    WHERE d.soHoaDon = c.HDNo and d.ngayDatHang >= '2022-01-01' AND d.ngayDatHang < '2023-01-01'
    GROUP BY NVNo
    HAVING SUM(c.soLuong) > 100
);

-- f) Tăng phụ cấp lên bằng 50% lương cho những nhân viên bán được hàng nhiều nhất.
UPDATE  NhanVien
SET     phuCap=luongCoBan/2
WHERE   maNV in(
	    SELECT ddh.NVNo
	    FROM  ChiTietDatHang ct, DonDatHang ddh
	    WHERE ct.HDNo=ddh.soHoaDon 
	    GROUP BY ddh.NVNo
	    HAVING SUM(soLuong) in (SELECT TOP 1 SUM(soLuong) Tong
		                        FROM ChiTietDatHang ct, DonDatHang ddh
		                        WHERE  ct.HDNo=ddh.soHoaDon 
		                        GROUP BY ddh.NVNo
			                        ORDER BY Tong desc));
		                        
--g) Giảm 25% lương của những nhân viên trong năm 2023 không lập được bất kỳ đơn đặt hàng nào.
UPDATE NhanVien
SET luongCoBan = luongCoBan * 0.75
WHERE maNV NOT IN (
    SELECT NVNo
    FROM DonDatHang
    WHERE YEAR(ngayDatHang) = 2023)
------------------------------------------------------------------------------------
---------------------------  TUẦN 9  -----------------------------------------------
------------------------------------------------------------------------------------
--1.	Họ tên và địa chỉ và năm bắt đầu làm việc của các nhân viên trong công ty
select n.ho,n.ten,n.diaChi,year(n.ngayLamViec) "nam bat dau"
from NhanVien n
--2.	Công ty [Việt Tiến] đã cung cấp những mặt hàng nào?
update NhaCungCap
set maCT= 'VT'
where maCT= 'CT0002'

update NhaCungCap
set tenCongTy= N'Việt Tiến'
where tenCongTy= N'Nhà Cung Cấp B'

select m.maHang,m.tenHang
from MatHang m
where CTNo='VT'
--3.	Hãy cho biết có những khách hàng nào lại chính là đối tác cung cấp hàng của công ty (tức là có cùng tên giao dịch).
select k.maKH,k.tenCongTy,k.tenGiaoDich
from KhachHang k , NhaCungCap ncc
where k.tenGiaoDich=ncc.tenGiaoDich
--4.	Những nhân viên nào của công ty chưa từng lập bất kỳ một hoá đơn đặt hàng nào?
select n.maNV,n.ho,n.ten
from NhanVien n
where n.maNV not in	(	select NVNo
						from DonDatHang	)
--5.	Mỗi một nhân viên của công ty đã lập  bao nhiêu đơn đặt hàng (nếu nhân viên chưa hề lập một hoá đơn nào thì cho kết quả là 0)
select
		NV.maNV,
		NV.ho + ' ' + NV.ten as hoTen,
		isnull(
				(select count(*)
				 from DonDatHang DH
				 where DH.NVNo = NV.maNV),
				0
		) as soDonDatHang
from
    NhanVien NV
order by
    soDonDatHang desc;
--6.	Cho biết tổng số tiền hàng mà cửa hàng thu được trong mỗi tháng của năm 2022 (thời được gian tính theo ngày đặt hàng).
update DonDatHang
set ngayDatHang='2022-9-10'  
where ngayDatHang='2023-10-11'

update DonDatHang
set ngayDatHang='2022-8-11'  
where ngayDatHang='2023-10-12'

SELECT MONTH(ngayDatHang) AS Thang, SUM(giaBan * soLuong * (1 - mucGiamGia)) AS TongTienHang
FROM DonDatHang, ChiTietDatHang
WHERE DonDatHang.soHoaDon = ChiTietDatHang.HDNo
  AND YEAR(ngayDatHang) = 2022
GROUP BY MONTH(ngayDatHang);
------------------------------------------------------------------------------------
---------------------------  TUẦN 12  -----------------------------------------------
------------------------------------------------------------------------------------
--4.	Địa chỉ và điện thoại của nhà cung cấp có tên giao dịch [VINAMILK]  là gì?
update NhaCungCap
set tenGiaoDich = N'VINAMILK'
where tenGiaoDich = N'Giao Dịch A'

select diaChi , dienThoai
from NhaCungCap
where	tenGiaoDich = N'VINAMILK'
--5.	Cho biết mã và tên của các mặt hàng có giá lớn hơn 100000 và số lượng hiện có ít hơn 50.
update MatHang
set soLuong = 40 
where	soLuong = 100

select maHang , tenHang , giaHang , soLuong 
from MatHang
where giaHang > 100000 and soLuong < 50
--6.	Cho biết mỗi mặt hàng trong công ty do ai cung cấp.

select m.maHang,m.tenHang,n.maCT as maBenCungCap,n.tenCongTy as benCungCap,n.tenGiaoDich 
from MatHang m,NhaCungCap n
where	m.CTNo = n.maCT
--7.	Công ty [Việt Tiến] đã cung cấp những mặt hàng nào?
select m.maHang,m.tenHang,n.maCT,n.tenCongTy,n.tenGiaoDich 
from MatHang m, NhaCungCap n
where m.CTNo = n.maCT and n.tenCongTy = N'Việt Tiến'
=======
set noiGiaoHang = (
 			SELECT diaChi
        		FROM KhachHang
        		WHERE KhachHang.maKH = DonDatHang.KHNo
		  )
where	 noiGiaoHang is null;
>>>>>>> 679dd96f7c1fc0c2df11bbd10e4f718f534f23a9
