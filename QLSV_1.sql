CREATE DATABASE QLSV

CREATE TABLE DMKHOA(
    MaKH NVARCHAR(6) PRIMARY KEY,
    TenKhoa NVARCHAR(30)

)

CREATE TABLE SINHVIEN(
    MaSV NVARCHAR(6)  PRIMARY KEY,
    HoSV NVARCHAR(30),
    TenSV NVARCHAR(15),
    GioiTinh NVARCHAR(3),
    NgaySinh DATE,
    NoiSinh NVARCHAR(50),
    DiaChi NVARCHAR(50),
    MaKH NVARCHAR(6),
    FOREIGN KEY (MaKH) REFERENCES DMKHOA(MaKH),
    HocBong INT

)

CREATE TABLE MONHOC(
    MaMH NVARCHAR(6) PRIMARY KEY
    TenMH NVARCHAR(50),
    SoTiet INT
)

CREATE TABLE KETQUA(
    MaSV NVARCHAR(6),
    FOREIGN KEY (MaSV) REFERENCES SINHVIEN(MaSV),
    MaMH NVARCHAR(6),
    FOREIGN KEY (MaMH) REFERENCES MONHOC(MaMH),
    DIEM INT

)

DROP TABLE KETQUA,MONHOC,SINHVIEN,DMKHOA