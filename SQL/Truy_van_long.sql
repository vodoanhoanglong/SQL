-- Kiểm tra xem giáo viên 001 có phải là giáo viên chủ nhiệm hay k
-- Lấy ra list các mã giáo viên Chủ nhiệm
-- Kiểm tra mã GV tồn tại trong list đó
SELECT * FROM dbo.GIAOVIEN
WHERE MAGV = '001' AND MAGV IN 
(
	SELECT GVCN FROM dbo.GIAOVIEN
)

-- Truy vấn lồng trong FROM
SELECT * FROM
dbo.GIAOVIEN, (SELECT * FROM dbo.DETAI) AS DT

-- Xuất ra list giáo viên tham gia nhìu hơn 1 đề tài
-- Lấy ra all thông tin của giáo viên
SELECT * FROM dbo.GIAOVIEN AS GV
-- Khi số lượng đề tài giáo viên đó tham gia > 1
WHERE 1 <
(
	SELECT COUNT(*) FROM dbo.THAMGIADT
	WHERE MAGV = GV.MAGV
)

-- Xuất ra thông tin của khoa có nhìu hơn 2 giáo viên
-- Lấy list bộ môn nằm trong khoa hiện tại
SELECT * FROM dbo.KHOA AS K
WHERE 2 <
(
	SELECT COUNT(*) FROM dbo.BOMON AS BM, dbo.GIAOVIEN AS GV
	WHERE BM.MAKHOA = K.MAKHOA
	AND BM.MABM = GV.MABM
)