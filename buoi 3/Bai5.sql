/*
Created		8/13/2020
Modified		8/13/2020
Project		
Model			
Company		
Author		
Version		
Database		MS SQL 2005 
*/


Create table [NCC]
(
	[MaNCC] Char(10) NOT NULL,
	[TenNCC] Nvarchar(100) NULL,
	[DiaChi] Nvarchar(100) NULL,
	[SDT] Char(10) NULL,
Primary Key ([MaNCC])
) 
go

Create table [KhachHang]
(
	[MaKH] Char(10) NOT NULL,
	[TenKH] Nvarchar(100) NULL,
	[SDT] Char(10) NULL,
	[DiaChi] Nvarchar(100) NULL,
Primary Key ([MaKH])
) 
go

Create table [NGK]
(
	[MaNGK] Char(1) NOT NULL,
	[MaLoai] Char(10) NOT NULL,
	[TenNGK] Char(1) NULL,
	[SLTon] Integer NULL,
Primary Key ([MaNGK])
) 
go

Create table [PhieuDH]
(
	[MaPhieuDH] Char(10) NOT NULL,
	[MaNCC] Char(10) NOT NULL,
	[NgayDat] Datetime NULL,
Primary Key ([MaPhieuDH])
) 
go

Create table [PhieuGhiNo]
(
	[MaPhieu] Char(10) NOT NULL,
	[NgayNo] Datetime NULL,
	[NgayTra] Datetime NULL,
	[MaHD] Char(10) NOT NULL,
Primary Key ([MaPhieu])
) 
go

Create table [PhieuGiao]
(
	[MaPhieuGH] Char(10) NOT NULL,
	[MaPhieuDH] Char(10) NOT NULL,
	[NgayGiao] Datetime NULL,
Primary Key ([MaPhieuGH])
) 
go

Create table [LoaiNGK]
(
	[MaLoai] Char(10) NOT NULL,
	[TenLoai] Nvarchar(100) NULL,
	[MaNCC] Char(10) NOT NULL,
Primary Key ([MaLoai])
) 
go

Create table [HoaDon]
(
	[MaHD] Char(10) NOT NULL,
	[MaKH] Char(10) NOT NULL,
	[TongTien] Float NULL,
Primary Key ([MaHD])
) 
go

Create table [CT_PhieuDat]
(
	[MaNGK] Char(1) NOT NULL,
	[MaPhieuDH] Char(10) NOT NULL,
	[SoLuong] Float NULL,
Primary Key ([MaNGK],[MaPhieuDH])
) 
go

Create table [CT_PhieuGiao]
(
	[MaNGK] Char(1) NOT NULL,
	[MaPhieuGH] Char(10) NOT NULL,
	[SoLuong] Integer NULL,
	[gia] Float NULL,
Primary Key ([MaNGK],[MaPhieuGH])
) 
go

Create table [CT_HD]
(
	[MaNGK] Char(1) NOT NULL,
	[MaHD] Char(10) NOT NULL,
	[SoLuong] Char(10) NOT NULL,
	[Gia] Float NULL,
	[ThanhTien] Float NULL,
Primary Key ([MaNGK],[MaHD])
) 
go


Alter table [PhieuDH] add  foreign key([MaNCC]) references [NCC] ([MaNCC])  on update no action on delete no action 
go
Alter table [LoaiNGK] add  foreign key([MaNCC]) references [NCC] ([MaNCC])  on update no action on delete no action 
go
Alter table [HoaDon] add  foreign key([MaKH]) references [KhachHang] ([MaKH])  on update no action on delete no action 
go
Alter table [CT_PhieuDat] add  foreign key([MaNGK]) references [NGK] ([MaNGK])  on update no action on delete no action 
go
Alter table [CT_PhieuGiao] add  foreign key([MaNGK]) references [NGK] ([MaNGK])  on update no action on delete no action 
go
Alter table [CT_HD] add  foreign key([MaNGK]) references [NGK] ([MaNGK])  on update no action on delete no action 
go
Alter table [PhieuGiao] add  foreign key([MaPhieuDH]) references [PhieuDH] ([MaPhieuDH])  on update no action on delete no action 
go
Alter table [CT_PhieuDat] add  foreign key([MaPhieuDH]) references [PhieuDH] ([MaPhieuDH])  on update no action on delete no action 
go
Alter table [CT_PhieuGiao] add  foreign key([MaPhieuGH]) references [PhieuGiao] ([MaPhieuGH])  on update no action on delete no action 
go
Alter table [NGK] add  foreign key([MaLoai]) references [LoaiNGK] ([MaLoai])  on update no action on delete no action 
go
Alter table [PhieuGhiNo] add  foreign key([MaHD]) references [HoaDon] ([MaHD])  on update no action on delete no action 
go
Alter table [CT_HD] add  foreign key([MaHD]) references [HoaDon] ([MaHD])  on update no action on delete no action 
go


Set quoted_identifier on
go


Set quoted_identifier off
go


