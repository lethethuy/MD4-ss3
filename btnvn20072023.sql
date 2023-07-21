create database btvn20072023;
use btvn2072023;

create table KhachHang(
MaKH nvarchar(4) primary key not null,
TenKH nvarchar(30) not null,
Diachi nvarchar(50),
NgaySinh datetime,
SoDT nvarchar(15) unique
);

create table NhanVien(
MaNv nvarchar(4) primary key not null,
HoTen varchar(100) not null,
GioiTinh bit not null,
DiaChi varchar(255) not null,
NgaySinh varchar(50) not null,
DienThoai varchar(11),
Email varchar(50),
NoiSinh varchar(100) not null,
NgayVaoLam datetime,
MaNQL nvarchar(4)
); 

create table NhaCungCap(
MaNCC nvarchar(5) primary key not null,
TenNCC varchar(100) not null,
DiaChi varchar(255) not null,
DienThoai varchar(11) not null,
Email varchar(100) not null,
Website varchar(100)
);

create table LoaiSp(
MaLoaiSp nvarchar(4) primary key not null  not null,
TenloaiSp nvarchar(30) not null,
Ghichu nvarchar(100) not null
);

create table SanPham(
MaSp nvarchar(4) primary key not null ,
MaloaiSp nvarchar(4) not null,
TenSp nvarchar(50) not null,
Donvitinh nvarchar(10) not null,
Ghichu nvarchar(100),
foreign key (MaloaiSP) references LoaiSp(MaLoaiSp)
);


create table PhieuNhap(
SoPN nvarchar(5) primary key not null, 
MaNv nvarchar(4) not null,
MaNCC nvarchar(5) not null,
NgayNhap datetime default(now()) not null,
GhiChu varchar(100),
foreign key(MaNv) references NhanVien(MaNv),
foreign key(MaNCC) references NhaCungCap(MaNCC)
);

create table CTPHIEUNHAP(
MaSP nvarchar(4) not null,
SoPN nvarchar(5) not null,
primary key (MaSP, SoPN),
Soluong smallint default 0 not null,
Gianhap real not null default 0,
foreign key (MaSP) references SanPham(MaSp),
foreign key (SoPN) references PhieuNhap(SoPN)
);


create table PHIEUXUAT (
SoPX nvarchar(5) primary key not null,
MaNv nvarchar(4) not null,
MaKH nvarchar(4) not null,
NgayBan datetime not null,
NgayHienTai datetime default(now()) not null,
check(NgayBan >= NgayHienTai),
GhiChu text,
foreign key (MaNv) references NhanVien(MaNv),
foreign key (MaKH) references KhachHang(MaKH)
);

create table CTPHIEUXUAT(
SoPX nvarchar(5) not null,
MaSP nvarchar(4) not null,
primary key (SoPX, MaSP),
SoLuong smallint not null,
GiaBan real not null,
foreign key (SoPX) references PHIEUXUAT(SoPX),
foreign key(MaSP) references SanPham(MaSp)
);



INSERT INTO NhanVien (MaNv, HoTen, GioiTinh, DiaChi, NgaySinh, DienThoai, Email, NoiSinh, NgayVaoLam, MaNQL)
VALUES
  ('NV01', 'Nguyen Van A', 1, '123 Nguyen Hue, TP.HCM', '1990-01-15', '0901234567', 'nv.a@example.com', 'TP.HCM', '2020-01-01 08:00:00', null),
  ('NV02', 'Tran Thi B', 0, '456 Le Loi, TP.HCM', '1995-05-20', '0912345678', 'tt.b@example.com', 'TP.HCM', '2021-03-15 09:30:00', 'NV02'),
  ('NV03', 'Pham Van C', 1, '789 Vo Van Tan, TP.HCM', '1988-11-02', '0987654321', 'pv.c@example.com', 'TP.HCM', '2019-10-10 07:45:00', 'NV02');
INSERT INTO KhachHang (MaKH, TenKH, Diachi, NgaySinh, SoDT)
VALUES
  ('KH01', 'Nguyen Thi D', '101 Nguyen Trai, TP.HCM', '1985-12-25', '0978123456'),
  ('KH02', 'Tran Van E', '202 Le Lai, TP.HCM', '1992-08-10', '0987123456'),
  ('KH03', 'Le Thi F', '303 Vo Van Tan, TP.HCM', '1989-06-18', '0918123456');
INSERT INTO NhaCungCap (MaNCC, TenNCC, DiaChi, DienThoai, Email, Website)
VALUES
  ('NCC01', 'Cong ty A', '15 Le Duan, TP.HCM', '0909123456', 'info@ncc-a.com', 'www.ncc-a.com'),
  ('NCC02', 'Cong ty B', '25 Nguyen Thi Minh Khai, TP.HCM', '0918234567', 'info@ncc-b.com', 'www.ncc-b.com'),
  ('NCC03', 'Cong ty C', '35 Tran Hung Dao, TP.HCM', '0987654321', 'info@ncc-c.com', 'www.ncc-c.com');
INSERT INTO LoaiSp (MaLoaiSp, TenloaiSp, Ghichu)
VALUES
  ('LSP1', 'Điện thoại di động', 'Các sản phẩm điện thoại di động'),
  ('LSP2', 'Laptop', 'Các sản phẩm laptop'),
  ('LSP3', 'Phụ kiện điện tử', 'Các phụ kiện điện tử');
INSERT INTO SanPham (MaSp, MaloaiSp, TenSp, Donvitinh, Ghichu)
VALUES
  ('SP01', 'LSP1', 'iPhone 12', 'cái', 'Màu đen, bộ nhớ 128GB'),
  ('SP02', 'LSP1', 'Samsung Galaxy S21', 'cái', 'Màu xanh, bộ nhớ 256GB'),
  ('SP03', 'LSP2', 'Dell XPS 13', 'cái', 'Core i7, RAM 16GB');
INSERT INTO PhieuNhap (SoPN, MaNv, MaNCC, NgayNhap, GhiChu)
VALUES
  ('PN01', 'NV01', 'NCC01', '2023-07-10 10:30:00', 'Phiếu nhập số 1'),
  ('PN02', 'NV02', 'NCC02', '2023-07-15 15:45:00', 'Phiếu nhập số 2'),
  ('PN03', 'NV03', 'NCC03', '2023-07-20 09:00:00', 'Phiếu nhập số 3');
INSERT INTO CTPHIEUNHAP (MaSP, SoPN, Soluong, Gianhap)
VALUES
  ('SP01', 'PN01', 50, 15000000),
  ('SP02', 'PN01', 30, 13000000),
  ('SP03', 'PN02', 20, 18000000),
  ('SP01', 'PN03', 40, 14500000);
INSERT INTO PHIEUXUAT (SoPX, MaNv, MaKH, NgayBan, GhiChu)
VALUES
  ('PX01', 'NV01', 'KH01', '2023-08-12 14:30:00', 'Phiếu xuất số 1'),
  ('PX02', 'NV02', 'KH02', '2023-08-18 10:15:00', 'Phiếu xuất số 2'),
  ('PX03', 'NV03', 'KH03', '2023-08-20 16:00:00', 'Phiếu xuất số 3');
INSERT INTO ctphieuxuat (SoPX, MaSP, SoLuong, GiaBan)
VALUES
  ('PX01', 'SP01', 10, 20000000),
  ('PX01', 'SP02', 20, 18000000),
  ('PX02', 'SP03', 5, 22000000),
  ('PX03', 'SP01', 15, 19500000);





