/*
Created		8/6/2020
Modified		8/6/2020
Project		
Model			
Company		
Author		
Version		
Database		MS SQL 2005 
*/


Create table [Phong]
(
	[MaPhong] Char(10) NOT NULL,
	[Tang] Char(1) NOT NULL,
	[DienTich] Char(1) NOT NULL,
Primary Key ([MaPhong])
) 
go

Create table [HopDongThue]
(
	[MaHDong] Char(10) NOT NULL,
	[TGianThue] Datetime NULL,
	[TienDatCoc6Thang] Float NULL,
	[MaCT] Char(11) NOT NULL,
Primary Key ([MaHDong])
) 
go

Create table [NhanVien]
(
	[MaNV] Char(10) NOT NULL,
	[TenNV] Nvarchar(100) NULL,
	[DiaChi] Nvarchar(100) NULL,
	[SDT] Char(10) NULL,
	[MaCT] Char(11) NOT NULL,
	[MaPhong] Char(10) NOT NULL,
Primary Key ([MaNV])
) 
go

Create table [MucGia]
(
	[Tang] Char(1) NOT NULL,
	[DienTich] Char(1) NOT NULL,
	[Giá] Char(1) NULL,
Primary Key ([Tang],[DienTich])
) 
go

Create table [CongTy]
(
	[MaCT] Char(11) NOT NULL,
	[TenCT] Nvarchar(100) NULL,
	[DiaChi] Nvarchar(100) NULL,
	[SDT] Char(10) NULL,
Primary Key ([MaCT])
) 
go

Create table [PhieuGiaHan]
(
	[MaPhieu] Char(10) NOT NULL,
	[NgayLapPhieu] Datetime NULL,
	[NgayHetHan] Datetime NULL,
	[MaHDong] Char(10) NOT NULL,
	[MaPhong] Char(10) NOT NULL,
Primary Key ([MaPhieu])
) 
go

Create table [DichVu]
(
	[MaDV] Char(1) NOT NULL,
	[TenDV] Char(1) NULL,
Primary Key ([MaDV])
) 
go

Create table [CT_HopDong]
(
	[MaHDong] Char(10) NOT NULL,
	[MaPhong] Char(10) NOT NULL,
	[ThoiHanThue] Char(1) NULL,
Primary Key ([MaHDong],[MaPhong])
) 
go

Create table [HoaDon]
(
	[SoHD] Char(10) NOT NULL,
	[NgayLap] Datetime NULL,
	[MaHDong] Char(10) NOT NULL,
	[MaPhong] Char(10) NOT NULL,
	[MaDV] Char(1) NOT NULL,
Primary Key ([SoHD])
) 
go


Alter table [CT_HopDong] add  foreign key([MaPhong]) references [Phong] ([MaPhong])  on update no action on delete no action 
go
Alter table [NhanVien] add  foreign key([MaPhong]) references [Phong] ([MaPhong])  on update no action on delete no action 
go
Alter table [CT_HopDong] add  foreign key([MaHDong]) references [HopDongThue] ([MaHDong])  on update no action on delete no action 
go
Alter table [Phong] add  foreign key([Tang],[DienTich]) references [MucGia] ([Tang],[DienTich])  on update no action on delete no action 
go
Alter table [NhanVien] add  foreign key([MaCT]) references [CongTy] ([MaCT])  on update no action on delete no action 
go
Alter table [HopDongThue] add  foreign key([MaCT]) references [CongTy] ([MaCT])  on update no action on delete no action 
go
Alter table [HoaDon] add  foreign key([MaDV]) references [DichVu] ([MaDV])  on update no action on delete no action 
go
Alter table [PhieuGiaHan] add  foreign key([MaHDong],[MaPhong]) references [CT_HopDong] ([MaHDong],[MaPhong])  on update no action on delete no action 
go
Alter table [HoaDon] add  foreign key([MaHDong],[MaPhong]) references [CT_HopDong] ([MaHDong],[MaPhong])  on update no action on delete no action 
go


Set quoted_identifier on
go


Set quoted_identifier off
go


