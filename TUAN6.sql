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
	diaChi			nvarchar(30),
	Email			varchar(20),
	dienThoai		char(11),
	FAX				char(11)
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
	dienThoai   varchar(11) unique,
	luongCoBan  money,
	phuCap		money
);

--Tao bang DonDatHang--
CREATE TABLE DonDatHang
(
	soHoaDon	   char(10) primary key,	
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
	soLuong		int,
	donViTinh	nvarchar(10),
	giaHang		money
);
--Tao bang ChiTietDatHang

CREATE TABLE ChiTietDatHang
(
	soHDNo1		char(10) foreign key references DonDatHang(soHoaDon),
	maHangNo1	char(10) foreign key references MatHang(maHang),
	giaBan		money,
	soLuong		int,
	mucGiamGia  money
);

--1.	Thiết lập  mối quan hệ giữa các bảng.
ALTER TABLE DonDatHang

    add KHNo char(10) foreign key references KhachHang(maKH)
			    on delete cascade
			    on update cascade,
        NVNo char(10)  foreign key references  NhanVien(maNV)
			    on delete cascade
			    on update cascade;
ALTER TABLE MatHang
    add CTNo char(10)  foreign key references NhaCungCap(maCT)
			    on delete cascade
			    on update cascade,
        LHNo char(10)  foreign key references LoaiHang(maLH)
			    on delete cascade
			    on update cascade;

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


