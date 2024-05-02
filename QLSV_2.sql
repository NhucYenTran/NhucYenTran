INSERT INTO DMKHOA
VALUES   
    (N'AV', N'Anh Văn'),
    (N'TH', N'Tin Học'),
    (N'TR', N'Triết Học'),
    (N'VL', N'Vật Lý')


INSERT INTO SINHVIEN
VALUES
    ('A01',N'NGuyễn Thị',N'Hải',N'Nữ','1977-02-23',N'Cần Thơ',N'12 B Võ Văn Tần','TH',10000),
    ('A02',N'Trần Văn',N'Chính','Nam','1997-12-24',N'Cần Thơ',N'34 Nguyễn Bỉnh Khiêm','TH',120000),
    ('A03',N'Lê Bạch',N'Yến',N'Nữ','1996-02-21',N'Hà Nội','&^% PastTeur','TH',140000),
    ('B01',N'Trần Thanh','Mai',N'Nữ','1977-08-12',N'Bến Tre',N'32 Lê Lai','TH',NULL),
    ('B02',N'Trần thu',N'Thủy',N'Nữ','1977-01-01',N'Cần Thơ',N'45 Nguyễn Thái Sơn','TH',NULL),
    ('B03',N'Lê Thị','Thanh',N'Nữ','1975-01-01',N'Cà Mau',N'345 Nguyễn Kiệm','AV',NULL),
    ('B04',N'Trần trọng','Kim','Nam','1977-12-20',N'Hậu Giang',N'123 Lê Văn Sỹ','AV',120000),
    ('C01',N'Tào hồng',N'Thiên','Nam','1978-07-01',N'Cần Thơ',N'56 Hoàng Diệu','TH',NULL),
    ('C02', N'Hòang minh', N'Châu', 'Nam', '1976-05-03', N'Hậu Giang', N'102 Kỳ Đồng', 'AV', NULL),
    ('C03', N'Phan quỳnh', N'Hương', N'Nữ', '1979-05-05', N'Hậu Giang', N'234 Phạm văn hai', 'AV', NULL);



INSERT INTO MONHOC 
VALUES
    ('01', N'Cơ sở Dữ liệu', 45),
    ('02', N'Trí tuệ Nhân tạo', 45),
    ('03', N'Xử lý ảnh', 45),
    ('04', N'Đồ họa máy tính', 60),
    ('05', N'Văn bản lưu trữ', 60),
    ('06', N'Tin học đại cương', 60)

INSERT INTO KETQUA(MaSV, MaMH, DIEM) 
VALUES
    ('A01', '01', 2),
    ('A01', '03', 7),
    ('A02', '01', 5),
    ('A02', '05', 9),
    ('A03', '01', 5),
    ('A03', '03', 3),
    ('B01', '03', 3),
    ('B01', '02', 6),
    ('B02', '04', 10),
    ('B02', '01', 7),
    ('B03', '03', 6),
    ('B04', '05', 3),
    ('B04', '06', 4);

