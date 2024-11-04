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
	ho			nvarchar(10),
	ten			nvarchar(15),
	ngaySinh	date,
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
	soLuong		int,
	donViTinh	nvarchar(10),
	giaHang		money
);
--Tao bang ChiTietDatHang

CREATE TABLE ChiTietDatHang
(
	HDNo		char(10),
	MHNo	    char(10),
	giaBan		money,
	soLuong		int,
	mucGiamGia  decimal(5,2)
    primary key(HDNo,MHNo)
);

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


