--2	Bổ sung ràng buộc thiết lập giá trị mặc định bằng 1 cho cột SOLUONG  và bằng 0 cho cột MUCGIAMGIA trong bảng CHITIETDATHANG
alter table CHITIETDATHANG
    add constraint DF_CHITIETDATHANG_SOLUONG default 1 for SOLUONG,
        constraint DF_CHITIETDATHANG_MUCGIAMGIA default 0 for MUCGIAMGIA 