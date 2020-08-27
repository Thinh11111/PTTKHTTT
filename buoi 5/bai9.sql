/*
Created		8/27/2020
Modified		8/27/2020
Project		
Model			
Company		
Author		
Version		
Database		MS SQL 2005 
*/


Create table [Tour]
(
	[MaTour] Char(10) NOT NULL,
	[TenTour] Nvarchar(100) NULL,
	[SoNgay] Integer NULL,
	[DonGia1Khach] Float NULL,
Primary Key ([MaTour])
) 
go

Create table [HDVienDL]
(
	[MaSo] Char(10) NOT NULL,
	[Ten] Nvarchar(100) NULL,
	[DiaChi] Nvarchar(100) NULL,
	[SDT] Char(10) NULL,
	[LuongCB] Float NULL,
Primary Key ([MaSo])
) 
go

Create table [PhieuDK]
(
	[MaPhieu] Char(10) NOT NULL,
	[MaLoai] Char(10) NOT NULL,
	[NoiDk] Nvarchar(100) NULL,
	[NgayDK] Datetime NULL,
Primary Key ([MaPhieu])
) 
go

Create table [DiaDiemThamQuan]
(
	[MaSoDD] Char(10) NOT NULL,
	[TenDD] Nvarchar(100) NULL,
	[DiaChi] Nvarchar(100) NULL,
	[NoiDung] Nvarchar(100) NULL,
	[YNghia] Nvarchar(100) NULL,
Primary Key ([MaSoDD])
) 
go

Create table [Chuyen]
(
	[MaTour] Char(10) NOT NULL,
	[MaSo] Char(10) NOT NULL,
	[NgayDi] Datetime NULL,
	[MaPhieu] Char(10) NOT NULL,
Primary Key ([MaTour],[MaSo])
) 
go

Create table [LoTrinh]
(
	[MaLT] Char(10) NOT NULL,
	[NoiDen] Nvarchar(100) NULL,
	[NoiDi] Nvarchar(100) NULL,
Primary Key ([MaLT])
) 
go

Create table [LoTrinh_Tour]
(
	[MaTour] Char(10) NOT NULL,
	[MaLT] Char(10) NOT NULL,
	[SoNgayO] Integer NULL,
	[LoaiPhuongTien] Nvarchar(100) NULL,
	[LoaiKhachSan] Nvarchar(100) NULL,
Primary Key ([MaTour],[MaLT])
) 
go

Create table [CT_DDThamQuan]
(
	[MaTour] Char(10) NOT NULL,
	[MaSoDD] Char(10) NOT NULL,
	[ThoiGianThamQuan] Char(10) NULL,
Primary Key ([MaTour],[MaSoDD])
) 
go

Create table [LoaiPhieu]
(
	[MaLoai] Char(10) NOT NULL,
	[TenLoai] Nvarchar(100) NULL,
Primary Key ([MaLoai])
) 
go

Create table [Doan]
(
	[MaDoan] Char(10) NOT NULL,
	[TenCoQuan] Nvarchar(100) NULL,
	[DiaChi] Nvarchar(100) NULL,
	[SDTCoQuan] Char(10) NULL,
	[NguoiDaiDien] Nvarchar(100) NULL,
	[SoNguoiDi] Integer NULL,
Primary Key ([MaDoan])
) 
go

Create table [HopDong]
(
	[MaDoan] Char(10) NOT NULL,
	[MaTour] Char(10) NOT NULL,
	[NgayLap] Datetime NULL,
	[DiaDiemDon] Nvarchar(100) NULL,
Primary Key ([MaDoan],[MaTour])
) 
go


Alter table [Chuyen] add  foreign key([MaTour]) references [Tour] ([MaTour])  on update no action on delete no action 
go
Alter table [LoTrinh_Tour] add  foreign key([MaTour]) references [Tour] ([MaTour])  on update no action on delete no action 
go
Alter table [CT_DDThamQuan] add  foreign key([MaTour]) references [Tour] ([MaTour])  on update no action on delete no action 
go
Alter table [HopDong] add  foreign key([MaTour]) references [Tour] ([MaTour])  on update no action on delete no action 
go
Alter table [Chuyen] add  foreign key([MaSo]) references [HDVienDL] ([MaSo])  on update no action on delete no action 
go
Alter table [Chuyen] add  foreign key([MaPhieu]) references [PhieuDK] ([MaPhieu])  on update no action on delete no action 
go
Alter table [CT_DDThamQuan] add  foreign key([MaSoDD]) references [DiaDiemThamQuan] ([MaSoDD])  on update no action on delete no action 
go
Alter table [LoTrinh_Tour] add  foreign key([MaLT]) references [LoTrinh] ([MaLT])  on update no action on delete no action 
go
Alter table [PhieuDK] add  foreign key([MaLoai]) references [LoaiPhieu] ([MaLoai])  on update no action on delete no action 
go
Alter table [HopDong] add  foreign key([MaDoan]) references [Doan] ([MaDoan])  on update no action on delete no action 
go


Set quoted_identifier on
go


Set quoted_identifier off
go


