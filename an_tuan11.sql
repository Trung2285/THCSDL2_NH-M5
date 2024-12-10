
---------------------------------------------BÀI TẬP THỦ TỤC, HÀM VÀ TRIGGER--------------------------------------------
--2.	Tạo thủ tục lưu trữ có chức năng thống kê tổng số lượng hàng bán được của một mặt hàng có mã bất kỳ 
--(mã mặt hàng cần thống kê là tham số của thủ tục).
CREATE PROCEDURE ThongKeSoLuongHangBan
    @maHang CHAR(10)
AS
BEGIN
    -- Kiểm tra mã mặt hàng có tồn tại
    IF NOT EXISTS (SELECT 1 FROM MatHang WHERE maHang = @maHang)
    BEGIN
        RAISERROR('Mã mặt hàng không tồn tại.', 16, 1);
        RETURN;
    END

    -- Tính tổng số lượng hàng bán
    DECLARE @tongSoLuong FLOAT;
    SELECT @tongSoLuong = SUM(soLuong)
    FROM ChiTietDatHang
    WHERE MHNo = @maHang;

    IF @tongSoLuong IS NULL
        SET @tongSoLuong = 0;

    PRINT 'Tổng số lượng hàng bán: ' + CAST(@tongSoLuong AS NVARCHAR(50));
END;
GO

GO
