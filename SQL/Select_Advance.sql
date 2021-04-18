--TAO BANG NHAN VIEN
CREATE TABLE NhanVien
(
	MaNV	VARCHAR(10)	PRIMARY KEY,
	TenNV	NVARCHAR(250),
	TenTP	 NVARCHAR(250),
	CityCode	VARCHAR(10)
)
--TAO BANG CHUC VU
CREATE TABLE ChucVu
(
	CityCode	VARCHAR(10) PRIMARY KEY,
	TenTP	NVARCHAR(250)
)
-- SELECT CÓ UNION
	-- HIỆN TÊN TP KO TRÙNG NHAU
SELECT nv.TenTP FROM NhanVien nv
UNION
SELECT cv.TenTP FROM ChucVu cv
-- SELECT CÓ DISTINCT
SELECT DISTINCT nv.CityCode, cv.TenTP -- nếu có 2 thuộc tính thì sẽ lấy 2 thuộc tính đó là duy nhất
FROM NhanVien nv INNER JOIN ChucVu cv
ON nv.CityCode = cv.CityCode
-- SELECT CÓ GROUP BY
SELECT
	COUNT(nv.CityCode) AS SoLuongTP,
	nv.CityCode,
	(SELECT cv.TenTP FROM ChucVu cv WHERE cv.CityCode = nv.CityCode) AS CityName
FROM NhanVien nv
	--lấy lên list tên TP là nơi sinh của nhân viên kèm số lượng nhân viên sinh ra ở đó
GROUP BY nv.CityCode 
-- HAVING KHI CÓ GROUP BY
HAVING COUNT(nv.CityCode) > 2 -- lấy ra list > 2 NV sinh cùng 1 TP; có thể dùng phép so sánh khác(=,<,...) 
	