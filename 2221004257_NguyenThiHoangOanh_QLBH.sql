create database QuanlykhohangSunhouse
go
use QuanlykhohangSunhouse
create table BAOCAOKIEMKE (
   MAKIEMKE             nvarchar(50)          not null
   constraint PK_MaKIEMKE primary key ,
   MANV                 nvarchar(50)          not null,
   NGAYKIEMKE           datetime             not null,
 
)
create table CTPHIEUNHAP (
   MAPHIEUNHAP          nvarchar(50)          not null,
   MASP                 nvarchar(50)          not null,
   SOLUONGNHAP          int                  not null,
   GIANHAP              int                  not null,
   constraint PK_CTPHIEUNHAP primary key (MAPHIEUNHAP, MASP)
)
create table CTPHIEUXUAT (
   MAPHIEUXUAT          nvarchar(50)          not null,
   MASP                 nvarchar(50)          not null,
   SOLUONGXUAT          int                  not null,
   GIAXUAT              int                  not null,
   constraint PK_CTPHIEUXUAT primary key  (MAPHIEUXUAT, MASP)
)
create table KHOHANG (
   MAKHO                nvarchar(50)          not null
   constraint PK_MAKHO primary key,
   TENKHO               nvarchar(100)         not null,
   DIACHIKHO            nvarchar(100)         null,
   SDTLIENHE           nchar(10)              null,
  
)
create table LUUTRU (
   MAKHO                nvarchar(50)          not null,
   MASP                 nvarchar(50)          not null,
   constraint PK_LUUTRU primary key (MAKHO, MASP)
)
create table NHACUNGCAP (
   MANCC                nvarchar(50)          not null
   constraint PK_MANCC primary key,
   TENNCC               nvarchar(100)         not null,
   DIACHINCC            nvarchar(100)         null,
   EMAILNCC             nvarchar(100)         null,
   SDTNCC               nchar(10)              null,
  
)
create table NHANVIENKHO (
   MANV                nvarchar(50)          not null
   constraint PK_MANVKHO primary key,
   MAKHO                nvarchar(50)          not null,
   HOTENNV              nvarchar(100)         not null,
   NGAYSINHNV           datetime             null,
   GIOITINHNVK				nvarchar(20) check (GIOITINHNVK in (N'Nam',N'N??',N'Kha?c')),
   EMAILNV              nvarchar(50)          null,
   DIACHINV             nvarchar(100)         null,
   MANQL                nvarchar(50)          not null,
   MATKHAUNVK			varchar(50)			not null
   
)

create table KHACHHANG (
   MAKH             nvarchar(50)          not null
   constraint PK_MAKH primary key,
   HOTENKH           nvarchar(100)         not null,
   NGAYSINHKH        datetime             null,
   GIOITINHKH			nvarchar(20) check (GIOITINHKH in (N'Nam',N'N??',N'Kha?c')),
   SDTKH              nchar(10)             not  null,
   EMAILKH            nvarchar(50)          null,
   DIACHIKH           nvarchar(100)         null,
   MATKHAUKH			varchar(50)			not null
 
  
)
alter table KHACHHANG alter column MATKHAUKH varchar(50) null

create table PHIEUNHAPKHO (
   MAPHIEUNHAP          nvarchar(50)          not null
     constraint PK_MAPHIEUNHAP primary key,
   MANV                 nvarchar(50)          not null,
   MANCC                nvarchar(50)          null,
   NGAYNHAP             datetime             not null,
   GHICHUSPN            nvarchar(100)         null,
  
)

create table PHIEUXUATKHO (
   MAPHIEUXUAT          nvarchar(50)          not null
   constraint PK_MAPHIEUXUAT primary key,
   MANV                 nvarchar(50)          not null,
   MANVKD               nvarchar(50)          not null,
   NGAYXUAT             datetime             not null,
   GHICHUSPX            nvarchar(100)         null,

) 
alter table PHIEUXUATKHO  add   MAKH nvarchar(50) 
alter table PHIEUXUATKHO drop MANVKD
create table SANPHAM (
   MASP                 nvarchar(50)          not null
    constraint PK_MASP primary key,
   TENSP                nvarchar(100)         not null,
   DONVITINH            nvarchar(50)          not null,
   MALOAISP				nvarchar(50)		not null,
   GHICHU               nvarchar(100)         null,
   
)

create table THUOC (
   MAKIEMKE             nvarchar(50)          not null,
   MASP                 nvarchar(50)          not null,
   constraint PK_THUOC primary key  (MAKIEMKE, MASP)
)

create table LOAISP
(
	MALOAISP nvarchar(50) not null
	constraint PK_MALOAISP primary key,
	TENLOAISP nvarchar(100) not null

)
create table TAIKHOAN
(
	TENTK nvarchar(50) not null
	constraint PK_TENTK primary key,
	MATKHAU varchar(50) not null
)
alter table BAOCAOKIEMKE
   add constraint FK_BBKK_MANV foreign key (MANV)
      references NHANVIENKHO (MANV)
go

alter table CTPHIEUNHAP
   add constraint FK_CTPN_MASP foreign key (MASP)
      references SANPHAM (MASP)
go

alter table CTPHIEUNHAP
   add constraint FK_MACTPN foreign key (MAPHIEUNHAP)
      references PHIEUNHAPKHO (MAPHIEUNHAP)
go

alter table CTPHIEUXUAT
   add constraint FK_CTPX_MASP foreign key (MASP)
      references SANPHAM (MASP)
go

alter table CTPHIEUXUAT
   add constraint FK_MAPHIEUXUAT foreign key (MAPHIEUXUAT)
      references PHIEUXUATKHO (MAPHIEUXUAT)
go

alter table LUUTRU
   add constraint FK_MASPHAM foreign key (MASP)
      references SANPHAM (MASP)
go

alter table LUUTRU
   add constraint FK_MAKHO foreign key (MAKHO)
      references KHOHANG (MAKHO)
go

alter table NHANVIENKHO
   add constraint FK_MANVK foreign key (MAKHO)
      references KHOHANG (MAKHO)
go

alter table PHIEUNHAPKHO
   add constraint FK_MANVKHO foreign key (MANV)
      references NHANVIENKHO (MANV)
go

alter table PHIEUNHAPKHO
   add constraint FK_MaNCC foreign key (MANCC)
      references NHACUNGCAP (MANCC)
go

alter table PHIEUXUATKHO
   add constraint FK_MANHANVIEN foreign key (MANV)
      references NHANVIENKHO (MANV)
go

alter table PHIEUXUATKHO
   add constraint FK_MAKH foreign key (MAKH)
      references KHACHHANG (MAKH)
go
		

alter table THUOC
   add constraint FK_MASANPHAM foreign key (MASP)
      references SANPHAM (MASP)
go

alter table THUOC
   add constraint FK_MKK foreign key (MAKIEMKE)
      references BAOCAOKIEMKE (MAKIEMKE)
go
Alter table SANPHAM
	add constraint FK_MALOAISANPHAM foreign key(MALOAISP) references LOAISP(MALOAISP)
go
insert into KHOHANG
values ('KH001',N'Kho Ha?ng HCM',N'Hô? Chi? Minh','0765781234'),
		('KH002',N'Kho Ha?ng HN',N'Ha? Nô?i','0657234218'),
		('KH003',N'Kho Ha?ng HP',N'Ha?i Pho?ng','0678723145');

iNSERT INTO KHACHHANG
    VALUES ('KH001', N'Vu? Tha?o My', '2001-09-09',N'N??' ,'0789236781', N'thaomy@gmail.com', N'Quâ?n 2,TP. Hô? Chi? Minh',N'1234'),
			('KH002', N'???ng Tiê?n Khôi', '1997-01-10',N'Nam', '0823789234', N'tienkhoi@gmail.com', N'Thu? ???c,TP. Hô? Chi? Minh','2345'),
			('KH003', N'Nguyê?n Thu?y An', '1999-05-15',N'N??', '0876123902', N'thuyan@gmail.com', N'Quâ?n 1,TP. Hô? Chi? Minh','3451'),
			('KH004', N'Hoa?ng V?n Tro?ng', '2000-12-25',N'Nam', '0267912672', N'vantrong@gmail.com', N'Quâ?n Bi?nh Tân,TP. Hô? Chi? Minh','3421'),
			('KH005', N'???ng Anh Khoa', '1990-01-30',N'Nam', '0926720127', N'anhkhoa@gmail.com', N'Tha?o ?iê?n, Quâ?n 2,TP. Hô? Chi? Minh','0956'),
			('KH006', N'Tr??ng Tha?o Nhi', '1998-03-05',N'N??', '0297410251', N'thaonhi@gmail.com', N'Quâ?n 10,TP. Hô? Chi? Minh','3255'),
			('KH007', N'Nguyê?n Quy?nh Nh?', '2002-10-10',N'N??', '0926110241', N'quynhnhu@gmail.com', N'Quâ?n 5,TP. Hô? Chi? Minh','8768'),
			('KH008', N'Nguyê?n Anh Du?ng', '1990-06-12',N'Nam', '0789654678', N'anhdung@gmail.com', N'Quâ?n 6,TP. Hô? chi? Minh','3456');

insert into NHANVIENKHO
values ('NV001','KH002',N'Nguyê?n Thi? Hoa?ng Oanh','2004-01-10',N'N??','hoangoanh@gmail.com',N'Lê V?n Viê?t, Quâ?n 9','QL010','9876'),
		('NV002','KH003',N'Vu? Hoa?ng Oanh','2001-05-20',N'N??','vuoanh@gmail.com',N'Nguyê?n Huê?, Quâ?n 1','','4532'),
		('NV003','KH002',N'Nguyê?n Thi? My? Linh','1999-08-07',N'N??','mylinh@gmail.com',N'?inh Tiên Hoa?ng, Bi?nh Tha?nh','','6754'),
		('NV004','KH001',N'Nguyê?n Hoa?ng Ngo?c Anh','2004-05-10',N'N??','hoanganh@gmail.com',N'Vo? V?n Ngân, Thu? ???c','','9012'),
		('NV005','KH003',N'Nguyê?n Anh Du?ng','2002-10-10',N'Nam','anhdung@gmail.com',N'Lê V?n Viê?t, Quâ?n 9','','1952'),
		('NV006','KH002',N'Nguyê?n Trung Kiên','2002-07-02',N'Nam','trungkien@gmail.com',N'Ca?ch Ma?ng Tha?ng 8, Tân Bi?nh','','5117');

insert into BAOCAOKIEMKE
values ('MKK001','NV001','2024-10-01'),
		('MKK002','NV002','2024-12-10'),
		('MKK003','NV003','2024-01-23'),
		('MKK004','NV004','2024-11-20'),
		('MKK005','NV005','2024-01-05'),
		('MKK006','NV006','2024-06-01'),
		('MKK007','NV005','2024-01-20'),
		('MKK008','NV001','2024-05-29');


insert into NHACUNGCAP
values ('NCC001',N'NCC Thi?nh Pha?t','Quâ?n 1, HCM','thinhphat@gmail.com','0989234218'),
		('NCC002',N'NCC Tha?nh ?a?t','Quâ?n 9, HCM','thanhdat@gmail.com','0672386365'),
		('NCC003',N'NCC Thi?nh V???ng','Ha? Nô?i','thinhvuong@gmail.com','0276538921');

insert into PHIEUNHAPKHO
values ('PN001','NV001','NCC001','2024-05-01',''),
		('PN002','NV004','NCC002','2024-06-10',''),
		('PN003','NV003','NCC001','2024-05-20',''),
		('PN004','NV006','NCC003','2024-07-09',''),
		('PN005','NV002','NCC002','2024-04-10',''),
		('PN006','NV005','NCC002','2023-04-14',''),
		('PN007','NV002','NCC001','2023-05-20',''),
		('PN008','NV001','NCC003','2023-07-03',''),
		('PN009','NV006','NCC001','2024-01-30',''),
		('PN010','NV003','NCC001','2023-02-27',''),
		('PN011','NV005','NCC002','2024-03-19',''),
		('PN012','NV005','NCC003','2022-11-15','');

insert into PHIEUXUATKHO
values 
		('Px001','NV001','2024-05-30','','KH001'),
		('Px002','NV002','2024-06-20','','KH002'),
		('Px003','NV005','2024-05-20','','KH001'),
		('Px004','NV006','2024-03-09','','KH003'),
		('Px005','NV003','2024-01-10','','KH001'),
		('Px006','NV003','2023-07-01','','KH003'),
		('Px007','NV002','2023-10-20','','KH002'),
		('Px008','NV001','2022-04-15','','KH003'),
		('Px009','NV004','2024-01-20','','KH001');

INSERT INTO LOAISP
values (N'L001',N'?ô? gia du?ng'),
		(N'L002',N'Thiê?t bi? nha? bê?p'),
		(N'L003',N'?iê?n dân du?ng'),
		(N'L004',N'?iê?n t?? ?iê?n la?nh')

INSERT INTO SANPHAM
values ('SP001',N'Bô? nô?i cha?o','Cai',N'L001',''),
('SP002',N'Bô? nô?i inox','Cai',N'L001',''),
('SP003',N'Nô?i a?p suâ?t','Cai',N'L001',''),
('SP004',N'Hô?p th??c phâ?m','Cai',N'L001',''),
('SP005',N'Â?m ?un n???c','Cai',N'L001',''),
('SP006',N'Bê?p ?ôi ?iê?n t??','Cai',N'L002',''),
('SP007',N'Bê?p ?ôi hô?ng ngoa?i','Cai',N'L002',''),
('SP008',N'Ma?y hu?t mu?i','Cai',N'L002',''),
('SP009',N'Bê?p gas','Cai',N'L002',''),
('SP010',N'?e?n ti?ch ?iê?n','Cai',N'L003',''),
('SP011',N'?e?n pin','Cai',N'L003',''),
('SP012',N'Ô? c??m ?iê?n','Cai',N'L003',''),
('SP013',N'Bi?nh n???c no?ng','Cai',N'L004',''),
('SP014',N'Ma?y lo?c n???c','Cai',N'L004',''),
('SP015',N'?iê?u ho?a không khi?','Cai',N'L004',''),
('SP016',N'Tu? ma?t','Cai',N'L004',''),
('SP017',N'Tu? la?nh','Cai',N'L004','');

insert into CTPHIEUNHAP
values ('PN001','SP001','1000','700000'),
		('PN002','SP002','1500','550000'),
		('PN003','SP005','2000','350000'),
		('PN004','SP010','900','270000'),
		('PN005','SP012','500','90000'),
		('PN006','SP006','10','9000000'),
		('PN007','SP017','50','15000000'),
		('PN008','SP011','500','150000'),
		('PN009','SP003','700','900000'),
		('PN010','SP012','350','90000'),
		('PN011','SP009','100','700000'),
		('PN012','SP011','250','150000');



insert into CTPHIEUXUAT
values ('Px001','SP001','1000','700000'),
		('Px002','SP002','1500','650000'),
		('Px003','SP009','2000','900000'),
		('Px004','SP007','900','500000'),
		('Px005','SP005','500','600000'),
		('Px006','SP012','500','130000'),
		('Px007','SP017','500','18000000'),
		('Px008','SP010','500','400000'),
		('Px009','SP011','500','370000');
		
insert into TAIKHOAN
values (N'Admin',N'admin') 

insert into LUUTRU
values('KH001','SP001'),
		('KH001','SP002'),
		('KH002','SP003'),
		('KH003','SP004'),
		('KH002','SP005'),
		('KH003','SP006'),
		('KH001','SP007'),
		('KH001','SP008'),
		('KH002','SP009'),
		('KH002','SP010'),
		('KH001','SP011'),
		('KH003','SP012'),
		('KH002','SP013'),
		('KH001','SP014'),
		('KH003','SP015'),
		('KH002','SP016'),
		('KH002','SP017');

create proc SelectAllSanPham
as
select SANPHAM.MASP,TENSP, DONVITINH,MALOAISP,GHICHU, isNULL((SOLUONGNHAP-SOLUONGXUAT),0) as N'SÔ? L???NG TÔ?N KHO'
from SANPHAM left join CTPHIEUNHAP on SANPHAM.MASP=CTPHIEUNHAP.MASP left  join CTPHIEUXUAT on SANPHAM.MASP=CTPHIEUXUAT.MASP

exec SelectAllSanPham

create proc dangnhap
@loaitaikhoan varchar(50),
@taikhoan varchar(50),
@matkhau varchar(50)
as
begin
if @loaitaikhoan='Admin' 
			select*
			from TAIKHOAN
			where TENTK= @taikhoan
				and MATKHAU=@matkhau
	else if @loaitaikhoan =N'Nhân viên kho' 
	select*
	from NHANVIENKHO
	where CONVERT(varchar(50),MANV)=@taikhoan
	and MATKHAUNVK=@matkhau;
else select*
from NHANVIENKINHDOANH
where MANVKD=@taikhoan
and MATKHAUNVKD=@matkhau;

end

exec dangnhap N'Nhân viên kho','NV001','9876'


create proc Danhmucdogiadung @tukhoa nvarchar(50)
as
select SANPHAM.MASP,TENSP,DONVITINH,GHICHU, LUUTRU.MAKHO, TENKHO, DIACHIKHO,SDTLIENHE
from SANPHAM join LUUTRU on SANPHAM.MASP=LUUTRU.MASP join KHOHANG on KHOHANG.MAKHO =LUUTRU.MAKHO
where SANPHAM.MALOAISP = N'L001' and 
(LOWER(SANPHAM.MASP) like '%'+LOWER(trim(@tukhoa))+'%'
or LOWER(TENSP) like '%'+LOWER(trim(@tukhoa))+'%')

exec  Danhmucdogiadung N'nô?i'


create proc Danhmucthietbinhabep @tukhoa nvarchar(50)
as
select SANPHAM.MASP,TENSP,DONVITINH,GHICHU, LUUTRU.MAKHO, TENKHO, DIACHIKHO,SDTLIENHE
from SANPHAM join LUUTRU on SANPHAM.MASP=LUUTRU.MASP join KHOHANG on KHOHANG.MAKHO =LUUTRU.MAKHO
where SANPHAM.MALOAISP = N'L002' and 
(LOWER(SANPHAM.MASP) like '%'+LOWER(trim(@tukhoa))+'%'
or LOWER(TENSP) like '%'+LOWER(trim(@tukhoa))+'%')

exec  Danhmucthietbinhabep N'bê?p'


create proc Danhmucdiendandung @tukhoa nvarchar(50)
as
select SANPHAM.MASP,TENSP,DONVITINH,GHICHU, LUUTRU.MAKHO, TENKHO, DIACHIKHO,SDTLIENHE
from SANPHAM join LUUTRU on SANPHAM.MASP=LUUTRU.MASP join KHOHANG on KHOHANG.MAKHO =LUUTRU.MAKHO
where SANPHAM.MALOAISP = N'L003' and 
(LOWER(SANPHAM.MASP) like '%'+LOWER(trim(@tukhoa))+'%'
or LOWER(TENSP) like '%'+LOWER(trim(@tukhoa))+'%')

exec Danhmucdiendandung N'ô?'

create proc Danhmucdientulanh @tukhoa nvarchar(50)
as
select SANPHAM.MASP,TENSP,DONVITINH,GHICHU, LUUTRU.MAKHO, TENKHO, DIACHIKHO,SDTLIENHE
from SANPHAM join LUUTRU on SANPHAM.MASP=LUUTRU.MASP join KHOHANG on KHOHANG.MAKHO =LUUTRU.MAKHO
where SANPHAM.MALOAISP = N'L004' and 
(LOWER(SANPHAM.MASP) like '%'+LOWER(trim(@tukhoa))+'%'
or LOWER(TENSP) like '%'+LOWER(trim(@tukhoa))+'%')

exec Danhmucdientulanh N'Ma?y'

create or alter proc Quanlysanpham 
as

SELECT 
        SANPHAM.MASP, 
        SANPHAM.TENSP, 
        SANPHAM.DONVITINH,
        SANPHAM.GHICHU,
		LOAISP.MALOAISP,
		TENLOAISP
    FROM SANPHAM join LOAISP ON SANPHAM.MALOAISP=LOAISP.MALOAISP
    
  exec  Quanlysanpham



create or alter proc Quanlynhanvien
as
SELECT MANV,MAKHO,HOTENNV,NGAYSINHNV,GIOITINHNVK,EMAILNV, DIACHINV From NHANVIENKHO

exec Quanlysanpham 

create or alter proc timkiemhoadon
as
select PHIEUXUATKHO.MAPHIEUXUAT,month(NGAYXUAT) as Thang,year(NGAYXUAT)as nam, NHANVIENKHO.MANV,KHACHHANG.MAKH,(SOLUONGXUAT*GIAXUAT) as N'Tô?ng Tiê?n'
from PHIEUXUATKHO join NHANVIENKHO on PHIEUXUATKHO.MANV=NHANVIENKHO.MANV join KHACHHANG on KHACHHANG.MAKH=PHIEUXUATKHO.MAKH JOIN CTPHIEUXUAT ON
CTPHIEUXUAT.MAPHIEUXUAT=PHIEUXUATKHO.MAPHIEUXUAT
exec timkiemhoadon

alter table CTPHIEUXUAT Alter column SOLUONGXUAT BIGINT
alter table CTPHIEUXUAT Alter column GIAXUAT BIGINT

CREATE OR ALTER PROCEDURE thongtinnhapsp
AS
BEGIN
    SELECT 
        PN.MAPHIEUNHAP,
        PN.NGAYNHAP,
        PN.MANV,
        PN.MANCC,
        CTPN.MASP,
        CTPN.SOLUONGNHAP,
        CTPN.GIANHAP,
		 PN.GHICHUSPN
    FROM 
        PHIEUNHAPKHO AS PN
    INNER JOIN 
        CTPHIEUNHAP AS CTPN ON PN.MAPHIEUNHAP = CTPN.MAPHIEUNHAP;
		END;
GO



CREATE OR ALTER PROCEDURE LocPhieuNhapTheoNgay
    @TuNgay DATE,
    @DenNgay DATE
AS
BEGIN
    SELECT 
        PN.MAPHIEUNHAP,
        PN.NGAYNHAP,
        PN.MANV,
        PN.MANCC,
        CTPN.MASP,
        CTPN.SOLUONGNHAP,
        CTPN.GIANHAP,
        PN.GHICHUSPN
    FROM 
        PHIEUNHAPKHO PN
    INNER JOIN 
        CTPHIEUNHAP CTPN ON PN.MAPHIEUNHAP = CTPN.MAPHIEUNHAP
    WHERE 
        PN.NGAYNHAP BETWEEN @TuNgay AND @DenNgay;
END


CREATE OR ALTER PROCEDURE thongtinxuatsp
AS
BEGIN
    SELECT 
        pxk.MAPHIEUXUAT,
		  pxk.MANV,
		pxk.MAKH,
        pxk.NGAYXUAT,
		pxk.GHICHUSPX,
        ctx.MASP,
        ctx.SOLUONGXUAT,
        ctx.GIAXUAT
    FROM PHIEUXUATKHO pxk
    JOIN CTPHIEUXUAT ctx ON pxk.MAPHIEUXUAT = ctx.MAPHIEUXUAT
END
GO


CREATE OR ALTER PROCEDURE sp_TonKho
    @TuKhoa NVARCHAR(100)
AS
BEGIN
    SELECT 
        sp.MaSP,
        sp.TenSP,
        ISNULL(NHAP.TongNhap, 0) AS SoLuongNhap,
        ISNULL(XUAT.TongXuat, 0) AS SoLuongXuat,
        ISNULL(NHAP.TongNhap, 0) - ISNULL(XUAT.TongXuat, 0) AS TonKho
    FROM SANPHAM sp
    LEFT JOIN (
        SELECT MaSP, SUM(SOLUONGNHAP) AS TongNhap
        FROM PHIEUNHAPKHO pn
        JOIN  CTPHIEUNHAP ct ON pn.MAPHIEUNHAP = ct.MAPHIEUNHAP
        GROUP BY MaSP
    ) NHAP ON sp.MaSP = NHAP.MaSP
    LEFT JOIN (
        SELECT MaSP, SUM(SOLUONGXUAT) AS TongXuat
        FROM PHIEUXUATKHO px
        JOIN CTPHIEUXUAT ct ON px.MAPHIEUXUAT = ct.MAPHIEUXUAT
        GROUP BY MaSP
    ) XUAT ON sp.MaSP = XUAT.MaSP
    WHERE sp.TenSP LIKE N'%' + @TuKhoa + '%' OR sp.MaSP LIKE N'%' + @TuKhoa + '%'

END

EXEC sp_TonKho @TuKhoa = 'SP01'