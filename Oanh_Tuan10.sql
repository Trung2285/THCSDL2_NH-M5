--12. Hãy cho biết có những khách hàng nào lại chính là đối tác cung cấp hàng của công ty 
--(tức là có cùng tên giao dịch).
update KhachHang
set tenGiaoDich=N'Giao Dịch XXX'
where tenGiaoDich=N'Giao Dịch J';

SELECT kh.*, ncc.*
FROM KhachHang kh
INNER JOIN NhaCungCap ncc ON kh.tenGiaoDich = ncc.tenGiaoDich;


-- 14. Những đơn hàng nào yêu cầu giao hàng ngay tại công ty đặt hàng và những đơn đó là của công ty nào
update DonDatHang 
set noiGiaoHang=N'Hà Tĩnh'
where DonDatHang.noiGiaoHang=N'Nghệ An'

update DonDatHang 
set noiGiaoHang=N'Quảng Trị'
where DonDatHang.noiGiaoHang=N'Thanh Hóa'

select ddh.*, ct.maCT, ct.tenCongTy, ct.diaChi
from DonDatHang ddh, NhaCungCap ct, MatHang mh, ChiTietDatHang ctdh
where ct.maCT=mh.CTNo and mh.maHang=ctdh.MHNo and ctdh.HDNo=ddh.soHoaDon and ddh.noiGiaoHang=ct.diaChi