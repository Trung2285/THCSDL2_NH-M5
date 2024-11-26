SELECT 
    NhaCungCap.tenCongTy, 
    NhaCungCap.diaChi 
FROM 
    MatHang , NhaCungCap, LoaiHang
WHERE MatHang.CTNo = NhaCungCap.maCT and MatHang.LHNo = LoaiHang.maLH  and
		LoaiHang.tenLH = N'Thực phẩm';

SELECT 
    k.tenGiaoDich 
FROM 
    ChiTietDatHang c, DonDatHang d, MatHang m, KhachHang k
WHERE d.KHNo = k.maKH and m.maHang = c.MHNo and d.soHoaDon = c.HDNo and 
    m.tenHang = N'Sữa';

SELECT 
    k.tenGiaoDich AS TenKhachHang, 
    n.ten AS TenNhanVien, 
    d.ngayDatHang, 
    d.noiGiaoHang 
FROM 
    DonDatHang d,KhachHang k, NhanVien n
WHERE n.maNV = d.NVNo and k.maKH = d.KHNo and 
    d.soHoaDon = 'HD0001';	