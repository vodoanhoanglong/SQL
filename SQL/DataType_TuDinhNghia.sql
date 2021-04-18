-- Kiểu dữ liệu tự định nghĩa
-- EXEC sp_addtype 'Tên kiểu dữ liệu', 'Kiểu dữ liệu', 'Not Null' (có hay k đều đc)
EXEC sp_addtype 'NNAME', 'NVARCHAR(10)', 'NOT NULL'

CREATE TABLE TEST
(
	[NAME]	NNAME,
	ADDRESS	NVARCHAR(100)
)
GO

-- Xóa Type
EXEC sp_droptype 'NNAME'