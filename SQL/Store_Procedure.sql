CREATE DATABASE BAI09
GO
USE BAI09
GO
-- TẠO STORE PROCEDURE
CREATE PROC ProABC
	@Str1 NVARCHAR(250),
	@Str2 NVARCHAR(250)
AS
	SELECT @Str1 + @Str2 AS Str1ConcatStr2
GO
-- GỌI RA STORE PROCEDURE
EXEC ProABC N'Võ Đoàn', N' Hoàng Long'
-- XÓA BỎ STORE PROCEDURE
DROP PROC ProABC
GO
-- TẠO THỦ TỤC ĐỌC DANH SÁCH NHÂN VIÊN LỚN HƠN N TUỔI
CREATE TABLE NhanVien
(
	ID		INT PRIMARY KEY,
	FullName	NVARCHAR(250),
	Birthday	DATE 
)

CREATE PROC ReadNVByAge
	@age INT
AS
	DECLARE @Now DATETIME	-- Tạo biến @Now
	SET @Now = GETDATE()	-- Gán @Now = time hiện tại
	SET @Now = DATEADD(YEAR, -@age, @Now)  -- Trừ đi N năm
	SELECT * FROM NhanVien WHERE NhanVien.Birthday <= @Now
GO
-- Gọi Proc
EXEC ReadNVByAge 30



