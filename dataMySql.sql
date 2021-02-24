﻿--
-- Script was generated by Devart dbForge Studio 2019 for MySQL, Version 8.2.23.0
-- Product home page: http://www.devart.com/dbforge/mysql/studio
-- Script date 2/23/2021 11:05:36 AM
-- Server version: 5.5.5-10.1.47-MariaDB-0ubuntu0.18.04.1
-- Client version: 4.1
--


SET NAMES 'utf8';

INSERT INTO MF706_VuMinhHieu_eShop.District(districtId,districtName,cityId), VALUES

(1, 'Quận Hoàn Kiếm ', 1),
(2, 'Quận Ba Đình', 1),
(3, 'Quận Hai Bà Trưng', 1),
(4, 'Quận Tây Hồ', 1),
(5, 'Quận Đống Đa', 1),
(6, 'Quận Cầu Giấy', 1),
(7, 'Quận Long Biên', 1),
(8, 'Quận Hoàng Mai', 1),
(9, 'Quận Hà Đông', 1),
(10, 'Quận Thanh Xuân', 1),
(11, 'Quận Bắc Từ Liêm', 1),
(12, 'Quận Nam Từ Liêm', NULL);


INSERT INTO MF706_VuMinhHieu_eShop.City(cityId,cityName,countryId)VALUES
   (1, 'Hà Nội', 1),
 (2, 'Hải Phòng', 1),
 (3, 'Đà Nẵng', 1),
 (4, 'Thành phố Hồ Chí Minh', 1),
 (5, 'Cần Thơ', 1),
 (6, 'Băng Cốc', 11),
 (7, 'Nonthaburi', 11),
 (8, 'Singapore', 10);

INSERT INTO MF706_VuMinhHieu_eShop.District(districtId,districtName,cityId) VALUES

(1, 'Quận Hoàn Kiếm ', 1),
(2, 'Quận Ba Đình', 1),
(3, 'Quận Hai Bà Trưng', 1),
(4, 'Quận Tây Hồ', 1),
(5, 'Quận Đống Đa', 1),
(6, 'Quận Cầu Giấy', 1),
(7, 'Quận Long Biên', 1),
(8, 'Quận Hoàng Mai', 1),
(9, 'Quận Hà Đông', 1),
(10, 'Quận Thanh Xuân', 1),
(11, 'Quận Bắc Từ Liêm', 1),
(12, 'Quận Nam Từ Liêm', NULL);

INSERT INTO MF706_VuMinhHieu_eShop.Ward(wardId,wardName,districtId) VALUES
(1, 'Đại Kim', 1),
(2, 'Định Công', 1),
(3, 'Giáp Bát', 1),
(4, 'Hoàng Liệt', 1),
(5, 'Hoàng Văn Thụ', 1),
(6, 'Lĩnh Nam', 1),
(7, 'Mai Động', 1),
(8, 'Tân Mai', 1),
(9, 'Thanh Trì', 1),
(10, 'Thịnh Liệt', 1),
(11, 'Trần Phú', 1),
(12, 'Tương Mai', 1),
(13, 'Vĩnh Hưng', 1),
(14, 'Yên Sở', 1);

INSERT INTO MF706_VuMinhHieu_eShop.StatusShop(statusId,statusName) VALUES
(1, 'Đang hoạt động'),
(2, 'Đã đóng cửa'),
(3, 'Đang xây dựng'),
(4, 'Đang bảo trì');

INSERT INTO MF706_VuMinhHieu_eShop.User(userId,userName,password,fullName,createDate,avatar,userGroupId,active) VALUES

    INSERT INTO MF706_VuMinhHieu_eShop.Shop(shopId,shopCode,shopName,address,phone,taxCode,statusId,wardId,street,createDate, createUserId) VALUES
('058385673df742409b3b3bf9b6d20000', 'S1016', 'DOVIDA 67 Cầu Giấy', '67 Cầu Giấy 123', '1000001', '1001', 1, NULL, '66 Cầu Giấy', CAST('20210222T16:52:16.127' AS DateTime), '149fb958744f70c67709bf1378b8dc91'),
('06983f50a5444a7890791d62a9c73e1e', 'S1015', 'DOVIDA 66 Cầu Giấy', '66 Cầu Giấy', '1000002', '1001', 1, 1, '66 Cầu Giấy', CAST('20210222T16:52:43.867' AS DateTime), '149fb958744f70c67709bf1378b8dc91'),
('0a5a636b2bea4dd390eba9ff64036807', 's1012', 'shop12', 'hanoi', '11111111', '000000', NULL, NULL, 'hanoi', CAST('20210221T11:40:34.503' AS DateTime), '149fb958744f70c67709bf1378b8dc91'),
('1104f3132ef14c73a9fd9111e34347f8', 's1032', 'DOVIDA 	86	Cầu Giấy', '86	Cầu Giấy', '4911243511', '269339', 1, 1, '86	Cầu Giấy', CAST('20210222T09:05:53.150' AS DateTime), '149fb958744f70c67709bf1378b8dc91'),
('1193319f63931c1eb7be406293204378', 's1000', 'DOVADI138 TÔ HIỆU', '138 TÔ HIỆU, HÀ ĐÔNG', '02436622666', NULL, 1, 1, '138 Tô hiệu', CAST('20210220T00:00:00.000' AS DateTime), '149fb958744f70c67709bf1378b8dc91'),
('11acd342735a6bbe73de23e177779933', 's1001', 'DOVADI245 ĐỊNH CÔNG HẠ', '245 ĐỊNH CÔNG HẠ', '02445824566', '147858', 1, NULL, '245 Định Công Hạ', CAST('20210222T14:56:42.217' AS DateTime), '149fb958744f70c67709bf1378b8dc91'),
('11ca83c81be86374cad5ba100c6f7bce', 's1002', 'DOVADI807 GIẢI PHÓNG', '807 GIẢI PHÓNG Hai Bà Trưng', '02441235688', '425159    ', 2, 3, '807 Giải Phóng', CAST('20210222T14:32:19.577' AS DateTime), '149fb958744f70c67709bf1378b8dc91'),
('1231228944d058dc3b84196123975cb2', 'S1004', 'DOVADI138 TAM TRINH', '138 Đường Tam Trinh, Yên Sở, Hoàng Mai, Hà Nội, Vietnam', '02000182256', '475826    ', 3, 14, '138 Đường Tam Trinh', CAST('20210220T00:00:00.000' AS DateTime), '149fb958744f70c67709bf1378b8dc91'),
('12596832665220479ec008fd2f807219', 'S1003', 'DOVADI546 CẦU DẬU', '546 Cầu Dậu, Thanh Liệt, Thanh Trì, Hà Nội, Vietnam', '02000024566', '123456    ', 1, 10, '546 Cầu Dậu', CAST('20210220T00:00:00.000' AS DateTime), '149fb958744f70c67709bf1378b8dc91'),
('12668a601dcb5fa6a809bf1378b8dc91', 'S1005', 'DOVADI165 THANH ĐÀM', '165 Thanh Đàm, Thanh Trì, Hoàng Mai, Hà Nội, Vietnam', '02018001800', '789128    ', 4, 9, '165 Thanh Đàm', CAST('20210220T00:00:00.000' AS DateTime), '149fb958744f70c67709bf1378b8dc91'),
('16dd5d890baf4a8d8f942c11442d61c8', 's1024', 'DOVIDA 	78	Cầu Giấy', '78	Cầu Giấy', '35940855684', '537691', 1, 1, '78	Cầu Giấy', CAST('20210222T08:42:25.290' AS DateTime), '149fb958744f70c67709bf1378b8dc91'),
('2fee76cbfbd14d9eb1083843b3cc518e', '1026', 'DOVIDA 80	Cầu Giấy', '1000012', '', '', 1, 1, '', CAST('20210222T08:58:09.920' AS DateTime), '149fb958744f70c67709bf1378b8dc91'),
('3f6ba444d9fb412bb1459d2ff4ac2713', 's1033', 'DOVIDA 	113	Láng Hạ', '113	Láng Hạ', '48790065573', '386012', 1, 1, '113	Láng Hạ', CAST('20210222T09:08:05.583' AS DateTime), '149fb958744f70c67709bf1378b8dc91'),
('46370eb8ef7e4b2a9086dbdb37dfc0bf', 's1006', 'Hiếu Minh Vũ7', '236 Hoàng Quốc Việt', '0369520662', '0350', 1, 7, 'Trần cung', CAST('20210902T00:00:00.000' AS DateTime), '149fb958744f70c67709bf1378b8dc91'),
('4a7c217028d24743b72ae9cee77abd66', 's1028', 'DOVIDA 	82	Cầu Giấy', '82	Cầu Giấy', '85254927864', '111083', 1, 1, '82	Cầu Giấy', CAST('20210222T08:59:52.567' AS DateTime), '149fb958744f70c67709bf1378b8dc91'),
('5bdd7b470a244b48936e06b621421fae', 's1035', 'DOVIDA 	179	Láng Hạ', '179	Láng Hạ', '55827086904', '903049', 1, 1, '179	Láng Hạ', CAST('20210222T20:48:51.910' AS DateTime), '149fb958744f70c67709bf1378b8dc91'),
('5cb12c6c7c9142d8a10347d5a0ae706b', 's1023', 'DOVIDA 	77	Cầu Giấy', '77	Cầu Giấy', '48299639190', '380629', 1, 1, '77	Cầu Giấy', CAST('20210222T08:39:40.390' AS DateTime), '149fb958744f70c67709bf1378b8dc91'),
('6d05c9e3316d4ec5bdda67bcabfc8d18', 's1022', 'DOVIDA 	76 Trần Phú', '76 Trần Phú', '43387495568', '290277', 1, 1, 'Trần Phú', CAST('20210222T08:13:50.390' AS DateTime), '149fb958744f70c67709bf1378b8dc91'),
('6fd72fbdef4e4655a26740e47d09a7b9', 's1026', 'DOVIDA 	79Cầu Giấy', '79Cầu Giấy', '58892658383', '429441', 1, 1, '79Cầu Giấy', CAST('20210222T08:49:11.203' AS DateTime), '149fb958744f70c67709bf1378b8dc91'),
('84388f16453e444e897bc772ec51795c', 's1027', 'DOVIDA 	81	Cầu Giấy', '81	Cầu Giấy', '89915490564', '757268', 1, 1, '81	Cầu Giấy', CAST('20210222T08:57:44.647' AS DateTime), '149fb958744f70c67709bf1378b8dc91'),
('8cc5a5f66de44f17bfa5276f716d02bc', 's1034', 'DOVIDA 	925	Láng Hạ', '925	Láng Hạ', '67718819794', '401421', 1, 1, '925	Láng Hạ', CAST('20210222T09:09:28.400' AS DateTime), '149fb958744f70c67709bf1378b8dc91'),
('963e684a0fb34ba084a023dca342ee9c', 's1020', 'DOVIDA 69	Cầu Giấy', '1000001', '68664931127', '170155', 1, 1, '69	Cầu Giấy', CAST('20210222T00:02:05.413' AS DateTime), '149fb958744f70c67709bf1378b8dc91'),
('a00ad789ee1a40d3b5845d6f6c3c1d00', 's1011', 'Hop1', 'hanoi', '09111900', '0000', NULL, NULL, 'hanoi', CAST('20210221T11:39:30.370' AS DateTime), '149fb958744f70c67709bf1378b8dc91'),
('abfb297f59d244bba46c18b25567c1ae', 's1025', 'DOVIDA 	79	Cầu Giấy', '79	Cầu Giấy', '10567479035', '289822', 1, 1, '79	Cầu Giấy', CAST('20210222T08:45:16.790' AS DateTime), '149fb958744f70c67709bf1378b8dc91'),
('b514bdf327484f818003580e6dfe42de', 's1013', 'DOVADI101 DUY TÂ', '101 Duy Tân', '234234', '234234', 1, 1, '32ds f sd', CAST('20210221T23:37:58.207' AS DateTime), '149fb958744f70c67709bf1378b8dc91'),
('bdb2d54d27404917beb0d29ed7dea9dd', 's1210', 'DOVIDA 	73 Cầu Giấy', '73 Cầu Giấy', '35580161066', '412098', 1, 1, '73 Cầu Giấy', CAST('20210222T00:06:21.397' AS DateTime), '149fb958744f70c67709bf1378b8dc91'),
('c21742add2c5470fbdc718ab7b76cb33', '1021', 'DOVIDA 	74	Cầu Giấy', '74	Cầu Giấy', '61305334650', '717845', 1, 1, '74	Cầu Giấy', CAST('20210222T00:07:55.967' AS DateTime), '149fb958744f70c67709bf1378b8dc91'),
('c47e8812eab24aa5b9dcbef2e94b6535', 's1029', 'DOVIDA 	83	Cầu Giấy', '83	Cầu Giấy', '54567772133', '647849', 1, 1, '83	Cầu Giấy', CAST('20210222T09:02:20.300' AS DateTime), '149fb958744f70c67709bf1378b8dc91'),
('d6b62bb1951f4263bc3000170f10cbad', 'S1019', 'DOVADI 56 CẦU GIẤY', '56 Cầu Giấy', '0125456728', '012458', 1, 1, '', CAST('20210221T23:08:45.257' AS DateTime), '149fb958744f70c67709bf1378b8dc91'),
('d83f6c2f9798400f9ea2416b5549b326', 's1021', 'DOVIDA 	75	Cầu Giấy', '75	Cầu Giấy', '6745049220', '301255', 1, 1, '', CAST('20210222T20:47:51.647' AS DateTime), '149fb958744f70c67709bf1378b8dc91'),
('dd5f53aa3e67409fa08183370e24c5e2', 's1014', 'DOVIDA36 THANH NIÊ', '36 Đường Thanh Niên', '1456125458', '345634', 1, 1, '36 Đường Thanh Niên', CAST('20210221T23:42:15.817' AS DateTime), '149fb958744f70c67709bf1378b8dc91'),
('f5ade64ca1114958b7f7f0c458ad7669', 's1030', 'DOVIDA 84 Cầu Giấy', '84 Cầu Giấy', '0321125785 ', '904547', 1, 1, '84 Cầu Giấy', CAST('20210222T09:04:09.440' AS DateTime), '149fb958744f70c67709bf1378b8dc91'),
('fc9c118e02de4f1a9067fe7617163069', 's1133', 'DOVIDA 	594	Láng Hạ', 'DOVIDA 	594	Láng Hạ', '31784476193', '382341', 1, 1, '	594	Láng Hạ', CAST('20210222T20:39:22.267' AS DateTime), '149fb958744f70c67709bf1378b8dc91');



