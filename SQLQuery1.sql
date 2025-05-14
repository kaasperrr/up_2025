create database [PM04_ISP32_TPV]
GO
/****** Object:  Database [PM04_ISP31_ESE]    Script Date: 20.05.2022 10:13:32 ******/

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PM04_ISP33_BSV].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PM04_ISP33_BSV] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PM04_ISP33_BSV] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PM04_ISP33_BSV] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PM04_ISP33_BSV] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PM04_ISP33_BSV] SET ARITHABORT OFF 
GO
ALTER DATABASE [PM04_ISP33_BSV] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PM04_ISP33_BSV] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PM04_ISP33_BSV] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PM04_ISP33_BSV] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PM04_ISP33_BSV] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PM04_ISP33_BSV] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PM04_ISP33_BSV] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PM04_ISP33_BSV] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PM04_ISP33_BSV] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PM04_ISP33_BSV] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PM04_ISP33_BSV] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PM04_ISP33_BSV] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PM04_ISP33_BSV] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PM04_ISP33_BSV] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PM04_ISP33_BSV] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PM04_ISP33_BSV] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PM04_ISP33_BSV] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PM04_ISP33_BSV] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PM04_ISP33_BSV] SET  MULTI_USER 
GO
ALTER DATABASE [PM04_ISP33_BSV] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PM04_ISP33_BSV] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PM04_ISP33_BSV] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PM04_ISP33_BSV] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [PM04_ISP33_BSV] SET DELAYED_DURABILITY = DISABLED 
GO
USE [PM04_ISP33_BSV]
GO
/****** Object:  Table [dbo].[History_UpdateCount]    Script Date: 20.05.2022 10:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[History_UpdateCount](
	[id_historyupdate] [int] IDENTITY(1,1) NOT NULL,
	[name_material] [varchar](50) NULL,
	[count_old] [decimal](18, 2) NULL,
	[count_new] [decimal](18, 2) NULL,
 CONSTRAINT [PK_History_UpdateCount] PRIMARY KEY CLUSTERED 
(
	[id_historyupdate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Material]    Script Date: 20.05.2022 10:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Material](
	[id_material] [int] IDENTITY(1,1) NOT NULL,
	[name_material] [varchar](50) NULL,
	[image] [text] NULL,
	[ostatok] [decimal](18, 2) NULL,
	[cena] [money] NULL,
	[id_type] [int] NULL,
	[opisanie] [varchar](max) NULL,
	[ed_ismer] [varchar](10) NULL,
	[kol_na_sklade] [decimal](18, 2) NULL,
	[kol_v_upakovke] [decimal](18, 2) NULL,
 CONSTRAINT [PK_Material] PRIMARY KEY CLUSTERED 
(
	[id_material] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Material_Produkcia]    Script Date: 20.05.2022 10:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Material_Produkcia](
	[id_material] [int] NOT NULL,
	[id_produkcia] [int] NOT NULL,
	[min_kol_material] [decimal](18, 2) NULL,
 CONSTRAINT [PK_Material_Produkcia_1] PRIMARY KEY CLUSTERED 
(
	[id_material] ASC,
	[id_produkcia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Postavshik]    Script Date: 20.05.2022 10:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Postavshik](
	[id_postavshik] [int] IDENTITY(1,1) NOT NULL,
	[name_postavshik] [varchar](50) NULL,
	[email_postavshik] [varchar](80) NULL,
	[phone_postavshik] [varchar](30) NULL,
	[logo_postavshik] [text] NULL,
 CONSTRAINT [PK_Postavshik] PRIMARY KEY CLUSTERED 
(
	[id_postavshik] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Produkcia]    Script Date: 20.05.2022 10:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Produkcia](
	[id_produkcia] [int] NOT NULL,
	[name_produkcia] [nchar](10) NULL,
	[id_proizvodstvo] [int] NOT NULL,
	[id_type_produkcii] [int] NULL,
 CONSTRAINT [PK_Produkcia] PRIMARY KEY CLUSTERED 
(
	[id_produkcia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Proizvodstvo]    Script Date: 20.05.2022 10:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Proizvodstvo](
	[id_proizvodstvo] [int] IDENTITY(1,1) NOT NULL,
	[name_proizvodstvo] [varchar](50) NULL,
 CONSTRAINT [PK_Proizvodstvo] PRIMARY KEY CLUSTERED 
(
	[id_proizvodstvo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sklad]    Script Date: 20.05.2022 10:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sklad](
	[id_material] [int] NOT NULL,
	[id_postavshik] [int] NOT NULL,
	[stoimost_ed] [money] NULL,
 CONSTRAINT [PK_Sklad] PRIMARY KEY CLUSTERED 
(
	[id_material] ASC,
	[id_postavshik] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sotrudnik]    Script Date: 20.05.2022 10:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sotrudnik](
	[id_sotrudnik] [int] IDENTITY(1,1) NOT NULL,
	[FIO] [varchar](max) NULL,
	[id_proizvodstvo] [int] NOT NULL,
 CONSTRAINT [PK_Sotrudnik] PRIMARY KEY CLUSTERED 
(
	[id_sotrudnik] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Type]    Script Date: 20.05.2022 10:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Type](
	[id_type] [int] IDENTITY(1,1) NOT NULL,
	[name_type] [varchar](50) NULL,
 CONSTRAINT [PK_Type] PRIMARY KEY CLUSTERED 
(
	[id_type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Type_Produkcii]    Script Date: 20.05.2022 10:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Type_Produkcii](
	[id_type_produkcii] [int] IDENTITY(1,1) NOT NULL,
	[type_produkcii] [varchar](20) NULL,
 CONSTRAINT [PK_Type_Produkcii] PRIMARY KEY CLUSTERED 
(
	[id_type_produkcii] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[History_UpdateCount] ON 

INSERT [dbo].[History_UpdateCount] ([id_historyupdate], [name_material], [count_old], [count_new]) VALUES (1, N'драконовое дереводревесина', CAST(567.00 AS Decimal(18, 2)), CAST(547.00 AS Decimal(18, 2)))
INSERT [dbo].[History_UpdateCount] ([id_historyupdate], [name_material], [count_old], [count_new]) VALUES (2, N'бамбук древесина', CAST(53.00 AS Decimal(18, 2)), CAST(53.00 AS Decimal(18, 2)))
INSERT [dbo].[History_UpdateCount] ([id_historyupdate], [name_material], [count_old], [count_new]) VALUES (3, N'пихта древесина', CAST(26.00 AS Decimal(18, 2)), CAST(26.00 AS Decimal(18, 2)))
INSERT [dbo].[History_UpdateCount] ([id_historyupdate], [name_material], [count_old], [count_new]) VALUES (4, N'пихта древесина', CAST(26.00 AS Decimal(18, 2)), CAST(26.00 AS Decimal(18, 2)))
INSERT [dbo].[History_UpdateCount] ([id_historyupdate], [name_material], [count_old], [count_new]) VALUES (5, N'баобаб древесина', CAST(26353.00 AS Decimal(18, 2)), CAST(26353.00 AS Decimal(18, 2)))
INSERT [dbo].[History_UpdateCount] ([id_historyupdate], [name_material], [count_old], [count_new]) VALUES (6, N'брахихитон древесина', CAST(2666.00 AS Decimal(18, 2)), CAST(2666.00 AS Decimal(18, 2)))
INSERT [dbo].[History_UpdateCount] ([id_historyupdate], [name_material], [count_old], [count_new]) VALUES (7, N'берёза', CAST(604.00 AS Decimal(18, 2)), CAST(604.00 AS Decimal(18, 2)))
INSERT [dbo].[History_UpdateCount] ([id_historyupdate], [name_material], [count_old], [count_new]) VALUES (8, N'пихта древесина', CAST(26.00 AS Decimal(18, 2)), CAST(26.00 AS Decimal(18, 2)))
INSERT [dbo].[History_UpdateCount] ([id_historyupdate], [name_material], [count_old], [count_new]) VALUES (9, N'баобаб древесина', CAST(26353.00 AS Decimal(18, 2)), CAST(26353.00 AS Decimal(18, 2)))
INSERT [dbo].[History_UpdateCount] ([id_historyupdate], [name_material], [count_old], [count_new]) VALUES (10, N'брахихитон древесина', CAST(2666.00 AS Decimal(18, 2)), CAST(2666.00 AS Decimal(18, 2)))
INSERT [dbo].[History_UpdateCount] ([id_historyupdate], [name_material], [count_old], [count_new]) VALUES (11, N'драконовое дереводревесина', CAST(547.00 AS Decimal(18, 2)), CAST(547.00 AS Decimal(18, 2)))
INSERT [dbo].[History_UpdateCount] ([id_historyupdate], [name_material], [count_old], [count_new]) VALUES (12, N'пихта древесина', CAST(26.00 AS Decimal(18, 2)), CAST(26.00 AS Decimal(18, 2)))
INSERT [dbo].[History_UpdateCount] ([id_historyupdate], [name_material], [count_old], [count_new]) VALUES (13, N'черная древесина', CAST(7352.00 AS Decimal(18, 2)), CAST(7352.00 AS Decimal(18, 2)))
INSERT [dbo].[History_UpdateCount] ([id_historyupdate], [name_material], [count_old], [count_new]) VALUES (14, N'черная древесина', CAST(7352.00 AS Decimal(18, 2)), CAST(7352.00 AS Decimal(18, 2)))
INSERT [dbo].[History_UpdateCount] ([id_historyupdate], [name_material], [count_old], [count_new]) VALUES (15, N'пихта древесина', CAST(26.00 AS Decimal(18, 2)), CAST(26.00 AS Decimal(18, 2)))
INSERT [dbo].[History_UpdateCount] ([id_historyupdate], [name_material], [count_old], [count_new]) VALUES (16, N'черная древесина', CAST(7352.00 AS Decimal(18, 2)), CAST(7352.00 AS Decimal(18, 2)))
INSERT [dbo].[History_UpdateCount] ([id_historyupdate], [name_material], [count_old], [count_new]) VALUES (17, N'Хвойная древесина', CAST(431.00 AS Decimal(18, 2)), CAST(431.00 AS Decimal(18, 2)))
INSERT [dbo].[History_UpdateCount] ([id_historyupdate], [name_material], [count_old], [count_new]) VALUES (18, N'Хвойная древесина', CAST(431.00 AS Decimal(18, 2)), CAST(431.00 AS Decimal(18, 2)))
INSERT [dbo].[History_UpdateCount] ([id_historyupdate], [name_material], [count_old], [count_new]) VALUES (19, N'хвойная древесина', CAST(431.00 AS Decimal(18, 2)), CAST(431.00 AS Decimal(18, 2)))
INSERT [dbo].[History_UpdateCount] ([id_historyupdate], [name_material], [count_old], [count_new]) VALUES (20, N'Хвойная древесина', CAST(431.00 AS Decimal(18, 2)), CAST(431.00 AS Decimal(18, 2)))
INSERT [dbo].[History_UpdateCount] ([id_historyupdate], [name_material], [count_old], [count_new]) VALUES (21, N'[войная древесина', CAST(431.00 AS Decimal(18, 2)), CAST(431.00 AS Decimal(18, 2)))
INSERT [dbo].[History_UpdateCount] ([id_historyupdate], [name_material], [count_old], [count_new]) VALUES (22, N'{войная древесина', CAST(431.00 AS Decimal(18, 2)), CAST(431.00 AS Decimal(18, 2)))
INSERT [dbo].[History_UpdateCount] ([id_historyupdate], [name_material], [count_old], [count_new]) VALUES (23, N'Хвойная древесина', CAST(431.00 AS Decimal(18, 2)), CAST(431.00 AS Decimal(18, 2)))
INSERT [dbo].[History_UpdateCount] ([id_historyupdate], [name_material], [count_old], [count_new]) VALUES (24, N'Хвойная древесина', CAST(431.00 AS Decimal(18, 2)), CAST(431.00 AS Decimal(18, 2)))
INSERT [dbo].[History_UpdateCount] ([id_historyupdate], [name_material], [count_old], [count_new]) VALUES (25, N'Хвойная древесина', CAST(431.00 AS Decimal(18, 2)), CAST(431.00 AS Decimal(18, 2)))
INSERT [dbo].[History_UpdateCount] ([id_historyupdate], [name_material], [count_old], [count_new]) VALUES (26, N'Хвойная древесина', CAST(431.00 AS Decimal(18, 2)), CAST(431.00 AS Decimal(18, 2)))
INSERT [dbo].[History_UpdateCount] ([id_historyupdate], [name_material], [count_old], [count_new]) VALUES (27, N'Хвойная древесина', CAST(431.00 AS Decimal(18, 2)), CAST(431.00 AS Decimal(18, 2)))
INSERT [dbo].[History_UpdateCount] ([id_historyupdate], [name_material], [count_old], [count_new]) VALUES (28, N'Наруто', CAST(56783.00 AS Decimal(18, 2)), CAST(56783.00 AS Decimal(18, 2)))
INSERT [dbo].[History_UpdateCount] ([id_historyupdate], [name_material], [count_old], [count_new]) VALUES (29, N'хвойная древесина', CAST(431.00 AS Decimal(18, 2)), CAST(431.00 AS Decimal(18, 2)))
INSERT [dbo].[History_UpdateCount] ([id_historyupdate], [name_material], [count_old], [count_new]) VALUES (30, N'анвн', CAST(56783.00 AS Decimal(18, 2)), CAST(56783.00 AS Decimal(18, 2)))
INSERT [dbo].[History_UpdateCount] ([id_historyupdate], [name_material], [count_old], [count_new]) VALUES (31, N'анвн', CAST(56783.00 AS Decimal(18, 2)), CAST(56783.00 AS Decimal(18, 2)))
INSERT [dbo].[History_UpdateCount] ([id_historyupdate], [name_material], [count_old], [count_new]) VALUES (32, N'хвойная древесина', CAST(431.00 AS Decimal(18, 2)), CAST(431.00 AS Decimal(18, 2)))
INSERT [dbo].[History_UpdateCount] ([id_historyupdate], [name_material], [count_old], [count_new]) VALUES (33, N'осина древесина', CAST(34.00 AS Decimal(18, 2)), CAST(34.00 AS Decimal(18, 2)))
INSERT [dbo].[History_UpdateCount] ([id_historyupdate], [name_material], [count_old], [count_new]) VALUES (34, N'осина древесина', CAST(34.00 AS Decimal(18, 2)), CAST(34.00 AS Decimal(18, 2)))
INSERT [dbo].[History_UpdateCount] ([id_historyupdate], [name_material], [count_old], [count_new]) VALUES (35, N'осина древесина', CAST(34.00 AS Decimal(18, 2)), CAST(34.00 AS Decimal(18, 2)))
INSERT [dbo].[History_UpdateCount] ([id_historyupdate], [name_material], [count_old], [count_new]) VALUES (36, N'осина древесина', CAST(34.00 AS Decimal(18, 2)), CAST(34.00 AS Decimal(18, 2)))
INSERT [dbo].[History_UpdateCount] ([id_historyupdate], [name_material], [count_old], [count_new]) VALUES (37, N'хвойная древесина', CAST(431.00 AS Decimal(18, 2)), CAST(431.00 AS Decimal(18, 2)))
INSERT [dbo].[History_UpdateCount] ([id_historyupdate], [name_material], [count_old], [count_new]) VALUES (38, N'хвойная древесина', CAST(431.00 AS Decimal(18, 2)), CAST(431.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[History_UpdateCount] OFF
SET IDENTITY_INSERT [dbo].[Material] ON 

INSERT [dbo].[Material] ([id_material], [name_material], [image], [ostatok], [cena], [id_type], [opisanie], [ed_ismer], [kol_na_sklade], [kol_v_upakovke]) VALUES (1, N'хвойная древесина', N'image\хвойная_древесина.jpg', CAST(345.00 AS Decimal(18, 2)), 6353.0000, 2, N'Ядровая порода с узкой заболонью. Ядро коричневое, годичные слои волнистые, смоляных ходов нет, сердцевинные лучи не видны.', N'метры', CAST(431.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)))
INSERT [dbo].[Material] ([id_material], [name_material], [image], [ostatok], [cena], [id_type], [opisanie], [ed_ismer], [kol_na_sklade], [kol_v_upakovke]) VALUES (2, N'ольха древесина', N'\image\ольха_древесина.jpg', CAST(534.00 AS Decimal(18, 2)), 26363.0000, 2, N'Ольховая древесина характеризуется следующими уникальными свойствами, отличающими ее от остальных пород:
мягкая и вязкая волокнистая структура
устойчивость к деформации и образованию трещин
устойчивость к воздействию влаги', N'кв. метры', CAST(80.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)))
INSERT [dbo].[Material] ([id_material], [name_material], [image], [ostatok], [cena], [id_type], [opisanie], [ed_ismer], [kol_na_sklade], [kol_v_upakovke]) VALUES (3, N'эвкалипт древесина', N'\image\эвкалипт_древесина.jpeg', CAST(7689.00 AS Decimal(18, 2)), 67443.0000, 3, N'Древесина обычно свилеватая, иногда прямоволокнистая, с текстурой от среднего до крупного размера и с плотностью в сухом состоянии около 705 кг/м3. Порода нестойкая. ', N'метры', CAST(4437.00 AS Decimal(18, 2)), CAST(13.00 AS Decimal(18, 2)))
INSERT [dbo].[Material] ([id_material], [name_material], [image], [ostatok], [cena], [id_type], [opisanie], [ed_ismer], [kol_na_sklade], [kol_v_upakovke]) VALUES (6, N'берёза', N'\image\picture.jpg', CAST(553.00 AS Decimal(18, 2)), 6754.0000, 1, N'Береза – древесина, обладающая рядом важных свойств:
хорошая теплопроводность
высокая эластичность, средний вес
мягковолокнистая структура – более надежное сращивание ламелей
простота в обработке режущими инструментами', N'кг', CAST(604.00 AS Decimal(18, 2)), CAST(15.00 AS Decimal(18, 2)))
INSERT [dbo].[Material] ([id_material], [name_material], [image], [ostatok], [cena], [id_type], [opisanie], [ed_ismer], [kol_na_sklade], [kol_v_upakovke]) VALUES (7, N'ель древесина', N'\image\ель_древесина.jpg', CAST(5.20 AS Decimal(18, 2)), 4444.0000, 1, N'Древесина деревьев рода Ель, которую, как и древесину пихты, сосны и лиственницы, относят к хвойным породам. В Европе и большей части Северной Азии это название относят почти исключительно к древесине Ели обыкновенной, в Северной Америке так называют прежде всего древесину Ели ситхинской. ', N'метры', CAST(543.00 AS Decimal(18, 2)), CAST(9.00 AS Decimal(18, 2)))
INSERT [dbo].[Material] ([id_material], [name_material], [image], [ostatok], [cena], [id_type], [opisanie], [ed_ismer], [kol_na_sklade], [kol_v_upakovke]) VALUES (8, N'акация древесина', N'\image\акация_древесина.jpg', CAST(26.00 AS Decimal(18, 2)), 725.0000, 2, N'Акация коа — спил ствола. Древесина «австралийского чёрного дерева» и других видов высоко ценится для изготовления мебели и ружейных прикладов, различных отделочных работ, в машиностроении; используется и на топливо. ', N'кв. метры', CAST(6632.00 AS Decimal(18, 2)), CAST(16.00 AS Decimal(18, 2)))
INSERT [dbo].[Material] ([id_material], [name_material], [image], [ostatok], [cena], [id_type], [opisanie], [ed_ismer], [kol_na_sklade], [kol_v_upakovke]) VALUES (9, N'тополь древесина', N'\image\тополь_древесина.jpg', CAST(34.00 AS Decimal(18, 2)), 234.0000, 1, N'Древесина у тополя ядровая, рассеяннососудистая, мягкая, малостойкая к гниению и другим биоповреждениям, вязкая, трудно расщепляется и раскалывается. Показатели износостойкости низкие, способность удерживать крепления близка по своему значению к древесине липы. Заболонь широкая, белого цвета, неявно отделена от ядра серого либо светло­-желтого, реже - желтовато­-коричневого цвета.', N'кв. метры', CAST(34.00 AS Decimal(18, 2)), CAST(53.00 AS Decimal(18, 2)))
INSERT [dbo].[Material] ([id_material], [name_material], [image], [ostatok], [cena], [id_type], [opisanie], [ed_ismer], [kol_na_sklade], [kol_v_upakovke]) VALUES (10, N'бамбук древесина', N'\image\бамбук_древесина.jpg', CAST(14.00 AS Decimal(18, 2)), 523.0000, 2, N'Популярность древесины бамбука, обусловлена ее характеристиками. А именно, плотность древесины бамбука, выше, чем у древесины дуба. А именно, порядка 550-650 кг/м3. Иногда достигает и 700 кг/м3. На самом деле, бамбук не считается, с биологической точки зрения, деревом. И не имеет древесины. Поскольку бамбук относится к траве, семейства злаковых. ', N'метры', CAST(53.00 AS Decimal(18, 2)), CAST(75.00 AS Decimal(18, 2)))
INSERT [dbo].[Material] ([id_material], [name_material], [image], [ostatok], [cena], [id_type], [opisanie], [ed_ismer], [kol_na_sklade], [kol_v_upakovke]) VALUES (11, N'липа древесина', N'\image\липа_древесина.jpg', CAST(752.00 AS Decimal(18, 2)), 326.0000, 1, N'Древесина различных видов деревьев рода Липа. В Европе это Липа европейская и Липа сердцевидная. Древесина липы была излюбленным материалом для скульптур и резьбы по дереву во времена поздней готики. И в наши дни главной областью применения этой древесины остаётся скульптура, различные виды резьбы и изготовление токарных изделий, так как она легко обрабатывается в любых направлениях.', N'кг', CAST(546.00 AS Decimal(18, 2)), CAST(17.00 AS Decimal(18, 2)))
INSERT [dbo].[Material] ([id_material], [name_material], [image], [ostatok], [cena], [id_type], [opisanie], [ed_ismer], [kol_na_sklade], [kol_v_upakovke]) VALUES (12, N'граб древесина', N'\image\граб_древесина.jpg', CAST(54.00 AS Decimal(18, 2)), 445.0000, 2, N'Граб - заболонная рассеянно-сосудистая порода. Древесина белая, иногда с сероватым или желтоватым оттенком, тяжелая, прочная, твердая.', N'кг', CAST(36.00 AS Decimal(18, 2)), CAST(35.00 AS Decimal(18, 2)))
INSERT [dbo].[Material] ([id_material], [name_material], [image], [ostatok], [cena], [id_type], [opisanie], [ed_ismer], [kol_na_sklade], [kol_v_upakovke]) VALUES (13, N'каштан древесина', N'\image\каштан_древесина.jpg', CAST(75.00 AS Decimal(18, 2)), 656.0000, 1, N'Каштан - ядровая порода. Древесина каштана легкая, мягкая, хорошо режется и отделывается. Каштан отличается сероватым или приглушенным красноватым цветом. Ядро каштана по цвету и строению напоминает дубовую древесину. Каштан принадлежит к среднеусыхающим породам древесины. Каштановые пиломатериалы в процессе их сушки могут растрескиваться и коробиться, но в меньшей степени, чем это происходит с дубом.', N'метры', CAST(632.00 AS Decimal(18, 2)), CAST(23.00 AS Decimal(18, 2)))
INSERT [dbo].[Material] ([id_material], [name_material], [image], [ostatok], [cena], [id_type], [opisanie], [ed_ismer], [kol_na_sklade], [kol_v_upakovke]) VALUES (14, N'груша древесина', N'\image\груша_древесина.jpg', CAST(623.00 AS Decimal(18, 2)), 623.0000, 2, N'Древесина груши обладает высокими прочностными показателями наряду с дубом, клёном, ясенем и другими твердо-лиственными породами, в чем-то немного уступая им, а в чем-то и превосходя. При этом следует помнить, что древесина дикой груши заметно прочней и долговечней древесины культурных сортов. ... Древесина груши — излюбленный материал скульпторов-резчиков. Отполированная древесина имеет глянцевито-матовую поверхность и красивый цвет. ', N'кв. метры', CAST(25.00 AS Decimal(18, 2)), CAST(2.00 AS Decimal(18, 2)))
INSERT [dbo].[Material] ([id_material], [name_material], [image], [ostatok], [cena], [id_type], [opisanie], [ed_ismer], [kol_na_sklade], [kol_v_upakovke]) VALUES (15, N'пихта древесина', N'\image\picture.jpg', CAST(2323.00 AS Decimal(18, 2)), 232.0000, 1, NULL, N'кг', CAST(26.00 AS Decimal(18, 2)), CAST(26.00 AS Decimal(18, 2)))
INSERT [dbo].[Material] ([id_material], [name_material], [image], [ostatok], [cena], [id_type], [opisanie], [ed_ismer], [kol_na_sklade], [kol_v_upakovke]) VALUES (16, N'тик древесина', N'\image\тик_древесина.jpg', CAST(5636.00 AS Decimal(18, 2)), 543.0000, 2, N'Действительно уникальные свойства тика вызваны составом данной древесины. В ней до 5% каучука, что очень необычно. ... Тик — отличный материал для уличной, садовой мебели, напольных покрытий, в том числе паркета и декоративной отделки. Благодаря водоотталкивающим свойствам настилы из тика можно применять даже в ванных комнатах, в душевых кабинах.', N'метры', CAST(1343.00 AS Decimal(18, 2)), CAST(23.00 AS Decimal(18, 2)))
INSERT [dbo].[Material] ([id_material], [name_material], [image], [ostatok], [cena], [id_type], [opisanie], [ed_ismer], [kol_na_sklade], [kol_v_upakovke]) VALUES (17, N'сосна древесина', N'\image\сосна_древесина.jpg', CAST(542.00 AS Decimal(18, 2)), 955.0000, 1, N'Древесина деревьев рода Сосна, относящаяся к хвойным породам древесины, так же как ель, пихта, лиственница или тис. В Европе под этим названием понимают почти исключительно древесину Сосны обыкновенной. Существует ряд других видов сосен, древесина которых находит применение в различных областях, среди них Европейский кедр, Сосна веймутова и всё чаще выращиваемая из-за своей стойкости к загрязнению воздуха Сосна чёрная.', N'кг', CAST(67.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)))
INSERT [dbo].[Material] ([id_material], [name_material], [image], [ostatok], [cena], [id_type], [opisanie], [ed_ismer], [kol_na_sklade], [kol_v_upakovke]) VALUES (18, N'тис древесина', N'\image\тис_древесина.jpg', CAST(243.00 AS Decimal(18, 2)), 723.0000, 3, N'Тис — древесина тисов, деревьев рода Taxaceae. Европейский тис это ядровая порода дерева. Узкая заболонь желтовато-белая и занимает от десяти до двадцати годовых колец. Ядро красновато-коричневого цвета. Эта устойчивая, плотная, тяжёлая, твёрдая и в то же время эластичная древесина, имеющая тонкие годовые кольца из-за медленного роста. Её высокая плотность сказывается на её весе. Кубометр тиса весит от 640 до 800 кг.', N'кв. метры', CAST(6235.00 AS Decimal(18, 2)), CAST(24.00 AS Decimal(18, 2)))
INSERT [dbo].[Material] ([id_material], [name_material], [image], [ostatok], [cena], [id_type], [opisanie], [ed_ismer], [kol_na_sklade], [kol_v_upakovke]) VALUES (19, N'венге древесина', N'\image\венге_древесина.jpg', CAST(235.00 AS Decimal(18, 2)), 677.0000, 3, N'Венге — редкая и ценная порода тропической древесины, получаемая от дерева Венге (Millettia laurentii). Родственный вид Milletia ctuhmanii встречается в Восточной Африке и имеет местное название панга-панга (panga panga). Эти две породы сходны по внешнему виду и свойствам. Тяжёлая, твёрдая, устойчивая к давлению древесина. Плотность в сухом состоянии около 880 кг/м? (древесина панга-панга несколько легче — 800 кг/м?). Имеет хорошую сопротивляемость грибкам и насекомым.', N'кг', CAST(865.00 AS Decimal(18, 2)), CAST(7.00 AS Decimal(18, 2)))
INSERT [dbo].[Material] ([id_material], [name_material], [image], [ostatok], [cena], [id_type], [opisanie], [ed_ismer], [kol_na_sklade], [kol_v_upakovke]) VALUES (20, N'мербау древесина', N'\image\мербау_древесина.jpg', CAST(97.00 AS Decimal(18, 2)), 544.0000, 3, N'Мербау — коммерческое название породы древесины деревьев из рода Intsia семейства Бобовые. Красно-коричневая древесина видов мербау, большей частью получаемая от видов Intsia palembanica или Intsia bijuga, похожа по структуре, свойствам и цвету на древесину деревьев рода Afzelia, тверда и прекрасно полируется. Её плотность (при влажности 12 %) составляет около 800 кг/м?.', N'кг', CAST(16.00 AS Decimal(18, 2)), CAST(8.00 AS Decimal(18, 2)))
INSERT [dbo].[Material] ([id_material], [name_material], [image], [ostatok], [cena], [id_type], [opisanie], [ed_ismer], [kol_na_sklade], [kol_v_upakovke]) VALUES (21, N'сирень древесина', N'\image\сирень_древесина.jpg', CAST(998.00 AS Decimal(18, 2)), 644.0000, 2, N'Древесина сирени мелкослоистая с желтоватыми слоями, пронизанными фиолетовыми жилками. Если смазать обработанную поверхность слабо разведенной серной или соляной кислотой, жилки на ней окрашиваются в яркокрасный цвет. Древесина сирени твердая, гибкая, упругая, очень плотная, гладко и чисто отделывается, прекрасно полируется.', N'кг', CAST(47.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)))
INSERT [dbo].[Material] ([id_material], [name_material], [image], [ostatok], [cena], [id_type], [opisanie], [ed_ismer], [kol_na_sklade], [kol_v_upakovke]) VALUES (22, N'яблоня древесина', N'\image\яблоня_древесина.jpg', CAST(96.00 AS Decimal(18, 2)), 56.0000, 2, N'Древесина яблони удивительно твёрдая, отличается стойкостью к износу, чрезвычайно высокой прочностью, сравнимой с древесиной дуба. Прочность яблоневой древесины увеличивается при обработке олифой, а также при обработке льняным маслом. Древесину яблони можно шлифовать, полировать, лущить.', N'кв. метры', CAST(234.00 AS Decimal(18, 2)), CAST(21.00 AS Decimal(18, 2)))
INSERT [dbo].[Material] ([id_material], [name_material], [image], [ostatok], [cena], [id_type], [opisanie], [ed_ismer], [kol_na_sklade], [kol_v_upakovke]) VALUES (24, N'платан древесина', N'\image\платан_древесина.jpg', CAST(54.00 AS Decimal(18, 2)), 4335.0000, 2, N'Древесина платана – зернообразная, крапчатая, а иногда так называемый «очковый платан» дает невероятно красивую текстуру благодаря зонам узлов, расположенных по поверхности разреза. Еще одно свойство древесины платана – блеск. Древесина платана: обработка. Древесина платана хорошо шлифуется, полируется, после чего поверхность глянцевато блестит. Древесина платана неплохо режется, без сколов, а вот гнется не очень хорошо.', N'кг', CAST(524.00 AS Decimal(18, 2)), CAST(54.00 AS Decimal(18, 2)))
INSERT [dbo].[Material] ([id_material], [name_material], [image], [ostatok], [cena], [id_type], [opisanie], [ed_ismer], [kol_na_sklade], [kol_v_upakovke]) VALUES (25, N'боярышник древесина', N'\image\боярышник_древесина.jpg', CAST(835.00 AS Decimal(18, 2)), 422.0000, 2, N'Древесина боярышника однородная, плотная и мелковолокнистая. По прочности и твердости сравнима с орехом, от которого отличается полным отсутствием заметных пор даже в заболонной части. При сушке древесина боярышника практически не растрескивается и не коробится, а стойкость к расслаиванию и сколам позволяет вырезать из нее сложные ажурные детали даже из тонких дощечек.', N'кг', CAST(234.00 AS Decimal(18, 2)), CAST(433.00 AS Decimal(18, 2)))
INSERT [dbo].[Material] ([id_material], [name_material], [image], [ostatok], [cena], [id_type], [opisanie], [ed_ismer], [kol_na_sklade], [kol_v_upakovke]) VALUES (26, N'можжевельник древесина', N'\image\можжевельник_древесина.jpg', CAST(635.00 AS Decimal(18, 2)), 266.0000, 1, N'Древесина можжевельника используется для изготовления бочек под плодовые консервы, квасных кружек и кухонной утвари.
Из нее вытачивают кронштейны, карандаши, крючья для подвешивания мясных окороков. Масло, молоко и другие скоропортящиеся продукты долгое время сохраняются свежими в емкостях из можжевельника. Древесная смола используется в промышленности для изготовления красок, лаков и скипидара.', N'кг', CAST(6524.00 AS Decimal(18, 2)), CAST(3.00 AS Decimal(18, 2)))
INSERT [dbo].[Material] ([id_material], [name_material], [image], [ostatok], [cena], [id_type], [opisanie], [ed_ismer], [kol_na_sklade], [kol_v_upakovke]) VALUES (27, N'черешня древесина', N'\image\черешня_древесина.jpg', CAST(735.00 AS Decimal(18, 2)), 555.0000, 1, N'Древесина черешни, дерева, достигающего 25 м в высоту, естественный ареал которого простирается от Центральной Европы до Турции и Ирака. Это дерево интродуцировано также в Северной Америке, Передней Индии и Северной Африке. Используется в основном для изготовления шпона, внутренней отделки и особенно для изготовления мебели. В качестве топочного материала не играет никакой экономической роли.', N'метры', CAST(5335.00 AS Decimal(18, 2)), CAST(15.00 AS Decimal(18, 2)))
INSERT [dbo].[Material] ([id_material], [name_material], [image], [ostatok], [cena], [id_type], [opisanie], [ed_ismer], [kol_na_sklade], [kol_v_upakovke]) VALUES (28, N'бук древесина', N'\image\бук_древесина.jpg', CAST(8363.00 AS Decimal(18, 2)), 53.0000, 2, N'Древесина различных видов деревьев рода Бук. В Европе этим названием обозначается в первую очередь древесина Бука лесного, используемого в различных целях, особенно при строительстве и изготовлении мебели. Иногда «белым буком» называют древесину граба, которая тем не менее сильно отличается от буковой.', N'кг', CAST(35.00 AS Decimal(18, 2)), CAST(22.00 AS Decimal(18, 2)))
INSERT [dbo].[Material] ([id_material], [name_material], [image], [ostatok], [cena], [id_type], [opisanie], [ed_ismer], [kol_na_sklade], [kol_v_upakovke]) VALUES (29, N'снейквуд древесина', N'\image\снейквуд_древесина.jpg', CAST(634.00 AS Decimal(18, 2)), 2727.0000, 3, N'Змеиное дерево (Snakewood). Ботаническое название — Piratinera guianensis, syn. Brosinum guianensis, сем. Moraceae. ... Свое название снейквуд эта порода получила из-за характерных темных мелких пятен неправильной формы, напоминающих пятна на шкуре леопарда или на коже змеи с цветистой окраской. Отличается причудливой окраской — перемежающиеся красно-коричневые и палево-розоватые нерегулярные горизонтальные волнообразные полосы с черными отметинами и пятнами.', N'кв. метры', CAST(35535.00 AS Decimal(18, 2)), CAST(13.00 AS Decimal(18, 2)))
INSERT [dbo].[Material] ([id_material], [name_material], [image], [ostatok], [cena], [id_type], [opisanie], [ed_ismer], [kol_na_sklade], [kol_v_upakovke]) VALUES (30, N'карагач древесина', N'\image\карагач_древесина.jpg', CAST(574.00 AS Decimal(18, 2)), 3434.0000, 3, N'Древесина дерева карагач обладает полезным свойством сопротивляться гниению при нахождении в среде с повышенной сыростью. Много лет назад в Европейских городах использовали полый ствол дерева как водопроводные трубы.', N'кг', CAST(252.00 AS Decimal(18, 2)), CAST(13.00 AS Decimal(18, 2)))
INSERT [dbo].[Material] ([id_material], [name_material], [image], [ostatok], [cena], [id_type], [opisanie], [ed_ismer], [kol_na_sklade], [kol_v_upakovke]) VALUES (31, N'самшит древесина', N'\image\самшит_древесина.jpg', CAST(635.00 AS Decimal(18, 2)), 335.0000, 3, N'Обработка древесины самшита. Сушить самшит достаточно сложно, поскольку древесина склонна к растрескиванию. Особенно страдает торцовая часть и поверхностный слой. ... Самшит. Полезные свойства. Самшит полностью ядовит и опасен для здоровья и жизни человека при пероральном приеме. Поэтому с ним не стоит экспериментировать и использовать советы народной медицины, где нужно употреблять части самшита внутрь. ', N'метры', CAST(43.00 AS Decimal(18, 2)), CAST(23.00 AS Decimal(18, 2)))
INSERT [dbo].[Material] ([id_material], [name_material], [image], [ostatok], [cena], [id_type], [opisanie], [ed_ismer], [kol_na_sklade], [kol_v_upakovke]) VALUES (32, N'палисандр древесина', N'\image\палисандр_древесина.jpg', CAST(3434.00 AS Decimal(18, 2)), 454.0000, 1, N'Название древесины ряда пород тропических деревьев. Вопреки тому, что БСЭ называет палисандром «древесину некоторых южноамериканских видов жакаранды семейства бигнониевых», более правильным и установившимся следует считать употребление этого названия по отношению к древесине деревьев рода дальбергия семейства бобовых. В английском языке за древесиной палисандра закрепилось название Rosewood, но в русском языке использование его буквального перевода «розовое дерево» является скорее описательным.', N'кг', CAST(5535.00 AS Decimal(18, 2)), CAST(34.00 AS Decimal(18, 2)))
INSERT [dbo].[Material] ([id_material], [name_material], [image], [ostatok], [cena], [id_type], [opisanie], [ed_ismer], [kol_na_sklade], [kol_v_upakovke]) VALUES (33, N'бакаут древесина', N'\image\бакаут_древесина.jpg', CAST(4243.00 AS Decimal(18, 2)), 6263.0000, 2, N'Ценная древесина деревьев рода Guaiacum. Эта древесина использовалась раньше там, где были крайне важны её прочность, вес и твёрдость. Все виды этого рода внесены в настоящее время в Приложение II CITES как потенциально находящиеся под угрозой виды. Бакаут получают главным образом из Guaiacum officinale и Guaiacum sanctum, и тот и другой - небольшие медленно растущие деревья.', N'кв. метры', CAST(3434.00 AS Decimal(18, 2)), CAST(22.00 AS Decimal(18, 2)))
INSERT [dbo].[Material] ([id_material], [name_material], [image], [ostatok], [cena], [id_type], [opisanie], [ed_ismer], [kol_na_sklade], [kol_v_upakovke]) VALUES (34, N'красное древесина', N'\image\красное_древесина.jpg', CAST(242.00 AS Decimal(18, 2)), 34.0000, 2, N'Красное дерево — древесина некоторых видов деревьев, имеющая красные и коричневатые тона, обычно прочная и хорошо поддающаяся обработке. Такая древесина высоко ценится за хорошие механические характеристики, обладает высокой плотностью и прочностью, хорошо полируется.', N'кг', CAST(46.00 AS Decimal(18, 2)), CAST(4.00 AS Decimal(18, 2)))
INSERT [dbo].[Material] ([id_material], [name_material], [image], [ostatok], [cena], [id_type], [opisanie], [ed_ismer], [kol_na_sklade], [kol_v_upakovke]) VALUES (35, N'осина древесина', N'image\осина_древесина.jpg', CAST(3453.00 AS Decimal(18, 2)), 34.0000, 1, N'Осина — древесина различных видов деревьев рода Тополь (лат. Populus) семейства Ивовые. Родина растений рода Тополь — Европа, Азия и Северная Америка. Большинство видов — быстрорастущие деревья, созревающие уже в возрасте от 30 до 50 лет. Эта древесина получается в основном от выращенных деревьев культурных сортов. Всё больше древесины осины и тополей получается не из обычных лесных хозяйств, а из лесных хозяйств короткого цикла.', N'кв. метры', CAST(34.00 AS Decimal(18, 2)), CAST(34.00 AS Decimal(18, 2)))
INSERT [dbo].[Material] ([id_material], [name_material], [image], [ostatok], [cena], [id_type], [opisanie], [ed_ismer], [kol_na_sklade], [kol_v_upakovke]) VALUES (36, N'ильм древесина', N'\image\ильм_древесина.jpg', CAST(242.00 AS Decimal(18, 2)), 48.0000, 2, N'Высушенная древесина ильма относится к малостойкой к гниению в атмосферных условиях. Ее относительная стойкость составляет 2,3 (у бука — 3,3, у дуба - 5,2). Часто используется для нижних венцов колодезных срубов и для свай гидротехнических сооружений и мостов.', N'метры', CAST(2534.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)))
INSERT [dbo].[Material] ([id_material], [name_material], [image], [ostatok], [cena], [id_type], [opisanie], [ed_ismer], [kol_na_sklade], [kol_v_upakovke]) VALUES (37, N'клен древесина', N'\image\клен_древесина.jpg', CAST(836.00 AS Decimal(18, 2)), 52.0000, 3, N'Древесина деревьев рода Клён, включающего в себя до 200 видов деревьев и кустарников, распространённых в Евразии и Северной Америке. Используется прежде всего как строительная древесина или для изготовления мебели, значительно реже в качестве топлива. Экономически значимой является древесина высокорослых видов клёна, в Евразии это такие виды как Явор и Клён остролистный. ', N'кг', CAST(45.00 AS Decimal(18, 2)), CAST(7.00 AS Decimal(18, 2)))
INSERT [dbo].[Material] ([id_material], [name_material], [image], [ostatok], [cena], [id_type], [opisanie], [ed_ismer], [kol_na_sklade], [kol_v_upakovke]) VALUES (38, N'шелковица древесина', N'\image\шелковица_древесина.jpg', CAST(224.00 AS Decimal(18, 2)), 25.0000, 3, N'Древесина шелковицы твёрдая, тяжёлая, с красивой текстурой, цветом и блеском, применяется для бытовых и художественных изделий.
Шелковица — кольцесосудистая порода с очень узкой (3-5 годичных слоёв) желтовато-белой заболонью, резко отделяющейся от красновато-бурого ядра. От действия света древесина темнеет и становится тёмно-бурой.', N'метры', CAST(232.00 AS Decimal(18, 2)), CAST(2.00 AS Decimal(18, 2)))
INSERT [dbo].[Material] ([id_material], [name_material], [image], [ostatok], [cena], [id_type], [opisanie], [ed_ismer], [kol_na_sklade], [kol_v_upakovke]) VALUES (39, N'крушина древесина', N'\image\крушина_древесина.jpg', CAST(363.00 AS Decimal(18, 2)), 42.0000, 2, N'Крушина-род кустарников, реже деревьев, который относится к семейству Крушиновые. Род насчитывает порядка 40 видов. Крушина, распространена в умеренно тёплых и субтропических областях Северного и Южного полушарий. ... Крушина. Свойства древесины. Древесина крушины относится к ядровым породам. Заболонь широкая, светлая с небольшим сероватым оттенком. Ядро красновато-бурого цвета. ', N'кг', CAST(5443.00 AS Decimal(18, 2)), CAST(6.00 AS Decimal(18, 2)))
INSERT [dbo].[Material] ([id_material], [name_material], [image], [ostatok], [cena], [id_type], [opisanie], [ed_ismer], [kol_na_sklade], [kol_v_upakovke]) VALUES (40, N'ива древесина', N'\image\ива_древесина.jpg', CAST(635.00 AS Decimal(18, 2)), 3553.0000, 1, N'Ива — ядровая порода с широкой белой заболонью, нередко отграниченной от буровато-розового ядра. Годичные слои заметны слабо. Сосуды мелкие, сердцевинные лучи узкие, незаметные. Древесина ее мягкая, легкая, мало стойкая против гниения, с невысокой прочностью; по свойствам близка древесине липы.', N'кв. метры', CAST(5134.00 AS Decimal(18, 2)), CAST(25.00 AS Decimal(18, 2)))
INSERT [dbo].[Material] ([id_material], [name_material], [image], [ostatok], [cena], [id_type], [opisanie], [ed_ismer], [kol_na_sklade], [kol_v_upakovke]) VALUES (41, N'баобаб древесина', N'\image\picture.jpg', CAST(545.00 AS Decimal(18, 2)), 33.0000, 2, N'Древесина баобаба очень пористая и рыхлая, представляющая собой фактически губку, впитывающую в сезон дождей тысячи литров воды. Поэтому древесиной баобаба любят лакомиться слоны в период засухи. В силу этих особенностей древесина баобаба не имеет промышленной ценности. Использование. Баобаб является символом Мадагаскара, только здесь произрастает вид баобабов имеющих длинный толстый ствол и небольшую плоскую крону на верху. ', N'кг', CAST(26353.00 AS Decimal(18, 2)), CAST(243.00 AS Decimal(18, 2)))
INSERT [dbo].[Material] ([id_material], [name_material], [image], [ostatok], [cena], [id_type], [opisanie], [ed_ismer], [kol_na_sklade], [kol_v_upakovke]) VALUES (43, N'грецкий орех древесина', N'\image\грецкийорех_древесина.jpg', CAST(735.00 AS Decimal(18, 2)), 25.0000, 3, N'Древесина грецкого ореха принадлежит к самым дорогим видам подобного сырья на рынке. Для покупателя важна, прежде всего, высокая декоративность древесины, но и другие ее качества не остаются без внимания. Древесина хорошо полируется, она плотная и вязкая, устойчива к процессам гниения, разрушению жуками-древоточцами и насекомыми.', N'кг', CAST(35.00 AS Decimal(18, 2)), CAST(13.00 AS Decimal(18, 2)))
INSERT [dbo].[Material] ([id_material], [name_material], [image], [ostatok], [cena], [id_type], [opisanie], [ed_ismer], [kol_na_sklade], [kol_v_upakovke]) VALUES (44, N'амазак древесина', N'\image\амазак_древесина.jpg', CAST(65.00 AS Decimal(18, 2)), 434.0000, 2, N'Амазаку (овангкол, шедуа) - африканская порода деревьев, которую используют в производстве шпона, фанеры, напольных покрытий, эксклюзивной мебели, декоративных элементов, музыкальных инструментов, шкатулок. Близкая родственница - бубинга . Это дерево из того же семейства с такими же механическими свойствами. Имеет такую же красивую текстурой. В отличии от красно-розовой древесины бубинги, амазакуа имеет шоколадно-коричневый оттенок.', N'кв. метры', CAST(423.00 AS Decimal(18, 2)), CAST(22.00 AS Decimal(18, 2)))
INSERT [dbo].[Material] ([id_material], [name_material], [image], [ostatok], [cena], [id_type], [opisanie], [ed_ismer], [kol_na_sklade], [kol_v_upakovke]) VALUES (45, N'гевея древесина', N'\image\гевея_древесина.jpg', CAST(365.00 AS Decimal(18, 2)), 24.0000, 1, N'Гевея – это крепкая и красивая порода древесины. Растение является вечнозеленым и теплолюбивым. Произрастает во влажных тропических лесах Бразилии и Юго-Восточной Азии, в частности, в Малайзии. ... Сок гевеи бело-желтоватого цвета обладает редкими качествами, по эластичности и прочности похожими на резину. По этой причине другое название сока дерева – «резиновый».', N'кг', CAST(1426.00 AS Decimal(18, 2)), CAST(24.00 AS Decimal(18, 2)))
INSERT [dbo].[Material] ([id_material], [name_material], [image], [ostatok], [cena], [id_type], [opisanie], [ed_ismer], [kol_na_sklade], [kol_v_upakovke]) VALUES (46, N'падук древесина', N'\image\падук_древесина.jpg', CAST(725.00 AS Decimal(18, 2)), 42.0000, 2, N'Падук — это экзотическое дерево, произрастающее в жарком тропическом климате. Под общим названием «падук» объединяется порядка 70 видов лесоматериала рода «птерокарпус», что означает «крылатый плод» или «сочное крыло» — именно так в народе называют семена этого дерева. Древесина падука обладает исключительными эксплуатационными характеристиками, потому широко востребована в производственной сфере.', N'метры', CAST(412214.00 AS Decimal(18, 2)), CAST(24.00 AS Decimal(18, 2)))
INSERT [dbo].[Material] ([id_material], [name_material], [image], [ostatok], [cena], [id_type], [opisanie], [ed_ismer], [kol_na_sklade], [kol_v_upakovke]) VALUES (47, N'драконовое дереводревесина', N'\image\драконовоедерево_древесина.jpg', CAST(45.00 AS Decimal(18, 2)), 67.0000, 1, N'Драконово дерево (Dracaena draco) – это реликтовое растение, на его толстых ветках растут пучки очень острых листьев. Драконово дерево при повреждениях ствола выделяет смолистый сок («драконовая кровь»), вначале бесцветный, но на воздухе быстро приобретающий характерный кроваво-красный цвет, обусловленный наличием в нём пигментов дракокармина и дракорубина. ', N'кг', CAST(547.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)))
INSERT [dbo].[Material] ([id_material], [name_material], [image], [ostatok], [cena], [id_type], [opisanie], [ed_ismer], [kol_na_sklade], [kol_v_upakovke]) VALUES (48, N'туя древесина', N'\image\туя_древесина.jpg', CAST(355.00 AS Decimal(18, 2)), 2.0000, 1, N'Западная туя источает приятный арромат. В древесине и листьях содержится эфирное масло. Потому нередко используется в парфюмерии и косметологии. 7. Масло туи обладаем многими целебными свойствами. Так, например, в гомеопатии масло использовалась как средство борьбы с сосудистыми и кожными заболеваниями.', N'кг', CAST(343.00 AS Decimal(18, 2)), CAST(22.00 AS Decimal(18, 2)))
INSERT [dbo].[Material] ([id_material], [name_material], [image], [ostatok], [cena], [id_type], [opisanie], [ed_ismer], [kol_na_sklade], [kol_v_upakovke]) VALUES (49, N'ясень древесина', N'\image\ясень_древесина.jpg', CAST(636.00 AS Decimal(18, 2)), 22.0000, 2, N'Ясень — древесина деревьев вида Ясень обыкновенный (лат. Fraxinus excelsior). Согласно стандарту DIN 4076 для обозначения этой древесины используется сокращение «ES». Ареал ясеня простирается через всю Европу, особенно часто он встречается в северных предгорьях Альп, в Польше и на побережье Балтики. В Центральной Европе бук и ясень считаются важнейшими древесными породами.', N'метры', CAST(3535.00 AS Decimal(18, 2)), CAST(15.00 AS Decimal(18, 2)))
INSERT [dbo].[Material] ([id_material], [name_material], [image], [ostatok], [cena], [id_type], [opisanie], [ed_ismer], [kol_na_sklade], [kol_v_upakovke]) VALUES (50, N'бубинга древесина', N'\image\бубинга_древесина.jpg', CAST(343.00 AS Decimal(18, 2)), 53.0000, 3, N'Технические характеристики древесины бубинги таковы: плотность около 0,9 г/см?, твердость по Бринеллю около 4 ед. (по Янка — 2900). К положительным свойствам относят также высокую биостойкость — бубингу не едят древоточцы, не поражают грибки, гниль и плесень. ... Зато деревообработчики, которые приобрели бубингу, столь нерачительно с ней не обращаются. Большую часть пускают на производство шпона для отделки мебели. ', N'кг', CAST(5453.00 AS Decimal(18, 2)), CAST(45.00 AS Decimal(18, 2)))
INSERT [dbo].[Material] ([id_material], [name_material], [image], [ostatok], [cena], [id_type], [opisanie], [ed_ismer], [kol_na_sklade], [kol_v_upakovke]) VALUES (51, N'брахихитон древесина', N'\image\picture.jpg', CAST(35.00 AS Decimal(18, 2)), 6532.0000, 1, N'Брахихитон — это быстрорастущее вечнозеленое дерево с темно-зеленой густой заостренной листвой, напоминающей тополь. У него широкий ствол, который в молодом возрасте сужается к пирамидальной форме. По мере взросления ствол расширяется и приобретает форму бутылки. В конце весны он производит кремово-белые цветы в форме колокольчиков с пурпурными прожилками. ', N'метры', CAST(2666.00 AS Decimal(18, 2)), CAST(13.00 AS Decimal(18, 2)))
INSERT [dbo].[Material] ([id_material], [name_material], [image], [ostatok], [cena], [id_type], [opisanie], [ed_ismer], [kol_na_sklade], [kol_v_upakovke]) VALUES (52, N'эвкалипт древесина', N'\image\эвкалипт_древесина.jpg', CAST(262.00 AS Decimal(18, 2)), 2262.0000, 2, N'Древесина радужного эвкалипта – настоящий антагонист коре. Она относится к ядровым – однородная, светлая, ровного кремового оттенка, с рассеянными мелкими сосудами. Промышленной зрелости деревья достигают к 20 годам. Свежий материал довольно капризен, требует сушки в естественных условиях, склонен к растрескиванию.', N'кг', CAST(42432.00 AS Decimal(18, 2)), CAST(23.00 AS Decimal(18, 2)))
INSERT [dbo].[Material] ([id_material], [name_material], [image], [ostatok], [cena], [id_type], [opisanie], [ed_ismer], [kol_na_sklade], [kol_v_upakovke]) VALUES (53, N'Черная древесина', N'image\черная_древесина.jpg', NULL, 645.0000, 3, N'', N'', CAST(457.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)))
INSERT [dbo].[Material] ([id_material], [name_material], [image], [ostatok], [cena], [id_type], [opisanie], [ed_ismer], [kol_na_sklade], [kol_v_upakovke]) VALUES (54, N'Черная', N'', NULL, 56.0000, 2, N'апав', N'кг', CAST(65.00 AS Decimal(18, 2)), CAST(6.00 AS Decimal(18, 2)))
INSERT [dbo].[Material] ([id_material], [name_material], [image], [ostatok], [cena], [id_type], [opisanie], [ed_ismer], [kol_na_sklade], [kol_v_upakovke]) VALUES (55, N'анвн', N'', NULL, 2323.0000, 2, N'Наруто', N'67', CAST(56783.00 AS Decimal(18, 2)), CAST(5678.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[Material] OFF
SET IDENTITY_INSERT [dbo].[Postavshik] ON 

INSERT [dbo].[Postavshik] ([id_postavshik], [name_postavshik], [email_postavshik], [phone_postavshik], [logo_postavshik]) VALUES (101, N'Ираклий Максимович Титова', N'elvira07@sysoeva.org', N'8-800-121-66-81', N'\agents\agent_93.png')
INSERT [dbo].[Postavshik] ([id_postavshik], [name_postavshik], [email_postavshik], [phone_postavshik], [logo_postavshik]) VALUES (102, N'Виноградоваа Вера Александровна', N'izolda.vorontov@lytkina.ru', N'(812) 267-19-59', N'\agents\agent_116.png')
INSERT [dbo].[Postavshik] ([id_postavshik], [name_postavshik], [email_postavshik], [phone_postavshik], [logo_postavshik]) VALUES (103, N'Евсеева Болеслав Сергеевич', N'artem.fadeev@polykov.com', N'+7 (922) 467-93-83', N'\agents\agent_66.png')
INSERT [dbo].[Postavshik] ([id_postavshik], [name_postavshik], [email_postavshik], [phone_postavshik], [logo_postavshik]) VALUES (104, N'Гавриил Сергеевич Игнатьев', N'fedotov.platon@pavlov.ru', N'8-800-317-35-79', N'\agents\agent_96.png')
INSERT [dbo].[Postavshik] ([id_postavshik], [name_postavshik], [email_postavshik], [phone_postavshik], [logo_postavshik]) VALUES (105, N'Георгий Александрович Лукин', N'faina.tikonova@veselov.com', N'+7 (922) 851-23-23', N'\agents\agent_58.png')
INSERT [dbo].[Postavshik] ([id_postavshik], [name_postavshik], [email_postavshik], [phone_postavshik], [logo_postavshik]) VALUES (106, N'Алина Борисовна Потаповаа', N'viktoriy.belozerova@isaev.net', N'(495) 931-29-26', NULL)
INSERT [dbo].[Postavshik] ([id_postavshik], [name_postavshik], [email_postavshik], [phone_postavshik], [logo_postavshik]) VALUES (107, N'Изабелла Борисовна Архиповаа', N'nazarov.polina@voronova.ru', N'(495) 445-61-43', N'\agents\agent_108.png')
INSERT [dbo].[Postavshik] ([id_postavshik], [name_postavshik], [email_postavshik], [phone_postavshik], [logo_postavshik]) VALUES (108, N'Дорофеева Зинаида Борисовна', N'lebedeva.larisa@lavrentev.net', N'8-800-232-56-37', N'\agents\agent_97.png')
INSERT [dbo].[Postavshik] ([id_postavshik], [name_postavshik], [email_postavshik], [phone_postavshik], [logo_postavshik]) VALUES (109, N'Тетерина Георгий Сергеевич', N'tamara22@pavlova.com', N'(495) 713-51-83', N'\agents\agent_100.png')
INSERT [dbo].[Postavshik] ([id_postavshik], [name_postavshik], [email_postavshik], [phone_postavshik], [logo_postavshik]) VALUES (110, N'Давид Андреевич Фадеев', N'alina56@zdanov.com', N'(812) 823-93-42', N'\agents\agent_59.png')
INSERT [dbo].[Postavshik] ([id_postavshik], [name_postavshik], [email_postavshik], [phone_postavshik], [logo_postavshik]) VALUES (111, N'Виктор Иванович Молчанов', N'nikodim81@kiseleva.com', N'8-800-582-39-19', N'\agents\agent_38.png')
INSERT [dbo].[Postavshik] ([id_postavshik], [name_postavshik], [email_postavshik], [phone_postavshik], [logo_postavshik]) VALUES (112, N'Тимофеева Григорий Андреевич', N'sermakova@sarova.net', N'(35222) 96-19-26', N'\agents\agent_45.png')
INSERT [dbo].[Postavshik] ([id_postavshik], [name_postavshik], [email_postavshik], [phone_postavshik], [logo_postavshik]) VALUES (113, N'Екатерина Сергеевна Бобылёва', N'dsiryev@dementeva.com', N'8-800-511-43-61', N'\agents\agent_46.png')
INSERT [dbo].[Postavshik] ([id_postavshik], [name_postavshik], [email_postavshik], [phone_postavshik], [logo_postavshik]) VALUES (114, N'Лазарева Аркадий Сергеевич', N'nelli11@gureva.ru', N'(495) 893-71-17', N'\agents\agent_54.png')
INSERT [dbo].[Postavshik] ([id_postavshik], [name_postavshik], [email_postavshik], [phone_postavshik], [logo_postavshik]) VALUES (115, N'Носов Михаил Андреевич', N'tdrozdov@ersova.ru', N'(35222) 73-44-19', N'\agents\agent_78.png')
INSERT [dbo].[Postavshik] ([id_postavshik], [name_postavshik], [email_postavshik], [phone_postavshik], [logo_postavshik]) VALUES (116, N'Люся Владимировна Фёдороваа', N'wsamsonov@martynov.ru', N'+7 (922) 233-27-68', N'\agents\agent_76.png')
INSERT [dbo].[Postavshik] ([id_postavshik], [name_postavshik], [email_postavshik], [phone_postavshik], [logo_postavshik]) VALUES (117, N'Сава Александрович Титова', N'boleslav.zukova@nikiforova.com', N'(495) 688-28-59', N'\agents\agent_30.png')
INSERT [dbo].[Postavshik] ([id_postavshik], [name_postavshik], [email_postavshik], [phone_postavshik], [logo_postavshik]) VALUES (118, N'Василий Андреевич Ковалёв', N'gerasim.makarov@kornilov.ru', N'8-800-538-41-77', NULL)
INSERT [dbo].[Postavshik] ([id_postavshik], [name_postavshik], [email_postavshik], [phone_postavshik], [logo_postavshik]) VALUES (119, N'Горбунов Назар Сергеевич', N'kanisimov@nikolaev.ru', N'(495) 452-58-94', N'\agents\agent_92.png')
INSERT [dbo].[Postavshik] ([id_postavshik], [name_postavshik], [email_postavshik], [phone_postavshik], [logo_postavshik]) VALUES (120, N'Данила Александрович Кириллов', N'stanislav.zykov@volkova.net', N'+7 (922) 596-14-53', N'\agents\agent_120.png')
INSERT [dbo].[Postavshik] ([id_postavshik], [name_postavshik], [email_postavshik], [phone_postavshik], [logo_postavshik]) VALUES (121, N'Анжелика Дмитриевна Горбунова', N'galina31@melnikov.ru', N'(35222) 39-28-95', N'\agents\agent_31.png')
INSERT [dbo].[Postavshik] ([id_postavshik], [name_postavshik], [email_postavshik], [phone_postavshik], [logo_postavshik]) VALUES (122, N'Кондратьева Таисия Андреевна', N'vladlena58@seliverstova.ru', N'(495) 284-69-37', N'\agents\agent_44.png')
INSERT [dbo].[Postavshik] ([id_postavshik], [name_postavshik], [email_postavshik], [phone_postavshik], [logo_postavshik]) VALUES (123, N'Игорь Львович Щукина', N'dmitrii05@zukov.ru', N'(812) 132-93-75', N'\agents\agent_95.png')
INSERT [dbo].[Postavshik] ([id_postavshik], [name_postavshik], [email_postavshik], [phone_postavshik], [logo_postavshik]) VALUES (124, N'Герман Иванович Гусева', N'albert57@burova.ru', N'(812) 524-87-16', NULL)
INSERT [dbo].[Postavshik] ([id_postavshik], [name_postavshik], [email_postavshik], [phone_postavshik], [logo_postavshik]) VALUES (125, N'Бронислав Владимирович Ефимов', N'vladlen06@melnikov.net', N'(812) 976-77-15', N'\agents\agent_106.png')
INSERT [dbo].[Postavshik] ([id_postavshik], [name_postavshik], [email_postavshik], [phone_postavshik], [logo_postavshik]) VALUES (126, N'Ксения Андреевна Михайлова', N'gorskov.larisa@kalinin.com', N'8-800-752-71-45', N'\agents\agent_37.png')
INSERT [dbo].[Postavshik] ([id_postavshik], [name_postavshik], [email_postavshik], [phone_postavshik], [logo_postavshik]) VALUES (127, N'Воробьёва Родион Максимович', N'pstepanova@siryev.com', N'(35222) 85-24-18', N'\agents\agent_105.png')
INSERT [dbo].[Postavshik] ([id_postavshik], [name_postavshik], [email_postavshik], [phone_postavshik], [logo_postavshik]) VALUES (128, N'Карпов Иосиф Максимович', N'maiy.belov@rogov.ru', N'(495) 374-21-79', N'\agents\agent_62.png')
INSERT [dbo].[Postavshik] ([id_postavshik], [name_postavshik], [email_postavshik], [phone_postavshik], [logo_postavshik]) VALUES (129, N'Чернов Геннадий Алексеевич', N'faina02@muraveva.com', N'+7 (922) 248-79-98', N'\agents\agent_74.png')
INSERT [dbo].[Postavshik] ([id_postavshik], [name_postavshik], [email_postavshik], [phone_postavshik], [logo_postavshik]) VALUES (130, N'Белова Полина Владимировна', N'ivanova.antonin@rodionov.ru', N'+7 (922) 947-11-99', N'\agents\agent_63.png')
INSERT [dbo].[Postavshik] ([id_postavshik], [name_postavshik], [email_postavshik], [phone_postavshik], [logo_postavshik]) VALUES (131, N'Фролова Эдуард Борисович', N'veronika.egorov@bespalova.com', N'(35222) 13-15-63', N'\agents\agent_41.png')
INSERT [dbo].[Postavshik] ([id_postavshik], [name_postavshik], [email_postavshik], [phone_postavshik], [logo_postavshik]) VALUES (132, N'Злата Романовна Корнилова', N'danila.birykov@stepanov.ru', N'8-800-753-27-68', N'\agents\agent_90.png')
INSERT [dbo].[Postavshik] ([id_postavshik], [name_postavshik], [email_postavshik], [phone_postavshik], [logo_postavshik]) VALUES (133, N'Клавдия Фёдоровна Кудряшова', N'lydmila.belyeva@karpov.ru', N'(495) 277-77-59', N'\agents\agent_47.png')
INSERT [dbo].[Postavshik] ([id_postavshik], [name_postavshik], [email_postavshik], [phone_postavshik], [logo_postavshik]) VALUES (134, N'Шубина Валерия Евгеньевна', N'emysnikov@kiselev.net', N'8-800-933-48-75', N'\agents\agent_85.png')
INSERT [dbo].[Postavshik] ([id_postavshik], [name_postavshik], [email_postavshik], [phone_postavshik], [logo_postavshik]) VALUES (135, N'Нонна Владимировна Горбунова', N'ybragina@odintov.org', N'(35222) 41-81-98', N'\agents\agent_86.png')
SET IDENTITY_INSERT [dbo].[Postavshik] OFF
SET IDENTITY_INSERT [dbo].[Type] ON 

INSERT [dbo].[Type] ([id_type], [name_type]) VALUES (1, N'Мягкая')
INSERT [dbo].[Type] ([id_type], [name_type]) VALUES (2, N'Твёрдая')
INSERT [dbo].[Type] ([id_type], [name_type]) VALUES (3, N'Смешанная')
SET IDENTITY_INSERT [dbo].[Type] OFF
SET IDENTITY_INSERT [dbo].[Type_Produkcii] ON 

INSERT [dbo].[Type_Produkcii] ([id_type_produkcii], [type_produkcii]) VALUES (1, N'Газетная')
INSERT [dbo].[Type_Produkcii] ([id_type_produkcii], [type_produkcii]) VALUES (2, N'Офсетная')
INSERT [dbo].[Type_Produkcii] ([id_type_produkcii], [type_produkcii]) VALUES (3, N'Мелованная')
SET IDENTITY_INSERT [dbo].[Type_Produkcii] OFF
ALTER TABLE [dbo].[Material] ADD  CONSTRAINT [DF_Material_image]  DEFAULT (N'\image\picture.jpg') FOR [image]
GO
ALTER TABLE [dbo].[Material]  WITH CHECK ADD  CONSTRAINT [FK_Material_Type] FOREIGN KEY([id_type])
REFERENCES [dbo].[Type] ([id_type])
GO
ALTER TABLE [dbo].[Material] CHECK CONSTRAINT [FK_Material_Type]
GO
ALTER TABLE [dbo].[Material_Produkcia]  WITH CHECK ADD  CONSTRAINT [FK_Material_Produkcia_Material] FOREIGN KEY([id_material])
REFERENCES [dbo].[Material] ([id_material])
GO
ALTER TABLE [dbo].[Material_Produkcia] CHECK CONSTRAINT [FK_Material_Produkcia_Material]
GO
ALTER TABLE [dbo].[Material_Produkcia]  WITH CHECK ADD  CONSTRAINT [FK_Material_Produkcia_Produkcia] FOREIGN KEY([id_produkcia])
REFERENCES [dbo].[Produkcia] ([id_produkcia])
GO
ALTER TABLE [dbo].[Material_Produkcia] CHECK CONSTRAINT [FK_Material_Produkcia_Produkcia]
GO
ALTER TABLE [dbo].[Produkcia]  WITH CHECK ADD  CONSTRAINT [FK_Produkcia_Proizvodstvo] FOREIGN KEY([id_proizvodstvo])
REFERENCES [dbo].[Proizvodstvo] ([id_proizvodstvo])
GO
ALTER TABLE [dbo].[Produkcia] CHECK CONSTRAINT [FK_Produkcia_Proizvodstvo]
GO
ALTER TABLE [dbo].[Produkcia]  WITH CHECK ADD  CONSTRAINT [FK_Produkcia_Type_Produkcii] FOREIGN KEY([id_type_produkcii])
REFERENCES [dbo].[Type_Produkcii] ([id_type_produkcii])
GO
ALTER TABLE [dbo].[Produkcia] CHECK CONSTRAINT [FK_Produkcia_Type_Produkcii]
GO
ALTER TABLE [dbo].[Sklad]  WITH CHECK ADD  CONSTRAINT [FK_Sklad_Material] FOREIGN KEY([id_material])
REFERENCES [dbo].[Material] ([id_material])
GO
ALTER TABLE [dbo].[Sklad] CHECK CONSTRAINT [FK_Sklad_Material]
GO
ALTER TABLE [dbo].[Sklad]  WITH CHECK ADD  CONSTRAINT [FK_Sklad_Postavshik] FOREIGN KEY([id_postavshik])
REFERENCES [dbo].[Postavshik] ([id_postavshik])
GO
ALTER TABLE [dbo].[Sklad] CHECK CONSTRAINT [FK_Sklad_Postavshik]
GO
ALTER TABLE [dbo].[Sotrudnik]  WITH CHECK ADD  CONSTRAINT [FK_Sotrudnik_Proizvodstvo] FOREIGN KEY([id_proizvodstvo])
REFERENCES [dbo].[Proizvodstvo] ([id_proizvodstvo])
GO
ALTER TABLE [dbo].[Sotrudnik] CHECK CONSTRAINT [FK_Sotrudnik_Proizvodstvo]
GO
USE [master]
GO
ALTER DATABASE [PM04_ISP33_BSV] SET  READ_WRITE 
GO
