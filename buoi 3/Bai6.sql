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


Create table [SoHoKhau]
(
	[SoHK] Char(15) NOT NULL,
	[HoTenChuHo] Nvarchar(100) NULL,
	[SoNha] Integer NULL,
	[Duong] Nvarchar(100) NULL,
	[Phuong] Nvarchar(100) NULL,
	[Quan] Nvarchar(100) NULL,
Primary Key ([SoHK])
) 
go

Create table [NhanKhau]
(
	[MaNK] Char(100) NOT NULL,
	[SoHK] Char(15) NOT NULL,
	[HoTen] Nvarchar(100) NULL,
	[BiDanh] Nvarchar(100) NULL,
	[NgayThangNS] Datetime NULL,
	[NoiSinh] Nvarchar(100) NULL,
	[NguyenQuan] Nvarchar(100) NULL,
	[DanToc] Nvarchar(100) NULL,
	[TonGiao] Nvarchar(100) NULL,
	[TrinhDoVH] Char(10) NULL,
	[NgheNghiep] Nvarchar(100) NULL,
	[NoiLamViec] Nvarchar(100) NULL,
	[CMND] Char(10) NULL,
	[NgayCap] Datetime NULL,
	[NoiCap] Nvarchar(100) NULL,
Primary Key ([MaNK])
) 
go

Create table [PhieuChuyenDen]
(
	[MaPhieuCD] Char(11) NOT NULL,
	[NoiChuyenDi] Nvarchar(100) NULL,
	[NgayChuyenDi] Datetime NULL,
	[NgayChuyenDen] Datetime NULL,
	[LiDo] Nvarchar(100) NULL,
	[TenChuHoCanNhapKhau] Nvarchar(100) NULL,
	[MaNK] Char(100) NOT NULL,
	[MaNV] Char(10) NOT NULL,
Primary Key ([MaPhieuCD])
) 
go

Create table [GiayKhaiSinh]
(
	[STT] Char(100) NOT NULL,
	[HoTen] Nvarchar(100) NULL,
	[NoiSinh] Nvarchar(100) NULL,
	[BenhVien] Nvarchar(100) NULL,
	[NgaySinh] Datetime NULL,
	[HoTenBacSi] Nvarchar(100) NULL,
	[HoTenMe] Nvarchar(100) NULL,
	[DCThuongTruCuaMe] Nvarchar(100) NULL,
	[MaNV] Char(10) NOT NULL,
	[MaNK] Char(100) NOT NULL,
Primary Key ([STT])
) 
go

Create table [PhieuChuyenDi]
(
	[MaPhieuCD] Char(100) NOT NULL,
	[NoiChuyenDi] Nvarchar(1) NULL,
	[NgayChuyenDi] Datetime NULL,
	[NoiChuyenDen] Nvarchar(100) NULL,
	[LiDo] Nvarchar(100) NULL,
	[MaNK] Char(100) NOT NULL,
	[MaNV] Char(10) NOT NULL,
Primary Key ([MaPhieuCD])
) 
go

Create table [PhieuTu]
(
	[MaPhieuTu] Char(10) NOT NULL,
	[TenNhanKhau] Nvarchar(100) NULL,
	[NgayMat] Datetime NULL,
	[LiDoMat] Nvarchar(100) NULL,
	[NhanVienLapPhieu] Nvarchar(100) NULL,
	[MaNV] Char(10) NOT NULL,
	[MaNK] Char(100) NOT NULL,
Primary Key ([MaPhieuTu])
) 
go

Create table [PhieuThayDoiChuHo]
(
	[STT] Char(10) NOT NULL,
	[LiDothayDoi] Nvarchar(100) NULL,
	[NgayThayDoi] Datetime NULL,
	[TenChuHoCu] Nvarchar(100) NULL,
	[TenChuHoMoi] Nvarchar(100) NULL,
	[MaNK] Char(100) NOT NULL,
	[MaNV] Char(10) NOT NULL,
Primary Key ([STT])
) 
go

Create table [NhanVien]
(
	[MaNV] Char(10) NOT NULL,
	[TenNV] Nvarchar(100) NULL,
	[ChucVu] Nvarchar(100) NULL,
	[MaBP] Char(10) NOT NULL,
Primary Key ([MaNV])
) 
go

Create table [BoPhan]
(
	[MaBP] Char(10) NOT NULL,
	[TenBP] Nvarchar(100) NULL,
Primary Key ([MaBP])
) 
go

Create table [QuanHeChuHo]
(
	[STT] Char(10) NOT NULL,
	[LoaiQH] Nvarchar(100) NULL,
	[MaNK] Char(100) NOT NULL,
Primary Key ([STT])
) 
go


Alter table [NhanKhau] add  foreign key([SoHK]) references [SoHoKhau] ([SoHK])  on update no action on delete no action 
go
Alter table [PhieuChuyenDi] add  foreign key([MaNK]) references [NhanKhau] ([MaNK])  on update no action on delete no action 
go
Alter table [PhieuChuyenDen] add  foreign key([MaNK]) references [NhanKhau] ([MaNK])  on update no action on delete no action 
go
Alter table [PhieuThayDoiChuHo] add  foreign key([MaNK]) references [NhanKhau] ([MaNK])  on update no action on delete no action 
go
Alter table [PhieuTu] add  foreign key([MaNK]) references [NhanKhau] ([MaNK])  on update no action on delete no action 
go
Alter table [QuanHeChuHo] add  foreign key([MaNK]) references [NhanKhau] ([MaNK])  on update no action on delete no action 
go
Alter table [GiayKhaiSinh] add  foreign key([MaNK]) references [NhanKhau] ([MaNK])  on update no action on delete no action 
go
Alter table [PhieuChuyenDi] add  foreign key([MaNV]) references [NhanVien] ([MaNV])  on update no action on delete no action 
go
Alter table [PhieuChuyenDen] add  foreign key([MaNV]) references [NhanVien] ([MaNV])  on update no action on delete no action 
go
Alter table [PhieuTu] add  foreign key([MaNV]) references [NhanVien] ([MaNV])  on update no action on delete no action 
go
Alter table [PhieuThayDoiChuHo] add  foreign key([MaNV]) references [NhanVien] ([MaNV])  on update no action on delete no action 
go
Alter table [GiayKhaiSinh] add  foreign key([MaNV]) references [NhanVien] ([MaNV])  on update no action on delete no action 
go
Alter table [NhanVien] add  foreign key([MaBP]) references [BoPhan] ([MaBP])  on update no action on delete no action 
go


Set quoted_identifier on
go


Set quoted_identifier off
go


