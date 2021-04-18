-- test1
SELECT MaNV AS N'Mã Số', TenNV FROM NhanVien 
-- test2
SELECT MaNV, TenNV, 15 AS MaBaoCao, N'Long' AS NguoiBaoCao FROM NhanVien
-- test3 
SELECT	
	nv.TenNV,
	nv.MaNV,
	15 AS MaTaoLao, -- TẤT CẢ CÁC HÀNG TRONG CỘT MATAOLAO SẼ ĐỀU MANG GIÁ TRỊ 15
	(
		SELECT
		    cv.TenNV 
		FROM ChucVu cv WHERE cv.MaNV = nv.MaNV
	) AS TenChucVu
FROM NhanVien nv
-- test 4
SELECT	
	TOP 1 -- lay 1 hang dau
	nv.TenNV,
	nv.MaNV,
	15 AS MaTaoLao,
	(
		SELECT
		    cv.TenNV 
		FROM ChucVu cv WHERE cv.MaNV = nv.MaNV
	) AS TenChucVu
FROM NhanVien nv
-- test 5
SELECT	
	nv.TenNV,
	nv.MaNV,
	15 AS MaTaoLao,
	(
		SELECT
		    cv.TenNV 
		FROM ChucVu cv WHERE cv.MaNV = nv.MaNV
	) AS TenChucVu
FROM NhanVien nv
-- DESC giảm dần, ASC tăng dần, nếu k để gì auto là ASC
ORDER BY nv.TenNV DESC