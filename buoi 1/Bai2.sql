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


Create table [CUAHANG]
(
	[MSCH] Char(5) NOT NULL,
	[TenCuaHang] Nvarchar(100) NULL,
	[DiaChi] Nvarchar(100) NULL,
	[MSLH] Char(5) NOT NULL,
	[MSNV] Char(5) NOT NULL,
Primary Key ([MSCH])
) 
go

Create table [MATHANG]
(
	[MSMH] Char(5) NOT NULL,
	[MSLH] Char(5) NOT NULL,
	[TenMH] Nvarchar(50) NULL,
Primary Key ([MSMH])
) 
go

Create table [LOAIHANG]
(
	[MSLH] Char(5) NOT NULL,
	[TenLoaiHang] Nvarchar(100) NULL,
Primary Key ([MSLH])
) 
go

Create table [PHIEUGIAO]
(
	[SOPG] Char(5) NOT NULL,
	[NgayLapPhieu] Datetime NULL,
	[MSNV] Char(5) NOT NULL,
Primary Key ([SOPG])
) 
go

Create table [PHIEUTHANHTOAN]
(
	[SOPTT] Char(5) NOT NULL,
	[NgayLapPhieu] Datetime NULL,
	[MSNV] Char(5) NOT NULL,
Primary Key ([SOPTT])
) 
go

Create table [NhANVIEN]
(
	[MSNV] Char(5) NOT NULL,
	[Ten] Nvarchar(100) NULL,
	[NamSinh] Integer NULL,
	[Phai] Nvarchar(5) NULL,
	[DiaChi] Nvarchar(100) NULL,
Primary Key ([MSNV])
) 
go

Create table [CTPTHANHTOAN]
(
	[MSMH] Char(5) NOT NULL,
	[SOPTT] Char(5) NOT NULL,
	[SoLuong] Integer NULL,
Primary Key ([MSMH],[SOPTT])
) 
go

Create table [CTPHIEUGIAO]
(
	[MSMH] Char(5) NOT NULL,
	[SOPG] Char(5) NOT NULL,
	[SoLuongGiao] Integer NULL,
Primary Key ([MSMH],[SOPG])
) 
go

Create table [CTMATHANG]
(
	[MSCH] Char(5) NOT NULL,
	[MSMH] Char(5) NOT NULL,
Primary Key ([MSCH],[MSMH])
) 
go


Alter table [CTMATHANG] add  foreign key([MSCH]) references [CUAHANG] ([MSCH])  on update no action on delete no action 
go
Alter table [CTPTHANHTOAN] add  foreign key([MSMH]) references [MATHANG] ([MSMH])  on update no action on delete no action 
go
Alter table [CTPHIEUGIAO] add  foreign key([MSMH]) references [MATHANG] ([MSMH])  on update no action on delete no action 
go
Alter table [CTMATHANG] add  foreign key([MSMH]) references [MATHANG] ([MSMH])  on update no action on delete no action 
go
Alter table [CUAHANG] add  foreign key([MSLH]) references [LOAIHANG] ([MSLH])  on update no action on delete no action 
go
Alter table [MATHANG] add  foreign key([MSLH]) references [LOAIHANG] ([MSLH])  on update no action on delete no action 
go
Alter table [CTPHIEUGIAO] add  foreign key([SOPG]) references [PHIEUGIAO] ([SOPG])  on update no action on delete no action 
go
Alter table [CTPTHANHTOAN] add  foreign key([SOPTT]) references [PHIEUTHANHTOAN] ([SOPTT])  on update no action on delete no action 
go
Alter table [PHIEUTHANHTOAN] add  foreign key([MSNV]) references [NhANVIEN] ([MSNV])  on update no action on delete no action 
go
Alter table [PHIEUGIAO] add  foreign key([MSNV]) references [NhANVIEN] ([MSNV])  on update no action on delete no action 
go
Alter table [CUAHANG] add  foreign key([MSNV]) references [NhANVIEN] ([MSNV])  on update no action on delete no action 
go


Set quoted_identifier on
go


Set quoted_identifier off
go


