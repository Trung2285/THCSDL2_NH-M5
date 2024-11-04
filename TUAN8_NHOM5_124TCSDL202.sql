-- Bổ sung câu lệnh if exists
if exists (select * from sys.databases where name = 'CONGTACGIAOHANG')
	begin
		use master
		alter database CONGTACGIAOHANG set single_user with rollback immediate
		drop database CONGTACGIAOHANG;
	end

CREATE DATABASE CONGTACGIAOHANG
GO
USE CONGTACGIAOHANG

--Tao bang KhachHang--
CREATE TABLE KhachHang
(
	maKH			char(10) primary key,
	tenCongTy		nvarchar(30),
	tenGiaoDich		nvarchar(30),
	diaChi			nvarchar(100) not null,
	Email			varchar(20) unique not null,
	dienThoai		varchar(11) not null,
	FAX				char(10)
);

--Tao bang NhanVien
CREATE TABLE NhanVien
(
	maNV		char(10) primary key,
	ho			nvarchar(10) not null,
	ten			nvarchar(15) not null,
	ngaySinh	date not null,
	ngayLamViec date,
	diaChi		nvarchar(100),
	dienThoai   varchar(11) unique,
	luongCoBan  decimal(15,2),
	phuCap		decimal(15,2)
);

--Tao bang DonDatHang--
CREATE TABLE DonDatHang
(
	soHoaDon	   char(10) primary key,
    KHNo           char(10),
    NVNo           char(10),	
	ngayDatHang    date,
	ngayGiaoHang   date,
	ngayChuyenHang date,
	noiGiaoHang    nvarchar(20)
);

--Tao bang LoaiHang
CREATE TABLE LoaiHang
(
	maLH	char(10) primary key,
	tenLH	nvarchar(20)
);

--Tao bang NhaCungCap
CREATE TABLE NhaCungCap
(
	maCT		 char(10) primary key,
	tenCongTy	 nvarchar(30),
	tenGiaoDich  nvarchar(30),
	diaChi		 nvarchar(30),
	dienThoai	 varchar(11) unique,
	FAX			 char(10) unique,
	Email	     varchar(20) unique
);

--Tao bang MatHang
CREATE TABLE MatHang
(
	maHang		char(10) primary key,
	tenHang		nvarchar(20),
    CTNo        char(10),
    LHNo        char(10),
	soLuong		float,
	donViTinh	nvarchar(10),
	giaHang		money
);
--Tao bang ChiTietDatHang

CREATE TABLE ChiTietDatHang
(
	HDNo		char(10),
	MHNo	    char(10),
	giaBan		money,
	soLuong		float,
	mucGiamGia  decimal(5,2)
    primary key(HDNo,MHNo)
);
------------------------------------------------------------------------------------
------------------BỔ SUNG RÀNG BUỘC CHO DATABASE------------------------------------
------------------------------------------------------------------------------------
--Trong bảng KhachHang, ràng buộc :

-- Email phải là duy nhất(không trùng), chứa @ và bắt đầu bằng chữ cái
alter table KhachHang
	add constraint UQ_KhachHang_Email		 unique(Email),
		constraint CK_KhachHang_Email		 check(Email like '[a-z]%@%')

-- SDT có 10 hoặc 11 chữ số và duy nhất(không trùng)
alter table KhachHang
	add	constraint UQ_KhachHang_SDT			 unique(dienThoai),
		constraint CK_KhachHang_SDT			 check(dienThoai like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]' or
												   dienThoai like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')

-- Số fax có  chữ số và duy nhất(không trùng)
alter table KhachHang
	add	constraint UQ_KhachHang_FAX			 unique(FAX),
		constraint CK_KhachHang_FAX			 check(FAX like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')

--Trong bảng NhaCungCap, ràng buộc :

-- Email phải là duy nhất(không trùng), chứa @ và bắt đầu bằng chữ cái
alter table NhaCungCap
	add constraint UQ_NhaCungCap_Email		 unique(Email),
		constraint CK_NhaCungCap_Email		 check(Email like '[a-z]%@%')

-- SDT có 10 hoặc 11 chữ số và duy nhất(không trùng)
alter table NhaCungCap
	add	constraint UQ_NhaCungCap_SDT			 unique(dienThoai),
		constraint CK_NhaCungCap_SDT			 check(dienThoai like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]' or
												   dienThoai like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')

-- Số fax có  chữ số và duy nhất(không trùng)
alter table NhaCungCap
	add	constraint UQ_NhaCungCap_FAX			 unique(FAX),
		constraint CK_NhaCungCap_FAX			 check(FAX like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')

--Trong bảng NhanVien, ràng buộc :
-- SDT có 10 hoặc 11 chữ số và duy nhất(không trùng)
alter table NhanVien
	add	constraint UQ_NhanVien_SDT			 unique(dienThoai),
		constraint CK_NhanVien_SDT			 check(dienThoai like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]' or
												   dienThoai like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')

--Ngày làm việc lớn hơn ngày sinh
alter table NhanVien
    add constraint CK_NhanVien_Ngay         check(ngayLamViec >  ngaySinh)

--Lương cơ bản và phụ cấp lớn hơn hoặc bằng 0
alter table NhanVien
    add constraint CK_NhanVien_luongCoBan   check(luongCoBan >=0 ),
        constraint CK_NhanVien_phuCap       check(phuCap >=0 )

----Trong bảng DonDatHang, ràng buộc :

--ngày giao hàng >= ngày đặt hàng và ngày chuyển hàng >= ngày giao hàng
alter table DonDatHang
    add constraint CK_DonDatHang_Ngay check(ngayGiaoHang>=ngayDatHang and ngayChuyenHang >= ngayGiaoHang)

----Trong bảng MatHang, ràng buộc :

--Số lượng, giá hàng > 0
alter table MatHang
    add constraint CK_MatHang_SL_GH    check(soLuong > 0  and giaHang > 0)

----Trong bảng ChiTietDatHang, ràng buộc :

--Số lượng, giá bán, mức giảm giá > 0
alter table ChiTietDatHang
    add constraint CK_ChiTietDatHang_SL_GB_MGG    check(soLuong > 0 and giaBan > 0 and mucGiamGia > 0 and mucGiamGia < 1)

------------------------------------------------------------------------------------
---------------------------  TUẦN 6  -----------------------------------------------
------------------------------------------------------------------------------------
--1.	Thiết lập  mối quan hệ giữa các bảng.
-- Ràng buộc khóa ngoại cho bảng DonDatHang
alter table DonDatHang
	add constraint FK_DonDatHang_KHNo foreign key (KHNo) references KhachHang(MaKH)
				on delete
					cascade
				on update
                    cascade, 
		constraint FK_DonDatHang_NVNo foreign key (NVNo) references NhanVien(MaNV)
				on delete
					cascade
				on update 
					cascade
-- Ràng buộc khóa ngoại cho bảng MatHang
alter table MatHang
    add constraint FK_DonDatHang_CTNo foreign key (CTNo)  references NhaCungCap(maCT)
				on delete
					cascade
				on update
                    cascade,
        constraint FK_DonDatHang_LHNo foreign key (LHNo)  references LoaiHang(maLH)
				on delete
					cascade
				on update
                    cascade
-- Ràng buộc khóa ngoại cho bảng ChiTietDatHang
alter table ChiTietDatHang
	add constraint FK_ChiTietDatHang_HDNo foreign key (HDNo) references DonDatHang(soHoaDon)
				on delete
					cascade
				on update
                    cascade,
		CONSTRAINT FK_ChiTietDatHang_MHNo foreign key (MHNo) references MatHang(maHang)
				on delete
					cascade
				on update
                    cascade  

--2.	Bổ sung ràng buộc thiết lập giá trị mặc định bằng 1 cho cột SOLUONG  và bằng 0 cho cột MUCGIAMGIA trong bảng CHITIETDATHANG
ALTER TABLE  ChiTietDatHang
    add constraint DF_ChiTietDatHang_soLuong default 1 for soLuong,
        constraint DF_ChiTietDatHang_mucGiamGia default 0 for mucGiamGia 

--3.	Bổ sung cho bảng DONDATHANG ràng buộc kiểm tra ngày giao hàng và ngày chuyển hàng phải sau hoặc bằng với ngày đặt hàng. 
ALTER TABLE DonDatHang
	ADD CONSTRAINT CK_DonDatHang_Dates CHECK (ngayGiaoHang >= ngayDatHang AND ngayChuyenHang >= ngayDatHang);

--4.	Bổ sung ràng buộc cho bảng NHANVIEN để đảm bảo rằng một nhân viên chỉ có thể làm việc trong công ty khi đủ 18 tuổi và không quá 60 tuổi.
ALTER TABLE NhanVien
    ADD CONSTRAINT CK_NHANVIEN_AGE CHECK (DATEDIFF(YEAR, ngaySinh, GETDATE()) BETWEEN 18 AND 60)
------------------------------------------------------------------------------------
---------------------------  TUẦN 7  -----------------------------------------------
------------------------------------------------------------------------------------
--Thêm dữ liệu bảng KhachHang
INSERT INTO KhachHang (maKH, tenCongTy, tenGiaoDich, diaChi, Email, dienThoai, FAX) VALUES
('KH0001', N'Công Ty A', N'Giao Dịch A', N'Hà Nội', 'email1@cty.com', '0123456789', '0123456780'),
('KH0002', N'Công Ty B', N'Giao Dịch B', N'Hồ Chí Minh', 'email2@cty.com', '0123456788', '0123456781'),
('KH0003', N'Công Ty C', N'Giao Dịch C', N'Đà Nẵng', 'email3@cty.com', '0123456787', '0123456782'),
('KH0004', N'Công Ty D', N'Giao Dịch D', N'Hải Phòng', 'email4@cty.com', '0123456786', '0123456783'),
('KH0005', N'Công Ty E', N'Giao Dịch E', N'Cần Thơ', 'email5@cty.com', '0123456785', '0123456784'),
('KH0006', N'Công Ty F', N'Giao Dịch F', N'Vũng Tàu', 'email6@cty.com', '0123456784', '0123456785'),
('KH0007', N'Công Ty G', N'Giao Dịch G', N'Bình Dương', 'email7@cty.com', '0123456783', '0123456786'),
('KH0008', N'Công Ty H', N'Giao Dịch H',N'Đồng Nai', 'email8@cty.com', '0123456782', '0123456787'),
('KH0009', N'Công Ty I', N'Giao Dịch I', N'Thanh Hóa', 'email9@cty.com', '0123456781', '0123456788'),
('KH0010', N'Công Ty J', N'Giao Dịch J', N'Nghệ An', 'email10@cty.com', '0123456780', '0123456789');
--Thêm dữ liệu bảng NhanVien
INSERT INTO NhanVien (maNV, ho, ten, ngaySinh, ngayLamViec, diaChi, dienThoai, luongCoBan, phuCap) VALUES
('NV0001', N'Nguyen', N'Anh', '1990-05-12', '2015-04-10', N'Hà Nội', '0912345670', 8000000, 500000),
('NV0002', N'Le', N'Bao', '1985-07-25', '2014-07-14', N'Hồ Chí Minh', '0912345671', 8500000, 500000),
('NV0003', N'Tran', N'Cuong', '1995-09-10', '2018-02-10', N'Đà Nẵng', '0912345672', 7800000, 600000),
('NV0004', N'Pham', N'Duy', '1980-02-15', '2010-08-15', N'Hải Phòng', '0912345673', 9200000, 500000),
('NV0005', N'Do', N'Dung', '1988-10-22', '2016-11-10', N'Cần Thơ', '0912345674', 8700000, 700000),
('NV0006', N'Ho', N'Em', '1993-03-30', '2019-09-05', N'Vũng Tàu', '0912345675', 8100000, 500000),
('NV0007', N'Bui', N'Gia', '1987-06-10', '2017-04-10', N'Bình Dương', '0912345676', 8300000, 600000),
('NV0008', N'Vu', N'Hao', '1990-08-05', '2015-12-22', N'Đồng Nai', '0912345677', 8000000, 500000),
('NV0009', N'Dang', N'Hieu', '1979-11-15', '2009-03-18', N'Thanh Hóa', '0912345678', 9300000, 500000),
('NV0010', N'Ly', N'Khoa', '1996-12-20', '2021-01-15', N'Nghệ An', '0912345679', 7900000, 500000);
--thêm dữ liệu vào bảng LoaiHang
INSERT INTO DonDatHang (soHoaDon, KHNo, NVNo, ngayDatHang, ngayGiaoHang, ngayChuyenHang, noiGiaoHang) VALUES
('HD0001', 'KH0001', 'NV0001', '2023-10-10', '2023-10-12', '2023-10-19', N'Hà Nội'),
('HD0002', 'KH0002', 'NV0002', '2023-10-11', '2023-10-13', '2023-10-19', N'Hồ Chí Minh'),
('HD0003', 'KH0003', 'NV0003', '2023-10-12', '2023-10-14', '2023-10-19', N'Đà Nẵng'),
('HD0004', 'KH0004', 'NV0004', '2023-10-13', '2023-10-15', '2023-10-19', N'Hải Phòng'),
('HD0005', 'KH0005', 'NV0005', '2023-10-14', '2023-10-16', '2023-10-19', N'Cần Thơ'),
('HD0006', 'KH0006', 'NV0006', '2023-10-15', '2023-10-17', '2023-10-20', N'Vũng Tàu'),
('HD0007', 'KH0007', 'NV0007', '2023-10-16', '2023-10-18', '2023-10-21', N'Bình Dương'),
('HD0008', 'KH0008', 'NV0008', '2023-10-17', '2023-10-19', '2023-10-22', N'Đồng Nai'),
('HD0009', 'KH0009', 'NV0009', '2023-10-18', '2023-10-20', '2023-10-23', N'Thanh Hóa'),
('HD0010', 'KH0010', 'NV0010', '2023-10-19', '2023-10-21', '2023-10-24', N'Nghệ An');
--Thêm dữ liệu vào bảng NhaCungCap
INSERT INTO NhaCungCap (maCT, tenCongTy, tenGiaoDich, diaChi, dienThoai, FAX, Email) VALUES
('CT0001', N'Nhà Cung Cấp A', N'Giao Dịch A', N'Hà Nội', '0934567890', '0234567890', 'ncc1@cty.com'),
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
INSERT INTO LoaiHang (maLH, tenLH) VALUES
('LH0001', N'Điện tử'),
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
INSERT INTO MatHang (maHang, tenHang, CTNo, LHNo, soLuong, donViTinh, giaHang) VALUES
('MH0001', N'Laptop', 'CT0001', 'LH0001', 100, N'Cái', 15000000),
('MH0002', N'Tủ lạnh', 'CT0002', 'LH0002', 50, N'Cái', 8000000),
('MH0003', N'Áo khoác', 'CT0003', 'LH0003', 200, N'Cái', 500000),
('MH0004', N'Sữa', 'CT0004', 'LH0004', 300, N'Thùng', 350000),
('MH0005', N'Đồ chơi Lego', 'CT0005', 'LH0005', 100, N'Bộ', 1200000),
('MH0006', N'Bút bi', 'CT0006', 'LH0006', 1000, N'Cây', 2000),
('MH0007', N'Máy đo huyết áp', 'CT0007', 'LH0007', 100, N'Cái', 800000),
('MH0008', N'Sách giáo khoa', 'CT0008', 'LH0008', 500, N'Cuốn', 50000),
('MH0009', N'Bàn gỗ', 'CT0009', 'LH0009', 50, N'Cái', 1500000),
('MH0010', N'Nước rửa tay', 'CT0010', 'LH0010', 200, N'Chai', 30000);
--Thêm dữ liệu vào bảng ChiTietDatHang
INSERT INTO ChiTietDatHang (HDNo, MHNo, giaBan, soLuong, mucGiamGia) VALUES
('HD0001', 'MH0001', 14500000, 2, 0.05),
('HD0002', 'MH0002', 7800000, 1, 0.03),
('HD0003', 'MH0003', 480000, 3, 0.02),
('HD0004', 'MH0004', 340000, 5, 0.01),
('HD0005', 'MH0005', 1150000, 1, 0.1),
('HD0006', 'MH0006', 1900, 50, 0.05),
('HD0007', 'MH0007', 760000, 2, 0.04),
('HD0008', 'MH0008', 48000, 20, 0.02),
('HD0009', 'MH0009', 1400000, 1, 0.05),
('HD0010', 'MH0010', 29000, 10, 0.07);
------------------------------------------------------------------------------------
---------------------------  TUẦN 8  -----------------------------------------------
------------------------------------------------------------------------------------
--a) Cập nhật lại giá trị trường NGAYCHUYENHANG của những bản ghi có NGAYCHUYENHANG
--   chưa xác định (NULL) trong bảng DONDATHANG bằng với giá trị của trường NGAYDATHANG.
UPDATE  DonDatHang
SET     ngayChuyenHang = ngayDatHang
WHERE   ngayChuyenHang is null
 
-- b) Tăng số lượng hàng của những mặt hàng do công ty VINAMILK cung cấp lên gấp đôi.
update  MatHang
set     soLuong = soLuong * 2
where   CTNo = N'CT0003';

--c) Cập nhật giá trị của trường NOIGIAOHANG trong bảng DONDATHANG bằng địa chỉ của-khách hàng đối với những đơn đặt hàng chưa xác định được nơi giao hàng (giá trị trường NOIGIAOHANG bằng NULL).
			update DonDatHang
            SET noiGiaoHang = (		
					SELECT diaChi
				    FROM KhachHang
				    WHERE KhachHang.maKH = DonDatHang.KHNo
			                                                )
			where	 noiGiaoHang is null;


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



