CREATE DATABASE [BAI02]
GO
USE [BAI02]
GO
-- tao table
CREATE TABLE NhanVien
(
	MaNV		NVARCHAR(10) PRIMARY KEY,
	TenNV		NVARCHAR(250),
	MaCV		VARCHAR(10),
	GioiTinh	BIT
)
GO
--lenh insert du lieu
INSERT INTO NhanVien(MaNV, GioiTinh, TenNV, MaCV)
VALUES ('NV1', 1, N'Hoàng Long A', 'CV1')
GO
INSERT INTO NhanVien(MaNV, GioiTinh, TenNV, MaCV)
VALUES ('NV2', 1, N'Hoàng Long B', 'CV1')
GO
INSERT INTO NhanVien(MaNV, GioiTinh, TenNV, MaCV)
VALUES ('NV3', 0, N'Hoàng Long C', 'CV2')
GO
INSERT INTO NhanVien(MaNV, GioiTinh, TenNV, MaCV)
VALUES ('NV4', 0, N'Hoàng Long D', 'CV2')
GO
-- doc du lieu
SELECT * FROM NhanVien
GO

SELECT MaNV, TenNV FROM NhanVien WHERE MaCV='CV1'
GO

SELECT MaNV, TenNV FROM NhanVien WHERE TenNV LIKE N'%à%'
GO
-- update du lieu
UPDATE NhanVien SET TenNV=N'Ngu vãi', GioiTinh=1 WHERE MaNV='NV4'
GO
-- LENH DELETE
DELETE FROM NhanVien WHERE MaNV='NV4'
GO