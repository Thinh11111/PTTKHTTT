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


Create table [PhieuTuyenDung]
(
	[STT] Char(10) NOT NULL,
	[ThGianThuViec] Datetime NULL,
	[LuongThuViec] Float NULL,
	[MaPB] Char(10) NOT NULL,
	[MaNV] Char(10) NOT NULL,
Primary Key ([STT])
) 
go

Create table [PhongBan]
(
	[MaPB] Char(10) NOT NULL,
	[TenPB] Nvarchar(100) NULL,
Primary Key ([MaPB])
) 
go

Create table [HopDongTuyenDung]
(
	[MaHD] Char(10) NOT NULL,
	[MaLoai] Char(10) NOT NULL,
	[MaNV] Char(10) NOT NULL,
	[NgayLap] Datetime NULL,
Primary Key ([MaHD])
) 
go

Create table [PhieuPhuTroi]
(
	[SoPhieu] Char(10) NOT NULL,
	[NgayPhuTroi] Datetime NULL,
	[HinhThuc] Nvarchar(100) NULL,
Primary Key ([SoPhieu])
) 
go

Create table [LoaiHD]
(
	[MaLoai] Char(10) NOT NULL,
	[TenLoai] Nvarchar(100) NULL,
Primary Key ([MaLoai])
) 
go

Create table [NhanVien]
(
	[MaNV] Char(10) NOT NULL,
	[TenNV] Nvarchar(100) NULL,
	[SDT] Integer NULL,
	[DC] Nvarchar(100) NULL,
Primary Key ([MaNV])
) 
go

Create table [CT_PhuTroi]
(
	[MaNV] Char(10) NOT NULL,
	[SoPhieu] Char(10) NOT NULL,
	[SoGioPhuTro] Integer NULL,
Primary Key ([MaNV],[SoPhieu])
) 
go

Create table [QuyetDinhLuong]
(
	[MaSo] Char(10) NOT NULL,
	[NgayQD] Char(1) NULL,
	[LuongCB] Float NULL,
	[MaNV] Char(10) NOT NULL,
	[MaPC] Char(10) NOT NULL,
Primary Key ([MaSo])
) 
go

Create table [PhuCapCV]
(
	[MaPC] Char(10) NOT NULL,
	[TenPhuCap] Nvarchar(100) NULL,
	[SoTien] Float NULL,
Primary Key ([MaPC])
) 
go

Create table [BangChamCong]
(
	[MaBCC] Char(10) NOT NULL,
	[TuNgay] Datetime NULL,
	[DenNgay] Datetime NULL,
Primary Key ([MaBCC])
) 
go

Create table [CT_ChamCong]
(
	[MaNV] Char(10) NOT NULL,
	[MaBCC] Char(10) NOT NULL,
	[SoGio] Datetime NULL,
Primary Key ([MaNV],[MaBCC])
) 
go

Create table [KhenThuong-KiLuat]
(
	[MaSo] Char(10) NOT NULL,
	[NgayKT-KL] Datetime NULL,
Primary Key ([MaSo])
) 
go

Create table [CaNhan]
(
	[MaNV] Char(10) NOT NULL,
	[MaSo] Char(10) NOT NULL,
	[SoTien] Float NULL,
Primary Key ([MaNV],[MaSo])
) 
go

Create table [TapThe]
(
	[MaSo] Char(10) NOT NULL,
	[MaPB] Char(10) NOT NULL,
	[SoTien] Float NULL,
Primary Key ([MaSo],[MaPB])
) 
go

Create table [QuyetDinh_CV]
(
	[SoQD] Char(10) NOT NULL,
	[NgayQD] Datetime NULL,
	[MaNV] Char(10) NOT NULL,
	[MaCV] Char(11) NOT NULL,
Primary Key ([SoQD])
) 
go

Create table [ChucVu]
(
	[MaCV] Char(11) NOT NULL,
	[TenCV] Nvarchar(1) NULL,
	[HeSoLuong] Float NULL,
	[PCCV] Float NULL,
Primary Key ([MaCV])
) 
go


Alter table [PhieuTuyenDung] add  foreign key([MaPB]) references [PhongBan] ([MaPB])  on update no action on delete no action 
go
Alter table [TapThe] add  foreign key([MaPB]) references [PhongBan] ([MaPB])  on update no action on delete no action 
go
Alter table [CT_PhuTroi] add  foreign key([SoPhieu]) references [PhieuPhuTroi] ([SoPhieu])  on update no action on delete no action 
go
Alter table [HopDongTuyenDung] add  foreign key([MaLoai]) references [LoaiHD] ([MaLoai])  on update no action on delete no action 
go
Alter table [PhieuTuyenDung] add  foreign key([MaNV]) references [NhanVien] ([MaNV])  on update no action on delete no action 
go
Alter table [HopDongTuyenDung] add  foreign key([MaNV]) references [NhanVien] ([MaNV])  on update no action on delete no action 
go
Alter table [CT_PhuTroi] add  foreign key([MaNV]) references [NhanVien] ([MaNV])  on update no action on delete no action 
go
Alter table [CT_ChamCong] add  foreign key([MaNV]) references [NhanVien] ([MaNV])  on update no action on delete no action 
go
Alter table [QuyetDinhLuong] add  foreign key([MaNV]) references [NhanVien] ([MaNV])  on update no action on delete no action 
go
Alter table [CaNhan] add  foreign key([MaNV]) references [NhanVien] ([MaNV])  on update no action on delete no action 
go
Alter table [QuyetDinh_CV] add  foreign key([MaNV]) references [NhanVien] ([MaNV])  on update no action on delete no action 
go
Alter table [QuyetDinhLuong] add  foreign key([MaPC]) references [PhuCapCV] ([MaPC])  on update no action on delete no action 
go
Alter table [CT_ChamCong] add  foreign key([MaBCC]) references [BangChamCong] ([MaBCC])  on update no action on delete no action 
go
Alter table [CaNhan] add  foreign key([MaSo]) references [KhenThuong-KiLuat] ([MaSo])  on update no action on delete no action 
go
Alter table [TapThe] add  foreign key([MaSo]) references [KhenThuong-KiLuat] ([MaSo])  on update no action on delete no action 
go
Alter table [QuyetDinh_CV] add  foreign key([MaCV]) references [ChucVu] ([MaCV])  on update no action on delete no action 
go


Set quoted_identifier on
go


Set quoted_identifier off
go


