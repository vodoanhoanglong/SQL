-- Xuất ra list tên bộ môn và số lượng giáo viên của bộ môn đó
-- Cột hiển thị phải là thuộc tính nằm trong khối group by hoặc Agreegate Function
SELECT TENBM, COUNT(*) FROM dbo.BOMON, dbo.GIAOVIEN
WHERE BOMON.MABM = GIAOVIEN.MABM
GROUP BY TENBM

-- Lấy list giáo viên có lương > lương trung bình của giáo viên
SELECT * FROM dbo.GIAOVIEN
WHERE LUONG > (SELECT SUM(LUONG) FROM dbo.GIAOVIEN) / (SELECT COUNT(*) FROM dbo.GIAOVIEN)

-- Xuất ra tên giáo viên và số lượng đề tài mà giáo viên đó đã làm
SELECT GV.HOTEN, COUNT(*) FROM dbo.GIAOVIEN AS GV, dbo.THAMGADT AS TGDT
WHERE GV.MAGV = TGDT.MAGV
GROUP BY GV.MAGV, GV.HOTEN

-- Xuất ra số lượng giáo viên trong từng bộ môn mà số giáo viên > 2
-- Having như Where của Select nhưng dành cho Group By
SELECT dbo.BOMON.MABM, COUNT(*) FROM dbo.GIAOVIEN, dbo.BOMON
WHERE dbo.BOMON.MABM = GIAOVIEN.MABM
GROUP BY dbo.BOMON.MABM
HAVING COUNT(*) > 2

-- Xuất ra mức lương và tổng tuổi của giáo viên nhận mức lương đó và có người thân và có tuổi lớn hơn tuổi trung bình
SELECT LUONG, SUM(YEAR(GETDATE()) - YEAR(GIAOVIEN.NGAYSINH)) FROM dbo.GIAOVIEN, dbo.NGUOITHAN
WHERE GIAOVIEN.MAGV = NGUOITHAN.MAGV
AND GIAOVIEN.MAGV IN (SELECT MAGV FROM dbo.NGUOITHAN)
GROUP BY LUONG, GIAOVIEN.NGAYSINH
HAVING YEAR(GETDATE()) - YEAR(GIAOVIEN.NGAYSINH) > -- Xét NGAYSINH trong Having phải dựa trên NGAYSINH trong phạm vi Group By
(
	(SELECT SUM(YEAR(GETDATE()) - YEAR(GIAOVIEN.NGAYSINH) FROM dbo.GIAOVIEN) / (SELECT COUNT(*) FROM dbo.GIAOVIEN)
)


