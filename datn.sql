create database DatnFinal;

use DatnFinal

create table Ao(
	Id uniqueidentifier primary key default newid(),
	Ma varchar(20) unique,
	Ten nvarchar(max) default null,
	IdChatVai uniqueidentifier,
	IdLoaiAo uniqueidentifier,
	CoAo nvarchar(max),
	Tui nvarchar(max),
	TayAo nvarchar(max),
	IdFormAo uniqueidentifier,
	IdHang uniqueidentifier,
	MoTa nvarchar(255) null,
	NgayNhap date,
	GiaNhap decimal,
	GiaBan decimal,
	TrangThai int null
)

create table LoaiAo (
	Id uniqueidentifier primary key default newid(),
	Ma varchar(20) unique,
	Ten nvarchar(max) default null,
	TenURL nvarchar(max) null,
	TrangThai int null
)

create table FormAo (
	Id uniqueidentifier primary key default newid(),
	Ma varchar(20) unique,
	Ten nvarchar(max) default null,
	TrangThai int null
)

create table Hang (
	Id uniqueidentifier primary key default newid(),
	Ma varchar(20) unique,
	Ten nvarchar(max) default null,
	DiaChi nvarchar(max) default null,
	TrangThai int null
)


create table Size (
	Id uniqueidentifier primary key default newid(),
	Ma varchar(20) unique,
	Ten nvarchar(max) default null,
	TrangThai int null
)

create table MauSac (
	Id uniqueidentifier primary key default newid(),
	Ma varchar(20) unique,
	Ten nvarchar(max) default null,
	TrangThai int null
)

create table ChatVai (
	Id uniqueidentifier primary key default newid(),
	Ma varchar(20) unique,
	Ten nvarchar(max) default null,
	ThongTin nvarchar(max) null,
	IdHuongDanBaoQuan uniqueidentifier,
	TrangThai int null
)

create table HuongDanBaoQuan (
	Id uniqueidentifier primary key default newid(),
	Ma varchar(20) unique,
	Ten nvarchar(max) null,
	ChiTiet nvarchar(max) null,
	TrangThai int null
)
	
create table AoChiTiet (
	Id uniqueidentifier primary key default newid(),
	IdSize uniqueidentifier,
	IdMauSac uniqueidentifier,
	IdAo uniqueidentifier,
	SoLuongTon int,
	SoLuongBan int,
	TrangThai int null
)

create table Anh (
	Id uniqueidentifier primary key default newid(),
	TenURL nvarchar(max) null,
	IdAo uniqueidentifier,
	TrangThai int null
)

create table DanhGia (
	Id uniqueidentifier primary key default newid(),
	IdAo uniqueidentifier,
	IdNguoiDung uniqueidentifier null,
	DanhGiaBinhLuan nvarchar(max) null,
	UrlVideo nvarchar(max) null,
	DanhGiaSao int null,
	TrangThai int null
)

create table ChuongTrinhGiamGiaSanPham (
	Id uniqueidentifier primary key default newid(),
	Ma varchar(20) unique,
	Ten nvarchar(50) default null,
	PhanTramGiam int,
	NgayBatDau date,
	NgayKetThuc date,
	TrangThai int null
)

create table ChuongTrinhGiamGiaHoaDon (
	Id uniqueidentifier primary key default newid(),
	Ma varchar(20) unique,
	Ten nvarchar(50) default null,
	PhanTramGiam int,
	SoLuongSanPham int null,
	SoTienHoaDon decimal null,
	NgayBatDau date,
	NgayKetThuc date,
	TrangThai int null
)

create table ChuongTrinhGiamGiaChiTietSanPham (
	ID uniqueidentifier primary key default newid(),
	IdPggSp uniqueidentifier,
	IdSanPham uniqueidentifier,
	SoTienDaGIam decimal,
	TrangThai int null
)

create table ChuongTrinhGiamGiaChiTietHoaDon (
	Id uniqueidentifier primary key default newid(),
	IdPggHd uniqueidentifier,
	IdHD uniqueidentifier,
	SoTienDaGIam decimal,
	TrangThai int null
)

create table Users (
	Id uniqueidentifier primary key default newid(),
	Ma varchar(20) unique,
	Ten nvarchar(50) default null,
	NgaySinh date null,
	GioiTinh int null,
	DiaChi nvarchar(255) null,
	ThanhPho nvarchar(255) null,
	QuocGia nvarchar(255) null,
	SDT nvarchar(15) null,
	Email nvarchar(255) null,
	MatKhau nvarchar(255) null,
	Role varchar(max),
	TrangThai int null
)

create table HoaDon (
	Id uniqueidentifier primary key default newid(),
	Ma varchar(20) unique,
	NgayTao DATETIME null,
	NgayChoXacNhan DATETIME null,
	NgayXacNhan DATETIME null,
	NgayHoanThanh DATETIME null,
	NgayHuy DATETIME null,
	NgayThanhToan DATETIME null,
	IdNhanVien uniqueidentifier,
	IdKhachHang uniqueidentifier,
	MoTa nvarchar(255) null,
	TongTien decimal,
	TrangThai int null
)


create table HoaDonChiTiet (
	Id uniqueidentifier primary key default newid(),
	IdHoaDon uniqueidentifier,
	IdAoChiTiet uniqueidentifier,
	SoLuong int,
	DonGia decimal,
	TrangThai int null
)


create table PhieuGiaoHang (
	Id uniqueidentifier primary key default newid(),
	IdHoaDon uniqueidentifier,
	IdKhachHang uniqueidentifier,
	IdNhanVien uniqueidentifier,
	Ten nvarchar(255) null,
	SDT nvarchar(15) null,
	DiaChi nvarchar(255) null,
	GhiChu nvarchar(255) null,
	PhiShip decimal,
	TrangThai int null
)

create table GioHang (
	Id uniqueidentifier primary key default newid(),
	Ma varchar(20) unique,
	IdKhachHang uniqueidentifier,
	NgayTao date null,
	TrangThai int null
)

create table GioHangChiTiet (
	Id uniqueidentifier primary key default newid(),
	IdGioHang uniqueidentifier,
	IdAoChiTiet uniqueidentifier,
	SoLuong int,
	DonGia decimal,
	TrangThai int null
)

create table Chat (
	Id uniqueidentifier primary key default newid(),
	IdNhanVien uniqueidentifier null,
	IdKhachHang uniqueidentifier null,
	NoiDung nvarchar(255) null,
	ThoiGian date,
	TrangThai int null
)

CREATE TABLE ChatMessage
(
    id INT IDENTITY(1,1) PRIMARY KEY,
    content NVARCHAR(MAX),
    timestamp DATETIME,
    iduser uniqueidentifier,
    bientrunggian int,
    FOREIGN KEY (iduser) REFERENCES Users(Id)
);

--
alter table Ao add foreign key (IdFormAo) references FormAo(Id)

alter table Ao add foreign key (IdHang) references Hang(Id)

alter table Ao add foreign key (IdChatVai) references ChatVai(Id)

alter table Ao add foreign key (IdLoaiAo) references LoaiAo(Id)

alter table AoChiTiet add foreign key (IdSize) references Size(Id)

alter table AoChiTiet add foreign key (IdMauSac) references MauSac(Id)


alter table AoChiTiet add foreign key (IdAo) references Ao(Id)

--

alter table ChatVai add foreign key (IdHuongDanBaoQuan) references HuongDanBaoQuan(Id)

--

alter table Anh add foreign key (IdAo) references Ao(Id)

alter table DanhGia add foreign key (IdAo) references Ao(Id)

alter table DanhGia add foreign key (IdNguoiDung) references Users(Id)

--

alter table ChuongTrinhGiamGiaChiTietSanPham add foreign key (IdPggSp) references ChuongTrinhGiamGiaSanPham(Id)

alter table ChuongTrinhGiamGiaChiTietSanPham add foreign key (IdSanPHam) references Ao(Id)

--

alter table ChuongTrinhGiamGiaChiTietHoaDon add foreign key (IdPggHd) references ChuongTrinhGiamGiaHoaDon(Id)

alter table ChuongTrinhGiamGiaChiTietHoaDon add foreign key (IdHD) references HoaDon(Id)

--

alter table HoaDon add foreign key (IdNhanVien) references Users(Id)

alter table HoaDon add foreign key (IdKhachHang) references Users(Id)

--

alter table HoaDonChiTiet add foreign key (IdHoaDon) references HoaDon(Id)

alter table HoaDonChiTiet add foreign key (IdAoChiTiet) references AoChiTiet(Id)

--

alter table PhieuGiaoHang add foreign key (IdHoaDon) references HoaDon(Id)

alter table PhieuGiaoHang add foreign key (IdKhachHang) references Users(Id)

alter table PhieuGiaoHang add foreign key (IdNhanVien) references Users(Id)

--

alter table GioHang add foreign key (IdKhachHang) references Users(Id)

--

alter table GioHangChiTIet add foreign key (IdGioHang) references GioHang(Id)

alter table GioHangChiTIet add foreign key (IdAoChiTiet) references AoChiTiet(Id)

--

alter table Chat add foreign key (IdKhachHang) references Users(Id)

alter table Chat add foreign key (IdNhanVien) references Users(Id)

---

select * from Ao

select * from AoChiTiet

---

select * from ChuongTrinhGiamGiaHoaDon

SELECT TOP 10 SUM(SoLuongBan) AS SoLuongBan
FROM AoChiTiet
GROUP BY IdAo
ORDER BY SoLuongBan DESC;

select * from GioHang

SELECT TOP 10 Ao.Ma, SUM(AoChiTiet.SoLuongBan) AS TongSoLuongBan
FROM AoChiTiet
INNER JOIN Ao ON AoChiTiet.IdAo = Ao.Id
GROUP BY Ao.Ma
ORDER BY TongSoLuongBan DESC

select * from AoChiTiet

update AoChiTiet set SoLuongBan = 1 , SoLuongTon = 9 where Id = '143CF3AB-38FE-4F97-8775-B4BE87CB36CB'

select top 2 gg.Id from ChuongTrinhGiamGiaSanPham gg where gg.TrangThai = 0 order by gg.PhanTramGiam desc

select * from ChuongTrinhGiamGiaChiTietSanPham

select distinct IdMauSac from AoChiTiet where IdAo = '6AC22C90-F35B-4570-8608-2F2727CF82D8'

INSERT INTO Users (Ma, Ten, NgaySinh, DiaChi, ThanhPho, QuocGia, SDT, Email, MatKhau, Role, TrangThai)
VALUES ('001', 'ADMIN', '2001-04-04', '987 Tam Trinh', 'Ha Noi', 'Vietnam', '0901234567', 'admin123@gmail.com', '123456', 'ADMIN', 1);

update Users set Ma = '001' where id = 'B0E153C2-3BD0-474F-8BB8-940A3A641918' 

select * from Users

select * from HoaDonChiTiet

select * from GioHang

insert into GioHang(Ma, IdKhachHang, TrangThai) values('GH002', '539A088B-1680-40D4-B21E-BE5D0162721D', 1)

select count(IdGioHang) from GioHangChiTiet where IdGioHang = '1ABFB3FD-5FEF-45DC-AFAD-D9DDDAD4414C'

select * from ChuongTrinhGiamGiaChiTietSanPham

select * from Ao

update Ao set TrangThai = 1 where Id ='92E42FD2-1E71-4B3A-9A6D-2D19954E49BF'

update AoChiTiet set IdAo = '2DCAAFD9-B0A5-4A2D-9896-809305F015E8' where Id='D28BD263-735F-41DA-99EC-35A920F08F70'

update HoaDon set TrangThai = 2 where Ma = 'Ma112247'

update HoaDon set NgayThanhToan = '2023-10-21' where id = 'F60C02B3-4856-4B37-92DF-3E1BC372EA0E'

delete AoChiTiet where Id = '48CFC453-7E1F-456F-8D54-6FEC3DC8196F'

delete from AoChiTiet where Id= '2ad3a81b-4677-4e82-b26e-738deb3f7ad5'

select * from AoChiTiet where Id = '0bdf5780-9b5a-490b-8c0e-931b1cb15371'

select * from Ao

select Id from MauSac where id = 'F675BE4A-4AEE-4CFA-9AAB-2CE3D4A73DD2'

select Id from Size where id = '84CD33C0-7EAB-46E9-AF0C-6A056DE2B037'

select * from HoaDon where NgayTao Like '%21-10-2023%' 

SELECT distinct NgayThanhToan FROM HoaDon WHERE NgayThanhToan IS NOT NULL;

select SUM(hdct.SoLuong) from HoaDonChiTiet hdct join HoaDon hd on hdct.IdHoaDon = hd.Id where hd.NgayThanhToan = '2023-10-05'

select * from HuongDanBaoQuan

delete HuongDanBaoQuan where Id = '33EDB08C-A149-435E-8E3C-B36469E1D79D'

-- insert

INSERT INTO Hang(Id, Ma, Ten, DiaChi, TrangThai)
VALUES
  (NEWID(), 'Hang1', N'Louis Vuitton', N'Nghệ An', 1),
  (NEWID(), 'Hang2', N'Hermes', N'Gia Lai', 1),
  (NEWID(), 'Hang3', N'Hermes', N'Sơn La', 1),
  (NEWID(), 'Hang4', N'Chanel', N'Đắk Lắk', 1),
  (NEWID(), 'Hang5', N'Gucci', N'Thanh Hóa', 1),
  (NEWID(), 'Hang6', N'Armani', N'Quảng Nam', 1),
  (NEWID(), 'Hang7', N'Burberry', N'Lâm Đồng', 1),
  (NEWID(), 'Hang8', N'Prada', N'Kon Tum', 1),
  (NEWID(), 'Hang9', N'Fendi', N'Điện Biên', 1),
  (NEWID(), 'Hang10', N'Dior', N'Lai Châu', 1);


  INSERT INTO HuongDanBaoQuan(Id, Ma, Ten, ChiTiet, TrangThai)
VALUES
    (NEWID(), 'HDBQ1', N'Cotton', N'Không nên ngâm vải trong xà phòng quá lâu, chỉ ngâm trong nước giặt vài phút và tiến hành giặt sạch ngay', 1),
    (NEWID(), 'HDBQ2', N'Polyester', N'Khi giặt đồ dùng màu trắng nên ngâm sản phẩm trước khi xử lý trong nước ấm, sau đó ngâm qua đêm và giặt lại vào buổi sáng hôm sau', 1),
    (NEWID(), 'HDBQ3', N'Len', N'Loại bỏ bớt bụi ra khỏi đồ len trước khi giặt bằng cách đập bụi', 1),
    (NEWID(), 'HDBQ4', N'Acrylic', N'Khi giặt bằng máy, sử dụng nước ấm và chế độ giặt nhẹ. Bạn có thể sấy khô acrylic trong máy sấy ở chế độ thấp và nhanh chóng loại bỏ chúng khi khô', 1),
    (NEWID(), 'HDBQ5', N'Canvas', N'Vải canvas với đặc tính thô cứng do đó trong quá trình sử dụng nên lưu ý nhằm đảm bảo cho túi luôn được sạch và được vệ sinh đúng cách nhất', 1),
	(NEWID(), 'HDBQ6', N'Da lộn', N'Bảo quản ở nơi thoáng mát và khô ráo. Tránh tiếp xúc với nước', 1),
    (NEWID(), 'HDBQ7', N'Vải dù', N'Không ngâm quá lâu trong xà phòng. Không giặt trong nhiệt độ quá cao', 1),
	(NEWID(), 'HDBQ8', N'Jean', N'Không nên ngâm vải trong xà phòng quá lâu, chỉ ngâm trong nước giặt vài phút và tiến hành giặt sạch ngay', 1);

insert into FormAo (Ma, Ten, TrangThai)
values
('AO-01', N'Form áo ôm sát', 1),
('AO-02', N'Form áo rộng rãi', 1),
('AO-03', N'Form áo oversize', 1),
('AO-04', N'Form áo croptop', 1),
('AO-05', N'Form áo sơ mi cổ Đức', 1),
('AO-06', N'Form áo sơ mi cổ tàu', 1),
('AO-07', N'Form áo sơ mi cổ tim', 1),
('AO-08', N'Form áo sơ mi hawaii', 1),
('AO-09', N'Form áo sơ mi flannel', 1);

insert into Size (Ma, Ten, TrangThai)
values
('S', 'Size S', 1),
('M', 'Size M', 1),
('L', 'Size L', 1),
('XL', 'Size XL', 1),
('XXL', 'Size XXL', 1),
('XXXL', 'Size 3XL', 1);

insert into MauSac (Ma, Ten, TrangThai)
values
('TRANG', N'Trắng', 1),
('DEN', N'Đen', 1),
('XAM', N'Xám', 1),
('DO', N'Đỏ', 1),
('XANH_DUONG', N'Xanh dương', 1),
('XANH_LA', N'Xanh lá', 1),
('TIM', N'Tím', 1),
('CAM', N'Cam', 1),
('VANG', N'Vàng', 1),
('HONG', N'Hồng', 1),
('BE', N'Be', 1);

select* from MauSac

update MauSac set Ten = N'Hồng' where Ma = 'HONG'