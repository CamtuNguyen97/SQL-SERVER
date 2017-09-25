CREATE DATABASE QLSinhVien
GO

USE QLSinhVien
GO

CREATE TABLE SinhVien(
	MaSV nchar(10) PRIMARY KEY,
	HoSV nvarchar(10) NOT NULL,
	TenSV nvarchar(50) NOT NULL,
	GioiTinh nvarchar(10),
	NgaySinh date ,
	MaLop nchar(8) 
)
GO

CREATE TABLE Lop(
	MaLop nchar(8) PRIMARY KEY,
	TenLop nvarchar(50) NOT NULL,
	GVCN nvarchar(50)
)
GO

ALTER TABLE SinhVien ADD CONSTRAINT FK_SinhVien_Lop FOREIGN KEY (MaLop) REFERENCES Lop(MaLop)


CREATE TABLE MonHoc(
	MaMH nchar(10) PRIMARY KEY,
	TenMH nvarchar(50) NOT NULL,
	SoTinChi tinyint NOT NULL
)
GO

CREATE TABLE Hoc(
	MaSV nchar(10) ,
	MaMH nchar(10) ,
	NgayDangKy date,
	Diem decimal(4,2),
	PRIMARY KEY (MaSV, MaMH, NgayDangKy) ,
	FOREIGN KEY (MaSV) REFERENCES SinhVien (MaSV),
	FOREIGN KEY (MaMH) REFERENCES MonHoc (MaMH)
)
GO

INSERT Lop 
VALUES ('L001', N'Lớp gì vậy', 'Chưa rõ')
INSERT Lop 
VALUES ('L002', N'Lớp gì vậy2', 'Chưa rõ2')
INSERT Lop 
VALUES ('L003', N'Lớp gì vậy3', 'Chưa rõ')
INSERT Lop 
VALUES ('L004', N'Lớp gì vậy4', 'Chưa rõ')
INSERT Lop 
VALUES ('L005', N'Lớp gì vậy5', 'Chưa rõ')


INSERT MonHoc
VALUES ('MH001', N'LT1','3')
INSERT MonHoc
VALUES ('MH002', N'LT2','3')
INSERT MonHoc
VALUES ('MH003', N'LT3','3')
INSERT MonHoc
VALUES ('MH004', N'LT4','3')
INSERT MonHoc
VALUES ('MH005', N'LT5','3')


INSERT SinhVien
VALUES ('SV1', N'Nguyễn Văn', N'Nam','Nam','19961204','L001')
INSERT SinhVien
VALUES ('SV2', N'Lê Hữu', N'Phước', N'Bê Đê','19960304','L001')
INSERT SinhVien
VALUES ('SV3', N'Nguyễn Văn', N'Nam','Nam','19960223','L002')
INSERT SinhVien
VALUES ('SV4', N'Nguyễn Văn', N'Nam','Nam','19961204','L003')
INSERT SinhVien
VALUES ('SV5', N'Nguyễn Văn', N'Nam','Nam','19961204','L004')

INSERT Hoc
VALUES ('SV1','MH001','19931212', '4.5')
INSERT Hoc
VALUES ('SV2','MH002','19931212', '4.5')
INSERT Hoc
VALUES ('SV3','MH001','19931212', '4.5')
INSERT Hoc
VALUES ('SV4','MH001','19930812', '4.5')
INSERT Hoc
VALUES ('SV5','MH001','19931012', '4.5')
GO

UPDATE SinhVien
SET GioiTinh = 'Nam'
WHERE MaSV = 'SV2'
GO

UPDATE SinhVien
SET GioiTinh = '3D'
WHERE MaSV != 'SV2' OR MaSV != 'SV3' OR MaSV != 'SV5'
GO

/*----Xóa
DELETE SinhVien
WHERE MaSV = 'SV4' OR MaSV = 'SV3'

DELETE Hoc
WHERE MaSV ='SV4' OR MaSV = 'SV3'
*/

SELECT MaSV, HoSV, TenSV, Lop.MaLop, TenLop
FROM SinhVien, Lop
WHERE SinhVien.MaLop = Lop.MaLop

SELECT SinhVien.MaSV, HoSV, TenSV, TenMH
FROM SinhVien, Hoc, MonHoc
WHERE SinhVien.MaSV = Hoc.MaSV AND
	MonHoc.MaMH = Hoc.MaMH

SELECT SinhVien.MaSV, HoSV, TenSV, GioiTinh, TenMH
FROM SinhVien, Hoc, MonHoc
WHERE SinhVien.MaSV IN ( 'SV1','SV5')

SELECT * FROM SinhVien

SELECT SinhVien.MaSV, HoSV, TenSV, GioiTinh, TenMH
FROM SinhVien, Hoc, MonHoc 
WHERE SinhVien.MaSV = Hoc.MaSV AND
	MonHoc.MaMH = Hoc.MaMH AND
	GioiTinh = '3D'