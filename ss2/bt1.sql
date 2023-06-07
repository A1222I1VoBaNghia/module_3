create database if not exists quanlybanhang;
use quanlybanhang;
create table vattu(
mavt int auto_increment primary key,
tenvt varchar(45)
);
create table phieuxuat(
mapx int auto_increment primary key,
ngayxuat date,
mavt int
);
create table phieunhap(
mapn int auto_increment primary key,
ngaynhap date,
mavt int
);
create table nhacc(
mancc varchar(45) primary key,
tenncc varchar(255),
diachi varchar(255),
sdt int
);
create table sdt(
sdt int ,
 mancc varchar(45) primary key,
 foreign key(mancc)references nhacc(mancc));
create table donhang(
sodh int auto_increment primary key,
ngaydh date,
mavt int,
mancc varchar(45),
foreign key (mancc) references nhacc(mancc)
);
create table chitietphieuxuat(
dgxuat double,
slxuat int,
mapx int,
mavt int,
primary key (mapx, mavt),
foreign key(mapx) references phieuxuat(mapx),
foreign key(mavt) references vattu(mavt));
create table chitietphieunhap(
dgnhap double,
slnhap int,
mapn int,
mavt int,
primary key (mapn, mavt),
foreign key(mapn)references phieunhap(mapn),
foreign key(mavt) references vattu(mavt)
);
create table chitietdondathang(
sodh int, 
mavt int,
primary key (sodh, mavt),
foreign key (mavt) references vattu(mavt),
foreign key (sodh) references donhang(sodh)
);
