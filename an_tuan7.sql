-- Bổ sung câu lệnh if exists
if exists (select * from sys.databases where name = 'CONGTACGIAOHANG')
	begin
		use master
		alter database CONGTACGIAOHANG set single_user with rollback immediate
		drop database CONGTACGIAOHANG;
	end
--tạo database Công tác giao hàng
CREATE DATABASE CONGTACGIAOHANG
GO
USE CONGTACGIAOHANG
--Tao bang KhachHang--
CREATE TABLE KhachHang
(
	maKH			char(10) primary key,
	tenCongTy		nvarchar(30),
	tenGiaoDich		nvarchar(30),
	diaChi			nvarchar(30),
	Email			varchar(20),
	dienThoai		char(10),
	FAX				char(10)
);
--Tao bang NhanVien
CREATE TABLE NhanVien
(
	maNV		char(10) primary key,
	ho			nvarchar(10),
	ten			nvarchar(15),
	ngaySinh	date,
	ngayLamViec date,
	diaChi		nvarchar(30),
	dienThoai   char(10),
	luongCoBan  money,
	phuCap		money
);
--Tao bang DonDatHang--
CREATE TABLE DonDatHang
(
	soHoaDon	   char(10) primary key,
	maKHNo1		   char(10) foreign key references KhachHang(maKH),
	maNVNo1		   char(10) foreign key references NhanVien(maNV),		
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
	dienThoai	 char(10),
	FAX			 char(10),
	Email	     varchar(20)
);
--Tao bang MatHang
CREATE TABLE MatHang
(
	maHang		char(10) primary key,
	tenHang		nvarchar(20),
	maCTNo1		char(10) foreign key references NhaCungCap(maCT),
	maLHNo1		char(10) foreign key references LoaiHang(maLH),
	soLuong		int,
	donViTinh	varchar(10),
	giaHang		money
);
--Tao bang ChiTietDatHang

CREATE TABLE ChiTietDatHang
(
	soHDNo1		char(10)	foreign key references DonDatHang(soHoaDon),
	maHangNo1	char(10)	foreign key references MatHang(maHang),
	giaBan		money,
	soLuong		int,
	mucGiamGia  float
);

--Bổ sung ràng buộc cho bảng DonDatHang kiểm tra ngày giao hàng và ngày chuyển hàng 
ALTER TABLE DonDatHang
	ADD CONSTRAINT CK_DonDatHang_Dates CHECK (ngayGiaoHang >= ngayDatHang AND ngayChuyenHang >= ngayDatHang);
--Bổ sung ràng buộc thiết lập giá trị mặc định bằng 1 cho cột SOLUONG  và bằng 0 cho cột MUCGIAMGIA trong bảng CHITIETDATHANG
alter table CHITIETDATHANG
    add constraint DF_CHITIETDATHANG_SOLUONG default 1 for soLuong,
        constraint DF_CHITIETDATHANG_MUCGIAMGIA default 0 for mucGiamGia 
--Bổ sung ràng buộc cho bảng NHANVIEN để đảm bảo rằng một nhân viên chỉ 
--có thể làm việc trong công ty khi đủ 18 tuổi và không quá 60 tuổi
ALTER TABLE NhanVien
	ADD CONSTRAINT CK_NHANVIEN_AGE CHECK (DATEDIFF(YEAR, ngaySinh, ngayLamViec) BETWEEN 18 AND 60)

set dateformat dmy
--insert dữ liệu vào bảng Nhân Viên
insert into NhanVien
values	('NV00000001' , N'Lê' , N'Huy Hùng' , '20/10/2001' , '19/11/2020' , N'Quảng Nam' , '0366827182' , 5000000 , 100000),
		('NV00000002', N'Nguyễn', N'Văn An', '15/02/1999', '05/06/2020', N'Hà Nội', '0377123456', 5000000, 150000),
		('NV00000003', N'Trần', N'Thị Hoa', '22/11/1998', '12/01/2021', N'TP Hồ Chí Minh', '0356123456', 5200000, 200000),
		('NV00000004', N'Lê', N'Thị Lan', '30/04/2001', '10/07/2019', N'Đà Nẵng', '0345123456', 5100000, 120000),
		('NV00000005', N'Hoàng', N'Quang Minh', '05/08/1997', '21/03/2018', N'Hải Phòng', '0334123456', 5800000, 100000),
		('NV00000006', N'Phạm', N'Văn Tuấn', '10/12/1996', '01/02/2020', N'Huế', '0323123456', 5400000, 180000),
		('NV00000007', N'Vũ', N'Thị Mai', '25/09/1999', '15/08/2021', N'Cần Thơ', '0312123456', 5300000, 160000),
		('NV00000008', N'Đặng', N'Hoài Nam', '12/03/1995', '11/11/2018', N'Quảng Ngãi', '0301123456', 6000000, 140000),
		('NV00000009', N'Bùi', N'Thị Hương', '18/07/2000', '05/09/2021', N'Bình Dương', '0390123456', 5150000, 130000),
		('NV00000010', N'Ngô', N'Văn Khang', '02/06/2002', '20/10/2022', N'Nha Trang', '0389123456', 5050000, 170000);

--a) Cập nhật lại giá trị trường NGAYCHUYENHANG của những bản ghi có NGAYCHUYENHANG chưa xác định (NULL) 
--trong bảng DONDATHANG bằng với giá trị của trường NGAYDATHANG.
