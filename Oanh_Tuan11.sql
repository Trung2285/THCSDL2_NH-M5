CREATE TRIGGER trg_AfterInsert_CHITIETDATHANG
ON ChiTietDatHang
FOR INSERT
AS
BEGIN
    DECLARE @maHang CHAR(10)
    DECLARE @soLuongMua INT
    DECLARE @soLuongHienCo INT

    SELECT @maHang = i.MHNo, @soLuongMua = i.soLuong
    FROM INSERTED i

    SELECT @soLuongHienCo = soLuong
    FROM MatHang
    WHERE maHang = @maHang

    IF @soLuongHienCo >= @soLuongMua
    BEGIN

        UPDATE MatHang
        SET soLuong= soLuong- @soLuongMua
        WHERE maHang = @maHang
    END
    ELSE
    BEGIN

        RAISERROR ('Số lượng hàng hiện có không đủ', 16, 1)
        ROLLBACK TRANSACTION
    END
END

-- Kiểm tra lại số lượng hiện có sau khi chèn
SELECT * FROM MatHang WHERE maHang = 'MH0001';
-- Chèn dữ liệu mới với số lượng lớn hơn số lượng hiện có
INSERT INTO DonDatHang (soHoaDon, KHNo, NVNo, ngayDatHang, ngayGiaoHang, ngayChuyenHang, noiGiaoHang) VALUES
('HD0012', 'KH0001', 'NV0001', '2023-10-10', '2023-10-12', null, null);
INSERT INTO ChiTietDatHang (HDNo, MHNo, giaBan, soLuong, mucGiamGia) 
VALUES ('HD0012', 'MH0001', 14500000, 100, 0.05);