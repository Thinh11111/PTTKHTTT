/*
Created		7/30/2020
Modified		7/30/2020
Project		
Model			
Company		
Author		
Version		
Database		MS SQL 2005 
*/


Create table [KHO]
(
	[MaSoKho] Char(5) NOT NULL,
	[MaSoDiaDiem] Char(10) NOT NULL,
	[SoPhieuNhap] Char(10) NOT NULL,
	[TenKho] Nvarchar(100) NULL,
	[LoaiHang] Nvarchar(50) NULL,
Primary Key ([MaSoKho])
) 
go

Create table [mathang]
(
	[MaSoMatHang] Char(1) NOT NULL,
	[MSLoaiHang] Char(5) NOT NULL,
	[TenHang] Nvarchar(50) NULL,
	[SLTon] Integer NULL,
Primary Key ([MaSoMatHang])
) 
go

Create table [DIADIEM]
(
	[MaSoDiaDiem] Char(10) NOT NULL,
	[MSNV] Char(10) NOT NULL,
	[DiaChi] Nvarchar(50) NULL,
Primary Key ([MaSoDiaDiem])
) 
go

Create table [NHANVIEN]
(
	[MSNV] Char(10) NOT NULL,
	[HoTen] Nvarchar(100) NULL,
	[Phai] Nvarchar(5) NULL,
	[NamSinh] Integer NULL,
	[DiaChiThuongTru] Nvarchar(100) NULL,
	[SDT] Integer NULL,
Primary Key ([MSNV])
) 
go

Create table [PHIEUNHAP]
(
	[SoPhieuNhap] Char(10) NOT NULL,
	[MSNV] Char(10) NOT NULL,
	[NgayLap] Datetime NULL,
Primary Key ([SoPhieuNhap])
) 
go

Create table [PHIEUXUAT]
(
	[SoPhieuXuat] Char(5) NOT NULL,
	[MSNV] Char(10) NOT NULL,
	[NgayLap] Datetime NULL,
Primary Key ([SoPhieuXuat])
) 
go

Create table [LOAIHANG]
(
	[MSLoaiHang] Char(5) NOT NULL,
	[TenLoaiHang] Nvarchar(50) NULL,
Primary Key ([MSLoaiHang])
) 
go

Create table [khomathang]
(
	[MaSoKho] Char(5) NOT NULL,
	[MaSoMatHang] Char(1) NOT NULL,
Primary Key ([MaSoKho],[MaSoMatHang])
) 
go

Create table [CTPNHAP]
(
	[SoPhieuNhap] Char(10) NOT NULL,
	[MaSoMatHang] Char(1) NOT NULL,
	[SoLuong] Integer NULL,
Primary Key ([SoPhieuNhap],[MaSoMatHang])
) 
go

Create table [CTPXUAT]
(
	[SoPhieuXuat] Char(5) NOT NULL,
	[MaSoMatHang] Char(1) NOT NULL,
	[SoLuong] Integer NULL,
Primary Key ([SoPhieuXuat],[MaSoMatHang])
) 
go


Alter table [khomathang] add  foreign key([MaSoKho]) references [KHO] ([MaSoKho])  on update no action on delete no action 
go
Alter table [khomathang] add  foreign key([MaSoMatHang]) references [mathang] ([MaSoMatHang])  on update no action on delete no action 
go
Alter table [CTPNHAP] add  foreign key([MaSoMatHang]) references [mathang] ([MaSoMatHang])  on update no action on delete no action 
go
Alter table [CTPXUAT] add  foreign key([MaSoMatHang]) references [mathang] ([MaSoMatHang])  on update no action on delete no action 
go
Alter table [KHO] add  foreign key([MaSoDiaDiem]) references [DIADIEM] ([MaSoDiaDiem])  on update no action on delete no action 
go
Alter table [DIADIEM] add  foreign key([MSNV]) references [NHANVIEN] ([MSNV])  on update no action on delete no action 
go
Alter table [PHIEUXUAT] add  foreign key([MSNV]) references [NHANVIEN] ([MSNV])  on update no action on delete no action 
go
Alter table [PHIEUNHAP] add  foreign key([MSNV]) references [NHANVIEN] ([MSNV])  on update no action on delete no action 
go
Alter table [CTPNHAP] add  foreign key([SoPhieuNhap]) references [PHIEUNHAP] ([SoPhieuNhap])  on update no action on delete no action 
go
Alter table [KHO] add  foreign key([SoPhieuNhap]) references [PHIEUNHAP] ([SoPhieuNhap])  on update no action on delete no action 
go
Alter table [CTPXUAT] add  foreign key([SoPhieuXuat]) references [PHIEUXUAT] ([SoPhieuXuat])  on update no action on delete no action 
go
Alter table [mathang] add  foreign key([MSLoaiHang]) references [LOAIHANG] ([MSLoaiHang])  on update no action on delete no action 
go


Set quoted_identifier on
go


Set quoted_identifier off
go


