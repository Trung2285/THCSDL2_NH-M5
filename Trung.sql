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
--Tao bang ChiTietDatHang
CREATE TABLE ChiTietDatHang
(
	soHDNo1		char(10) foreign key references DonDatHang(soHoaDon),
	maHangNo1	char(10) foreign key references MatHang(maHang),
	giaBan		money,
	soLuong		int,
	mucGiamGia  float
);