-- Tạo index trên bảng giáo viên
-- Tăng tốc độ tìm kiếm bù lại chậm tốc độ thêm, xóa, sửa
-- Cho phép các trường trùng nhau
CREATE INDEX IndexName ON dbo.NGUOITHAN(MAGV)

-- Không cho phép các trường trùng nhau
CREATE UNIQUE INDEX IndexNameUnique ON dbo.GIAOVIEN(MAGV)

SELECT * FROM dbo.NGUOITHAN
WHERE MAGV = '001' AND TEN = 'Test'