USE [master]
GO
/****** Object:  Database [BookRentalShop2024]    Script Date: 2024-04-02 오후 1:03:33 ******/
CREATE DATABASE [BookRentalShop2024]
GO
ALTER DATABASE [BookRentalShop2024] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BookRentalShop2024] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BookRentalShop2024] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BookRentalShop2024] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BookRentalShop2024] SET ARITHABORT OFF 
GO
ALTER DATABASE [BookRentalShop2024] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [BookRentalShop2024] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BookRentalShop2024] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BookRentalShop2024] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BookRentalShop2024] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BookRentalShop2024] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BookRentalShop2024] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BookRentalShop2024] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BookRentalShop2024] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BookRentalShop2024] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BookRentalShop2024] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BookRentalShop2024] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BookRentalShop2024] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BookRentalShop2024] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BookRentalShop2024] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BookRentalShop2024] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BookRentalShop2024] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BookRentalShop2024] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BookRentalShop2024] SET  MULTI_USER 
GO
ALTER DATABASE [BookRentalShop2024] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BookRentalShop2024] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BookRentalShop2024] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BookRentalShop2024] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BookRentalShop2024] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BookRentalShop2024] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [BookRentalShop2024] SET QUERY_STORE = OFF
GO
USE [BookRentalShop2024]
GO
/****** Object:  Table [dbo].[bookstbl]    Script Date: 2024-04-02 오후 1:03:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bookstbl](
	[bookIdx] [int] IDENTITY(1,1) NOT NULL,
	[Author] [varchar](45) NULL,
	[Division] [char](4) NOT NULL,
	[Names] [varchar](100) NULL,
	[ReleaseDate] [date] NULL,
	[ISBN] [varchar](200) NULL,
	[Price] [decimal](10, 0) NULL,
 CONSTRAINT [PK__bookstbl__47504B363C12E306] PRIMARY KEY CLUSTERED 
(
	[bookIdx] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[divtbl]    Script Date: 2024-04-02 오후 1:03:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[divtbl](
	[Division] [char](4) NOT NULL,
	[Names] [varchar](45) NULL,
PRIMARY KEY CLUSTERED 
(
	[Division] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[membertbl]    Script Date: 2024-04-02 오후 1:03:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[membertbl](
	[memberIdx] [int] IDENTITY(1,1) NOT NULL,
	[Names] [varchar](45) NOT NULL,
	[Levels] [char](1) NULL,
	[Addr] [varchar](100) NULL,
	[Mobile] [varchar](13) NULL,
	[Email] [varchar](50) NULL,
 CONSTRAINT [PK__membertb__A6BF400B1232F82A] PRIMARY KEY CLUSTERED 
(
	[memberIdx] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[rentaltbl]    Script Date: 2024-04-02 오후 1:03:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rentaltbl](
	[rentalIdx] [int] IDENTITY(1,1) NOT NULL,
	[memberIdx] [int] NULL,
	[bookIdx] [int] NULL,
	[rentalDate] [date] NULL,
	[returnDate] [date] NULL,
 CONSTRAINT [PK__rentaltb__51E4880D3DF22812] PRIMARY KEY CLUSTERED 
(
	[rentalIdx] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[bookstbl] ON 

INSERT [dbo].[bookstbl] ([bookIdx], [Author], [Division], [Names], [ReleaseDate], [ISBN], [Price]) VALUES (1, N'넬레 노이하우스', N'B001', N'잔혹한 어머니의 날 1', CAST(N'2019-10-07' AS Date), N'9791158791179', CAST(11520 AS Decimal(10, 0)))
INSERT [dbo].[bookstbl] ([bookIdx], [Author], [Division], [Names], [ReleaseDate], [ISBN], [Price]) VALUES (2, N'넬레 노이하우스', N'B001', N'잔혹한 어머니의 날 2', CAST(N'2019-10-07' AS Date), N'9791158791186', CAST(11520 AS Decimal(10, 0)))
INSERT [dbo].[bookstbl] ([bookIdx], [Author], [Division], [Names], [ReleaseDate], [ISBN], [Price]) VALUES (3, N'매뉴 라인하트', N'B006', N'월드 오브 워크래프트 팝업북', CAST(N'2019-10-21' AS Date), N'9788959527779', CAST(52200 AS Decimal(10, 0)))
INSERT [dbo].[bookstbl] ([bookIdx], [Author], [Division], [Names], [ReleaseDate], [ISBN], [Price]) VALUES (4, N'묵향동후', N'B003', N'마도조사 2', CAST(N'2019-09-03' AS Date), N'9791127852122', CAST(12600 AS Decimal(10, 0)))
INSERT [dbo].[bookstbl] ([bookIdx], [Author], [Division], [Names], [ReleaseDate], [ISBN], [Price]) VALUES (5, N'오코제키 다이', N'B005', N'루팡의 딸', CAST(N'2019-09-25' AS Date), N'9788998274412', CAST(13500 AS Decimal(10, 0)))
INSERT [dbo].[bookstbl] ([bookIdx], [Author], [Division], [Names], [ReleaseDate], [ISBN], [Price]) VALUES (6, N'조엘 디케르', N'B001', N'스테파니 메일러 실종사건', CAST(N'2019-08-12' AS Date), N'9788984373761', CAST(16200 AS Decimal(10, 0)))
INSERT [dbo].[bookstbl] ([bookIdx], [Author], [Division], [Names], [ReleaseDate], [ISBN], [Price]) VALUES (7, N'이지환', N'B002', N'닥터 퀸 1-2세트', CAST(N'2019-09-20' AS Date), N'9791164664122', CAST(27000 AS Decimal(10, 0)))
INSERT [dbo].[bookstbl] ([bookIdx], [Author], [Division], [Names], [ReleaseDate], [ISBN], [Price]) VALUES (8, N'김수지', N'B002', N'희란국 연가', CAST(N'2019-11-01' AS Date), N'9791131594100', CAST(14000 AS Decimal(10, 0)))
INSERT [dbo].[bookstbl] ([bookIdx], [Author], [Division], [Names], [ReleaseDate], [ISBN], [Price]) VALUES (9, N'알파타르트', N'B002', N'재혼 황후 1', CAST(N'2019-10-18' AS Date), N'9791164790289', CAST(14000 AS Decimal(10, 0)))
INSERT [dbo].[bookstbl] ([bookIdx], [Author], [Division], [Names], [ReleaseDate], [ISBN], [Price]) VALUES (10, N'안나 토드', N'B002', N'애프터 7', CAST(N'2019-08-30' AS Date), N'9791188253166', CAST(14000 AS Decimal(10, 0)))
INSERT [dbo].[bookstbl] ([bookIdx], [Author], [Division], [Names], [ReleaseDate], [ISBN], [Price]) VALUES (11, N'안타 토드', N'B002', N'애프터 8', CAST(N'2019-08-30' AS Date), N'9791188253173', CAST(14000 AS Decimal(10, 0)))
INSERT [dbo].[bookstbl] ([bookIdx], [Author], [Division], [Names], [ReleaseDate], [ISBN], [Price]) VALUES (12, N'남혜인', N'B002', N'아도니스 11', CAST(N'2019-08-26' AS Date), N'9791163022237', CAST(11800 AS Decimal(10, 0)))
INSERT [dbo].[bookstbl] ([bookIdx], [Author], [Division], [Names], [ReleaseDate], [ISBN], [Price]) VALUES (13, N'안드레아스 빙겔만', N'B001', N'쉐어하우스', CAST(N'2019-09-27' AS Date), N'9791186809792', CAST(13320 AS Decimal(10, 0)))
INSERT [dbo].[bookstbl] ([bookIdx], [Author], [Division], [Names], [ReleaseDate], [ISBN], [Price]) VALUES (14, N'비프케 로렌츠', N'B001', N'너도 곧 쉬게 될 거야', CAST(N'2019-09-18' AS Date), N'9791162834930', CAST(12600 AS Decimal(10, 0)))
INSERT [dbo].[bookstbl] ([bookIdx], [Author], [Division], [Names], [ReleaseDate], [ISBN], [Price]) VALUES (15, N'전건우', N'B001', N'어위크', CAST(N'2019-09-02' AS Date), N'9791188660353', CAST(12600 AS Decimal(10, 0)))
INSERT [dbo].[bookstbl] ([bookIdx], [Author], [Division], [Names], [ReleaseDate], [ISBN], [Price]) VALUES (16, N'토머스 해리스', N'B005', N'카리 모라', CAST(N'2019-09-11' AS Date), N'9791158511470', CAST(15000 AS Decimal(10, 0)))
INSERT [dbo].[bookstbl] ([bookIdx], [Author], [Division], [Names], [ReleaseDate], [ISBN], [Price]) VALUES (17, N'토머스 해리스', N'B005', N'한니발', CAST(N'2019-09-11' AS Date), N'9791158511500', CAST(15000 AS Decimal(10, 0)))
INSERT [dbo].[bookstbl] ([bookIdx], [Author], [Division], [Names], [ReleaseDate], [ISBN], [Price]) VALUES (18, N'정준', N'B003', N'화산전생 17', CAST(N'2019-08-23' AS Date), N'9791128394683', CAST(8000 AS Decimal(10, 0)))
INSERT [dbo].[bookstbl] ([bookIdx], [Author], [Division], [Names], [ReleaseDate], [ISBN], [Price]) VALUES (19, N'묵향동후', N'B003', N'마도조사 1', CAST(N'2019-07-30' AS Date), N'9791127851446', CAST(14000 AS Decimal(10, 0)))
INSERT [dbo].[bookstbl] ([bookIdx], [Author], [Division], [Names], [ReleaseDate], [ISBN], [Price]) VALUES (20, N'용대운', N'B003', N'군림천사 35', CAST(N'2019-07-26' AS Date), N'9788926706763', CAST(9000 AS Decimal(10, 0)))
INSERT [dbo].[bookstbl] ([bookIdx], [Author], [Division], [Names], [ReleaseDate], [ISBN], [Price]) VALUES (21, N'정준', N'B003', N'화산전생 15', CAST(N'2019-04-30' AS Date), N'9791128394669', CAST(8000 AS Decimal(10, 0)))
INSERT [dbo].[bookstbl] ([bookIdx], [Author], [Division], [Names], [ReleaseDate], [ISBN], [Price]) VALUES (22, N'김석진', N'B003', N'삼류무사 2부16', CAST(N'2019-04-02' AS Date), N'9791135413698', CAST(8000 AS Decimal(10, 0)))
INSERT [dbo].[bookstbl] ([bookIdx], [Author], [Division], [Names], [ReleaseDate], [ISBN], [Price]) VALUES (23, N'히가시노 게이고', N'B006', N'기도의 막이 내릴 때', CAST(N'2019-08-06' AS Date), N'9788990982780', CAST(16800 AS Decimal(10, 0)))
INSERT [dbo].[bookstbl] ([bookIdx], [Author], [Division], [Names], [ReleaseDate], [ISBN], [Price]) VALUES (24, N'히가시노 게이고', N'B006', N'악의', CAST(N'2019-07-25' AS Date), N'9788972750031', CAST(14000 AS Decimal(10, 0)))
INSERT [dbo].[bookstbl] ([bookIdx], [Author], [Division], [Names], [ReleaseDate], [ISBN], [Price]) VALUES (25, N'서철원', N'B004', N'최후의 만찬', CAST(N'2019-09-25' AS Date), N'9791130625843', CAST(15000 AS Decimal(10, 0)))
INSERT [dbo].[bookstbl] ([bookIdx], [Author], [Division], [Names], [ReleaseDate], [ISBN], [Price]) VALUES (26, N'마이 셰발, 페르 발뢰', N'B004', N'어느 끔찍한 남자', CAST(N'2019-09-20' AS Date), N'9788954657648', CAST(12800 AS Decimal(10, 0)))
INSERT [dbo].[bookstbl] ([bookIdx], [Author], [Division], [Names], [ReleaseDate], [ISBN], [Price]) VALUES (27, N'마이 셰발, 페르 발뢰', N'B004', N'폴리스, 폴리스, 포타티스모스!', CAST(N'2019-09-20' AS Date), N'9788954656535', CAST(13800 AS Decimal(10, 0)))
INSERT [dbo].[bookstbl] ([bookIdx], [Author], [Division], [Names], [ReleaseDate], [ISBN], [Price]) VALUES (28, N'김진명', N'B004', N'살수 1', CAST(N'2019-09-16' AS Date), N'9788925567716', CAST(14800 AS Decimal(10, 0)))
INSERT [dbo].[bookstbl] ([bookIdx], [Author], [Division], [Names], [ReleaseDate], [ISBN], [Price]) VALUES (29, N'김진명', N'B004', N'살수 2', CAST(N'2019-09-16' AS Date), N'9788925567723', CAST(14800 AS Decimal(10, 0)))
INSERT [dbo].[bookstbl] ([bookIdx], [Author], [Division], [Names], [ReleaseDate], [ISBN], [Price]) VALUES (30, N'손정미', N'B004', N'도공 서란', CAST(N'2019-09-16' AS Date), N'9788965708575', CAST(14000 AS Decimal(10, 0)))
INSERT [dbo].[bookstbl] ([bookIdx], [Author], [Division], [Names], [ReleaseDate], [ISBN], [Price]) VALUES (31, N'요안나', N'B002', N'순수하지 않은 감각', CAST(N'2019-10-02' AS Date), N'9791135445705', CAST(12500 AS Decimal(10, 0)))
INSERT [dbo].[bookstbl] ([bookIdx], [Author], [Division], [Names], [ReleaseDate], [ISBN], [Price]) VALUES (32, N'노승아', N'B002', N'오늘부터 천생연분 1', CAST(N'2019-09-18' AS Date), N'9791130039480', CAST(12800 AS Decimal(10, 0)))
INSERT [dbo].[bookstbl] ([bookIdx], [Author], [Division], [Names], [ReleaseDate], [ISBN], [Price]) VALUES (33, N'노승아', N'B002', N'오늘부터 선생연분 2', CAST(N'2019-09-18' AS Date), N'9791130039497', CAST(12800 AS Decimal(10, 0)))
INSERT [dbo].[bookstbl] ([bookIdx], [Author], [Division], [Names], [ReleaseDate], [ISBN], [Price]) VALUES (34, N'김이랑', N'B002', N'조선혼담공작소 꽃파당', CAST(N'2019-09-06' AS Date), N'9791159099724', CAST(138000 AS Decimal(10, 0)))
INSERT [dbo].[bookstbl] ([bookIdx], [Author], [Division], [Names], [ReleaseDate], [ISBN], [Price]) VALUES (35, N'전민석', N'B004', N'감치', CAST(N'2019-08-15' AS Date), N'9788947545075', CAST(15000 AS Decimal(10, 0)))
INSERT [dbo].[bookstbl] ([bookIdx], [Author], [Division], [Names], [ReleaseDate], [ISBN], [Price]) VALUES (36, N'나관중', N'B004', N'삼국지 세크', CAST(N'2019-07-25' AS Date), N'9788936479497', CAST(60000 AS Decimal(10, 0)))
INSERT [dbo].[bookstbl] ([bookIdx], [Author], [Division], [Names], [ReleaseDate], [ISBN], [Price]) VALUES (37, N'에리크 뷔야르', N'B004', N'그날의 비밀', CAST(N'2019-07-20' AS Date), N'9788932919751', CAST(12800 AS Decimal(10, 0)))
INSERT [dbo].[bookstbl] ([bookIdx], [Author], [Division], [Names], [ReleaseDate], [ISBN], [Price]) VALUES (38, N'요 네스뵈', N'B004', N'폴리스', CAST(N'2019-07-08' AS Date), N'9788934996699', CAST(16000 AS Decimal(10, 0)))
INSERT [dbo].[bookstbl] ([bookIdx], [Author], [Division], [Names], [ReleaseDate], [ISBN], [Price]) VALUES (39, N'T. M. 로건', N'B005', N'29초', CAST(N'2019-09-18' AS Date), N'9788950983208', CAST(15000 AS Decimal(10, 0)))
INSERT [dbo].[bookstbl] ([bookIdx], [Author], [Division], [Names], [ReleaseDate], [ISBN], [Price]) VALUES (40, N'토머스 해리스', N'B005', N'양들의 침묵', CAST(N'2019-09-11' AS Date), N'9791158511494', CAST(15000 AS Decimal(10, 0)))
INSERT [dbo].[bookstbl] ([bookIdx], [Author], [Division], [Names], [ReleaseDate], [ISBN], [Price]) VALUES (41, N'송시우', N'B005', N'대나무가 우는 섬', CAST(N'2019-09-06' AS Date), N'9788952739087', CAST(14000 AS Decimal(10, 0)))
INSERT [dbo].[bookstbl] ([bookIdx], [Author], [Division], [Names], [ReleaseDate], [ISBN], [Price]) VALUES (42, N'A. J. 핀', N'B005', N'우먼 인 윈도', CAST(N'2019-09-03' AS Date), N'9788934998952', CAST(15800 AS Decimal(10, 0)))
INSERT [dbo].[bookstbl] ([bookIdx], [Author], [Division], [Names], [ReleaseDate], [ISBN], [Price]) VALUES (43, N'이정명', N'B005', N'밤의 양들 1', CAST(N'2019-08-30' AS Date), N'9791189982461', CAST(11500 AS Decimal(10, 0)))
INSERT [dbo].[bookstbl] ([bookIdx], [Author], [Division], [Names], [ReleaseDate], [ISBN], [Price]) VALUES (44, N'이정명', N'B005', N'밤의 양들 2', CAST(N'2019-08-30' AS Date), N'9791189982478', CAST(11500 AS Decimal(10, 0)))
INSERT [dbo].[bookstbl] ([bookIdx], [Author], [Division], [Names], [ReleaseDate], [ISBN], [Price]) VALUES (45, N'정해연', N'B005', N'내가 죽였다', CAST(N'2019-08-21' AS Date), N'9791160748604', CAST(14000 AS Decimal(10, 0)))
INSERT [dbo].[bookstbl] ([bookIdx], [Author], [Division], [Names], [ReleaseDate], [ISBN], [Price]) VALUES (46, N'정준', N'B003', N'화산전생 16', CAST(N'2019-07-19' AS Date), N'9791128394676', CAST(8000 AS Decimal(10, 0)))
INSERT [dbo].[bookstbl] ([bookIdx], [Author], [Division], [Names], [ReleaseDate], [ISBN], [Price]) VALUES (47, N'무공진', N'B003', N'화중매 상하 세트', CAST(N'2019-07-15' AS Date), N'9791162764428', CAST(32000 AS Decimal(10, 0)))
INSERT [dbo].[bookstbl] ([bookIdx], [Author], [Division], [Names], [ReleaseDate], [ISBN], [Price]) VALUES (48, N'촌부', N'B003', N'천애협로 10', CAST(N'2019-06-03' AS Date), N'9791104920066', CAST(8000 AS Decimal(10, 0)))
INSERT [dbo].[bookstbl] ([bookIdx], [Author], [Division], [Names], [ReleaseDate], [ISBN], [Price]) VALUES (49, N'손선영', N'B003', N'소암, 바람의 노래', CAST(N'2019-05-17' AS Date), N'9791187440475', CAST(13800 AS Decimal(10, 0)))
INSERT [dbo].[bookstbl] ([bookIdx], [Author], [Division], [Names], [ReleaseDate], [ISBN], [Price]) VALUES (50, N'전민희', N'B006', N'룬의 아이들 블러디드 2', CAST(N'2019-09-25' AS Date), N'9788954657556', CAST(14500 AS Decimal(10, 0)))
INSERT [dbo].[bookstbl] ([bookIdx], [Author], [Division], [Names], [ReleaseDate], [ISBN], [Price]) VALUES (51, N'요나스 요나손', N'B006', N'핵을 들고 도망친 101세 노인', CAST(N'2019-09-25' AS Date), N'9788932919874', CAST(14800 AS Decimal(10, 0)))
INSERT [dbo].[bookstbl] ([bookIdx], [Author], [Division], [Names], [ReleaseDate], [ISBN], [Price]) VALUES (52, N'닐 셔스터먼, 재러드 셔스터먼', N'B006', N'드라이', CAST(N'2019-09-20' AS Date), N'9788936477783', CAST(15800 AS Decimal(10, 0)))
INSERT [dbo].[bookstbl] ([bookIdx], [Author], [Division], [Names], [ReleaseDate], [ISBN], [Price]) VALUES (53, N'스테파니 버지스', N'B006', N'초콜릿 하트 드래곤', CAST(N'2019-09-04' AS Date), N'9791135443947', CAST(14800 AS Decimal(10, 0)))
INSERT [dbo].[bookstbl] ([bookIdx], [Author], [Division], [Names], [ReleaseDate], [ISBN], [Price]) VALUES (54, N'브누아 필리퐁', N'B001', N'루거 총을 든 할머니', CAST(N'2019-07-30' AS Date), N'9791190182591', CAST(13500 AS Decimal(10, 0)))
INSERT [dbo].[bookstbl] ([bookIdx], [Author], [Division], [Names], [ReleaseDate], [ISBN], [Price]) VALUES (55, N'캐서린 스테드먼', N'B001', N'썸씽 인 더 워터', CAST(N'2019-07-24' AS Date), N'9788950982164', CAST(13500 AS Decimal(10, 0)))
INSERT [dbo].[bookstbl] ([bookIdx], [Author], [Division], [Names], [ReleaseDate], [ISBN], [Price]) VALUES (56, N'에이미 몰로이', N'B001', N'퍼펙트 마더', CAST(N'2019-07-22' AS Date), N'9791130623177', CAST(14220 AS Decimal(10, 0)))
INSERT [dbo].[bookstbl] ([bookIdx], [Author], [Division], [Names], [ReleaseDate], [ISBN], [Price]) VALUES (57, N'지건, 콕콕', N'B001', N'잔혹동화', CAST(N'2019-07-20' AS Date), N'9791161950938', CAST(12420 AS Decimal(10, 0)))
INSERT [dbo].[bookstbl] ([bookIdx], [Author], [Division], [Names], [ReleaseDate], [ISBN], [Price]) VALUES (58, N'류츠신', N'B006', N'삼체 3', CAST(N'2019-09-25' AS Date), N'9788954439923', CAST(17500 AS Decimal(10, 0)))
INSERT [dbo].[bookstbl] ([bookIdx], [Author], [Division], [Names], [ReleaseDate], [ISBN], [Price]) VALUES (59, N'히가시노 게이고', N'B006', N'방과 후', CAST(N'2019-07-10' AS Date), N'9791163898078', CAST(14800 AS Decimal(10, 0)))
SET IDENTITY_INSERT [dbo].[bookstbl] OFF
GO
INSERT [dbo].[divtbl] ([Division], [Names]) VALUES (N'B001', N'공포/스릴러')
INSERT [dbo].[divtbl] ([Division], [Names]) VALUES (N'B002', N'로맨스')
INSERT [dbo].[divtbl] ([Division], [Names]) VALUES (N'B003', N'무협')
INSERT [dbo].[divtbl] ([Division], [Names]) VALUES (N'B004', N'전쟁/역사')
INSERT [dbo].[divtbl] ([Division], [Names]) VALUES (N'B005', N'추리')
INSERT [dbo].[divtbl] ([Division], [Names]) VALUES (N'B006', N'SF/판타지')
INSERT [dbo].[divtbl] ([Division], [Names]) VALUES (N'I001', N'프로그래밍')
GO
SET IDENTITY_INSERT [dbo].[membertbl] ON 

INSERT [dbo].[membertbl] ([memberIdx], [Names], [Levels], [Addr], [Mobile], [Email]) VALUES (1, N'성명건', N'A', N'부산시 해운대구', N'010-6683-7732', N'smg@naver.com')
INSERT [dbo].[membertbl] ([memberIdx], [Names], [Levels], [Addr], [Mobile], [Email]) VALUES (2, N'고병학', N'A', N'부산시 사하구', N'010-2967-1016', N'gjw@naver.com')
INSERT [dbo].[membertbl] ([memberIdx], [Names], [Levels], [Addr], [Mobile], [Email]) VALUES (3, N'김근아', N'B', N'부산시 남구', N'010-9291-4419', N'gji@daum.com')
INSERT [dbo].[membertbl] ([memberIdx], [Names], [Levels], [Addr], [Mobile], [Email]) VALUES (4, N'김동주', N'B', N'부산시 북구', N'010-8956-7423', N'kys@gmail.com')
INSERT [dbo].[membertbl] ([memberIdx], [Names], [Levels], [Addr], [Mobile], [Email]) VALUES (5, N'김소민', N'D', N'부산시 영도구', N'010-8736-2919', N'jjh@hotmail.com')
INSERT [dbo].[membertbl] ([memberIdx], [Names], [Levels], [Addr], [Mobile], [Email]) VALUES (6, N'김인제', N'A', N'부산시 강서구', N'010-9295-6600', N'psh@yahoo.co.kr')
INSERT [dbo].[membertbl] ([memberIdx], [Names], [Levels], [Addr], [Mobile], [Email]) VALUES (7, N'김재린', N'C', N'부산시 동래구', N'010-5341-0128', N'pyh@naver.com')
INSERT [dbo].[membertbl] ([memberIdx], [Names], [Levels], [Addr], [Mobile], [Email]) VALUES (8, N'김현지', N'A', N'부산시 중구', N'010-2244-0675', N'pjh@empal.com')
INSERT [dbo].[membertbl] ([memberIdx], [Names], [Levels], [Addr], [Mobile], [Email]) VALUES (9, N'노수진', N'D', N'부산시 수영구', N'010-6318-2590', N'phc@hotmail.com')
INSERT [dbo].[membertbl] ([memberIdx], [Names], [Levels], [Addr], [Mobile], [Email]) VALUES (10, N'명수진', N'A', N'부산시 강서구', N'010-5615-1344', N'sms@nate.com')
INSERT [dbo].[membertbl] ([memberIdx], [Names], [Levels], [Addr], [Mobile], [Email]) VALUES (11, N'박나연', N'C', N'김해시 삼안동', N'010-9291-0882', N'ajj@dreamwiz.com')
INSERT [dbo].[membertbl] ([memberIdx], [Names], [Levels], [Addr], [Mobile], [Email]) VALUES (12, N'박성빈', N'D', N'부산시 남구', N'010-8956-6008', N'osyn@korea.com')
INSERT [dbo].[membertbl] ([memberIdx], [Names], [Levels], [Addr], [Mobile], [Email]) VALUES (13, N'손진용', N'A', N'부산시 금정구', N'010-2923-2919', N'oyln@hotmail.com')
INSERT [dbo].[membertbl] ([memberIdx], [Names], [Levels], [Addr], [Mobile], [Email]) VALUES (14, N'오혜진', N'B', N'부산시 부산진구', N'010-9295-5718', N'oyb@gmail.com')
INSERT [dbo].[membertbl] ([memberIdx], [Names], [Levels], [Addr], [Mobile], [Email]) VALUES (15, N'유왕권', N'D', N'부산시 동구', N'010-9341-0128', N'lgy@naver.com')
INSERT [dbo].[membertbl] ([memberIdx], [Names], [Levels], [Addr], [Mobile], [Email]) VALUES (16, N'유창우', N'A', N'부산시 사상구', N'010-5436-0675', N'ldh@hotmail.com')
INSERT [dbo].[membertbl] ([memberIdx], [Names], [Levels], [Addr], [Mobile], [Email]) VALUES (17, N'이경민', N'C', N'부산시 남구', N'010-6318-4654', N'lsj@freechal.com')
INSERT [dbo].[membertbl] ([memberIdx], [Names], [Levels], [Addr], [Mobile], [Email]) VALUES (18, N'이성희', N'A', N'부산시 남구', N'010-5615-7437', N'lyh@nate.com')
INSERT [dbo].[membertbl] ([memberIdx], [Names], [Levels], [Addr], [Mobile], [Email]) VALUES (19, N'이용석', N'B', N'부산시 수영구', N'010-6566-4419', N'ljw@daum.com')
INSERT [dbo].[membertbl] ([memberIdx], [Names], [Levels], [Addr], [Mobile], [Email]) VALUES (20, N'이은수', N'C', N'부산시 사상구', N'010-8956-1508', N'ljh@gmail.com')
INSERT [dbo].[membertbl] ([memberIdx], [Names], [Levels], [Addr], [Mobile], [Email]) VALUES (21, N'이정환', N'B', N'부산시 연제구', N'010-5667-2919', N'lty@hotmail.com')
INSERT [dbo].[membertbl] ([memberIdx], [Names], [Levels], [Addr], [Mobile], [Email]) VALUES (22, N'이주원', N'A', N'부산시 해운대구', N'010-9295-0341', N'lsj@yahoo.com')
INSERT [dbo].[membertbl] ([memberIdx], [Names], [Levels], [Addr], [Mobile], [Email]) VALUES (23, N'이주희', N'A', N'부산시 사하구', N'010-5341-4736', N'lcy@naver.com')
INSERT [dbo].[membertbl] ([memberIdx], [Names], [Levels], [Addr], [Mobile], [Email]) VALUES (24, N'이찬규', N'A', N'부산시 금정구', N'010-2244-5121', N'jsh@empal.com')
INSERT [dbo].[membertbl] ([memberIdx], [Names], [Levels], [Addr], [Mobile], [Email]) VALUES (25, N'허용민', N'B', N'부산시 수영구', N'010-6318-3734', N'jsm@hotmail.com')
INSERT [dbo].[membertbl] ([memberIdx], [Names], [Levels], [Addr], [Mobile], [Email]) VALUES (26, N'홍승욱', N'C', N'부산시 영도구', N'010-9090-7866', N'jjy@gmail.com')
INSERT [dbo].[membertbl] ([memberIdx], [Names], [Levels], [Addr], [Mobile], [Email]) VALUES (27, N'황정우', N'A', N'부산시 남구', N'010-6790-2355', N'jwj@naver.com')
INSERT [dbo].[membertbl] ([memberIdx], [Names], [Levels], [Addr], [Mobile], [Email]) VALUES (28, N'황지환', N'B', N'부산시 중구', N'010-9433-2988', N'csj@naver.com')
INSERT [dbo].[membertbl] ([memberIdx], [Names], [Levels], [Addr], [Mobile], [Email]) VALUES (29, N'홍동현', N'A', N'부산시 북구', N'010-5656-7676', N'gdh@yahoo.com')
INSERT [dbo].[membertbl] ([memberIdx], [Names], [Levels], [Addr], [Mobile], [Email]) VALUES (30, N'한승민', N'B', N'부산시 수영구', N'010-4980-7643', N'hsm@gmail.com')
INSERT [dbo].[membertbl] ([memberIdx], [Names], [Levels], [Addr], [Mobile], [Email]) VALUES (31, N'황소영', N'C', N'부산시 서구', N'010-4388-9078', N'hsy@nate.com')
SET IDENTITY_INSERT [dbo].[membertbl] OFF
GO
SET IDENTITY_INSERT [dbo].[rentaltbl] ON 

INSERT [dbo].[rentaltbl] ([rentalIdx], [memberIdx], [bookIdx], [rentalDate], [returnDate]) VALUES (1, 22, 30, CAST(N'2023-01-03' AS Date), CAST(N'2023-01-15' AS Date))
INSERT [dbo].[rentaltbl] ([rentalIdx], [memberIdx], [bookIdx], [rentalDate], [returnDate]) VALUES (2, 10, 10, CAST(N'2023-02-01' AS Date), NULL)
INSERT [dbo].[rentaltbl] ([rentalIdx], [memberIdx], [bookIdx], [rentalDate], [returnDate]) VALUES (3, 1, 12, CAST(N'2023-02-01' AS Date), CAST(N'2023-02-03' AS Date))
INSERT [dbo].[rentaltbl] ([rentalIdx], [memberIdx], [bookIdx], [rentalDate], [returnDate]) VALUES (4, 25, 34, CAST(N'2023-02-02' AS Date), NULL)
INSERT [dbo].[rentaltbl] ([rentalIdx], [memberIdx], [bookIdx], [rentalDate], [returnDate]) VALUES (5, 23, 22, CAST(N'2023-02-11' AS Date), CAST(N'2023-02-17' AS Date))
INSERT [dbo].[rentaltbl] ([rentalIdx], [memberIdx], [bookIdx], [rentalDate], [returnDate]) VALUES (6, 7, 30, CAST(N'2023-02-14' AS Date), NULL)
INSERT [dbo].[rentaltbl] ([rentalIdx], [memberIdx], [bookIdx], [rentalDate], [returnDate]) VALUES (7, 9, 31, CAST(N'2023-02-14' AS Date), CAST(N'2023-02-17' AS Date))
INSERT [dbo].[rentaltbl] ([rentalIdx], [memberIdx], [bookIdx], [rentalDate], [returnDate]) VALUES (8, 21, 15, CAST(N'2023-02-18' AS Date), CAST(N'2023-02-18' AS Date))
INSERT [dbo].[rentaltbl] ([rentalIdx], [memberIdx], [bookIdx], [rentalDate], [returnDate]) VALUES (9, 22, 17, CAST(N'2023-02-20' AS Date), CAST(N'2023-02-25' AS Date))
INSERT [dbo].[rentaltbl] ([rentalIdx], [memberIdx], [bookIdx], [rentalDate], [returnDate]) VALUES (10, 14, 7, CAST(N'2023-02-26' AS Date), CAST(N'2023-02-28' AS Date))
INSERT [dbo].[rentaltbl] ([rentalIdx], [memberIdx], [bookIdx], [rentalDate], [returnDate]) VALUES (11, 15, 9, CAST(N'2023-03-01' AS Date), CAST(N'2023-03-05' AS Date))
INSERT [dbo].[rentaltbl] ([rentalIdx], [memberIdx], [bookIdx], [rentalDate], [returnDate]) VALUES (12, 19, 44, CAST(N'2023-03-02' AS Date), NULL)
INSERT [dbo].[rentaltbl] ([rentalIdx], [memberIdx], [bookIdx], [rentalDate], [returnDate]) VALUES (13, 20, 59, CAST(N'2023-03-03' AS Date), CAST(N'2023-03-08' AS Date))
INSERT [dbo].[rentaltbl] ([rentalIdx], [memberIdx], [bookIdx], [rentalDate], [returnDate]) VALUES (14, 24, 24, CAST(N'2023-03-08' AS Date), CAST(N'2023-03-09' AS Date))
SET IDENTITY_INSERT [dbo].[rentaltbl] OFF
GO
ALTER TABLE [dbo].[bookstbl] ADD  CONSTRAINT [DF__bookstbl__Author__398D8EEE]  DEFAULT (NULL) FOR [Author]
GO
ALTER TABLE [dbo].[bookstbl] ADD  CONSTRAINT [DF__bookstbl__Names__3B75D760]  DEFAULT (NULL) FOR [Names]
GO
ALTER TABLE [dbo].[bookstbl] ADD  CONSTRAINT [DF__bookstbl__Releas__3C69FB99]  DEFAULT (NULL) FOR [ReleaseDate]
GO
ALTER TABLE [dbo].[bookstbl] ADD  CONSTRAINT [DF__bookstbl__ISBN__3D5E1FD2]  DEFAULT (NULL) FOR [ISBN]
GO
ALTER TABLE [dbo].[bookstbl] ADD  CONSTRAINT [DF__bookstbl__Price__3E52440B]  DEFAULT (NULL) FOR [Price]
GO
ALTER TABLE [dbo].[divtbl] ADD  DEFAULT (NULL) FOR [Names]
GO
ALTER TABLE [dbo].[membertbl] ADD  CONSTRAINT [DF__membertbl__Level__412EB0B6]  DEFAULT (NULL) FOR [Levels]
GO
ALTER TABLE [dbo].[membertbl] ADD  CONSTRAINT [DF__membertbl__Addr__4222D4EF]  DEFAULT (NULL) FOR [Addr]
GO
ALTER TABLE [dbo].[membertbl] ADD  CONSTRAINT [DF__membertbl__Mobil__4316F928]  DEFAULT (NULL) FOR [Mobile]
GO
ALTER TABLE [dbo].[membertbl] ADD  CONSTRAINT [DF__membertbl__Email__440B1D61]  DEFAULT (NULL) FOR [Email]
GO
ALTER TABLE [dbo].[rentaltbl] ADD  CONSTRAINT [DF__rentaltbl__membe__46E78A0C]  DEFAULT (NULL) FOR [memberIdx]
GO
ALTER TABLE [dbo].[rentaltbl] ADD  CONSTRAINT [DF__rentaltbl__bookI__47DBAE45]  DEFAULT (NULL) FOR [bookIdx]
GO
ALTER TABLE [dbo].[rentaltbl] ADD  CONSTRAINT [DF__rentaltbl__renta__48CFD27E]  DEFAULT (NULL) FOR [rentalDate]
GO
ALTER TABLE [dbo].[rentaltbl] ADD  CONSTRAINT [DF__rentaltbl__retur__49C3F6B7]  DEFAULT (NULL) FOR [returnDate]
GO
ALTER TABLE [dbo].[bookstbl]  WITH CHECK ADD  CONSTRAINT [FK__bookstbl__Divisi__3A81B327] FOREIGN KEY([Division])
REFERENCES [dbo].[divtbl] ([Division])
GO
ALTER TABLE [dbo].[bookstbl] CHECK CONSTRAINT [FK__bookstbl__Divisi__3A81B327]
GO
ALTER TABLE [dbo].[rentaltbl]  WITH CHECK ADD  CONSTRAINT [fk_rentaltbl_bookstbl1] FOREIGN KEY([bookIdx])
REFERENCES [dbo].[bookstbl] ([bookIdx])
GO
ALTER TABLE [dbo].[rentaltbl] CHECK CONSTRAINT [fk_rentaltbl_bookstbl1]
GO
ALTER TABLE [dbo].[rentaltbl]  WITH CHECK ADD  CONSTRAINT [fk_rentaltbl_membertbl1] FOREIGN KEY([memberIdx])
REFERENCES [dbo].[membertbl] ([memberIdx])
GO
ALTER TABLE [dbo].[rentaltbl] CHECK CONSTRAINT [fk_rentaltbl_membertbl1]
GO
USE [master]
GO
ALTER DATABASE [BookRentalShop2024] SET  READ_WRITE 
GO
