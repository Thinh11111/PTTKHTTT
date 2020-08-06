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


Create table [KhachHang]
(
	[MaKH] Char(10) NOT NULL,
	[HoTen] Nvarchar(100) NULL,
	[SDT] Integer NULL,
	[CMND] Integer NULL,
Primary Key ([MaKH])
) 
go

Create table [Phong]
(
	[MaPhong] Char(10) NOT NULL,
	[SoNguoiOToiDa] Integer NULL,
	[Gia] Float NULL,
Primary Key ([MaPhong])
) 
go

Create table [TienNghi]
(
	[STT] Char(1) NOT NULL,
	[TenTN] Char(1) NULL,
	[MaPhong] Char(10) NOT NULL,
	[MaLoaiTN] Char(1) NOT NULL,
Primary Key ([STT])
) 
go

Create table [DichVu]
(
	[MaDV] Char(10) NOT NULL,
	[TenDV] Nvarchar(100) NULL,
	[Gia] Float NULL,
Primary Key ([MaDV])
) 
go

Create table [HoaDon]
(
	[MaHD] Char(10) NOT NULL,
	[ThanhTien] Float NULL,
	[MaPhieu] Char(10) NOT NULL,
	[MaPhong] Char(10) NOT NULL,
Primary Key ([MaHD])
) 
go

Create table [PhieuThuePhong]
(
	[MaPhieu] Char(10) NOT NULL,
	[MaKH] Char(10) NOT NULL,
	[NgayThue] Char(1) NULL,
	[NgayDuKienTra] Char(1) NULL,
Primary Key ([MaPhieu])
) 
go

Create table [CT_Thue]
(
	[MaPhieu] Char(10) NOT NULL,
	[MaPhong] Char(10) NOT NULL,
	[NgayTra] Datetime NULL,
Primary Key ([MaPhieu],[MaPhong])
) 
go

Create table [CT_HD_DV]
(
	[MaHD] Char(10) NOT NULL,
	[MaDV] Char(10) NOT NULL,
	[Tien] Float NULL,
Primary Key ([MaHD],[MaDV])
) 
go

Create table [LoaiTN]
(
	[MaLoaiTN] Char(1) NOT NULL,
	[TenLoaiTN] Nvarchar(50) NULL,
Primary Key ([MaLoaiTN])
) 
go


Alter table [PhieuThuePhong] add  foreign key([MaKH]) references [KhachHang] ([MaKH])  on update no action on delete no action 
go
Alter table [CT_Thue] add  foreign key([MaPhong]) references [Phong] ([MaPhong])  on update no action on delete no action 
go
Alter table [TienNghi] add  foreign key([MaPhong]) references [Phong] ([MaPhong])  on update no action on delete no action 
go
Alter table [CT_HD_DV] add  foreign key([MaDV]) references [DichVu] ([MaDV])  on update no action on delete no action 
go
Alter table [CT_HD_DV] add  foreign key([MaHD]) references [HoaDon] ([MaHD])  on update no action on delete no action 
go
Alter table [CT_Thue] add  foreign key([MaPhieu]) references [PhieuThuePhong] ([MaPhieu])  on update no action on delete no action 
go
Alter table [HoaDon] add  foreign key([MaPhieu],[MaPhong]) references [CT_Thue] ([MaPhieu],[MaPhong])  on update no action on delete no action 
go
Alter table [TienNghi] add  foreign key([MaLoaiTN]) references [LoaiTN] ([MaLoaiTN])  on update no action on delete no action 
go


Set quoted_identifier on
go


Set quoted_identifier off
go


