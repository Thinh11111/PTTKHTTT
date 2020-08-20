/*
Created		8/20/2020
Modified		8/20/2020
Project		
Model			
Company		
Author		
Version		
Database		MS SQL 2005 
*/


Create table [PhieuDangKi]
(
	[MaPhieu] Char(10) NOT NULL,
	[HoTen] Nvarchar(100) NULL,
	[DiaChi] Nvarchar(100) NULL,
	[NgaySinh] Datetime NULL,
	[DT] Char(10) NULL,
	[MaHoSo] Char(10) NOT NULL,
Primary Key ([MaPhieu])
) 
go

Create table [HoSoBenhAn]
(
	[MaHoSo] Char(10) NOT NULL,
	[NgayLap] Datetime NULL,
	[NgayHetHan] Datetime NULL,
Primary Key ([MaHoSo])
) 
go

Create table [PhieuKhamBenh]
(
	[STT] Char(10) NOT NULL,
	[NgayGioKham] Datetime NULL,
	[BacSiKham] Nvarchar(100) NULL,
	[KhoaDieuTri] Nvarchar(100) NULL,
	[Trieuchung] Nvarchar(100) NULL,
	[ToaThuoc] Nvarchar(100) NULL,
	[MaHoSo] Char(10) NOT NULL,
Primary Key ([STT])
) 
go

Create table [VienPhi]
(
	[MaHDVP] Char(10) NOT NULL,
	[NgayDong] Datetime NULL,
	[SoTien] Float NULL,
	[MaHoSo] Char(10) NOT NULL,
Primary Key ([MaHDVP])
) 
go

Create table [BacSi]
(
	[MaBS] Char(10) NOT NULL,
	[TenBS] Nvarchar(100) NULL,
	[DC] Nvarchar(100) NULL,
	[SDT] Char(10) NULL,
Primary Key ([MaBS])
) 
go

Create table [ToaThuoc]
(
	[MaToa] Char(10) NOT NULL,
	[NgayLap] Datetime NULL,
	[MaBenh] Char(10) NOT NULL,
	[STT] Char(10) NOT NULL,
Primary Key ([MaToa])
) 
go

Create table [Thuoc]
(
	[MaThuoc] Char(10) NOT NULL,
	[TenThuoc] Nvarchar(100) NULL,
Primary Key ([MaThuoc])
) 
go

Create table [CT_Thuoc]
(
	[MaToa] Char(10) NOT NULL,
	[MaThuoc] Char(10) NOT NULL,
	[SoLuong] Float NULL,
Primary Key ([MaToa],[MaThuoc])
) 
go

Create table [Benh]
(
	[MaBenh] Char(10) NOT NULL,
	[TenBenh] Nvarchar(100) NULL,
Primary Key ([MaBenh])
) 
go

Create table [CT_KhamBenh]
(
	[MaBenh] Char(10) NOT NULL,
	[MaBS] Char(10) NOT NULL,
	[STT] Char(10) NOT NULL,
	[TrieuChung] Nvarchar(10) NULL,
Primary Key ([MaBenh],[STT])
) 
go

Create table [PhieuXuatVien]
(
	[MSPhieu] Char(10) NOT NULL,
	[NgayNhapVien] Datetime NULL,
	[NgayXyatVien] Datetime NULL,
	[MaHoSo] Char(10) NOT NULL,
Primary Key ([MSPhieu])
) 
go


Alter table [PhieuDangKi] add  foreign key([MaHoSo]) references [HoSoBenhAn] ([MaHoSo])  on update no action on delete no action 
go
Alter table [PhieuKhamBenh] add  foreign key([MaHoSo]) references [HoSoBenhAn] ([MaHoSo])  on update no action on delete no action 
go
Alter table [VienPhi] add  foreign key([MaHoSo]) references [HoSoBenhAn] ([MaHoSo])  on update no action on delete no action 
go
Alter table [PhieuXuatVien] add  foreign key([MaHoSo]) references [HoSoBenhAn] ([MaHoSo])  on update no action on delete no action 
go
Alter table [CT_KhamBenh] add  foreign key([STT]) references [PhieuKhamBenh] ([STT])  on update no action on delete no action 
go
Alter table [CT_KhamBenh] add  foreign key([MaBS]) references [BacSi] ([MaBS])  on update no action on delete no action 
go
Alter table [CT_Thuoc] add  foreign key([MaToa]) references [ToaThuoc] ([MaToa])  on update no action on delete no action 
go
Alter table [CT_Thuoc] add  foreign key([MaThuoc]) references [Thuoc] ([MaThuoc])  on update no action on delete no action 
go
Alter table [CT_KhamBenh] add  foreign key([MaBenh]) references [Benh] ([MaBenh])  on update no action on delete no action 
go
Alter table [ToaThuoc] add  foreign key([MaBenh],[STT]) references [CT_KhamBenh] ([MaBenh],[STT])  on update no action on delete no action 
go


Set quoted_identifier on
go


Set quoted_identifier off
go


