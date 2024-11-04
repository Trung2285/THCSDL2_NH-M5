------------------------------------------------------------------------------------
---------------------------  TUẦN 8  -----------------------------------------------
------------------------------------------------------------------------------------
--a) Cập nhật lại giá trị trường NGAYCHUYENHANG của những bản ghi có NGAYCHUYENHANG
--   chưa xác định (NULL) trong bảng DONDATHANG bằng với giá trị của trường NGAYDATHANG.
UPDATE  DonDatHang
SET     ngayChuyenHang = ngayDatHang
WHERE   ngayChuyenHang = null 