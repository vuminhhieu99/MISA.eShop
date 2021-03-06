USE [master]
GO
/****** Object:  Database [EShopDB]    Script Date: 2/25/2021 8:48:13 AM ******/
CREATE DATABASE [EShopDB]
 
GO
USE [EShopDB]
GO
/****** Object:  Table [dbo].[City]    Script Date: 2/25/2021 8:48:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[cityId] [int] IDENTITY(1,1) NOT NULL,
	[cityName] [nvarchar](50) NULL,
	[countryId] [int] NULL,
 CONSTRAINT [PK_City] PRIMARY KEY CLUSTERED 
(
	[cityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Country]    Script Date: 2/25/2021 8:48:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[countryId] [int] IDENTITY(1,1) NOT NULL,
	[countryName] [nvarchar](100) NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[countryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[District]    Script Date: 2/25/2021 8:48:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[District](
	[districtId] [int] IDENTITY(1,1) NOT NULL,
	[districtName] [nvarchar](50) NULL,
	[cityId] [int] NULL,
 CONSTRAINT [PK_District] PRIMARY KEY CLUSTERED 
(
	[districtId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shop]    Script Date: 2/25/2021 8:48:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shop](
	[shopId] [char](36) NOT NULL,
	[shopCode] [varchar](30) NOT NULL,
	[shopName] [nvarchar](100) NOT NULL,
	[address] [nvarchar](400) NOT NULL,
	[phone] [varchar](20) NULL,
	[taxCode] [varchar](50) NULL,
	[statusId] [int] NULL,
	[wardId] [int] NULL,
	[street] [nvarchar](50) NULL,
	[createDate] [datetime] NULL,
	[createUserId] [char](36) NULL,
 CONSTRAINT [PK_Shop] PRIMARY KEY CLUSTERED 
(
	[shopId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StatusShop]    Script Date: 2/25/2021 8:48:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StatusShop](
	[statusId] [int] IDENTITY(1,1) NOT NULL,
	[statusName] [nvarchar](100) NULL,
 CONSTRAINT [PK_StatusShop] PRIMARY KEY CLUSTERED 
(
	[statusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 2/25/2021 8:48:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[userId] [char](36) NOT NULL,
	[userName] [nvarchar](20) NOT NULL,
	[password] [varchar](16) NOT NULL,
	[fullName] [nvarchar](50) NULL,
	[createDate] [datetime] NULL,
	[avatar] [nvarchar](400) NULL,
	[userGroupId] [int] NULL,
	[active] [bit] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[userId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ward]    Script Date: 2/25/2021 8:48:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ward](
	[wardId] [int] IDENTITY(1,1) NOT NULL,
	[wardName] [nvarchar](50) NULL,
	[districtId] [int] NULL,
 CONSTRAINT [PK_Ward] PRIMARY KEY CLUSTERED 
(
	[wardId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[City] ON 

INSERT [dbo].[City] ([cityId], [cityName], [countryId]) VALUES (1, N'Hà Nội', 1)
INSERT [dbo].[City] ([cityId], [cityName], [countryId]) VALUES (2, N'Hải Phòng', 1)
INSERT [dbo].[City] ([cityId], [cityName], [countryId]) VALUES (3, N'Đà Nẵng', 1)
INSERT [dbo].[City] ([cityId], [cityName], [countryId]) VALUES (4, N'Thành phố Hồ Chí Minh', 1)
INSERT [dbo].[City] ([cityId], [cityName], [countryId]) VALUES (5, N'Cần Thơ', 1)
INSERT [dbo].[City] ([cityId], [cityName], [countryId]) VALUES (6, N'Băng Cốc', 11)
INSERT [dbo].[City] ([cityId], [cityName], [countryId]) VALUES (7, N'Nonthaburi', 11)
INSERT [dbo].[City] ([cityId], [cityName], [countryId]) VALUES (8, N'Singapore', 10)
SET IDENTITY_INSERT [dbo].[City] OFF
GO
SET IDENTITY_INSERT [dbo].[Country] ON 

INSERT [dbo].[Country] ([countryId], [countryName]) VALUES (1, N'Việt Nam')
INSERT [dbo].[Country] ([countryId], [countryName]) VALUES (2, N'Brunei')
INSERT [dbo].[Country] ([countryId], [countryName]) VALUES (3, N'Campuchia')
INSERT [dbo].[Country] ([countryId], [countryName]) VALUES (4, N'Đông Timor')
INSERT [dbo].[Country] ([countryId], [countryName]) VALUES (5, N'Indonesia')
INSERT [dbo].[Country] ([countryId], [countryName]) VALUES (6, N'Lào')
INSERT [dbo].[Country] ([countryId], [countryName]) VALUES (7, N'Malaysia')
INSERT [dbo].[Country] ([countryId], [countryName]) VALUES (8, N'Myanmar')
INSERT [dbo].[Country] ([countryId], [countryName]) VALUES (9, N'Philippines')
INSERT [dbo].[Country] ([countryId], [countryName]) VALUES (10, N'Singapore')
INSERT [dbo].[Country] ([countryId], [countryName]) VALUES (11, N'Thái Lan')
SET IDENTITY_INSERT [dbo].[Country] OFF
GO
SET IDENTITY_INSERT [dbo].[District] ON 

INSERT [dbo].[District] ([districtId], [districtName], [cityId]) VALUES (1, N'Quận Hoàn Kiếm ', 1)
INSERT [dbo].[District] ([districtId], [districtName], [cityId]) VALUES (2, N'Quận Ba Đình', 1)
INSERT [dbo].[District] ([districtId], [districtName], [cityId]) VALUES (3, N'Quận Hai Bà Trưng', 1)
INSERT [dbo].[District] ([districtId], [districtName], [cityId]) VALUES (4, N'Quận Tây Hồ', 1)
INSERT [dbo].[District] ([districtId], [districtName], [cityId]) VALUES (5, N'Quận Đống Đa', 1)
INSERT [dbo].[District] ([districtId], [districtName], [cityId]) VALUES (6, N'Quận Cầu Giấy', 1)
INSERT [dbo].[District] ([districtId], [districtName], [cityId]) VALUES (7, N'Quận Long Biên', 1)
INSERT [dbo].[District] ([districtId], [districtName], [cityId]) VALUES (8, N'Quận Hoàng Mai', 1)
INSERT [dbo].[District] ([districtId], [districtName], [cityId]) VALUES (9, N'Quận Hà Đông', 1)
INSERT [dbo].[District] ([districtId], [districtName], [cityId]) VALUES (10, N'Quận Thanh Xuân', 1)
INSERT [dbo].[District] ([districtId], [districtName], [cityId]) VALUES (11, N'Quận Bắc Từ Liêm', 1)
INSERT [dbo].[District] ([districtId], [districtName], [cityId]) VALUES (12, N'Quận Nam Từ Liêm', NULL)
SET IDENTITY_INSERT [dbo].[District] OFF
GO
INSERT [dbo].[Shop] ([shopId], [shopCode], [shopName], [address], [phone], [taxCode], [statusId], [wardId], [street], [createDate], [createUserId]) VALUES (N'058385673df742409b3b3bf9b6d20000    ', N'S1016', N'DOVIDA -67 Cầu Giấy', N'67 Cầu Giấy 123', N'1000001', N'1001', 1, NULL, N'66 Cầu Giấy', CAST(N'2021-02-22T16:52:16.127' AS DateTime), NULL)
INSERT [dbo].[Shop] ([shopId], [shopCode], [shopName], [address], [phone], [taxCode], [statusId], [wardId], [street], [createDate], [createUserId]) VALUES (N'1104f3132ef14c73a9fd9111e34347f8    ', N's1032', N'DOVIDA 	86	Cầu Giấy', N'86	Cầu Giấy', N'4911243511', N'269339', 1, 1, N'86	Cầu Giấy', CAST(N'2021-02-22T09:05:53.150' AS DateTime), NULL)
INSERT [dbo].[Shop] ([shopId], [shopCode], [shopName], [address], [phone], [taxCode], [statusId], [wardId], [street], [createDate], [createUserId]) VALUES (N'1193319f63931c1eb7be406293204378    ', N's1000', N'DOVADI-138 TÔ HIỆU', N'138 TÔ HIỆU, HÀ ĐÔNG', N'02436622666', NULL, 1, 1, N'138 Tô hiệu', CAST(N'2021-02-20T00:00:00.000' AS DateTime), N'149fb958744f70c67709bf1378b8dc91    ')
INSERT [dbo].[Shop] ([shopId], [shopCode], [shopName], [address], [phone], [taxCode], [statusId], [wardId], [street], [createDate], [createUserId]) VALUES (N'11acd342735a6bbe73de23e177779933    ', N's1001', N'DOVADI-245 ĐỊNH CÔNG HẠ', N'245 ĐỊNH CÔNG HẠ', N'02445824566', N'147858', 1, NULL, N'245 Định Công Hạ', CAST(N'2021-02-22T14:56:42.217' AS DateTime), N'149fb958744f70c67709bf1378b8dc91    ')
INSERT [dbo].[Shop] ([shopId], [shopCode], [shopName], [address], [phone], [taxCode], [statusId], [wardId], [street], [createDate], [createUserId]) VALUES (N'11ca83c81be86374cad5ba100c6f7bce    ', N's1002', N'DOVADI-807 GIẢI PHÓNG', N'807 GIẢI PHÓNG Hai Bà Trưng', N'02441235688', N'425159    ', 2, 3, N'807 Giải Phóng', CAST(N'2021-02-22T14:32:19.577' AS DateTime), N'149fb958744f70c67709bf1378b8dc91    ')
INSERT [dbo].[Shop] ([shopId], [shopCode], [shopName], [address], [phone], [taxCode], [statusId], [wardId], [street], [createDate], [createUserId]) VALUES (N'1231228944d058dc3b84196123975cb2    ', N'S1004', N'DOVADI-138 TAM TRINH', N'138 Đường Tam Trinh, Yên Sở, Hoàng Mai, Hà Nội, Vietnam', N'02000182256', N'475826    ', 3, 14, N'138 Đường Tam Trinh', CAST(N'2021-02-20T00:00:00.000' AS DateTime), N'149fb958744f70c67709bf1378b8dc91    ')
INSERT [dbo].[Shop] ([shopId], [shopCode], [shopName], [address], [phone], [taxCode], [statusId], [wardId], [street], [createDate], [createUserId]) VALUES (N'12596832665220479ec008fd2f807219    ', N'S1003', N'DOVADI-546 CẦU DẬU', N'546 Cầu Dậu, Thanh Liệt, Thanh Trì, Hà Nội, Vietnam', N'02000024566', N'123456    ', 1, 10, N'546 Cầu Dậu', CAST(N'2021-02-20T00:00:00.000' AS DateTime), N'149fb958744f70c67709bf1378b8dc91    ')
INSERT [dbo].[Shop] ([shopId], [shopCode], [shopName], [address], [phone], [taxCode], [statusId], [wardId], [street], [createDate], [createUserId]) VALUES (N'12668a601dcb5fa6a809bf1378b8dc91    ', N'S1005', N'DOVADI-165 THANH ĐÀM', N'165 Thanh Đàm, Thanh Trì, Hoàng Mai, Hà Nội, Vietnam', N'02018001800', N'789128    ', 4, 9, N'165 Thanh Đàm', CAST(N'2021-02-20T00:00:00.000' AS DateTime), N'149fb958744f70c67709bf1378b8dc91    ')
INSERT [dbo].[Shop] ([shopId], [shopCode], [shopName], [address], [phone], [taxCode], [statusId], [wardId], [street], [createDate], [createUserId]) VALUES (N'16dd5d890baf4a8d8f942c11442d61c8    ', N's1024', N'DOVIDA 	78	Cầu Giấy', N'78	Cầu Giấy', N'35940855684', N'537691', 1, 1, N'78	Cầu Giấy', CAST(N'2021-02-22T08:42:25.290' AS DateTime), NULL)
INSERT [dbo].[Shop] ([shopId], [shopCode], [shopName], [address], [phone], [taxCode], [statusId], [wardId], [street], [createDate], [createUserId]) VALUES (N'2fee76cbfbd14d9eb1083843b3cc518e    ', N'1026', N'DOVIDA 80	Cầu Giấy', N'1000012', N'', N'', 1, 1, N'', CAST(N'2021-02-22T08:58:09.920' AS DateTime), NULL)
INSERT [dbo].[Shop] ([shopId], [shopCode], [shopName], [address], [phone], [taxCode], [statusId], [wardId], [street], [createDate], [createUserId]) VALUES (N'3f6ba444d9fb412bb1459d2ff4ac2713    ', N's1033', N'DOVIDA 	113	Láng Hạ', N'113	Láng Hạ', N'48790065573', N'386012', 1, 1, N'113	Láng Hạ', CAST(N'2021-02-22T09:08:05.583' AS DateTime), NULL)
INSERT [dbo].[Shop] ([shopId], [shopCode], [shopName], [address], [phone], [taxCode], [statusId], [wardId], [street], [createDate], [createUserId]) VALUES (N'46370eb8ef7e4b2a9086dbdb37dfc0bf    ', N's1006', N'Hiếu Minh Vũ7', N'236 Hoàng Quốc Việt', N'0369520662', N'0350', 1, 7, N'Trần cung', CAST(N'2021-09-02T00:00:00.000' AS DateTime), N'149fb958744f70c67709bf1378b8dc91    ')
INSERT [dbo].[Shop] ([shopId], [shopCode], [shopName], [address], [phone], [taxCode], [statusId], [wardId], [street], [createDate], [createUserId]) VALUES (N'4a7c217028d24743b72ae9cee77abd66    ', N's1028', N'DOVIDA 	82	Cầu Giấy', N'82	Cầu Giấy', N'85254927864', N'111083', 1, 1, N'82	Cầu Giấy', CAST(N'2021-02-22T08:59:52.567' AS DateTime), NULL)
INSERT [dbo].[Shop] ([shopId], [shopCode], [shopName], [address], [phone], [taxCode], [statusId], [wardId], [street], [createDate], [createUserId]) VALUES (N'5bdd7b470a244b48936e06b621421fae    ', N's1035', N'DOVIDA 	179	Láng Hạ', N'179	Láng Hạ', N'55827086904', N'903049', 1, 1, N'179	Láng Hạ', CAST(N'2021-02-22T20:48:51.910' AS DateTime), NULL)
INSERT [dbo].[Shop] ([shopId], [shopCode], [shopName], [address], [phone], [taxCode], [statusId], [wardId], [street], [createDate], [createUserId]) VALUES (N'5cb12c6c7c9142d8a10347d5a0ae706b    ', N's1023', N'DOVIDA 	77	Cầu Giấy', N'77	Cầu Giấy', N'48299639190', N'380629', 1, 1, N'77	Cầu Giấy', CAST(N'2021-02-22T08:39:40.390' AS DateTime), NULL)
INSERT [dbo].[Shop] ([shopId], [shopCode], [shopName], [address], [phone], [taxCode], [statusId], [wardId], [street], [createDate], [createUserId]) VALUES (N'685f46a71fda4dfc89273aabad70a3f7    ', N'1036', N'DOVIDA 	778	Láng Hạ', N'778	Láng Hạ', N'15652801644', N'716163', 1, 5, N'778	Láng Hạ', CAST(N'2021-02-23T23:58:07.790' AS DateTime), NULL)
INSERT [dbo].[Shop] ([shopId], [shopCode], [shopName], [address], [phone], [taxCode], [statusId], [wardId], [street], [createDate], [createUserId]) VALUES (N'6d05c9e3316d4ec5bdda67bcabfc8d18    ', N's1022', N'DOVIDA 	76 Trần Phú', N'76 Trần Phú', N'43387495568', N'290277', 1, 1, N'Trần Phú', CAST(N'2021-02-22T08:13:50.390' AS DateTime), NULL)
INSERT [dbo].[Shop] ([shopId], [shopCode], [shopName], [address], [phone], [taxCode], [statusId], [wardId], [street], [createDate], [createUserId]) VALUES (N'6fd72fbdef4e4655a26740e47d09a7b9    ', N's1026', N'DOVIDA 	79Cầu Giấy', N'79Cầu Giấy', N'58892658383', N'429441', 1, 1, N'79Cầu Giấy', CAST(N'2021-02-22T08:49:11.203' AS DateTime), NULL)
INSERT [dbo].[Shop] ([shopId], [shopCode], [shopName], [address], [phone], [taxCode], [statusId], [wardId], [street], [createDate], [createUserId]) VALUES (N'7f68318985824f4b8d9e33cd45a76687    ', N's1037', N'DOVIDA 	137	Láng Hạ', N'137	Láng Hạ', N'41944730515', N'763922', 1, 14, N'137	Láng Hạ', CAST(N'2021-02-24T00:06:17.090' AS DateTime), NULL)
INSERT [dbo].[Shop] ([shopId], [shopCode], [shopName], [address], [phone], [taxCode], [statusId], [wardId], [street], [createDate], [createUserId]) VALUES (N'84388f16453e444e897bc772ec51795c    ', N's1027', N'DOVIDA 	81	Cầu Giấy', N'81	Cầu Giấy', N'89915490564', N'757268', 1, 1, N'81	Cầu Giấy', CAST(N'2021-02-22T08:57:44.647' AS DateTime), NULL)
INSERT [dbo].[Shop] ([shopId], [shopCode], [shopName], [address], [phone], [taxCode], [statusId], [wardId], [street], [createDate], [createUserId]) VALUES (N'8cc5a5f66de44f17bfa5276f716d02bc    ', N's1034', N'DOVIDA 	925	Láng Hạ', N'925	Láng Hạ', N'67718819794', N'401421', 1, 1, N'925	Láng Hạ', CAST(N'2021-02-22T09:09:28.400' AS DateTime), NULL)
INSERT [dbo].[Shop] ([shopId], [shopCode], [shopName], [address], [phone], [taxCode], [statusId], [wardId], [street], [createDate], [createUserId]) VALUES (N'963e684a0fb34ba084a023dca342ee9c    ', N's1020', N'DOVIDA -69	Cầu Giấy', N'1000001', N'68664931127', N'170155', 1, 1, N'69	Cầu Giấy', CAST(N'2021-02-22T00:02:05.413' AS DateTime), NULL)
INSERT [dbo].[Shop] ([shopId], [shopCode], [shopName], [address], [phone], [taxCode], [statusId], [wardId], [street], [createDate], [createUserId]) VALUES (N'abfb297f59d244bba46c18b25567c1ae    ', N's1025', N'DOVIDA 	79	Cầu Giấy', N'79	Cầu Giấy', N'10567479035', N'289822', 1, 1, N'79	Cầu Giấy', CAST(N'2021-02-22T08:45:16.790' AS DateTime), NULL)
INSERT [dbo].[Shop] ([shopId], [shopCode], [shopName], [address], [phone], [taxCode], [statusId], [wardId], [street], [createDate], [createUserId]) VALUES (N'b514bdf327484f818003580e6dfe42de    ', N's1013', N'DOVADI-101 DUY TÂN', N'101 Duy Tân', N'234234', N'234234', 1, 1, N'32ds f sd', CAST(N'2021-02-21T23:37:58.207' AS DateTime), NULL)
INSERT [dbo].[Shop] ([shopId], [shopCode], [shopName], [address], [phone], [taxCode], [statusId], [wardId], [street], [createDate], [createUserId]) VALUES (N'bdb2d54d27404917beb0d29ed7dea9dd    ', N's1210', N'DOVIDA 	73 Cầu Giấy', N'73 Cầu Giấy', N'35580161066', N'412098', 1, 1, N'73 Cầu Giấy', CAST(N'2021-02-22T00:06:21.397' AS DateTime), NULL)
INSERT [dbo].[Shop] ([shopId], [shopCode], [shopName], [address], [phone], [taxCode], [statusId], [wardId], [street], [createDate], [createUserId]) VALUES (N'c21742add2c5470fbdc718ab7b76cb33    ', N'1021', N'DOVIDA 	74	Cầu Giấy', N'74	Cầu Giấy', N'61305334650', N'717845', 1, 1, N'74	Cầu Giấy', CAST(N'2021-02-22T00:07:55.967' AS DateTime), NULL)
INSERT [dbo].[Shop] ([shopId], [shopCode], [shopName], [address], [phone], [taxCode], [statusId], [wardId], [street], [createDate], [createUserId]) VALUES (N'c47e8812eab24aa5b9dcbef2e94b6535    ', N's1029', N'DOVIDA 	83	Cầu Giấy', N'83	Cầu Giấy', N'54567772133', N'647849', 1, 1, N'83	Cầu Giấy', CAST(N'2021-02-22T09:02:20.300' AS DateTime), NULL)
INSERT [dbo].[Shop] ([shopId], [shopCode], [shopName], [address], [phone], [taxCode], [statusId], [wardId], [street], [createDate], [createUserId]) VALUES (N'd6b62bb1951f4263bc3000170f10cbad    ', N'S1019', N'DOVADI 56 CẦU GIẤY', N'56 Cầu Giấy', N'0125456728', N'012458', 1, 1, N'', CAST(N'2021-02-21T23:08:45.257' AS DateTime), NULL)
INSERT [dbo].[Shop] ([shopId], [shopCode], [shopName], [address], [phone], [taxCode], [statusId], [wardId], [street], [createDate], [createUserId]) VALUES (N'd83f6c2f9798400f9ea2416b5549b326    ', N's1021', N'DOVIDA 	75	Cầu Giấy', N'75	Cầu Giấy', N'6745049220', N'301255', 1, 1, N'', CAST(N'2021-02-22T20:47:51.647' AS DateTime), NULL)
INSERT [dbo].[Shop] ([shopId], [shopCode], [shopName], [address], [phone], [taxCode], [statusId], [wardId], [street], [createDate], [createUserId]) VALUES (N'dd5f53aa3e67409fa08183370e24c5e2    ', N's1014', N'DOVIDA-36 THANH NIÊN', N'36 Đường Thanh Niên', N'1456125458', N'345634', 1, 1, N'36 Đường Thanh Niên', CAST(N'2021-02-21T23:42:15.817' AS DateTime), NULL)
INSERT [dbo].[Shop] ([shopId], [shopCode], [shopName], [address], [phone], [taxCode], [statusId], [wardId], [street], [createDate], [createUserId]) VALUES (N'f5ade64ca1114958b7f7f0c458ad7669    ', N's1030', N'DOVIDA 84 Cầu Giấy', N'84 Cầu Giấy', N'0321125785 ', N'904547', 1, 1, N'84 Cầu Giấy', CAST(N'2021-02-22T09:04:09.440' AS DateTime), NULL)
INSERT [dbo].[Shop] ([shopId], [shopCode], [shopName], [address], [phone], [taxCode], [statusId], [wardId], [street], [createDate], [createUserId]) VALUES (N'fc9c118e02de4f1a9067fe7617163069    ', N's1133', N'DOVIDA 	594	Láng Hạ', N'DOVIDA 	594	Láng Hạ', N'31784476199', N'382341', 1, 1, N'594	Láng Hạ', CAST(N'2021-02-23T23:54:58.670' AS DateTime), NULL)
GO
SET IDENTITY_INSERT [dbo].[StatusShop] ON 

INSERT [dbo].[StatusShop] ([statusId], [statusName]) VALUES (1, N'Đang hoạt động')
INSERT [dbo].[StatusShop] ([statusId], [statusName]) VALUES (2, N'Đã đóng cửa')
INSERT [dbo].[StatusShop] ([statusId], [statusName]) VALUES (3, N'Đang xây dựng')
INSERT [dbo].[StatusShop] ([statusId], [statusName]) VALUES (4, N'Đang bảo trì')
SET IDENTITY_INSERT [dbo].[StatusShop] OFF
GO
INSERT [dbo].[User] ([userId], [userName], [password], [fullName], [createDate], [avatar], [userGroupId], [active]) VALUES (N'149fb958744f70c67709bf1378b8dc91    ', N'vuhieumisa', N'123456', N'Vũ Minh Hiếu', NULL, NULL, NULL, 1)
GO
SET IDENTITY_INSERT [dbo].[Ward] ON 

INSERT [dbo].[Ward] ([wardId], [wardName], [districtId]) VALUES (1, N'Đại Kim', 1)
INSERT [dbo].[Ward] ([wardId], [wardName], [districtId]) VALUES (2, N'Định Công', 1)
INSERT [dbo].[Ward] ([wardId], [wardName], [districtId]) VALUES (3, N'Giáp Bát', 1)
INSERT [dbo].[Ward] ([wardId], [wardName], [districtId]) VALUES (4, N'Hoàng Liệt', 1)
INSERT [dbo].[Ward] ([wardId], [wardName], [districtId]) VALUES (5, N'Hoàng Văn Thụ', 1)
INSERT [dbo].[Ward] ([wardId], [wardName], [districtId]) VALUES (6, N'Lĩnh Nam', 1)
INSERT [dbo].[Ward] ([wardId], [wardName], [districtId]) VALUES (7, N'Mai Động', 1)
INSERT [dbo].[Ward] ([wardId], [wardName], [districtId]) VALUES (8, N'Tân Mai', 1)
INSERT [dbo].[Ward] ([wardId], [wardName], [districtId]) VALUES (9, N'Thanh Trì', 1)
INSERT [dbo].[Ward] ([wardId], [wardName], [districtId]) VALUES (10, N'Thịnh Liệt', 1)
INSERT [dbo].[Ward] ([wardId], [wardName], [districtId]) VALUES (11, N'Trần Phú', 1)
INSERT [dbo].[Ward] ([wardId], [wardName], [districtId]) VALUES (12, N'Tương Mai', 1)
INSERT [dbo].[Ward] ([wardId], [wardName], [districtId]) VALUES (13, N'Vĩnh Hưng', 1)
INSERT [dbo].[Ward] ([wardId], [wardName], [districtId]) VALUES (14, N'Yên Sở', 1)
SET IDENTITY_INSERT [dbo].[Ward] OFF
GO
ALTER TABLE [dbo].[Shop] ADD  CONSTRAINT [DF_Shop_statusId]  DEFAULT ((1)) FOR [statusId]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_active]  DEFAULT ((1)) FOR [active]
GO
ALTER TABLE [dbo].[City]  WITH CHECK ADD  CONSTRAINT [FK_City_Country] FOREIGN KEY([countryId])
REFERENCES [dbo].[Country] ([countryId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[City] CHECK CONSTRAINT [FK_City_Country]
GO
ALTER TABLE [dbo].[District]  WITH CHECK ADD  CONSTRAINT [FK_District_City] FOREIGN KEY([cityId])
REFERENCES [dbo].[City] ([cityId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[District] CHECK CONSTRAINT [FK_District_City]
GO
ALTER TABLE [dbo].[Shop]  WITH CHECK ADD  CONSTRAINT [FK_Shop_StatusShop] FOREIGN KEY([statusId])
REFERENCES [dbo].[StatusShop] ([statusId])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Shop] CHECK CONSTRAINT [FK_Shop_StatusShop]
GO
ALTER TABLE [dbo].[Shop]  WITH CHECK ADD  CONSTRAINT [FK_Shop_User] FOREIGN KEY([createUserId])
REFERENCES [dbo].[User] ([userId])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Shop] CHECK CONSTRAINT [FK_Shop_User]
GO
ALTER TABLE [dbo].[Shop]  WITH CHECK ADD  CONSTRAINT [FK_Shop_Ward] FOREIGN KEY([wardId])
REFERENCES [dbo].[Ward] ([wardId])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Shop] CHECK CONSTRAINT [FK_Shop_Ward]
GO
ALTER TABLE [dbo].[Ward]  WITH CHECK ADD  CONSTRAINT [FK_Ward_District] FOREIGN KEY([districtId])
REFERENCES [dbo].[District] ([districtId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Ward] CHECK CONSTRAINT [FK_Ward_District]
GO
/****** Object:  StoredProcedure [dbo].[Proc_DeleteShop]    Script Date: 2/25/2021 8:48:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  create proc [dbo].[Proc_DeleteShop](@shopId char(36))
  as
  begin
		DELETE FROM Shop WHERE shopId = @shopId;
  end
GO
/****** Object:  StoredProcedure [dbo].[Proc_UpdateShop]    Script Date: 2/25/2021 8:48:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  create proc [dbo].[Proc_UpdateShop](@shopId char(36), @shopCode varchar(30),@shopName nvarchar(100) ,@address nvarchar(400) , @phone varchar(20),@taxCode varchar(50),@statusId int,@wardId int ,@street nvarchar(50) ,@createDate datetime,@createUserId char(36))
  as
  begin
  update Shop set [shopCode] = @shopCode, [shopName] = @shopName, [address] = @address, [phone] = @phone,[taxCode]  = @taxCode  ,[statusId]  = @statusId ,[wardId] = @wardId   ,[street]  = @street ,[createDate]  = @createDate ,[createUserId] = @createUserId
  where [shopId] = @shopId

end
GO
/****** Object:  StoredProcedure [dbo].[SelectShop_Proc]    Script Date: 2/25/2021 8:48:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  CREATE proc [dbo].[SelectShop_Proc]
  AS
BEGIN	
	select s.shopId as shopIdString, s.shopCode, s.shopName, s.shopName, s.address, s.phone, s.taxCode, s.statusId, s.street, s.createDate from shop as s 
END
GO
/****** Object:  StoredProcedure [dbo].[SelectShopResult_Proc]    Script Date: 2/25/2021 8:48:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE proc [dbo].[SelectShopResult_Proc](@shopCode nvarchar(30) = N'', @shopName nvarchar(100) = N'', @address nvarchar(400) = N'', @phone nvarchar(20) = N'', @statusId nvarchar(8) = N'')
  AS
BEGIN		
	select s.shopId , s.shopCode, s.shopName, s.shopName, s.address, s.phone, s.taxCode, s.statusId, ss.statusName, s.street, s.createDate, u.userName as createUserName from shop as s left join StatusShop as ss on s.statusId = ss.statusId left join dbo.[User] as u  on s.createUserId = u.userId 
	where shopCode LIKE '%'+@shopCode+ '%'
	and shopName  LIKE '%'+@shopName+ '%' 
	and [address]  LIKE '%'+@address+ '%'
	and ([phone]  LIKE '%'+@phone+ '%' or [phone] is null)
	and (s.statusId  LIKE '%'+@statusId+ '%' or s.statusId is null)
	order by s.createDate desc
	
	

	END
GO
/****** Object:  StoredProcedure [dbo].[SelectShopResultALL_Proc]    Script Date: 2/25/2021 8:48:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  create proc [dbo].[SelectShopResultALL_Proc]
  AS
BEGIN	
	select s.shopId , s.shopCode, s.shopName, s.shopName, s.address, s.phone, s.taxCode, s.statusId, ss.statusName, s.street, s.createDate, u.userName as createUserName from shop as s left join StatusShop as ss on s.statusId = ss.statusId left join dbo.[User] as u  on s.createUserId = u.userId
END
GO
USE [master]
GO
ALTER DATABASE [EShopDB] SET  READ_WRITE 
GO
