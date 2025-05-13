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

INSERT [dbo].[History_UpdateCount] ([id_historyupdate], [name_material], [count_old], [count_new]) VALUES (1, N'���������� ���������������', CAST(567.00 AS Decimal(18, 2)), CAST(547.00 AS Decimal(18, 2)))
INSERT [dbo].[History_UpdateCount] ([id_historyupdate], [name_material], [count_old], [count_new]) VALUES (2, N'������ ���������', CAST(53.00 AS Decimal(18, 2)), CAST(53.00 AS Decimal(18, 2)))
INSERT [dbo].[History_UpdateCount] ([id_historyupdate], [name_material], [count_old], [count_new]) VALUES (3, N'����� ���������', CAST(26.00 AS Decimal(18, 2)), CAST(26.00 AS Decimal(18, 2)))
INSERT [dbo].[History_UpdateCount] ([id_historyupdate], [name_material], [count_old], [count_new]) VALUES (4, N'����� ���������', CAST(26.00 AS Decimal(18, 2)), CAST(26.00 AS Decimal(18, 2)))
INSERT [dbo].[History_UpdateCount] ([id_historyupdate], [name_material], [count_old], [count_new]) VALUES (5, N'������ ���������', CAST(26353.00 AS Decimal(18, 2)), CAST(26353.00 AS Decimal(18, 2)))
INSERT [dbo].[History_UpdateCount] ([id_historyupdate], [name_material], [count_old], [count_new]) VALUES (6, N'���������� ���������', CAST(2666.00 AS Decimal(18, 2)), CAST(2666.00 AS Decimal(18, 2)))
INSERT [dbo].[History_UpdateCount] ([id_historyupdate], [name_material], [count_old], [count_new]) VALUES (7, N'�����', CAST(604.00 AS Decimal(18, 2)), CAST(604.00 AS Decimal(18, 2)))
INSERT [dbo].[History_UpdateCount] ([id_historyupdate], [name_material], [count_old], [count_new]) VALUES (8, N'����� ���������', CAST(26.00 AS Decimal(18, 2)), CAST(26.00 AS Decimal(18, 2)))
INSERT [dbo].[History_UpdateCount] ([id_historyupdate], [name_material], [count_old], [count_new]) VALUES (9, N'������ ���������', CAST(26353.00 AS Decimal(18, 2)), CAST(26353.00 AS Decimal(18, 2)))
INSERT [dbo].[History_UpdateCount] ([id_historyupdate], [name_material], [count_old], [count_new]) VALUES (10, N'���������� ���������', CAST(2666.00 AS Decimal(18, 2)), CAST(2666.00 AS Decimal(18, 2)))
INSERT [dbo].[History_UpdateCount] ([id_historyupdate], [name_material], [count_old], [count_new]) VALUES (11, N'���������� ���������������', CAST(547.00 AS Decimal(18, 2)), CAST(547.00 AS Decimal(18, 2)))
INSERT [dbo].[History_UpdateCount] ([id_historyupdate], [name_material], [count_old], [count_new]) VALUES (12, N'����� ���������', CAST(26.00 AS Decimal(18, 2)), CAST(26.00 AS Decimal(18, 2)))
INSERT [dbo].[History_UpdateCount] ([id_historyupdate], [name_material], [count_old], [count_new]) VALUES (13, N'������ ���������', CAST(7352.00 AS Decimal(18, 2)), CAST(7352.00 AS Decimal(18, 2)))
INSERT [dbo].[History_UpdateCount] ([id_historyupdate], [name_material], [count_old], [count_new]) VALUES (14, N'������ ���������', CAST(7352.00 AS Decimal(18, 2)), CAST(7352.00 AS Decimal(18, 2)))
INSERT [dbo].[History_UpdateCount] ([id_historyupdate], [name_material], [count_old], [count_new]) VALUES (15, N'����� ���������', CAST(26.00 AS Decimal(18, 2)), CAST(26.00 AS Decimal(18, 2)))
INSERT [dbo].[History_UpdateCount] ([id_historyupdate], [name_material], [count_old], [count_new]) VALUES (16, N'������ ���������', CAST(7352.00 AS Decimal(18, 2)), CAST(7352.00 AS Decimal(18, 2)))
INSERT [dbo].[History_UpdateCount] ([id_historyupdate], [name_material], [count_old], [count_new]) VALUES (17, N'������� ���������', CAST(431.00 AS Decimal(18, 2)), CAST(431.00 AS Decimal(18, 2)))
INSERT [dbo].[History_UpdateCount] ([id_historyupdate], [name_material], [count_old], [count_new]) VALUES (18, N'������� ���������', CAST(431.00 AS Decimal(18, 2)), CAST(431.00 AS Decimal(18, 2)))
INSERT [dbo].[History_UpdateCount] ([id_historyupdate], [name_material], [count_old], [count_new]) VALUES (19, N'������� ���������', CAST(431.00 AS Decimal(18, 2)), CAST(431.00 AS Decimal(18, 2)))
INSERT [dbo].[History_UpdateCount] ([id_historyupdate], [name_material], [count_old], [count_new]) VALUES (20, N'������� ���������', CAST(431.00 AS Decimal(18, 2)), CAST(431.00 AS Decimal(18, 2)))
INSERT [dbo].[History_UpdateCount] ([id_historyupdate], [name_material], [count_old], [count_new]) VALUES (21, N'[������ ���������', CAST(431.00 AS Decimal(18, 2)), CAST(431.00 AS Decimal(18, 2)))
INSERT [dbo].[History_UpdateCount] ([id_historyupdate], [name_material], [count_old], [count_new]) VALUES (22, N'{������ ���������', CAST(431.00 AS Decimal(18, 2)), CAST(431.00 AS Decimal(18, 2)))
INSERT [dbo].[History_UpdateCount] ([id_historyupdate], [name_material], [count_old], [count_new]) VALUES (23, N'������� ���������', CAST(431.00 AS Decimal(18, 2)), CAST(431.00 AS Decimal(18, 2)))
INSERT [dbo].[History_UpdateCount] ([id_historyupdate], [name_material], [count_old], [count_new]) VALUES (24, N'������� ���������', CAST(431.00 AS Decimal(18, 2)), CAST(431.00 AS Decimal(18, 2)))
INSERT [dbo].[History_UpdateCount] ([id_historyupdate], [name_material], [count_old], [count_new]) VALUES (25, N'������� ���������', CAST(431.00 AS Decimal(18, 2)), CAST(431.00 AS Decimal(18, 2)))
INSERT [dbo].[History_UpdateCount] ([id_historyupdate], [name_material], [count_old], [count_new]) VALUES (26, N'������� ���������', CAST(431.00 AS Decimal(18, 2)), CAST(431.00 AS Decimal(18, 2)))
INSERT [dbo].[History_UpdateCount] ([id_historyupdate], [name_material], [count_old], [count_new]) VALUES (27, N'������� ���������', CAST(431.00 AS Decimal(18, 2)), CAST(431.00 AS Decimal(18, 2)))
INSERT [dbo].[History_UpdateCount] ([id_historyupdate], [name_material], [count_old], [count_new]) VALUES (28, N'������', CAST(56783.00 AS Decimal(18, 2)), CAST(56783.00 AS Decimal(18, 2)))
INSERT [dbo].[History_UpdateCount] ([id_historyupdate], [name_material], [count_old], [count_new]) VALUES (29, N'������� ���������', CAST(431.00 AS Decimal(18, 2)), CAST(431.00 AS Decimal(18, 2)))
INSERT [dbo].[History_UpdateCount] ([id_historyupdate], [name_material], [count_old], [count_new]) VALUES (30, N'����', CAST(56783.00 AS Decimal(18, 2)), CAST(56783.00 AS Decimal(18, 2)))
INSERT [dbo].[History_UpdateCount] ([id_historyupdate], [name_material], [count_old], [count_new]) VALUES (31, N'����', CAST(56783.00 AS Decimal(18, 2)), CAST(56783.00 AS Decimal(18, 2)))
INSERT [dbo].[History_UpdateCount] ([id_historyupdate], [name_material], [count_old], [count_new]) VALUES (32, N'������� ���������', CAST(431.00 AS Decimal(18, 2)), CAST(431.00 AS Decimal(18, 2)))
INSERT [dbo].[History_UpdateCount] ([id_historyupdate], [name_material], [count_old], [count_new]) VALUES (33, N'����� ���������', CAST(34.00 AS Decimal(18, 2)), CAST(34.00 AS Decimal(18, 2)))
INSERT [dbo].[History_UpdateCount] ([id_historyupdate], [name_material], [count_old], [count_new]) VALUES (34, N'����� ���������', CAST(34.00 AS Decimal(18, 2)), CAST(34.00 AS Decimal(18, 2)))
INSERT [dbo].[History_UpdateCount] ([id_historyupdate], [name_material], [count_old], [count_new]) VALUES (35, N'����� ���������', CAST(34.00 AS Decimal(18, 2)), CAST(34.00 AS Decimal(18, 2)))
INSERT [dbo].[History_UpdateCount] ([id_historyupdate], [name_material], [count_old], [count_new]) VALUES (36, N'����� ���������', CAST(34.00 AS Decimal(18, 2)), CAST(34.00 AS Decimal(18, 2)))
INSERT [dbo].[History_UpdateCount] ([id_historyupdate], [name_material], [count_old], [count_new]) VALUES (37, N'������� ���������', CAST(431.00 AS Decimal(18, 2)), CAST(431.00 AS Decimal(18, 2)))
INSERT [dbo].[History_UpdateCount] ([id_historyupdate], [name_material], [count_old], [count_new]) VALUES (38, N'������� ���������', CAST(431.00 AS Decimal(18, 2)), CAST(431.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[History_UpdateCount] OFF
SET IDENTITY_INSERT [dbo].[Material] ON 

INSERT [dbo].[Material] ([id_material], [name_material], [image], [ostatok], [cena], [id_type], [opisanie], [ed_ismer], [kol_na_sklade], [kol_v_upakovke]) VALUES (1, N'������� ���������', N'image\�������_���������.jpg', CAST(345.00 AS Decimal(18, 2)), 6353.0000, 2, N'������� ������ � ����� ���������. ���� ����������, �������� ���� ���������, �������� ����� ���, ������������ ���� �� �����.', N'�����', CAST(431.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)))
INSERT [dbo].[Material] ([id_material], [name_material], [image], [ostatok], [cena], [id_type], [opisanie], [ed_ismer], [kol_na_sklade], [kol_v_upakovke]) VALUES (2, N'����� ���������', N'\image\�����_���������.jpg', CAST(534.00 AS Decimal(18, 2)), 26363.0000, 2, N'�������� ��������� ��������������� ���������� ����������� ����������, ����������� �� �� ��������� �����:
������ � ������ ����������� ���������
������������ � ���������� � ����������� ������
������������ � ����������� �����', N'��. �����', CAST(80.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)))
INSERT [dbo].[Material] ([id_material], [name_material], [image], [ostatok], [cena], [id_type], [opisanie], [ed_ismer], [kol_na_sklade], [kol_v_upakovke]) VALUES (3, N'�������� ���������', N'\image\��������_���������.jpeg', CAST(7689.00 AS Decimal(18, 2)), 67443.0000, 3, N'��������� ������ ����������, ������ ����������������, � ��������� �� �������� �� �������� ������� � � ���������� � ����� ��������� ����� 705 ��/�3. ������ ���������. ', N'�����', CAST(4437.00 AS Decimal(18, 2)), CAST(13.00 AS Decimal(18, 2)))
INSERT [dbo].[Material] ([id_material], [name_material], [image], [ostatok], [cena], [id_type], [opisanie], [ed_ismer], [kol_na_sklade], [kol_v_upakovke]) VALUES (6, N'�����', N'\image\picture.jpg', CAST(553.00 AS Decimal(18, 2)), 6754.0000, 1, N'������ � ���������, ���������� ����� ������ �������:
������� ����������������
������� ������������, ������� ���
���������������� ��������� � ����� �������� ���������� �������
�������� � ��������� �������� �������������', N'��', CAST(604.00 AS Decimal(18, 2)), CAST(15.00 AS Decimal(18, 2)))
INSERT [dbo].[Material] ([id_material], [name_material], [image], [ostatok], [cena], [id_type], [opisanie], [ed_ismer], [kol_na_sklade], [kol_v_upakovke]) VALUES (7, N'��� ���������', N'\image\���_���������.jpg', CAST(5.20 AS Decimal(18, 2)), 4444.0000, 1, N'��������� �������� ���� ���, �������, ��� � ��������� �����, ����� � �����������, ������� � ������� �������. � ������ � ������� ����� �������� ���� ��� �������� ������� ����� ������������� � ��������� ��� ������������, � �������� ������� ��� �������� ������ ����� ��������� ��� ����������. ', N'�����', CAST(543.00 AS Decimal(18, 2)), CAST(9.00 AS Decimal(18, 2)))
INSERT [dbo].[Material] ([id_material], [name_material], [image], [ostatok], [cena], [id_type], [opisanie], [ed_ismer], [kol_na_sklade], [kol_v_upakovke]) VALUES (8, N'������ ���������', N'\image\������_���������.jpg', CAST(26.00 AS Decimal(18, 2)), 725.0000, 2, N'������ ��� � ���� ������. ��������� ��������������� ������� ������ � ������ ����� ������ ������� ��� ������������ ������ � �������� ���������, ��������� ���������� �����, � ��������������; ������������ � �� �������. ', N'��. �����', CAST(6632.00 AS Decimal(18, 2)), CAST(16.00 AS Decimal(18, 2)))
INSERT [dbo].[Material] ([id_material], [name_material], [image], [ostatok], [cena], [id_type], [opisanie], [ed_ismer], [kol_na_sklade], [kol_v_upakovke]) VALUES (9, N'������ ���������', N'\image\������_���������.jpg', CAST(34.00 AS Decimal(18, 2)), 234.0000, 1, N'��������� � ������ �������, �������������������, ������, ����������� � ������� � ������ ���������������, ������, ������ ������������ � �������������. ���������� ��������������� ������, ����������� ���������� ��������� ������ �� ������ �������� � ��������� ����. �������� �������, ������ �����, ������ �������� �� ���� ������ ���� ������-�������, ���� - ���������-����������� �����.', N'��. �����', CAST(34.00 AS Decimal(18, 2)), CAST(53.00 AS Decimal(18, 2)))
INSERT [dbo].[Material] ([id_material], [name_material], [image], [ostatok], [cena], [id_type], [opisanie], [ed_ismer], [kol_na_sklade], [kol_v_upakovke]) VALUES (10, N'������ ���������', N'\image\������_���������.jpg', CAST(14.00 AS Decimal(18, 2)), 523.0000, 2, N'������������ ��������� �������, ����������� �� ����������������. � ������, ��������� ��������� �������, ����, ��� � ��������� ����. � ������, ������� 550-650 ��/�3. ������ ��������� � 700 ��/�3. �� ����� ����, ������ �� ���������, � ������������� ����� ������, �������. � �� ����� ���������. ��������� ������ ��������� � �����, ��������� ��������. ', N'�����', CAST(53.00 AS Decimal(18, 2)), CAST(75.00 AS Decimal(18, 2)))
INSERT [dbo].[Material] ([id_material], [name_material], [image], [ostatok], [cena], [id_type], [opisanie], [ed_ismer], [kol_na_sklade], [kol_v_upakovke]) VALUES (11, N'���� ���������', N'\image\����_���������.jpg', CAST(752.00 AS Decimal(18, 2)), 326.0000, 1, N'��������� ��������� ����� �������� ���� ����. � ������ ��� ���� ����������� � ���� ������������. ��������� ���� ���� ����������� ���������� ��� ��������� � ������ �� ������ �� ������� ������� ������. � � ���� ��� ������� �������� ���������� ���� ��������� ������� ����������, ��������� ���� ������ � ������������ �������� �������, ��� ��� ��� ����� �������������� � ����� ������������.', N'��', CAST(546.00 AS Decimal(18, 2)), CAST(17.00 AS Decimal(18, 2)))
INSERT [dbo].[Material] ([id_material], [name_material], [image], [ostatok], [cena], [id_type], [opisanie], [ed_ismer], [kol_na_sklade], [kol_v_upakovke]) VALUES (12, N'���� ���������', N'\image\����_���������.jpg', CAST(54.00 AS Decimal(18, 2)), 445.0000, 2, N'���� - ���������� ���������-���������� ������. ��������� �����, ������ � ��������� ��� ���������� ��������, �������, �������, �������.', N'��', CAST(36.00 AS Decimal(18, 2)), CAST(35.00 AS Decimal(18, 2)))
INSERT [dbo].[Material] ([id_material], [name_material], [image], [ostatok], [cena], [id_type], [opisanie], [ed_ismer], [kol_na_sklade], [kol_v_upakovke]) VALUES (13, N'������ ���������', N'\image\������_���������.jpg', CAST(75.00 AS Decimal(18, 2)), 656.0000, 1, N'������ - ������� ������. ��������� ������� ������, ������, ������ ������� � ������������. ������ ���������� ��������� ��� ������������ ����������� ������. ���� ������� �� ����� � �������� ���������� ������� ���������. ������ ����������� � ��������������� ������� ���������. ���������� ������������� � �������� �� ����� ����� ��������������� � ����������, �� � ������� �������, ��� ��� ���������� � �����.', N'�����', CAST(632.00 AS Decimal(18, 2)), CAST(23.00 AS Decimal(18, 2)))
INSERT [dbo].[Material] ([id_material], [name_material], [image], [ostatok], [cena], [id_type], [opisanie], [ed_ismer], [kol_na_sklade], [kol_v_upakovke]) VALUES (14, N'����� ���������', N'\image\�����_���������.jpg', CAST(623.00 AS Decimal(18, 2)), 623.0000, 2, N'��������� ����� �������� �������� ������������ ������������ ������ � �����, �����, ������ � ������� ������-����������� ��������, � ���-�� ������� ������� ��, � � ���-�� � ����������. ��� ���� ������� �������, ��� ��������� ����� ����� ������� ������� � ����������� ��������� ���������� ������. ... ��������� ����� � ����������� �������� �����������-��������. �������������� ��������� ����� ����������-������� ����������� � �������� ����. ', N'��. �����', CAST(25.00 AS Decimal(18, 2)), CAST(2.00 AS Decimal(18, 2)))
INSERT [dbo].[Material] ([id_material], [name_material], [image], [ostatok], [cena], [id_type], [opisanie], [ed_ismer], [kol_na_sklade], [kol_v_upakovke]) VALUES (15, N'����� ���������', N'\image\picture.jpg', CAST(2323.00 AS Decimal(18, 2)), 232.0000, 1, NULL, N'��', CAST(26.00 AS Decimal(18, 2)), CAST(26.00 AS Decimal(18, 2)))
INSERT [dbo].[Material] ([id_material], [name_material], [image], [ostatok], [cena], [id_type], [opisanie], [ed_ismer], [kol_na_sklade], [kol_v_upakovke]) VALUES (16, N'��� ���������', N'\image\���_���������.jpg', CAST(5636.00 AS Decimal(18, 2)), 543.0000, 2, N'������������� ���������� �������� ���� ������� �������� ������ ���������. � ��� �� 5% �������, ��� ����� ��������. ... ��� � �������� �������� ��� �������, ������� ������, ��������� ��������, � ��� ����� ������� � ������������ �������. ��������� ����������������� ��������� ������� �� ���� ����� ��������� ���� � ������ ��������, � ������� �������.', N'�����', CAST(1343.00 AS Decimal(18, 2)), CAST(23.00 AS Decimal(18, 2)))
INSERT [dbo].[Material] ([id_material], [name_material], [image], [ostatok], [cena], [id_type], [opisanie], [ed_ismer], [kol_na_sklade], [kol_v_upakovke]) VALUES (17, N'����� ���������', N'\image\�����_���������.jpg', CAST(542.00 AS Decimal(18, 2)), 955.0000, 1, N'��������� �������� ���� �����, ����������� � ������� ������� ���������, ��� �� ��� ���, �����, ����������� ��� ���. � ������ ��� ���� ��������� �������� ����� ������������� ��������� ����� ������������. ���������� ��� ������ ����� �����, ��������� ������� ������� ���������� � ��������� ��������, ����� ��� ����������� ����, ����� ��������� � �� ���� ������������ ��-�� ����� ��������� � ����������� ������� ����� ������.', N'��', CAST(67.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)))
INSERT [dbo].[Material] ([id_material], [name_material], [image], [ostatok], [cena], [id_type], [opisanie], [ed_ismer], [kol_na_sklade], [kol_v_upakovke]) VALUES (18, N'��� ���������', N'\image\���_���������.jpg', CAST(243.00 AS Decimal(18, 2)), 723.0000, 3, N'��� � ��������� �����, �������� ���� Taxaceae. ����������� ��� ��� ������� ������ ������. ����� �������� ���������-����� � �������� �� ������ �� �������� ������� �����. ���� ����������-����������� �����. ��� ����������, �������, ������, ������ � � �� �� ����� ���������� ���������, ������� ������ ������� ������ ��-�� ���������� �����. Ÿ ������� ��������� ����������� �� � ����. �������� ���� ����� �� 640 �� 800 ��.', N'��. �����', CAST(6235.00 AS Decimal(18, 2)), CAST(24.00 AS Decimal(18, 2)))
INSERT [dbo].[Material] ([id_material], [name_material], [image], [ostatok], [cena], [id_type], [opisanie], [ed_ismer], [kol_na_sklade], [kol_v_upakovke]) VALUES (19, N'����� ���������', N'\image\�����_���������.jpg', CAST(235.00 AS Decimal(18, 2)), 677.0000, 3, N'����� � ������ � ������ ������ ����������� ���������, ���������� �� ������ ����� (Millettia laurentii). ����������� ��� Milletia ctuhmanii ����������� � ��������� ������ � ����� ������� �������� �����-����� (panga panga). ��� ��� ������ ������ �� �������� ���� � ���������. ������, ������, ���������� � �������� ���������. ��������� � ����� ��������� ����� 880 ��/�? (��������� �����-����� ��������� ����� � 800 ��/�?). ����� ������� ���������������� ������� � ���������.', N'��', CAST(865.00 AS Decimal(18, 2)), CAST(7.00 AS Decimal(18, 2)))
INSERT [dbo].[Material] ([id_material], [name_material], [image], [ostatok], [cena], [id_type], [opisanie], [ed_ismer], [kol_na_sklade], [kol_v_upakovke]) VALUES (20, N'������ ���������', N'\image\������_���������.jpg', CAST(97.00 AS Decimal(18, 2)), 544.0000, 3, N'������ � ������������ �������� ������ ��������� �������� �� ���� Intsia ��������� �������. ������-���������� ��������� ����� ������, ������� ������ ���������� �� ����� Intsia palembanica ��� Intsia bijuga, ������ �� ���������, ��������� � ����� �� ��������� �������� ���� Afzelia, ������ � ��������� ����������. Ÿ ��������� (��� ��������� 12 %) ���������� ����� 800 ��/�?.', N'��', CAST(16.00 AS Decimal(18, 2)), CAST(8.00 AS Decimal(18, 2)))
INSERT [dbo].[Material] ([id_material], [name_material], [image], [ostatok], [cena], [id_type], [opisanie], [ed_ismer], [kol_na_sklade], [kol_v_upakovke]) VALUES (21, N'������ ���������', N'\image\������_���������.jpg', CAST(998.00 AS Decimal(18, 2)), 644.0000, 2, N'��������� ������ ������������� � ����������� ������, ������������ ����������� �������. ���� ������� ������������ ����������� ����� ����������� ������ ��� ������� ��������, ����� �� ��� ������������ � ����������� ����. ��������� ������ �������, ������, �������, ����� �������, ������ � ����� ������������, ��������� ����������.', N'��', CAST(47.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)))
INSERT [dbo].[Material] ([id_material], [name_material], [image], [ostatok], [cena], [id_type], [opisanie], [ed_ismer], [kol_na_sklade], [kol_v_upakovke]) VALUES (22, N'������ ���������', N'\image\������_���������.jpg', CAST(96.00 AS Decimal(18, 2)), 56.0000, 2, N'��������� ������ ����������� ������, ���������� ���������� � ������, ����������� ������� ����������, ��������� � ���������� ����. ��������� ��������� ��������� ������������� ��� ��������� ������, � ����� ��� ��������� ������� ������. ��������� ������ ����� ���������, ����������, ������.', N'��. �����', CAST(234.00 AS Decimal(18, 2)), CAST(21.00 AS Decimal(18, 2)))
INSERT [dbo].[Material] ([id_material], [name_material], [image], [ostatok], [cena], [id_type], [opisanie], [ed_ismer], [kol_na_sklade], [kol_v_upakovke]) VALUES (24, N'������ ���������', N'\image\������_���������.jpg', CAST(54.00 AS Decimal(18, 2)), 4335.0000, 2, N'��������� ������� � �������������, ���������, � ������ ��� ���������� �������� ������ ���� ���������� �������� �������� ��������� ����� �����, ������������� �� ����������� �������. ��� ���� �������� ��������� ������� � �����. ��������� �������: ���������. ��������� ������� ������ ���������, ����������, ����� ���� ����������� ���������� �������. ��������� ������� ������� �������, ��� ������, � ��� ������ �� ����� ������.', N'��', CAST(524.00 AS Decimal(18, 2)), CAST(54.00 AS Decimal(18, 2)))
INSERT [dbo].[Material] ([id_material], [name_material], [image], [ostatok], [cena], [id_type], [opisanie], [ed_ismer], [kol_na_sklade], [kol_v_upakovke]) VALUES (25, N'��������� ���������', N'\image\���������_���������.jpg', CAST(835.00 AS Decimal(18, 2)), 422.0000, 2, N'��������� ���������� ����������, ������� � ����������������. �� ��������� � ��������� �������� � ������, �� �������� ���������� ������ ����������� �������� ��� ���� � ���������� �����. ��� ����� ��������� ���������� ����������� �� ��������������� � �� ���������, � ��������� � ������������ � ������ ��������� �������� �� ��� ������� ������� ������ ���� �� ������ �������.', N'��', CAST(234.00 AS Decimal(18, 2)), CAST(433.00 AS Decimal(18, 2)))
INSERT [dbo].[Material] ([id_material], [name_material], [image], [ostatok], [cena], [id_type], [opisanie], [ed_ismer], [kol_na_sklade], [kol_v_upakovke]) VALUES (26, N'������������ ���������', N'\image\������������_���������.jpg', CAST(635.00 AS Decimal(18, 2)), 266.0000, 1, N'��������� ������������� ������������ ��� ������������ ����� ��� �������� ��������, ������� ������ � �������� ������.
�� ��� ���������� ����������, ���������, ������ ��� ������������ ������ ��������. �����, ������ � ������ ��������������� �������� ������ ����� ����������� ������� � �������� �� �������������. ��������� ����� ������������ � �������������� ��� ������������ ������, ����� � ���������.', N'��', CAST(6524.00 AS Decimal(18, 2)), CAST(3.00 AS Decimal(18, 2)))
INSERT [dbo].[Material] ([id_material], [name_material], [image], [ostatok], [cena], [id_type], [opisanie], [ed_ismer], [kol_na_sklade], [kol_v_upakovke]) VALUES (27, N'������� ���������', N'\image\�������_���������.jpg', CAST(735.00 AS Decimal(18, 2)), 555.0000, 1, N'��������� �������, ������, ������������ 25 � � ������, ������������ ����� �������� ������������ �� ����������� ������ �� ������ � �����. ��� ������ ��������������� ����� � �������� �������, �������� ����� � �������� ������. ������������ � �������� ��� ������������ �����, ���������� ������� � �������� ��� ������������ ������. � �������� ��������� ��������� �� ������ ������� ������������� ����.', N'�����', CAST(5335.00 AS Decimal(18, 2)), CAST(15.00 AS Decimal(18, 2)))
INSERT [dbo].[Material] ([id_material], [name_material], [image], [ostatok], [cena], [id_type], [opisanie], [ed_ismer], [kol_na_sklade], [kol_v_upakovke]) VALUES (28, N'��� ���������', N'\image\���_���������.jpg', CAST(8363.00 AS Decimal(18, 2)), 53.0000, 2, N'��������� ��������� ����� �������� ���� ���. � ������ ���� ��������� ������������ � ������ ������� ��������� ���� �������, ������������� � ��������� �����, �������� ��� ������������� � ������������ ������. ������ ������ ����� �������� ��������� �����, ������� ��� �� ����� ������ ���������� �� �������.', N'��', CAST(35.00 AS Decimal(18, 2)), CAST(22.00 AS Decimal(18, 2)))
INSERT [dbo].[Material] ([id_material], [name_material], [image], [ostatok], [cena], [id_type], [opisanie], [ed_ismer], [kol_na_sklade], [kol_v_upakovke]) VALUES (29, N'�������� ���������', N'\image\��������_���������.jpg', CAST(634.00 AS Decimal(18, 2)), 2727.0000, 3, N'������� ������ (Snakewood). ������������ �������� � Piratinera guianensis, syn. Brosinum guianensis, ���. Moraceae. ... ���� �������� �������� ��� ������ �������� ��-�� ����������� ������ ������ ����� ������������ �����, ������������ ����� �� ����� �������� ��� �� ���� ���� � ��������� ��������. ���������� ����������� �������� � �������������� ������-���������� � ������-��������� ������������ �������������� ������������� ������ � ������� ���������� � �������.', N'��. �����', CAST(35535.00 AS Decimal(18, 2)), CAST(13.00 AS Decimal(18, 2)))
INSERT [dbo].[Material] ([id_material], [name_material], [image], [ostatok], [cena], [id_type], [opisanie], [ed_ismer], [kol_na_sklade], [kol_v_upakovke]) VALUES (30, N'������� ���������', N'\image\�������_���������.jpg', CAST(574.00 AS Decimal(18, 2)), 3434.0000, 3, N'��������� ������ ������� �������� �������� ��������� �������������� ������� ��� ���������� � ����� � ���������� ��������. ����� ��� ����� � ����������� ������� ������������ ����� ����� ������ ��� ������������� �����.', N'��', CAST(252.00 AS Decimal(18, 2)), CAST(13.00 AS Decimal(18, 2)))
INSERT [dbo].[Material] ([id_material], [name_material], [image], [ostatok], [cena], [id_type], [opisanie], [ed_ismer], [kol_na_sklade], [kol_v_upakovke]) VALUES (31, N'������ ���������', N'\image\������_���������.jpg', CAST(635.00 AS Decimal(18, 2)), 335.0000, 3, N'��������� ��������� �������. ������ ������ ���������� ������, ��������� ��������� ������� � ��������������. �������� �������� �������� ����� � ������������� ����. ... ������. �������� ��������. ������ ��������� ������ � ������ ��� �������� � ����� �������� ��� ����������� ������. ������� � ��� �� ����� ������������������ � ������������ ������ �������� ��������, ��� ����� ����������� ����� ������� ������. ', N'�����', CAST(43.00 AS Decimal(18, 2)), CAST(23.00 AS Decimal(18, 2)))
INSERT [dbo].[Material] ([id_material], [name_material], [image], [ostatok], [cena], [id_type], [opisanie], [ed_ismer], [kol_na_sklade], [kol_v_upakovke]) VALUES (32, N'��������� ���������', N'\image\���������_���������.jpg', CAST(3434.00 AS Decimal(18, 2)), 454.0000, 1, N'�������� ��������� ���� ����� ����������� ��������. ������� ����, ��� ��� �������� ����������� ���������� ��������� ���������������� ����� ��������� ��������� ������������, ����� ���������� � �������������� ������� ������� ������������ ����� �������� �� ��������� � ��������� �������� ���� ���������� ��������� �������. � ���������� ����� �� ���������� ���������� ����������� �������� Rosewood, �� � ������� ����� ������������� ��� ����������� �������� �������� ������ �������� ������ ������������.', N'��', CAST(5535.00 AS Decimal(18, 2)), CAST(34.00 AS Decimal(18, 2)))
INSERT [dbo].[Material] ([id_material], [name_material], [image], [ostatok], [cena], [id_type], [opisanie], [ed_ismer], [kol_na_sklade], [kol_v_upakovke]) VALUES (33, N'������ ���������', N'\image\������_���������.jpg', CAST(4243.00 AS Decimal(18, 2)), 6263.0000, 2, N'������ ��������� �������� ���� Guaiacum. ��� ��������� �������������� ������ ���, ��� ���� ������ ����� � ���������, ��� � ��������. ��� ���� ����� ���� ������� � ��������� ����� � ���������� II CITES ��� ������������ ����������� ��� ������� ����. ������ �������� ������� ������� �� Guaiacum officinale � Guaiacum sanctum, � ��� � ������ - ��������� �������� �������� �������.', N'��. �����', CAST(3434.00 AS Decimal(18, 2)), CAST(22.00 AS Decimal(18, 2)))
INSERT [dbo].[Material] ([id_material], [name_material], [image], [ostatok], [cena], [id_type], [opisanie], [ed_ismer], [kol_na_sklade], [kol_v_upakovke]) VALUES (34, N'������� ���������', N'\image\�������_���������.jpg', CAST(242.00 AS Decimal(18, 2)), 34.0000, 2, N'������� ������ � ��������� ��������� ����� ��������, ������� ������� � ������������ ����, ������ ������� � ������ ����������� ���������. ����� ��������� ������ ������� �� ������� ������������ ��������������, �������� ������� ���������� � ����������, ������ ����������.', N'��', CAST(46.00 AS Decimal(18, 2)), CAST(4.00 AS Decimal(18, 2)))
INSERT [dbo].[Material] ([id_material], [name_material], [image], [ostatok], [cena], [id_type], [opisanie], [ed_ismer], [kol_na_sklade], [kol_v_upakovke]) VALUES (35, N'����� ���������', N'image\�����_���������.jpg', CAST(3453.00 AS Decimal(18, 2)), 34.0000, 1, N'����� � ��������� ��������� ����� �������� ���� ������ (���. Populus) ��������� ������. ������ �������� ���� ������ � ������, ���� � �������� �������. ����������� ����� � �������������� �������, ����������� ��� � �������� �� 30 �� 50 ���. ��� ��������� ���������� � �������� �� ���������� �������� ���������� ������. �� ������ ��������� ����� � ������� ���������� �� �� ������� ������ ��������, � �� ������ �������� ��������� �����.', N'��. �����', CAST(34.00 AS Decimal(18, 2)), CAST(34.00 AS Decimal(18, 2)))
INSERT [dbo].[Material] ([id_material], [name_material], [image], [ostatok], [cena], [id_type], [opisanie], [ed_ismer], [kol_na_sklade], [kol_v_upakovke]) VALUES (36, N'���� ���������', N'\image\����_���������.jpg', CAST(242.00 AS Decimal(18, 2)), 48.0000, 2, N'���������� ��������� ����� ��������� � ����������� � ������� � ����������� ��������. �� ������������� ��������� ���������� 2,3 (� ���� � 3,3, � ���� - 5,2). ����� ������������ ��� ������ ������ ���������� ������ � ��� ���� ���������������� ���������� � ������.', N'�����', CAST(2534.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)))
INSERT [dbo].[Material] ([id_material], [name_material], [image], [ostatok], [cena], [id_type], [opisanie], [ed_ismer], [kol_na_sklade], [kol_v_upakovke]) VALUES (37, N'���� ���������', N'\image\����_���������.jpg', CAST(836.00 AS Decimal(18, 2)), 52.0000, 3, N'��������� �������� ���� ���, ����������� � ���� �� 200 ����� �������� � �����������, ��������������� � ������� � �������� �������. ������������ ������ ����� ��� ������������ ��������� ��� ��� ������������ ������, ����������� ���� � �������� �������. ������������ �������� �������� ��������� ������������ ����� ����, � ������� ��� ����� ���� ��� ���� � ��� ������������. ', N'��', CAST(45.00 AS Decimal(18, 2)), CAST(7.00 AS Decimal(18, 2)))
INSERT [dbo].[Material] ([id_material], [name_material], [image], [ostatok], [cena], [id_type], [opisanie], [ed_ismer], [kol_na_sklade], [kol_v_upakovke]) VALUES (38, N'��������� ���������', N'\image\���������_���������.jpg', CAST(224.00 AS Decimal(18, 2)), 25.0000, 3, N'��������� ��������� ������, ������, � �������� ���������, ������ � �������, ����������� ��� ������� � �������������� �������.
��������� � ���������������� ������ � ����� ����� (3-5 �������� ����) ���������-����� ���������, ����� ������������ �� ����������-������ ����. �� �������� ����� ��������� ������� � ���������� ����-�����.', N'�����', CAST(232.00 AS Decimal(18, 2)), CAST(2.00 AS Decimal(18, 2)))
INSERT [dbo].[Material] ([id_material], [name_material], [image], [ostatok], [cena], [id_type], [opisanie], [ed_ismer], [kol_na_sklade], [kol_v_upakovke]) VALUES (39, N'������� ���������', N'\image\�������_���������.jpg', CAST(363.00 AS Decimal(18, 2)), 42.0000, 2, N'�������-��� �����������, ���� ��������, ������� ��������� � ��������� ����������. ��� ����������� ������� 40 �����. �������, �������������� � �������� ����� � �������������� �������� ��������� � ������ ���������. ... �������. �������� ���������. ��������� ������� ��������� � ������� �������. �������� �������, ������� � ��������� ��������� ��������. ���� ����������-������ �����. ', N'��', CAST(5443.00 AS Decimal(18, 2)), CAST(6.00 AS Decimal(18, 2)))
INSERT [dbo].[Material] ([id_material], [name_material], [image], [ostatok], [cena], [id_type], [opisanie], [ed_ismer], [kol_na_sklade], [kol_v_upakovke]) VALUES (40, N'��� ���������', N'\image\���_���������.jpg', CAST(635.00 AS Decimal(18, 2)), 3553.0000, 1, N'��� � ������� ������ � ������� ����� ���������, ������� ������������� �� ��������-�������� ����. �������� ���� ������� �����. ������ ������, ������������ ���� �����, ����������. ��������� �� ������, ������, ���� ������� ������ �������, � ��������� ����������; �� ��������� ������ ��������� ����.', N'��. �����', CAST(5134.00 AS Decimal(18, 2)), CAST(25.00 AS Decimal(18, 2)))
INSERT [dbo].[Material] ([id_material], [name_material], [image], [ostatok], [cena], [id_type], [opisanie], [ed_ismer], [kol_na_sklade], [kol_v_upakovke]) VALUES (41, N'������ ���������', N'\image\picture.jpg', CAST(545.00 AS Decimal(18, 2)), 33.0000, 2, N'��������� ������� ����� �������� � ������, �������������� ����� ���������� �����, ����������� � ����� ������ ������ ������ ����. ������� ���������� ������� ����� ���������� ����� � ������ ������. � ���� ���� ������������ ��������� ������� �� ����� ������������ ��������. �������������. ������ �������� �������� �����������, ������ ����� ������������ ��� �������� ������� ������� ������� ����� � ��������� ������� ����� �� �����. ', N'��', CAST(26353.00 AS Decimal(18, 2)), CAST(243.00 AS Decimal(18, 2)))
INSERT [dbo].[Material] ([id_material], [name_material], [image], [ostatok], [cena], [id_type], [opisanie], [ed_ismer], [kol_na_sklade], [kol_v_upakovke]) VALUES (43, N'������� ���� ���������', N'\image\�����������_���������.jpg', CAST(735.00 AS Decimal(18, 2)), 25.0000, 3, N'��������� �������� ����� ����������� � ����� ������� ����� ��������� ����� �� �����. ��� ���������� �����, ������ �����, ������� �������������� ���������, �� � ������ �� �������� �� �������� ��� ��������. ��������� ������ ����������, ��� ������� � ������, ��������� � ��������� �������, ���������� ������-������������ � ����������.', N'��', CAST(35.00 AS Decimal(18, 2)), CAST(13.00 AS Decimal(18, 2)))
INSERT [dbo].[Material] ([id_material], [name_material], [image], [ostatok], [cena], [id_type], [opisanie], [ed_ismer], [kol_na_sklade], [kol_v_upakovke]) VALUES (44, N'������ ���������', N'\image\������_���������.jpg', CAST(65.00 AS Decimal(18, 2)), 434.0000, 2, N'������� (��������, �����) - ����������� ������ ��������, ������� ���������� � ������������ �����, ������, ��������� ��������, ������������ ������, ������������ ���������, ����������� ������������, ��������. ������� ������������ - ������� . ��� ������ �� ���� �� ��������� � ������ �� ������������� ����������. ����� ����� �� �������� ���������. � ������� �� ������-������� ��������� �������, �������� ����� ���������-���������� �������.', N'��. �����', CAST(423.00 AS Decimal(18, 2)), CAST(22.00 AS Decimal(18, 2)))
INSERT [dbo].[Material] ([id_material], [name_material], [image], [ostatok], [cena], [id_type], [opisanie], [ed_ismer], [kol_na_sklade], [kol_v_upakovke]) VALUES (45, N'����� ���������', N'\image\�����_���������.jpg', CAST(365.00 AS Decimal(18, 2)), 24.0000, 1, N'����� � ��� ������� � �������� ������ ���������. �������� �������� ������������ � ������������. ������������ �� ������� ����������� ����� �������� � ���-��������� ����, � ���������, � ��������. ... ��� ����� ����-����������� ����� �������� ������� ����������, �� ������������ � ��������� �������� �� ������. �� ���� ������� ������ �������� ���� ������ � ����������.', N'��', CAST(1426.00 AS Decimal(18, 2)), CAST(24.00 AS Decimal(18, 2)))
INSERT [dbo].[Material] ([id_material], [name_material], [image], [ostatok], [cena], [id_type], [opisanie], [ed_ismer], [kol_na_sklade], [kol_v_upakovke]) VALUES (46, N'����� ���������', N'\image\�����_���������.jpg', CAST(725.00 AS Decimal(18, 2)), 42.0000, 2, N'����� � ��� ������������ ������, �������������� � ������ ����������� �������. ��� ����� ��������� ������ ������������ ������� 70 ����� ������������� ���� ������������, ��� �������� ��������� ���� ��� ������� ����� � ������ ��� � ������ �������� ������ ����� ������. ��������� ������ �������� ��������������� ����������������� ����������������, ������ ������ ������������ � ���������������� �����.', N'�����', CAST(412214.00 AS Decimal(18, 2)), CAST(24.00 AS Decimal(18, 2)))
INSERT [dbo].[Material] ([id_material], [name_material], [image], [ostatok], [cena], [id_type], [opisanie], [ed_ismer], [kol_na_sklade], [kol_v_upakovke]) VALUES (47, N'���������� ���������������', N'\image\����������������_���������.jpg', CAST(45.00 AS Decimal(18, 2)), 67.0000, 1, N'��������� ������ (Dracaena draco) � ��� ���������� ��������, �� ��� ������� ������ ������ ����� ����� ������ �������. ��������� ������ ��� ������������ ������ �������� ��������� ��� (����������� ������), ������� ����������, �� �� ������� ������ ������������� ����������� �������-������� ����, ������������� �������� � �� ��������� ������������ � �����������. ', N'��', CAST(547.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)))
INSERT [dbo].[Material] ([id_material], [name_material], [image], [ostatok], [cena], [id_type], [opisanie], [ed_ismer], [kol_na_sklade], [kol_v_upakovke]) VALUES (48, N'��� ���������', N'\image\���_���������.jpg', CAST(355.00 AS Decimal(18, 2)), 2.0000, 1, N'�������� ��� �������� �������� �������. � ��������� � ������� ���������� ������� �����. ������ ������� ������������ � ���������� � ������������. 7. ����� ��� �������� ������� ��������� ����������. ���, ��������, � ���������� ����� �������������� ��� �������� ������ � ����������� � ������� �������������.', N'��', CAST(343.00 AS Decimal(18, 2)), CAST(22.00 AS Decimal(18, 2)))
INSERT [dbo].[Material] ([id_material], [name_material], [image], [ostatok], [cena], [id_type], [opisanie], [ed_ismer], [kol_na_sklade], [kol_v_upakovke]) VALUES (49, N'����� ���������', N'\image\�����_���������.jpg', CAST(636.00 AS Decimal(18, 2)), 22.0000, 2, N'����� � ��������� �������� ���� ����� ������������ (���. Fraxinus excelsior). �������� ��������� DIN 4076 ��� ����������� ���� ��������� ������������ ���������� �ES�. ����� ����� ������������ ����� ��� ������, �������� ����� �� ����������� � �������� ���������� ����, � ������ � �� ��������� �������. � ����������� ������ ��� � ����� ��������� ���������� ���������� ��������.', N'�����', CAST(3535.00 AS Decimal(18, 2)), CAST(15.00 AS Decimal(18, 2)))
INSERT [dbo].[Material] ([id_material], [name_material], [image], [ostatok], [cena], [id_type], [opisanie], [ed_ismer], [kol_na_sklade], [kol_v_upakovke]) VALUES (50, N'������� ���������', N'\image\�������_���������.jpg', CAST(343.00 AS Decimal(18, 2)), 53.0000, 3, N'����������� �������������� ��������� ������� ������: ��������� ����� 0,9 �/��?, ��������� �� �������� ����� 4 ��. (�� ���� � 2900). � ������������� ��������� ������� ����� ������� ������������ � ������� �� ���� ����������, �� �������� ������, ����� � �������. ... ���� �����������������, ������� ��������� �������, ����� ������������ � ��� �� ����������. ������� ����� ������� �� ������������ ����� ��� ������� ������. ', N'��', CAST(5453.00 AS Decimal(18, 2)), CAST(45.00 AS Decimal(18, 2)))
INSERT [dbo].[Material] ([id_material], [name_material], [image], [ostatok], [cena], [id_type], [opisanie], [ed_ismer], [kol_na_sklade], [kol_v_upakovke]) VALUES (51, N'���������� ���������', N'\image\picture.jpg', CAST(35.00 AS Decimal(18, 2)), 6532.0000, 1, N'���������� � ��� �������������� ������������ ������ � �����-������� ������ ����������� �������, ������������ ������. � ���� ������� �����, ������� � ������� �������� �������� � ������������� �����. �� ���� ���������� ����� ����������� � ����������� ����� �������. � ����� ����� �� ���������� �������-����� ����� � ����� ������������� � ���������� ����������. ', N'�����', CAST(2666.00 AS Decimal(18, 2)), CAST(13.00 AS Decimal(18, 2)))
INSERT [dbo].[Material] ([id_material], [name_material], [image], [ostatok], [cena], [id_type], [opisanie], [ed_ismer], [kol_na_sklade], [kol_v_upakovke]) VALUES (52, N'�������� ���������', N'\image\��������_���������.jpg', CAST(262.00 AS Decimal(18, 2)), 2262.0000, 2, N'��������� ��������� ��������� � ��������� ���������� ����. ��� ��������� � ������� � ����������, �������, ������� ��������� �������, � ����������� ������� ��������. ������������ �������� ������� ��������� � 20 �����. ������ �������� �������� ��������, ������� ����� � ������������ ��������, ������� � ��������������.', N'��', CAST(42432.00 AS Decimal(18, 2)), CAST(23.00 AS Decimal(18, 2)))
INSERT [dbo].[Material] ([id_material], [name_material], [image], [ostatok], [cena], [id_type], [opisanie], [ed_ismer], [kol_na_sklade], [kol_v_upakovke]) VALUES (53, N'������ ���������', N'image\������_���������.jpg', NULL, 645.0000, 3, N'', N'', CAST(457.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)))
INSERT [dbo].[Material] ([id_material], [name_material], [image], [ostatok], [cena], [id_type], [opisanie], [ed_ismer], [kol_na_sklade], [kol_v_upakovke]) VALUES (54, N'������', N'', NULL, 56.0000, 2, N'����', N'��', CAST(65.00 AS Decimal(18, 2)), CAST(6.00 AS Decimal(18, 2)))
INSERT [dbo].[Material] ([id_material], [name_material], [image], [ostatok], [cena], [id_type], [opisanie], [ed_ismer], [kol_na_sklade], [kol_v_upakovke]) VALUES (55, N'����', N'', NULL, 2323.0000, 2, N'������', N'67', CAST(56783.00 AS Decimal(18, 2)), CAST(5678.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[Material] OFF
SET IDENTITY_INSERT [dbo].[Postavshik] ON 

INSERT [dbo].[Postavshik] ([id_postavshik], [name_postavshik], [email_postavshik], [phone_postavshik], [logo_postavshik]) VALUES (101, N'������� ���������� ������', N'elvira07@sysoeva.org', N'8-800-121-66-81', N'\agents\agent_93.png')
INSERT [dbo].[Postavshik] ([id_postavshik], [name_postavshik], [email_postavshik], [phone_postavshik], [logo_postavshik]) VALUES (102, N'������������ ���� �������������', N'izolda.vorontov@lytkina.ru', N'(812) 267-19-59', N'\agents\agent_116.png')
INSERT [dbo].[Postavshik] ([id_postavshik], [name_postavshik], [email_postavshik], [phone_postavshik], [logo_postavshik]) VALUES (103, N'������� �������� ���������', N'artem.fadeev@polykov.com', N'+7 (922) 467-93-83', N'\agents\agent_66.png')
INSERT [dbo].[Postavshik] ([id_postavshik], [name_postavshik], [email_postavshik], [phone_postavshik], [logo_postavshik]) VALUES (104, N'������� ��������� ��������', N'fedotov.platon@pavlov.ru', N'8-800-317-35-79', N'\agents\agent_96.png')
INSERT [dbo].[Postavshik] ([id_postavshik], [name_postavshik], [email_postavshik], [phone_postavshik], [logo_postavshik]) VALUES (105, N'������� ������������� �����', N'faina.tikonova@veselov.com', N'+7 (922) 851-23-23', N'\agents\agent_58.png')
INSERT [dbo].[Postavshik] ([id_postavshik], [name_postavshik], [email_postavshik], [phone_postavshik], [logo_postavshik]) VALUES (106, N'����� ��������� ���������', N'viktoriy.belozerova@isaev.net', N'(495) 931-29-26', NULL)
INSERT [dbo].[Postavshik] ([id_postavshik], [name_postavshik], [email_postavshik], [phone_postavshik], [logo_postavshik]) VALUES (107, N'�������� ��������� ���������', N'nazarov.polina@voronova.ru', N'(495) 445-61-43', N'\agents\agent_108.png')
INSERT [dbo].[Postavshik] ([id_postavshik], [name_postavshik], [email_postavshik], [phone_postavshik], [logo_postavshik]) VALUES (108, N'��������� ������� ���������', N'lebedeva.larisa@lavrentev.net', N'8-800-232-56-37', N'\agents\agent_97.png')
INSERT [dbo].[Postavshik] ([id_postavshik], [name_postavshik], [email_postavshik], [phone_postavshik], [logo_postavshik]) VALUES (109, N'�������� ������� ���������', N'tamara22@pavlova.com', N'(495) 713-51-83', N'\agents\agent_100.png')
INSERT [dbo].[Postavshik] ([id_postavshik], [name_postavshik], [email_postavshik], [phone_postavshik], [logo_postavshik]) VALUES (110, N'����� ��������� ������', N'alina56@zdanov.com', N'(812) 823-93-42', N'\agents\agent_59.png')
INSERT [dbo].[Postavshik] ([id_postavshik], [name_postavshik], [email_postavshik], [phone_postavshik], [logo_postavshik]) VALUES (111, N'������ �������� ��������', N'nikodim81@kiseleva.com', N'8-800-582-39-19', N'\agents\agent_38.png')
INSERT [dbo].[Postavshik] ([id_postavshik], [name_postavshik], [email_postavshik], [phone_postavshik], [logo_postavshik]) VALUES (112, N'��������� �������� ���������', N'sermakova@sarova.net', N'(35222) 96-19-26', N'\agents\agent_45.png')
INSERT [dbo].[Postavshik] ([id_postavshik], [name_postavshik], [email_postavshik], [phone_postavshik], [logo_postavshik]) VALUES (113, N'��������� ��������� �������', N'dsiryev@dementeva.com', N'8-800-511-43-61', N'\agents\agent_46.png')
INSERT [dbo].[Postavshik] ([id_postavshik], [name_postavshik], [email_postavshik], [phone_postavshik], [logo_postavshik]) VALUES (114, N'�������� ������� ���������', N'nelli11@gureva.ru', N'(495) 893-71-17', N'\agents\agent_54.png')
INSERT [dbo].[Postavshik] ([id_postavshik], [name_postavshik], [email_postavshik], [phone_postavshik], [logo_postavshik]) VALUES (115, N'����� ������ ���������', N'tdrozdov@ersova.ru', N'(35222) 73-44-19', N'\agents\agent_78.png')
INSERT [dbo].[Postavshik] ([id_postavshik], [name_postavshik], [email_postavshik], [phone_postavshik], [logo_postavshik]) VALUES (116, N'���� ������������ Ը�������', N'wsamsonov@martynov.ru', N'+7 (922) 233-27-68', N'\agents\agent_76.png')
INSERT [dbo].[Postavshik] ([id_postavshik], [name_postavshik], [email_postavshik], [phone_postavshik], [logo_postavshik]) VALUES (117, N'���� ������������� ������', N'boleslav.zukova@nikiforova.com', N'(495) 688-28-59', N'\agents\agent_30.png')
INSERT [dbo].[Postavshik] ([id_postavshik], [name_postavshik], [email_postavshik], [phone_postavshik], [logo_postavshik]) VALUES (118, N'������� ��������� ������', N'gerasim.makarov@kornilov.ru', N'8-800-538-41-77', NULL)
INSERT [dbo].[Postavshik] ([id_postavshik], [name_postavshik], [email_postavshik], [phone_postavshik], [logo_postavshik]) VALUES (119, N'�������� ����� ���������', N'kanisimov@nikolaev.ru', N'(495) 452-58-94', N'\agents\agent_92.png')
INSERT [dbo].[Postavshik] ([id_postavshik], [name_postavshik], [email_postavshik], [phone_postavshik], [logo_postavshik]) VALUES (120, N'������ ������������� ��������', N'stanislav.zykov@volkova.net', N'+7 (922) 596-14-53', N'\agents\agent_120.png')
INSERT [dbo].[Postavshik] ([id_postavshik], [name_postavshik], [email_postavshik], [phone_postavshik], [logo_postavshik]) VALUES (121, N'�������� ���������� ���������', N'galina31@melnikov.ru', N'(35222) 39-28-95', N'\agents\agent_31.png')
INSERT [dbo].[Postavshik] ([id_postavshik], [name_postavshik], [email_postavshik], [phone_postavshik], [logo_postavshik]) VALUES (122, N'����������� ������ ���������', N'vladlena58@seliverstova.ru', N'(495) 284-69-37', N'\agents\agent_44.png')
INSERT [dbo].[Postavshik] ([id_postavshik], [name_postavshik], [email_postavshik], [phone_postavshik], [logo_postavshik]) VALUES (123, N'����� ������� ������', N'dmitrii05@zukov.ru', N'(812) 132-93-75', N'\agents\agent_95.png')
INSERT [dbo].[Postavshik] ([id_postavshik], [name_postavshik], [email_postavshik], [phone_postavshik], [logo_postavshik]) VALUES (124, N'������ �������� ������', N'albert57@burova.ru', N'(812) 524-87-16', NULL)
INSERT [dbo].[Postavshik] ([id_postavshik], [name_postavshik], [email_postavshik], [phone_postavshik], [logo_postavshik]) VALUES (125, N'��������� ������������ ������', N'vladlen06@melnikov.net', N'(812) 976-77-15', N'\agents\agent_106.png')
INSERT [dbo].[Postavshik] ([id_postavshik], [name_postavshik], [email_postavshik], [phone_postavshik], [logo_postavshik]) VALUES (126, N'������ ��������� ���������', N'gorskov.larisa@kalinin.com', N'8-800-752-71-45', N'\agents\agent_37.png')
INSERT [dbo].[Postavshik] ([id_postavshik], [name_postavshik], [email_postavshik], [phone_postavshik], [logo_postavshik]) VALUES (127, N'��������� ������ ����������', N'pstepanova@siryev.com', N'(35222) 85-24-18', N'\agents\agent_105.png')
INSERT [dbo].[Postavshik] ([id_postavshik], [name_postavshik], [email_postavshik], [phone_postavshik], [logo_postavshik]) VALUES (128, N'������ ����� ����������', N'maiy.belov@rogov.ru', N'(495) 374-21-79', N'\agents\agent_62.png')
INSERT [dbo].[Postavshik] ([id_postavshik], [name_postavshik], [email_postavshik], [phone_postavshik], [logo_postavshik]) VALUES (129, N'������ �������� ����������', N'faina02@muraveva.com', N'+7 (922) 248-79-98', N'\agents\agent_74.png')
INSERT [dbo].[Postavshik] ([id_postavshik], [name_postavshik], [email_postavshik], [phone_postavshik], [logo_postavshik]) VALUES (130, N'������ ������ ������������', N'ivanova.antonin@rodionov.ru', N'+7 (922) 947-11-99', N'\agents\agent_63.png')
INSERT [dbo].[Postavshik] ([id_postavshik], [name_postavshik], [email_postavshik], [phone_postavshik], [logo_postavshik]) VALUES (131, N'������� ������ ���������', N'veronika.egorov@bespalova.com', N'(35222) 13-15-63', N'\agents\agent_41.png')
INSERT [dbo].[Postavshik] ([id_postavshik], [name_postavshik], [email_postavshik], [phone_postavshik], [logo_postavshik]) VALUES (132, N'����� ��������� ���������', N'danila.birykov@stepanov.ru', N'8-800-753-27-68', N'\agents\agent_90.png')
INSERT [dbo].[Postavshik] ([id_postavshik], [name_postavshik], [email_postavshik], [phone_postavshik], [logo_postavshik]) VALUES (133, N'������� Ը������� ���������', N'lydmila.belyeva@karpov.ru', N'(495) 277-77-59', N'\agents\agent_47.png')
INSERT [dbo].[Postavshik] ([id_postavshik], [name_postavshik], [email_postavshik], [phone_postavshik], [logo_postavshik]) VALUES (134, N'������ ������� ����������', N'emysnikov@kiselev.net', N'8-800-933-48-75', N'\agents\agent_85.png')
INSERT [dbo].[Postavshik] ([id_postavshik], [name_postavshik], [email_postavshik], [phone_postavshik], [logo_postavshik]) VALUES (135, N'����� ������������ ���������', N'ybragina@odintov.org', N'(35222) 41-81-98', N'\agents\agent_86.png')
SET IDENTITY_INSERT [dbo].[Postavshik] OFF
SET IDENTITY_INSERT [dbo].[Type] ON 

INSERT [dbo].[Type] ([id_type], [name_type]) VALUES (1, N'������')
INSERT [dbo].[Type] ([id_type], [name_type]) VALUES (2, N'������')
INSERT [dbo].[Type] ([id_type], [name_type]) VALUES (3, N'���������')
SET IDENTITY_INSERT [dbo].[Type] OFF
SET IDENTITY_INSERT [dbo].[Type_Produkcii] ON 

INSERT [dbo].[Type_Produkcii] ([id_type_produkcii], [type_produkcii]) VALUES (1, N'��������')
INSERT [dbo].[Type_Produkcii] ([id_type_produkcii], [type_produkcii]) VALUES (2, N'��������')
INSERT [dbo].[Type_Produkcii] ([id_type_produkcii], [type_produkcii]) VALUES (3, N'����������')
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
