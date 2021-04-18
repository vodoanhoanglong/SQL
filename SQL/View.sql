SELECT * FROM dbo.GIAOVIEN
-- Tạo ra 1 bảng lưu thông tin Giáo Viên, tên Bộ Môn và lương của giáo viên đó
SELECT HOTEN, TENBM, LUONG INTO LUONGGV FROM dbo.GIAOVIEN, dbo.BOMON
WHERE BOMON.MABM = GIAOVIEN.MABM

UPDATE dbo.GIAOVIEN SET LUONG = 9000
WHERE MAGV = '006'

SELECT * FROM dbo.GIAOVIEN -- GV 006 ĐC UPDATE LƯƠNG = 9000

SELECT * FROM LUONGGV -- GV 006 K ĐC UPDATE LƯƠNG = 9000

-- View là bảng ảo
-- Cập nhật dữ liệu theo bảng mà view truy vấn tới mỗi khi lấy View ra xài
-- Tạo ra view TestView từ câu truy vấn
CREATE VIEW TestView AS
SELECT * FROM dbo.GIAOVIEN

UPDATE dbo.GIAOVIEN SET LUONG = 9000
WHERE MAGV = '006'

SELECT * FROM TestView -- LÚC NÀY TESTVIEW ĐC UPDATE THEO TABLE GIAOVIEN

-- Xóa TestView
DROP VIEW TestView

-- Update View
ALTER VIEW TestView AS
SELECT HOTEN FROM dbo.GIAOVIEN

-- Tạo View có dấu
CREATE VIEW [Hoàng Long] AS
SELECT * FROM dbo.KHOA

SELECT * FROM [Hoàng Long]