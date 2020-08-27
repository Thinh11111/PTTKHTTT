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


Create table [HopDong]
(
	[SoHD] Char(10) NOT NULL,
	[TenChuHD] Nvarchar(100) NULL,
	[HinhThucSD] Nvarchar(100) NULL,
	[DiaChi] Nvarchar(100) NULL,
	[MaNV] Char(10) NOT NULL,
Primary Key ([SoHD])
) 
go

Create table [NhanVien]
(
	[MaNV] Char(10) NOT NULL,
	[TenNV] Nvarchar(100) NULL,
	[DiaChi] Nvarchar(100) NULL,
	[SDT] Char(10) NULL,
Primary Key ([MaNV])
) 
go

Create table [SoGhi]
(
	[STT] Char(10) NOT NULL,
	[SoHieu] Integer NULL,
	[Loai] Nvarchar(100) NULL,
	[ChiSoDien] Integer NULL,
	[MaNV] Char(10) NOT NULL,
Primary Key ([STT])
) 
go

Create table [HoaDon]
(
	[MaHoaDon] Char(10) NOT NULL,
	[ChiSoCTThangTruoc] Integer NULL,
	[ChiSoCTThangNay] Integer NULL,
	[DienNangTieuThu] Integer NULL,
	[MaNV] Char(10) NOT NULL,
	[STT] Char(10) NOT NULL,
Primary Key ([MaHoaDon])
) 
go

Create table [PhieuBaoCao]
(
	[MaPhieu] Char(10) NOT NULL,
	[TongSoDienTieuThu] Nvarchar(100) NULL,
	[HoConNo] Nvarchar(100) NULL,
	[SoTienChuaThu] Float NULL,
	[MaNV] Char(10) NOT NULL,
Primary Key ([MaPhieu])
) 
go

Create table [HoDan]
(
	[MaHo] Char(10) NOT NULL,
	[DiaChiHo] Nvarchar(100) NULL,
	[SDT] Char(10) NULL,
Primary Key ([MaHo])
) 
go

Create table [CongTo]
(
	[MaCongTo] Char(10) NOT NULL,
	[HeSo] Integer NULL,
	[MaLoai] Char(10) NOT NULL,
	[MaHo] Char(10) NOT NULL,
	[MaNV] Char(10) NOT NULL,
Primary Key ([MaCongTo])
) 
go

Create table [LoaiCongTo]
(
	[MaLoai] Char(10) NOT NULL,
	[TenLoai] Nvarchar(100) NULL,
Primary Key ([MaLoai])
) 
go

Create table [CT_HD]
(
	[MaHo] Char(10) NOT NULL,
	[SoHD] Char(10) NOT NULL,
	[NgayLap] Datetime NULL,
	[NgayKetThuc] Datetime NULL,
Primary Key ([MaHo],[SoHD])
) 
go

Create table [CT_HoaDon]
(
	[MaHo] Char(10) NOT NULL,
	[MaHoaDon] Char(10) NOT NULL,
	[NgayLap] Datetime NULL,
	[ThanhTien] Float NULL,
Primary Key ([MaHo],[MaHoaDon])
) 
go

Create table [CT_SoGhi]
(
	[STT] Char(10) NOT NULL,
	[MaCongTo] Char(10) NOT NULL,
	[SoCongToDien] Integer NULL,
Primary Key ([STT],[MaCongTo])
) 
go


Alter table [CT_HD] add  foreign key([SoHD]) references [HopDong] ([SoHD])  on update no action on delete no action 
go
Alter table [CongTo] add  foreign key([MaNV]) references [NhanVien] ([MaNV])  on update no action on delete no action 
go
Alter table [PhieuBaoCao] add  foreign key([MaNV]) references [NhanVien] ([MaNV])  on update no action on delete no action 
go
Alter table [HoaDon] add  foreign key([MaNV]) references [NhanVien] ([MaNV])  on update no action on delete no action 
go
Alter table [SoGhi] add  foreign key([MaNV]) references [NhanVien] ([MaNV])  on update no action on delete no action 
go
Alter table [HopDong] add  foreign key([MaNV]) references [NhanVien] ([MaNV])  on update no action on delete no action 
go
Alter table [HoaDon] add  foreign key([STT]) references [SoGhi] ([STT])  on update no action on delete no action 
go
Alter table [CT_SoGhi] add  foreign key([STT]) references [SoGhi] ([STT])  on update no action on delete no action 
go
Alter table [CT_HoaDon] add  foreign key([MaHoaDon]) references [HoaDon] ([MaHoaDon])  on update no action on delete no action 
go
Alter table [CongTo] add  foreign key([MaHo]) references [HoDan] ([MaHo])  on update no action on delete no action 
go
Alter table [CT_HD] add  foreign key([MaHo]) references [HoDan] ([MaHo])  on update no action on delete no action 
go
Alter table [CT_HoaDon] add  foreign key([MaHo]) references [HoDan] ([MaHo])  on update no action on delete no action 
go
Alter table [CT_SoGhi] add  foreign key([MaCongTo]) references [CongTo] ([MaCongTo])  on update no action on delete no action 
go
Alter table [CongTo] add  foreign key([MaLoai]) references [LoaiCongTo] ([MaLoai])  on update no action on delete no action 
go


Set quoted_identifier on
go


Set quoted_identifier off
go


