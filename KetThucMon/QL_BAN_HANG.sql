CREATE DATABASE QL_BAN_HANG

USE QL_BAN_HANG
set dateformat dmy

CREATE TABLE ADMIN(
	[id] [int] NOT NULL IDENTITY(1,1) PRIMARY KEY,
	[username] [varchar](16) NOT NULL UNIQUE,
	[password] [varchar](28) NOT NULL
)

CREATE TABLE KHACH_HANG(
	[Mkh] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[Ho_ten] [nvarchar](50) NOT NULL,
	[Dia_chi] [nvarchar](50) NULL,
	[Dien_thoai] [nvarchar](10) NULL,
	[Ten_dang_nhap] [nvarchar](15) NOT NULL,
	[Mat_khau] [nvarchar](15) NOT NULL,
	[Ngay_sinh] [datetime] NULL,
	[Gioi_tinh] [bit] NOT NULL,
	[Email] [nvarchar](50) NULL,
)
CREATE TABLE DANH_MUC(
	[Madm] [varchar](10) NOT NULL PRIMARY KEY,
	[Tendm] [nvarchar](50) NOT NULL UNIQUE,
	[Danhmuccha] [varchar](10) NOT NULL,
)

CREATE TABLE SAN_PHAM(
	[Madm] [varchar](10) NOT NULL,
	[Masp] [varchar](10) NOT NULL PRIMARY KEY,
	[Tensp] [nvarchar](50) NOT NULL UNIQUE,
	[Tonkho] [int] NOT NULL default 0,
	[Giatien] [int] NOT NULL default 0,
	[Mota] [nvarchar](200),
	[Giamgia] [real] default 0,
	[Anhhienthi] [varchar](200) NOT NULL,
	[Danhsachanh] [varchar](1000) NOT NULL,
	FOREIGN KEY ([Madm]) REFERENCES DANH_MUC([Madm])

)

SELECT * FROM SAN_PHAM SP INNER JOIN DANH_MUC DM ON SP.Madm = DM.Madm
CREATE TABLE DON_HANG(
	[Mdh] [INT] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[Ngaytao] [datetime] NOT NULL,
	[Giatien] [INT] NOT NULL,
	[Soluong] [INT] NOT NULL DEFAULT 0,
	[Mkh] [int] NOT NULL,
	[Masp] [varchar](10) NOT NULL,
	FOREIGN KEY ([Mkh]) REFERENCES KHACH_HANG([Mkh]),
	FOREIGN KEY ([Masp]) REFERENCES SAN_PHAM([Masp])

)

select * from DANH_MUC

INSERT INTO DANH_MUC VALUES('BACK_PACK',N'Ba lô','BACK_PACK')
INSERT INTO DANH_MUC VALUES('SHIRT',N'Áo','SHIRT')
INSERT INTO DANH_MUC VALUES('TSHIRT',N'Áo thun tay ngắn','SHIRT')
INSERT INTO DANH_MUC VALUES('HOODIE',N'Áo Hoodie','SHIRT')

INSERT INTO DANH_MUC VALUES('TROUSER',N'Quần','TROUSER')
INSERT INTO DANH_MUC VALUES('PANTS',N'Quần dài','TROUSER')
INSERT INTO DANH_MUC VALUES('SHORTS',N'Quần short','TROUSER')

INSERT INTO DANH_MUC VALUES('SHOES',N'Giày','SHOES')

INSERT INTO SAN_PHAM VALUES('BACK_PACK','DG-01',N'GOLDEN ROCKET BACKPACKS - GRB',119,450000,N'',0,'Products/Backpack/DG-Golden-1.webp','Products/Backpack/DG-Golden-1.webp,Products/Backpack/DG-Golden-2.webp,Products/Backpack/DG-Golden-3.webp,Products/Backpack/DG-Golden-4.webp')

INSERT INTO SAN_PHAM VALUES('BACK_PACK','DG-02',N'Degrey Backpack ss3 Hologram',69,650000,N'',0,'Products/Backpack/DG-holo-1.webp','Products/Backpack/DG-holo-1.webp,Products/Backpack/DG-holo-2.webp,Products/Backpack/DG-holo-3.webp,Products/Backpack/DG-holo-4.webp')

INSERT INTO SAN_PHAM VALUES('BACK_PACK','DG-03',N'Degrey BackPack ss3',73,450000,N'',0,'Products/Backpack/DG-vang-1.webp','Products/Backpack/DG-vang-1.webp,Products/Backpack/DG-vang-2.webp,Products/Backpack/DG-vang-3.webp,Products/Backpack/DG-vang-4.webp')

INSERT INTO SAN_PHAM VALUES('BACK_PACK','DG-04',N'XOÀI CHUA BACKPACKS',80,690000,N'',0,'Products/Backpack/DG-Xoai-Chua-1.webp','Products/Backpack/DG-Xoai-Chua-1.webp,Products/Backpack/DG-Xoai-Chua-2.webp,Products/Backpack/DG-Xoai-Chua-3.webp,Products/Backpack/DG-Xoai-Chua-4.webp')

INSERT INTO SAN_PHAM VALUES('BACK_PACK','BHBP-01',N'Candy Land Backpack',88,600000,N'',0,'Products/Backpack/Candy-land.webp','Products/Backpack/Candy-land.webp,Products/Backpack/Candy-land-2.jpg,Products/Backpack/Candy-land-3.jpg,Products/Backpack/Candy-land-4.jpg')

INSERT INTO SAN_PHAM VALUES('BACK_PACK','BHBP-02',N'DANGER BACKPACK',48,500000,N'',0,'Products/Backpack/Danger.webp','Products/Backpack/Danger.webp,Products/Backpack/Danger-2.webp,Products/Backpack/Danger-3.webp,Products/Backpack/Danger-4.webp')

INSERT INTO SAN_PHAM VALUES('BACK_PACK','BHBP-03',N'BW Backpack',120,550000,N'',0,'Products/Backpack/dau-lau-trang-den.webp','Products/Backpack/dau-lau-trang-den.webp,Products/Backpack/dau-lau-trang-den-2.webp,Products/Backpack/dau-lau-trang-den-3.webp,Products/Backpack/dau-lau-trang-den-4.webp')

INSERT INTO SAN_PHAM VALUES('BACK_PACK','BHBP-04',N'Fire V2 Backpack',86,450000,N'',0,'Products/Backpack/fire.webp','Products/Backpack/fire.webp,Products/Backpack/fire-2.webp,Products/Backpack/fire-3.webp,Products/Backpack/fire-4.webp')

INSERT INTO SAN_PHAM VALUES('BACK_PACK','BHBP-05',N'INSIGHT BACKPACK',120,500000,N'',0,'Products/Backpack/insight.webp','Products/Backpack/insight.webp,Products/Backpack/insight-2.webp,Products/Backpack/insigh-3.webp,Products/Backpack/insight-4.webp')

INSERT INTO SAN_PHAM VALUES('BACK_PACK','BHBP-06',N'Hungry Backpack',112,550000,N'',0,'Products/Backpack/hungry.webp','Products/Backpack/hungry.webp,Products/Backpack/hungry-2.jpeg,Products/Backpack/hungry-3.jpeg,Products/Backpack/hungry-4.webp')

INSERT INTO SAN_PHAM VALUES('HOODIE','BHHD-01',N'BAD DRUG HOODIE',55,510000,N'',0,'Products/Clothes/Hoodie/bad-drug-1.webp','Products/Clothes/Hoodie/bad-drug-1.webp,Products/Clothes/Hoodie/bad-drug-2.webp,Products/Clothes/Hoodie/bad-drug-3.webp,Products/Clothes/Hoodie/bad-drug-4.webp')        

INSERT INTO SAN_PHAM VALUES('HOODIE','BHHD-02',N'BAD HUMAN HOODIE',42,510000,N'',0,'Products/Clothes/Hoodie/bad-human-1.webp','Products/Clothes/Hoodie/bad-human-1.webp,Products/Clothes/Hoodie/bad-human-2.webp,Products/Clothes/Hoodie/bad-human-3.webp,Products/Clothes/Hoodie/bad-human-4.webp')  

INSERT INTO SAN_PHAM VALUES('HOODIE','BHHD-03',N'MULTI COLOUR HOODIE',67,510000,N'',0,'Products/Clothes/Hoodie/multi-colour-1.webp','Products/Clothes/Hoodie/multi-colour-1.webp,Products/Clothes/Hoodie/multi-colour-2.webp,Products/Clothes/Hoodie/multi-colour-3.webp,Products/Clothes/Hoodie/multi-colour-4.webp')

INSERT INTO SAN_PHAM VALUES('HOODIE','BHHD-04',N'RABBIT CLOUDY HOODIE',60,510000,N'',0,'Products/Clothes/Hoodie/rabbit-cloudy-1.webp','Products/Clothes/Hoodie/rabbit-cloudy-1.webp,Products/Clothes/Hoodie/rabbit-cloudy-2.webp,Products/Clothes/Hoodie/rabbit-cloudy-3.webp,Products/Clothes/Hoodie/rabbit-cloudy-4.webp')

INSERT INTO SAN_PHAM VALUES('HOODIE','BHHD-05',N'RABBIT GOD HOODIE',95,510000,N'',0,'Products/Clothes/Hoodie/rabbit-god-1.webp','Products/Clothes/Hoodie/rabbit-god-1.webp,Products/Clothes/Hoodie/rabbit-god-2.webp,Products/Clothes/Hoodie/rabbit-god-3.webp,Products/Clothes/Hoodie/rabbit-god-4.jpg')

INSERT INTO SAN_PHAM VALUES('HOODIE','BHHD-06',N'TRIPPY COLOUR HOODIE',47,510000,N'',0,'Products/Clothes/Hoodie/trippy-colour-1.webp','Products/Clothes/Hoodie/trippy-colour-1.webp,Products/Clothes/Hoodie/trippy-colour-2.webp,Products/Clothes/Hoodie/trippy-colour-3.webp,Products/Clothes/Hoodie/trippy-colour-4.webp')

INSERT INTO SAN_PHAM VALUES('HOODIE','DGHD-01',N'DEGREY ROCKET HOODIE',33,510000,N'',0,'Products/Clothes/Hoodie/degrey-rocket-1.webp','Products/Clothes/Hoodie/degrey-rocket-1.webp,Products/Clothes/Hoodie/degrey-rocket-2.webp,Products/Clothes/Hoodie/degrey-rocket-3.webp,Products/Clothes/Hoodie/degrey-rocket-4.webp')

INSERT INTO SAN_PHAM VALUES('HOODIE','DGHD-02',N'DEGREY ROCKET ZIP DEN HOODIE',55,510000,N'',0,'Products/Clothes/Hoodie/degrey-rocket-den-1.webp','Products/Clothes/Hoodie/degrey-rocket-den-1.webp,Products/Clothes/Hoodie/degrey-rocket-den-2.webp,Products/Clothes/Hoodie/degrey-rocket-den-3.webp,Products/Clothes/Hoodie/degrey-rocket-den-4.webp')

INSERT INTO SAN_PHAM VALUES('HOODIE','DGHD-03',N'FAVORHOOD',71,510000,N'',0,'Products/Clothes/Hoodie/favorhood-1.webp','Products/Clothes/Hoodie/favorhood-1.webp,Products/Clothes/Hoodie/favorhood-2.webp,Products/Clothes/Hoodie/favorhood-3.webp,Products/Clothes/Hoodie/favorhood-4.webp')

INSERT INTO SAN_PHAM VALUES('HOODIE','DGHD-04',N'SAILOR MOON',117,510000,N'',0,'Products/Clothes/Hoodie/sailor-moon-1.webp','Products/Clothes/Hoodie/sailor-moon-1.webp,Products/Clothes/Hoodie/sailor-moon-2.webp,Products/Clothes/Hoodie/sailor-moon-3.webp,Products/Clothes/Hoodie/sailor-moon-4.webp')



INSERT INTO SAN_PHAM VALUES('PANTS','BHP-01',N'BAD LINE',95,410000,N'',0,'Products/Trouser/pants/bad-line-1.webp','Products/Trouser/pants/bad-line-1.webp,Products/Trouser/pants/bad-line-2.webp,Products/Trouser/pants/bad-line-3.webp,Products/Trouser/pants/bad-line-4.webp')

INSERT INTO SAN_PHAM VALUES('PANTS','BHP-02',N'BH CARGO',52,410000,N'',0,'Products/Trouser/pants/cargo-1.webp','Products/Trouser/pants/cargo-1.webp,Products/Trouser/pants/cargo-2.webp,Products/Trouser/pants/cargo-3.webp,Products/Trouser/pants/cargo-4.webp')

INSERT INTO SAN_PHAM VALUES('PANTS','BHP-03',N'BH CARGO VÀNG',99,410000,N'',0,'Products/Trouser/pants/cargo-vang-1.webp','Products/Trouser/pants/cargo-vang-1.webp,Products/Trouser/pants/cargo-vang-2.webp,Products/Trouser/pants/cargo-vang-3.webp,Products/Trouser/pants/cargo-vang-4.webp')       

INSERT INTO SAN_PHAM VALUES('PANTS','BHP-04',N'BH CARGO XÁM',63,410000,N'',0,'Products/Trouser/pants/cargo-xam-1.webp','Products/Trouser/pants/cargo-xam-1.webp,Products/Trouser/pants/cargo-xam-2.webp,Products/Trouser/pants/cargo-xam-3.webp,Products/Trouser/pants/cargo-xam-4.webp')

INSERT INTO SAN_PHAM VALUES('PANTS','BHP-05',N'BH LINE SWEATPANTS CAM',120,410000,N'',0,'Products/Trouser/pants/line-sweatpan-cam-1.webp','Products/Trouser/pants/line-sweatpan-cam-1.webp,Products/Trouser/pants/line-sweatpan-cam-2.webp,Products/Trouser/pants/line-sweatpan-cam-3.webp,Products/Trouser/pants/line-sweatpan-cam-4.webp')

INSERT INTO SAN_PHAM VALUES('PANTS','BHP-06',N'BH LINE SWEATPANTS ĐỎ',100,410000,N'',0,'Products/Trouser/pants/line-sweatpan-do-1.webp','Products/Trouser/pants/line-sweatpan-do-1.webp,Products/Trouser/pants/line-sweatpan-do-2.webp,Products/Trouser/pants/line-sweatpan-do-3.webp,Products/Trouser/pants/line-sweatpan-do-4.webp')

INSERT INTO SAN_PHAM VALUES('PANTS','BHP-07',N'BH LINE SWEATPANTS NÂU',86,410000,N'',0,'Products/Trouser/pants/line-sweatpan-nau-1.webp','Products/Trouser/pants/line-sweatpan-nau-1.webp,Products/Trouser/pants/line-sweatpan-nau-2.webp,Products/Trouser/pants/line-sweatpan-nau-3.webp,Products/Trouser/pants/line-sweatpan-nau-4.webp')

INSERT INTO SAN_PHAM VALUES('PANTS','DCP-01',N'DC CARGO PANTS',60,410000,N'',0,'Products/Trouser/pants/dc-cargo-pant-1.webp','Products/Trouser/pants/dc-cargo-pant-1.webp,Products/Trouser/pants/dc-cargo-pant-2.webp,Products/Trouser/pants/dc-cargo-pant-3.webp,Products/Trouser/pants/dc-cargo-pant-4.webp')

INSERT INTO SAN_PHAM VALUES('PANTS','DCP-02',N'DC SHINE PANTS',123,410000,N'',0,'Products/Trouser/pants/dc-shine-pant-1.png','Products/Trouser/pants/dc-shine-pant-1.png,Products/Trouser/pants/dc-shine-pant-2.png,Products/Trouser/pants/dc-shine-pant-3.webp,Products/Trouser/pants/dc-shine-pant-4.webp')

INSERT INTO SAN_PHAM VALUES('PANTS','DCP-03',N'DC UNIFORM PANTS',86,410000,N'',0,'Products/Trouser/pants/dc-uniform-pant-1.png','Products/Trouser/pants/dc-uniform-pant-1.png,Products/Trouser/pants/dc-uniform-pant-2.png,Products/Trouser/pants/dc-uniform-pant-3.png,Products/Trouser/pants/dc-uniform-pant-4.webp')


INSERT INTO SAN_PHAM VALUES('SHOES','YM-01',N'YM-01',92,310000,N'',0,'Products/Shoes/YM-01-1.jpg','Products/Shoes/YM-01-1.jpg,Products/Shoes/YM-01-2.jpg,Products/Shoes/YM-01-3.jpg,Products/Shoes/YM-01-4.jpg')

INSERT INTO SAN_PHAM VALUES('SHOES','YM-02',N'YM-02',106,400000,N'',0,'Products/Shoes/YM-02-1.jpg','Products/Shoes/YM-02-1.jpg,Products/Shoes/YM-02-2.jpg,Products/Shoes/YM-02-3.jpg,Products/Shoes/YM-02-4.jpg')

INSERT INTO SAN_PHAM VALUES('SHOES','YM-03',N'YM-03',41,250000,N'',0,'Products/Shoes/YM-03-1.jpg','Products/Shoes/YM-03-1.jpg,Products/Shoes/YM-03-2.jpg,Products/Shoes/YM-03-3.jpg,Products/Shoes/YM-03-4.jpg')

INSERT INTO SAN_PHAM VALUES('SHOES','YM-04',N'YM-04',66,250000,N'',0,'Products/Shoes/YM-04-1.jpg','Products/Shoes/YM-04-1.jpg,Products/Shoes/YM-04-2.jpg,Products/Shoes/YM-04-3.jpg,Products/Shoes/YM-04-4.jpg')

INSERT INTO SAN_PHAM VALUES('SHOES','YM-05',N'YM-05',89,360000,N'',0,'Products/Shoes/YM-05-1.jpg','Products/Shoes/YM-05-1.jpg,Products/Shoes/YM-05-2.jpg,Products/Shoes/YM-05-3.jpg,Products/Shoes/YM-05-4.jpg')

INSERT INTO SAN_PHAM VALUES('SHOES','YM-06',N'YM-06',55,720000,N'',0,'Products/Shoes/YM-06-1.jpg','Products/Shoes/YM-06-1.jpg,Products/Shoes/YM-06-2.jpg,Products/Shoes/YM-06-3.jpg,Products/Shoes/YM-06-4.jpg')

INSERT INTO SAN_PHAM VALUES('SHOES','YM-07',N'YM-07',47,399.000,N'',0,'Products/Shoes/YM-07-1.jpg','Products/Shoes/YM-07-1.jpg,Products/Shoes/YM-07-2.jpg,Products/Shoes/YM-07-3.jpg,Products/Shoes/YM-07-4.jpg')

INSERT INTO SAN_PHAM VALUES('SHOES','YM-08',N'YM-08',68,250000,N'',0,'Products/Shoes/YM-08-1.jpg','Products/Shoes/YM-08-1.jpg,Products/Shoes/YM-08-2.jpg,Products/Shoes/YM-08-3.jpg,Products/Shoes/YM-08-4.jpg')

INSERT INTO SAN_PHAM VALUES('SHOES','YM-09',N'YM-09',57,350000,N'',0,'Products/Shoes/YM-09-1.jpg','Products/Shoes/YM-09-1.jpg,Products/Shoes/YM-09-2.jpg,Products/Shoes/YM-09-3.jpg,Products/Shoes/YM-09-4.jpg')

INSERT INTO SAN_PHAM VALUES('SHOES','YM-10',N'YM-10',51,510000,N'',0,'Products/Shoes/YM-10-1.jpg','Products/Shoes/YM-10-1.jpg,Products/Shoes/YM-10-2.jpg,Products/Shoes/YM-10-3.jpg,Products/Shoes/YM-10-4.jpg')


INSERT INTO SAN_PHAM VALUES('SHORTS','BHS-01',N'BAD HUMAN SHORT 1',48,310000,N'',0,'Products/Trouser/short/bad-human-black-1.webp','Products/Trouser/short/bad-human-black-1.webp,Products/Trouser/short/bad-human-black-2.webp,Products/Trouser/short/bad-human-black-3.jpg,Products/Trouser/short/bad-human-black-4.webp')

INSERT INTO SAN_PHAM VALUES('SHORTS','BHS-02',N'BAD HUMAN SHORT 2',58,310000,N'',0,'Products/Trouser/short/bad-human-white-1.webp','Products/Trouser/short/bad-human-white-1.webp,Products/Trouser/short/bad-human-white-2.webp,Products/Trouser/short/bad-human-white-3.jpg,Products/Trouser/short/bad-human-white-4.jpg')

INSERT INTO SAN_PHAM VALUES('SHORTS','BHS-03',N'BAD HUMAN SHORT 3',42,310000,N'',0,'Products/Trouser/short/bad-human-yellow-1.webp','Products/Trouser/short/bad-human-yellow-1.webp,Products/Trouser/short/bad-human-yellow-2.webp,Products/Trouser/short/bad-human-yellow-3.jpg,Products/Trouser/short/bad-human-yellow-4.jpg')

INSERT INTO SAN_PHAM VALUES('SHORTS','BHS-04',N'BAD SHORT',49,310000,N'',0,'Products/Trouser/short/bad-yellow-1.webp','Products/Trouser/short/bad-yellow-1.webp,Products/Trouser/short/bad-yellow-2.webp,Products/Trouser/short/bad-yellow-3.webp,Products/Trouser/short/bad-yellow-4.webp')

INSERT INTO SAN_PHAM VALUES('SHORTS','BHS-05',N'FIRE SHORT',105,310000,N'',0,'Products/Trouser/short/fire-1.webp','Products/Trouser/short/fire-1.webp,Products/Trouser/short/fire-2.webp,Products/Trouser/short/fire-3.webp,Products/Trouser/short/fire-4.webp')

INSERT INTO SAN_PHAM VALUES('SHORTS','BHS-06',N'RABBIT CAMO SHORT 1',68,350000,N'',0,'Products/Trouser/short/rabbit-camo-1.webp','Products/Trouser/short/rabbit-camo-1.webp,Products/Trouser/short/rabbit-camo-2.webp,Products/Trouser/short/rabbit-camo-3.webp,Products/Trouser/short/rabbit-camo-4.webp')

INSERT INTO SAN_PHAM VALUES('SHORTS','BHS-07',N'RABBIT CAMO SHORT 2',118,350000,N'',0,'Products/Trouser/short/rabbit-camo-do-1.webp','Products/Trouser/short/rabbit-camo-do-1.webp,Products/Trouser/short/rabbit-camo-do-2.webp,Products/Trouser/short/rabbit-camo-do-3.jpg,Products/Trouser/short/rabbit-camo-do-4.jpg')

INSERT INTO SAN_PHAM VALUES('SHORTS','BHS-08',N'RABBIT SHORT 1',56,310000,N'',0,'Products/Trouser/short/rabbit-den-1.webp','Products/Trouser/short/rabbit-den-1.webp,Products/Trouser/short/rabbit-den-2.webp,Products/Trouser/short/rabbit-den-3.webp,Products/Trouser/short/rabbit-den-4.webp')       

INSERT INTO SAN_PHAM VALUES('SHORTS','BHS-09',N'RABBIT SHORT 2',59,410000,N'',0,'Products/Trouser/short/rabbit-nau-den-1.jpg','Products/Trouser/short/rabbit-nau-den-1.jpg,Products/Trouser/short/rabbit-nau-den-2.jpg,Products/Trouser/short/rabbit-nau-den-3.jpg,Products/Trouser/short/rabbit-nau-den-4.jpg')

INSERT INTO SAN_PHAM VALUES('SHORTS','BHS-10',N'RABBIT SHORT 3',45,310000,N'',0,'Products/Trouser/short/rabbit-xam-1.webp','Products/Trouser/short/rabbit-xam-1.webp,Products/Trouser/short/rabbit-xam-2.jpg,Products/Trouser/short/rabbit-xam-3.jpg,Products/Trouser/short/rabbit-xam-4.webp')



INSERT INTO SAN_PHAM VALUES('TSHIRT','BHTS-01',N'ANGRY JUNGLE TEE',35,350000,N'',0,'Products/Clothes/T-shirt/angry-jungle-1.webp','Products/Clothes/T-shirt/angry-jungle-1.webp,Products/Clothes/T-shirt/angry-jungle-2.webp,Products/Clothes/T-shirt/angry-jungle-3.webp,Products/Clothes/T-shirt/angry-jungle-4.webp')

INSERT INTO SAN_PHAM VALUES('TSHIRT','BHTS-02',N'BAD DRUG TEE',35,350000,N'',0,'Products/Clothes/T-shirt/bad-drug-1.webp','Products/Clothes/T-shirt/bad-drug-1.webp,Products/Clothes/T-shirt/bad-drug-2.webp,Products/Clothes/T-shirt/bad-drug-3.webp,Products/Clothes/T-shirt/bad-drug-4.webp')      

INSERT INTO SAN_PHAM VALUES('TSHIRT','BHTS-03',N'BAD FUNKY',39,400000,N'',0,'Products/Clothes/T-shirt/bad-funky-1.webp','Products/Clothes/T-shirt/bad-funky-1.webp,Products/Clothes/T-shirt/bad-funky-2.webp,Products/Clothes/T-shirt/bad-funky-3.webp,Products/Clothes/T-shirt/bad-funky-4.webp')    

INSERT INTO SAN_PHAM VALUES('TSHIRT','BHTS-04',N'BAD PARADISE',86,315.000,N'',0,'Products/Clothes/T-shirt/bad-paradise-1.webp','Products/Clothes/T-shirt/bad-paradise-1.webp,Products/Clothes/T-shirt/bad-paradise-2.webp,Products/Clothes/T-shirt/bad-paradise-3.webp,Products/Clothes/T-shirt/bad-paradise-4.webp')

INSERT INTO SAN_PHAM VALUES('TSHIRT','BHTS-05',N'CANDY LAND TEE',102,315.000,N'',0,'Products/Clothes/T-shirt/candy-land-1.webp','Products/Clothes/T-shirt/candy-land-1.webp,Products/Clothes/T-shirt/candy-land-2.webp,Products/Clothes/T-shirt/candy-land-3.webp,Products/Clothes/T-shirt/candy-land-4.webp')

INSERT INTO SAN_PHAM VALUES('TSHIRT','BHTS-06',N'CHERRY BLOSSOM',92,325.000,N'',0,'Products/Clothes/T-shirt/cherry-blossom-1.webp','Products/Clothes/T-shirt/cherry-blossom-1.webp,Products/Clothes/T-shirt/cherry-blossom-2.webp,Products/Clothes/T-shirt/cherry-blossom-3.webp,Products/Clothes/T-shirt/cherry-blossom-4.webp')

INSERT INTO SAN_PHAM VALUES('TSHIRT','BHTS-07',N'NO COLOUR TEE',72,325.000,N'',0,'Products/Clothes/T-shirt/no-colour-1.webp','Products/Clothes/T-shirt/no-colour-1.webp,Products/Clothes/T-shirt/no-colour-2.webp,Products/Clothes/T-shirt/no-colour-3.webp,Products/Clothes/T-shirt/no-colour-4.webp')

INSERT INTO SAN_PHAM VALUES('TSHIRT','BHTS-08',N'RABBIT KING TEE',75,310000,N'',0,'Products/Clothes/T-shirt/rabbit-king-1.webp','Products/Clothes/T-shirt/rabbit-king-1.webp,Products/Clothes/T-shirt/rabbit-king-2.webp,Products/Clothes/T-shirt/rabbit-king-3.webp,Products/Clothes/T-shirt/rabbit-king-4.webp')

INSERT INTO SAN_PHAM VALUES('TSHIRT','BHTS-09',N'RABBIT HOMIE TEE',105,310000,N'',0,'Products/Clothes/T-shirt/rabit-homie-1.webp','Products/Clothes/T-shirt/rabit-homie-1.webp,Products/Clothes/T-shirt/rabit-homie-2.webp,Products/Clothes/T-shirt/rabit-homie-3.webp,Products/Clothes/T-shirt/rabit-homie-4.webp')

INSERT INTO SAN_PHAM VALUES('TSHIRT','BHTS-10',N'RABBIT SHOW TEE',31,310000,N'',0,'Products/Clothes/T-shirt/rabit-show-1.webp','Products/Clothes/T-shirt/rabit-show-1.webp,Products/Clothes/T-shirt/rabit-show-2.webp,Products/Clothes/T-shirt/rabit-show-3.webp,Products/Clothes/T-shirt/rabit-show-4.webp')

select * from SAN_PHAM

