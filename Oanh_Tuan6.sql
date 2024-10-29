USE master
IF EXISTS (SELECT * FROM sys.databases where name = 'Nhom5_Tuan6')
	BEGIN
		ALTER database Nhom5_Tuan6 set single_user with rollback immediate
		DROP database Nhom5_Tuan6;
	END;

CREATE DATABASE Nhom5_Tuan6
go
USE Nhom5_Tuan6
-- Tạo bảng Khách hàng
CREATE TABLE KhachHang
(
	maKhachHang char(10),
	tenCongTy nvarchar(50),
	tenGiaoDich nvarchar(50),
	diaChi nvarchar(100),
	Email varchar(50) unique,
	SDT varchar(11) unique,
	Fax varchar(10) unique,
	PRIMARY KEY (maKhachHang)
)

-- Tạo bảng Nhân viên
CREATE TABLE NhanVien
(
	maNhanVien char(7),
	Ho nvarchar(30),
	Ten nvarchar(30),
	ngaySinh date,
	ngayLamViec date,
	diaChi nvarchar(100),
	SDT varchar(11) unique,
	luongCoBan money,
	phuCap money,
	PRIMARY KEY (maNhanVien)
)

-- Tạo bảng Đơn đặt hàng
CREATE TABLE DonDatHang
(
	soHoaDon char(10),
	ngayDatHang date,
	ngayGiaoHang date,
	ngayChuyenHang date,
	noiGiaoHang nvarchar(100),
	PRIMARY KEY (soHoaDon)
)

-- Tạo bảng NhaCungCap
CREATE TABLE NhaCungCap
(
	maCongTy char(7),
	tenCongTy nvarchar(50),
	tenGiaoDich nvarchar(50),
	diaChi nvarchar(100),
	SDT varchar(11) unique,
	Fax varchar(10) unique,
	Email varchar(50) unique,
	PRIMARY KEY(maCongTy)
)

-- Tạo bảng Loại hàng
CREATE TABLE LoaiHang
(
	maLoaiHang char(5),
	tenLoaiHang nvarchar(50),
	PRIMARY KEY(maLoaiHang)
)

-- Tạo bảng mặt hàng
CREATE TABLE MatHang
(
	maHang char(5),
	tenHang nvarchar(50),
	soLuong int,
	donViTinh nvarchar(20),
	giaHang money,
	PRIMARY KEY(maHang)
)

--Tạo bảng Chi tiết đơn hàng
CREATE TABLE ChiTietDonHang
(
	soHoaDon char(10),
	maHang char(5),
	giaBan money,
	soLuong int,
	mucGiamGia float,
	PRIMARY KEY(soHoaDon,maHang),
	FOREIGN KEY (soHoaDon) references DonDatHang(soHoaDon)
		on delete
			cascade
		on update
			cascade,
	FOREIGN KEY (maHang) references MatHang(maHang)
		on delete
			cascade
		on update
			cascade
)
	-------------------------------------------------------
-- Thiết lập ràng buộc
ALTER TABLE DonDatHang
	add maKhachHang char(10) foreign key references KhachHang(maKhachHang)
			on delete
				cascade
			on update
				cascade,
		maNhanVien char(7)  foreign key references NhanVien(maNhanVien)
			on delete
				cascade
			on update
				cascade;

ALTER TABLE MatHang
	add maCongTy char(7)  foreign key references NhaCungCap(maCongTy)
			on delete
				cascade
			on update
				cascade,
		maLoaiHang char(5)  foreign key references LoaiHang(maLoaiHang)
			on delete
				cascade
			on update
				cascade;

/*ALTER TABLE ChiTietDonHang
	add constraint soHoaDon  foreign key references DonDatHang(soHoaDon),
		constraint maHang  foreign key references MatHang(maHang);*/