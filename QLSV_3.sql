-- 1.Cho biết danh sách những sinh viên mà tên có chứa ký tự 
-- nằm trong khoảng từ a đến m, gồm các thông tin: 
-- Họ tên sinh viên, Ngày sinh, Nơi sinh. 
-- Danh sách được sắp xếp  tăng dần theo tên sinh viên.
SELECT *
FROM SINHVIEN
WHERE TenSV LIKE N'%[a-m]%'

-- 2.Liệt kê danh sách sinh viên, gồm các thông tin sau: 
-- Mã sinh viên, Họ sinh viên, Tên sinh viên, Học bổng. 
-- Danh sách sẽ được sắp xếp theo thứ tự Mã sinh viên tăng dần.
SELECT MaSV,HoSV,TenSV,HocBong
FROM SINHVIEN
ORDER BY MaSV DESC

-- 3.Cho biết những môn học có số tiết lớn hơn 30 và nhỏ hơn hoặc bằng 45, 
-- gồm các thông tin: Mã môn học, Tên môn học, Số tiết.
SELECT *
FROM MONHOC
WHERE SoTieT BETWEEN 31 AND 45

-- 4.Liệt kê những sinh viên nam của khoa Anh văn và khoa tin học, 
-- gồm các thông  tin: Mã sinh viên, Họ tên sinh viên, tên khoa, Phái.
SELECT MaSV,HoSV+' '+TenSV as 'Ho va Ten',TenKhoa,GioiTinh
FROM SINHVIEN,DMKHOA
WHERE SINHVIEN.MaKH=DMKHOA.MaKH
AND GioiTinh='Nam'

-- 5.Liệt kê những sinh viên có điểm thi môn sơ sở dữ liệu nhỏ hơn 5, 
-- gồm thông tin: Mã sinh viên, Họ tên, phái, điểm

SELECT SINHVIEN.MaSV,HoSV+' '+TenSV as 'Ho va Ten',GioiTinh,DIEM
FROM SINHVIEN
JOIN KETQUA on SINHVIEN.MaSV=KETQUA.MaSV
JOIN MONHOC on KETQUA.MaMH=MONHOC.MaMH
WHERE TenMH=N'Cơ sở Dữ liệu' AND DIEM<5

-- 6.Liệt kê những sinh viên học khoa Anh văn mà không có học bổng, 
-- gồm thông tin: Mã sinh viên, Họ và tên, tên khoa, Nơi sinh, Học bổng
SELECT MaSV,HoSV+' '+TenSV as 'Ho va Ten',TenKhoa,NoiSinh,HocBong
FROM SINHVIEN,DMKHOA
WHERE SINHVIEN.MaKH=DMKHOA.MaKH
AND TenKhoa=N'Anh Văn' AND HocBong is NULL

-- 7.Thông tin các sinh viên gồm: Họ tên sinh viên, Ngày sinh, Học bổng. 
-- Thông tin sẽ được sắp xếp theo thứ tự Ngày sinh tăng dần và Học bổng giảm dần.
SELECT HoSV+' '+TenSV as 'Ho va Ten',NgaySinh,HocBong
FROM SINHVIEN
ORDER BY NgaySinh ASC ,HocBong DESC

-- 8.Cho biết danh sách các sinh viên có học bổng lớn hơn 10,000, gồm các thông tin: 
-- Mã sinh viên, Họ tên sinh viên, Mã khoa, Học bổng. Danh sách sẽ được sắp xếp theo thứ tự Mã khoa giảm dần.
SELECT MaSV,HoSV+' '+TenSV as 'Ho va Ten',MaKH,HocBong
FROM SINHVIEN
ORDER BY MaKH DESC

-- 9.Danh sách sinh viên có nơi sinh ở Hà Nội và sinh vào tháng 02, 
-- gồm các thông tin: Họ sinh viên, Tên sinh viên, Nơi sinh, Ngày sinh.
SELECT HoSV+' '+TenSV as 'Ho va Ten',NoiSinh,NgaySinh
FROM SINHVIEN
WHERE NoiSinh=N'Hà Nội' AND MONTH(NgaySinh)=2

-- 10.Danh sách những sinh viên có tuổi từ 40 đến 45, thông tin gồm: Họ tên sinh viên, Tuổi
SELECT HoSV+' '+TenSV as 'Ho va Ten',YEAR(GETDATE())-YEAR(NgaySinh) AS Tuoi
FROM SINHVIEN
WHERE YEAR(GETDATE())-YEAR(NgaySinh) BETWEEN 40 AND 45

-- 11.Cho biết thông tin về mức học bổng của các sinh viên, 
-- gồm: Mã sinh viên, Phái, Mã khoa, Mức học bổng. 
-- Trong đó, mức học bổng sẽ hiển thị là “Học bổng cao” nếu giá trị của field học bổng lớn hơn 50,000 
-- và ngược lại hiển thị là “Mức trung bình”

SELECT MaSV, GioiTinh, MaKH,
CASE 
    WHEN HocBong > 50000 THEN N'Học bổng cao'
    ELSE N'Mức trung bình'
END AS MucHocBong
FROM SINHVIEN;


-- 12.Cho biết tổng số sinh viên của toàn trường
SELECT COUNT(MaSV) as 'Tong sinh vien toan truong'
FROM SINHVIEN

-- 13.Cho biết tổng sinh viên và tổng sinh viên nữ.
SELECT COUNT(MaSV) as 'Tong sinh vien toan truong',COUNT(GioiTinh)
FROM SINHVIEN
GROUP BY GioiTinh
HAVING GioiTinh=N'Nữ'

-- 14.Cho biết tổng số sinh viên của từng khoa.
SELECT  TenKhoa,COUNT(MaSV) AS 'Tong sinh vien tung khoa'
FROM SINHVIEN,DMKHOA
WHERE SINHVIEN.MaKH=DMKHOA.MaKH
GROUP BY TenKhoa, SINHVIEN.MaKH

-- 15.Cho biết số lượng sinh viên học từng môn.
SELECT MONHOC.TenMH,COUNT(SINHVIEN.MaSV) AS 'So luong sinh vien tung mon hoc'
FROM SINHVIEN
JOIN KETQUA on SINHVIEN.MaSV=KETQUA.MaSV
JOIN MONHOC on KETQUA.MaMH=MONHOC.MaMH
GROUP BY MONHOC.TenMH

-- 16.Cho biết số lượng môn học mà sinh viên đã học(tức tổng số môn học có trong bảng Kết quả)
SELECT HoSV+' '+TenSV as 'Ho va Ten',COUNT(MaMH) AS 'So luong mon sinh vien da hoc'
FROM SINHVIEN,KETQUA
WHERE SINHVIEN.MaSV=KETQUA.MaSV
GROUP BY HoSV,TenSV

-- 17.Cho biết tổng số học bổng của mỗi khoa.
SELECT DMKHOA.TenKhoa,COUNT(HocBong) AS 'Tong so hoc bong moi khoa'
FROM SINHVIEN,DMKHOA
WHERE SINHVIEN.MaKH=DMKHOA.MaKH
GROUP BY DMKHOA.TenKhoa

-- 18.Cho biết học bổng cao nhất của mỗi khoa.
SELECT DMKHOA.TenKhoa,MAX(HocBong) AS 'Hoc bong cao nhat'
FROM SINHVIEN,DMKHOA
WHERE SINHVIEN.MaKH=DMKHOA.MaKH
GROUP BY DMKHOA.TenKhoa

-- 19.Cho biết tổng số sinh viên nam và tổng số sinh viên nữ của mỗi khoa.
SELECT DMKHOA.TenKhoa,
    (SELECT COUNT(*)
    FROM SINHVIEN
    WHERE SINHVIEN.MaKH=DMKHOA.MaKH
    AND GioiTinh='Nam'
    ) AS 'tsSV nam',
    (SELECT COUNT(*)
    FROM SINHVIEN
    WHERE SINHVIEN.MaKH=DMKHOA.MaKH
    AND GioiTinh=N'Nữ'
    ) AS 'Tssv nu'
FROM DMKHOA

-- 20.Cho biết số lượng sinh viên theo từng độ tuổi.
SELECT YEAR(GETDATE())-YEAR(NgaySinh) AS 'Do tuoi' ,COUNT(MaSV) AS 'So luong Sinh Vien'
FROM SINHVIEN
GROUP BY YEAR(GETDATE())-YEAR(NgaySinh)

-- 21.Cho biết những năm sinh nào có >=2 sinh viên đang theo học tại trường.
SELECT YEAR(NgaySinh) AS NamSinh, COUNT(*) AS SoSinhVien
FROM SINHVIEN
GROUP BY YEAR(NgaySinh)
HAVING COUNT(*) >= 2

-- 22.Cho biết những nơi nào có hơn 2 sinh viên đang theo học tại trường.
SELECT NoiSinh, COUNT(*) AS SoSinhVien
FROM SINHVIEN
GROUP BY NoiSinh
HAVING COUNT(*) > 2

-- 23.Cho biết những môn nào có trên 3 sinh viên dự thi.
SELECT MaMH, COUNT(*) AS SoSinhVien
FROM KETQUA
GROUP BY MaMH
HAVING COUNT(*) > 3

-- 24.Cho biết những sinh viên thi lại 
SELECT *
FROM SINHVIEN
WHERE MaSV IN (
    SELECT MaSV FROM KETQUA WHERE DIEM < 5
)

-- 25.Cho biết danh sách các sinh viên rớt trên 2 môn ở lần thi 1.
SELECT MaSV, COUNT(*) AS SoMonRot
FROM KETQUA
WHERE DIEM < 5
GROUP BY MaSV
HAVING COUNT(*) > 2

-- 26.Cho biết danh sách những khoa có nhiều hơn 2 sinh viên nam
SELECT MaKH, COUNT(*) AS SoSinhVienNam
FROM SINHVIEN
WHERE GioiTinh = 'Nam'
GROUP BY MaKH
HAVING COUNT(*) >2

-- 27.Cho biết những khoa có 2 sinh đạt học bổng từ 120000 đến 140000.
SELECT MaKH, COUNT(*) AS SoSinhVien
FROM SINHVIEN
WHERE HocBong BETWEEN 120000 AND 140000
GROUP BY MaKH
HAVING COUNT(*) = 2

-- 28.Cho biết số lượng sinh viên đậu và số lượng sinh viên rớt của từng môn trong lần thi 1.
SELECT MaMH, 
SUM(CASE WHEN DIEM >= 5 THEN 1 ELSE 0 END) AS SoSinhVienDau, 
SUM(CASE WHEN DIEM < 5 THEN 1 ELSE 0 END) AS SoSinhVienRot
FROM KETQUA
GROUP BY MaMH

-- 29.Cho biết sinh viên nào có học bổng cao nhất. 
SELECT *
FROM SINHVIEN
WHERE HocBong = (
    SELECT MAX(HocBong) 
    FROM SINHVIEN
)

-- 30.Cho biết sinh viên nào có điểm thi lần 1 môn cơ sở dữ liệu cao nhất.
SELECT *
FROM SINHVIEN
WHERE MaSV = (
    SELECT MaSV 
    FROM KETQUA,MONHOC
    WHERE KETQUA.MaMH=MONHOC.MaMH
    AND TenMH=N'Cơ sở Dữ liệu'
    AND DIEM = (
        SELECT MAX(DIEM) 
        FROM KETQUA,MONHOC
        WHERE KETQUA.MaMH=MONHOC.MaMH
        AND TenMH=N'Cơ sở Dữ liệu'
    )
)

-- 31.Cho biết sinh viên khoa anh văn có tuổi lớn nhất.
SELECT *
FROM SINHVIEN,DMKHOA
WHERE SINHVIEN.MaKH=DMKHOA.MaKH
AND DMKHOA.TenKhoa=N'Anh Văn'
AND NgaySinh = (
    SELECT MIN(NgaySinh) 
    FROM SINHVIEN,DMKHOA
    WHERE SINHVIEN.MaKH=DMKHOA.MaKH
    AND DMKHOA.TenKhoa=N'Anh Văn'
)

-- 32.Cho biết khoa nào có đông sinh viên nhất.
SELECT DMKHOA.TenKhoa, COUNT(SINHVIEN.MaSV) AS SoSinhVien
FROM SINHVIEN,DMKHOA
WHERE SINHVIEN.MaKH=DMKHOA.MaKH
GROUP BY DMKHOA.TenKhoa
HAVING COUNT(SINHVIEN.MaSV) = (
    SELECT MAX(SoSV)
    FROM (
        SELECT COUNT(*) AS SoSV
        FROM SINHVIEN
        GROUP BY MaKH
    ) AS Temp
);

-- 33.Cho biết khoa nào có đông nữ nhất.
SELECT DMKHOA.TenKhoa, COUNT(SINHVIEN.MaSV) AS SoSinhVien
FROM SINHVIEN,DMKHOA
WHERE SINHVIEN.MaKH=DMKHOA.MaKH
GROUP BY DMKHOA.TenKhoa
HAVING COUNT(SINHVIEN.MaSV) = (
    SELECT MAX(SoSV)
    FROM (
        SELECT COUNT(*) AS SoSV
        FROM SINHVIEN
        WHERE GioiTinh=N'Nữ'
        GROUP BY MaKH
    ) AS Temp
);

-- 34.Cho biết sinh viên có nơi sinh cùng với Thuỷ.
SELECT *
FROM SINHVIEN
WHERE NoiSinh = (
    SELECT NoiSinh
    FROM SINHVIEN
    WHERE TenSV = N'Thủy'
);
