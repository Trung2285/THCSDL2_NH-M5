-- Tăng lương lên gấp rưỡi cho những nhân viên bán được số lượng hàng nhiều hơn 100 trong năm 2022
UPDATE NhanVien
SET luongCoBan = luongCoBan * 1.5
WHERE maNV IN (
    SELECT DISTINCT NVNo
    FROM DonDatHang as d, ChiTietDatHang as c
    WHERE d.soHoaDon = c.HDNo and d.ngayDatHang >= '2022-01-01' AND d.ngayDatHang < '2023-01-01'
    GROUP BY NVNo
    HAVING SUM(c.soLuong) > 100
);