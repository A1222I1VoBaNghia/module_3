create database sale_chi_tiet_don_hangso_dhso_dhmanagement;
use sale_management;
CREATE TABLE don_vi_dat_hang (
  ma_dv INT PRIMARY KEY,
  ten_dv VARCHAR(255) NOT NULL,
  dia_chi VARCHAR(255) NOT NULL,
  dien_thoai VARCHAR(15) NOT NULL
);

CREATE TABLE don_vi_giao_hang (
  ma_dv INT PRIMARY KEY,
  ten_dv VARCHAR(255) NOT NULL,
  dia_chi VARCHAR(255) NOT NULL
);

CREATE TABLE hang_hoa (
  ma_hang INT PRIMARY KEY,
  ten_hang VARCHAR(255) NOT NULL,
  don_vi_tinh VARCHAR(20) NOT NULL,
  mo_ta VARCHAR(255) DEFAULT NULL
);

CREATE TABLE nguoi_dat_hang (
  ma_nd INT PRIMARY KEY,
  ho_ten_nd VARCHAR(255) NOT NULL
);

CREATE TABLE noi_giao_hang (
  ma_ng INT PRIMARY KEY,
  ten_ng VARCHAR(255) NOT NULL
);

CREATE TABLE nguoi_nhan (
  ma_nn INT PRIMARY KEY,
  ho_ten_nn VARCHAR(255) NOT NULL
);

CREATE TABLE nguoi_giao (
  ma_ng INT PRIMARY KEY,
  ho_ten_ng VARCHAR(255) NOT NULL
);

CREATE TABLE don_dat_hang (
  so_dh INT PRIMARY KEY,
  ma_dv INT,
  ngay_dat DATE NOT NULL,
  ma_nd INT,
  FOREIGN KEY (ma_dv) REFERENCES don_vi_dat_hang(ma_dv),
  FOREIGN KEY (ma_nd) REFERENCES nguoi_dat_hang(ma_nd)
);

CREATE TABLE phieu_giao_hang (
  so_pg INT PRIMARY KEY,
  ma_dv INT,
  ngay_giao DATE NOT NULL,
  ma_ng INT,
  ma_nn INT,
  FOREIGN KEY (ma_dv) REFERENCES don_vi_giao_hang(ma_dv),
  FOREIGN KEY (ma_ng) REFERENCES nguoi_giao(ma_ng),
  FOREIGN KEY (ma_nn) REFERENCES nguoi_nhan(ma_nn)
);

CREATE TABLE chi_tiet_don_hang (
  so_dh INT,
  ma_hang INT,
  so_luong INT NOT NULL,
  FOREIGN KEY (so_dh) REFERENCES don_dat_hang(so_dh),
  FOREIGN KEY (ma_hang) REFERENCES hang_hoa(ma_hang)
);

CREATE TABLE chi_tiet_giao_hang (
  so_pg INT,
  ma_hang INT,
  so_luong INT NOT NULL,
  don_gia DECIMAL(15,2) NOT NULL,
  FOREIGN KEY (so_pg) REFERENCES phieu_giao_hang(so_pg),
  FOREIGN KEY (ma_hang) REFERENCES hang_hoa(ma_hang)
);