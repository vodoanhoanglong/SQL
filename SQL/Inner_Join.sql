--TAO BANG NHAN VIEN
CREATE TABLE NhanVien
(
	MaNV	VARCHAR(10)	PRIMARY KEY,
	TenNV	NVARCHAR(250),
	MaCV	VARCHAR(10)
)
--TAO BANG CHUC VU
CREATE TABLE ChucVu
(
	MaCV	VARCHAR(10) PRIMARY KEY,
	TenCV	NVARCHAR(250)
)
-- SELECT C� JOIN
SELECT nv.MaNV, nv.TenNV, cv.TenCV
FROM NhanVien nv INNER JOIN ChucVu cv
ON nv.MaCV = cv.MaCV
