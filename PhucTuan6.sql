
--4	Bổ sung ràng buộc cho bảng NHANVIEN để đảm bảo rằng một nhân viên chỉ 
--có thể làm việc trong công ty khi đủ 18 tuổi và không quá 60 tuổi
ALTER TABLE NhanVien
ADD CONSTRAINT CK_NHANVIEN_AGE CHECK (DATEDIFF(YEAR, ngaySinh, GETDATE()) BETWEEN 18 AND 60)