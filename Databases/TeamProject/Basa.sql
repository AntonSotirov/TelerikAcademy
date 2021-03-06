USE [master]
GO
/****** Object:  Database [supermarket]    Script Date: 23.7.2013 г. 13:24:18 ******/
CREATE DATABASE [supermarket]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'supermarket', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\supermarket.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'supermarket_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\supermarket_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [supermarket] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [supermarket].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [supermarket] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [supermarket] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [supermarket] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [supermarket] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [supermarket] SET ARITHABORT OFF 
GO
ALTER DATABASE [supermarket] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [supermarket] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [supermarket] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [supermarket] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [supermarket] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [supermarket] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [supermarket] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [supermarket] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [supermarket] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [supermarket] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [supermarket] SET  DISABLE_BROKER 
GO
ALTER DATABASE [supermarket] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [supermarket] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [supermarket] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [supermarket] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [supermarket] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [supermarket] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [supermarket] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [supermarket] SET RECOVERY FULL 
GO
ALTER DATABASE [supermarket] SET  MULTI_USER 
GO
ALTER DATABASE [supermarket] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [supermarket] SET DB_CHAINING OFF 
GO
ALTER DATABASE [supermarket] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [supermarket] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'supermarket', N'ON'
GO
USE [supermarket]
GO
/****** Object:  Table [dbo].[Expenses]    Script Date: 23.7.2013 г. 13:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Expenses](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[VendorID] [int] NOT NULL,
	[Mounth] [nvarchar](50) NOT NULL,
	[Expenses] [decimal](10, 2) NOT NULL,
 CONSTRAINT [PK_Expenses] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Mesures]    Script Date: 23.7.2013 г. 13:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mesures](
	[ID] [int] NOT NULL,
	[Mesure_Name] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_mesures] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Products]    Script Date: 23.7.2013 г. 13:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ID] [int] NOT NULL,
	[Product_Name] [nvarchar](100) NOT NULL,
	[Base_Price] [decimal](10, 2) NOT NULL,
	[mesures_ID] [int] NOT NULL,
	[vendors_ID] [int] NOT NULL,
 CONSTRAINT [PK_products] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SellsReport]    Script Date: 23.7.2013 г. 13:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SellsReport](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[UnitPrice] [decimal](10, 2) NOT NULL,
	[Location] [nvarchar](100) NOT NULL,
	[FromDate] [date] NULL,
 CONSTRAINT [PK_SellsReport] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Vendors]    Script Date: 23.7.2013 г. 13:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vendors](
	[ID] [int] NOT NULL,
	[VendorName] [nvarchar](100) NULL,
 CONSTRAINT [PK_vendors] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Expenses] ON 

INSERT [dbo].[Expenses] ([ID], [VendorID], [Mounth], [Expenses]) VALUES (1, 4, N'Jul-2013', CAST(30.00 AS Decimal(10, 2)))
INSERT [dbo].[Expenses] ([ID], [VendorID], [Mounth], [Expenses]) VALUES (2, 4, N'Aug-2013', CAST(40.00 AS Decimal(10, 2)))
INSERT [dbo].[Expenses] ([ID], [VendorID], [Mounth], [Expenses]) VALUES (3, 2, N'Jul-2013', CAST(200.00 AS Decimal(10, 2)))
INSERT [dbo].[Expenses] ([ID], [VendorID], [Mounth], [Expenses]) VALUES (4, 2, N'Aug-2013', CAST(180.00 AS Decimal(10, 2)))
INSERT [dbo].[Expenses] ([ID], [VendorID], [Mounth], [Expenses]) VALUES (5, 1, N'Jul-2013', CAST(120.00 AS Decimal(10, 2)))
INSERT [dbo].[Expenses] ([ID], [VendorID], [Mounth], [Expenses]) VALUES (6, 1, N'Aug-2013', CAST(180.00 AS Decimal(10, 2)))
INSERT [dbo].[Expenses] ([ID], [VendorID], [Mounth], [Expenses]) VALUES (7, 4, N'Jul-2013', CAST(30.00 AS Decimal(10, 2)))
INSERT [dbo].[Expenses] ([ID], [VendorID], [Mounth], [Expenses]) VALUES (8, 4, N'Aug-2013', CAST(40.00 AS Decimal(10, 2)))
INSERT [dbo].[Expenses] ([ID], [VendorID], [Mounth], [Expenses]) VALUES (9, 2, N'Jul-2013', CAST(200.00 AS Decimal(10, 2)))
INSERT [dbo].[Expenses] ([ID], [VendorID], [Mounth], [Expenses]) VALUES (10, 2, N'Aug-2013', CAST(180.00 AS Decimal(10, 2)))
INSERT [dbo].[Expenses] ([ID], [VendorID], [Mounth], [Expenses]) VALUES (11, 1, N'Jul-2013', CAST(120.00 AS Decimal(10, 2)))
INSERT [dbo].[Expenses] ([ID], [VendorID], [Mounth], [Expenses]) VALUES (12, 1, N'Aug-2013', CAST(180.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[Expenses] OFF
INSERT [dbo].[Mesures] ([ID], [Mesure_Name]) VALUES (3, N'grams')
INSERT [dbo].[Mesures] ([ID], [Mesure_Name]) VALUES (5, N'kg')
INSERT [dbo].[Mesures] ([ID], [Mesure_Name]) VALUES (1, N'liters')
INSERT [dbo].[Mesures] ([ID], [Mesure_Name]) VALUES (4, N'packs')
INSERT [dbo].[Mesures] ([ID], [Mesure_Name]) VALUES (2, N'pieces')
INSERT [dbo].[Products] ([ID], [Product_Name], [Base_Price], [mesures_ID], [vendors_ID]) VALUES (1, N'Beer "Zagorka"', CAST(0.95 AS Decimal(10, 2)), 1, 1)
INSERT [dbo].[Products] ([ID], [Product_Name], [Base_Price], [mesures_ID], [vendors_ID]) VALUES (2, N'Vodka "Targovishte"', CAST(7.85 AS Decimal(10, 2)), 1, 2)
INSERT [dbo].[Products] ([ID], [Product_Name], [Base_Price], [mesures_ID], [vendors_ID]) VALUES (3, N'30Beer "Beck''s"', CAST(0.69 AS Decimal(10, 2)), 1, 3)
INSERT [dbo].[Products] ([ID], [Product_Name], [Base_Price], [mesures_ID], [vendors_ID]) VALUES (4, N'Chocolate "Nestle"', CAST(2.80 AS Decimal(10, 2)), 3, 4)
INSERT [dbo].[Products] ([ID], [Product_Name], [Base_Price], [mesures_ID], [vendors_ID]) VALUES (5, N'Chocolate "Svoge"', CAST(2.20 AS Decimal(10, 2)), 3, 5)
INSERT [dbo].[Products] ([ID], [Product_Name], [Base_Price], [mesures_ID], [vendors_ID]) VALUES (6, N'Beer "Kamenitza"', CAST(1.00 AS Decimal(10, 2)), 1, 6)
INSERT [dbo].[Products] ([ID], [Product_Name], [Base_Price], [mesures_ID], [vendors_ID]) VALUES (7, N'Shpek "Bourgas"', CAST(6.36 AS Decimal(10, 2)), 3, 7)
INSERT [dbo].[Products] ([ID], [Product_Name], [Base_Price], [mesures_ID], [vendors_ID]) VALUES (8, N'Beer "Ariana"', CAST(0.95 AS Decimal(10, 2)), 1, 8)
INSERT [dbo].[Products] ([ID], [Product_Name], [Base_Price], [mesures_ID], [vendors_ID]) VALUES (9, N'Popcorn "Lidl"', CAST(0.55 AS Decimal(10, 2)), 2, 9)
INSERT [dbo].[Products] ([ID], [Product_Name], [Base_Price], [mesures_ID], [vendors_ID]) VALUES (10, N'Gummy Bears "Haribo"', CAST(3.25 AS Decimal(10, 2)), 3, 10)
INSERT [dbo].[Products] ([ID], [Product_Name], [Base_Price], [mesures_ID], [vendors_ID]) VALUES (11, N'Beer "Amstel"', CAST(0.95 AS Decimal(10, 2)), 1, 11)
INSERT [dbo].[Products] ([ID], [Product_Name], [Base_Price], [mesures_ID], [vendors_ID]) VALUES (12, N'Beer "Haineken"', CAST(3.20 AS Decimal(10, 2)), 1, 12)
INSERT [dbo].[Products] ([ID], [Product_Name], [Base_Price], [mesures_ID], [vendors_ID]) VALUES (13, N'Shpek "Leki"', CAST(6.99 AS Decimal(10, 2)), 3, 13)
INSERT [dbo].[Products] ([ID], [Product_Name], [Base_Price], [mesures_ID], [vendors_ID]) VALUES (14, N'Teleshki Salam "Leki"', CAST(2.80 AS Decimal(10, 2)), 3, 13)
INSERT [dbo].[Products] ([ID], [Product_Name], [Base_Price], [mesures_ID], [vendors_ID]) VALUES (15, N'Kamchiq Salam "Leki"', CAST(3.20 AS Decimal(10, 2)), 3, 13)
INSERT [dbo].[Products] ([ID], [Product_Name], [Base_Price], [mesures_ID], [vendors_ID]) VALUES (16, N'Shpek "Sami M"', CAST(5.69 AS Decimal(10, 2)), 3, 14)
INSERT [dbo].[Products] ([ID], [Product_Name], [Base_Price], [mesures_ID], [vendors_ID]) VALUES (17, N'Donut "Lidl"', CAST(0.65 AS Decimal(10, 2)), 2, 9)
INSERT [dbo].[Products] ([ID], [Product_Name], [Base_Price], [mesures_ID], [vendors_ID]) VALUES (18, N'Whiskey "JB"', CAST(17.89 AS Decimal(10, 2)), 1, 15)
INSERT [dbo].[Products] ([ID], [Product_Name], [Base_Price], [mesures_ID], [vendors_ID]) VALUES (19, N'Vodka "Sobieski"', CAST(13.25 AS Decimal(10, 2)), 1, 16)
INSERT [dbo].[Products] ([ID], [Product_Name], [Base_Price], [mesures_ID], [vendors_ID]) VALUES (20, N'Lutenica "Olineza"', CAST(3.99 AS Decimal(10, 2)), 1, 20)
INSERT [dbo].[Products] ([ID], [Product_Name], [Base_Price], [mesures_ID], [vendors_ID]) VALUES (21, N'Majoneza "Olineza"', CAST(4.25 AS Decimal(10, 2)), 1, 20)
INSERT [dbo].[Products] ([ID], [Product_Name], [Base_Price], [mesures_ID], [vendors_ID]) VALUES (22, N'Ketchup "Olineza"', CAST(1.65 AS Decimal(10, 2)), 1, 20)
INSERT [dbo].[Products] ([ID], [Product_Name], [Base_Price], [mesures_ID], [vendors_ID]) VALUES (23, N'Gorchitza "Olineza"', CAST(1.00 AS Decimal(10, 2)), 1, 20)
INSERT [dbo].[Products] ([ID], [Product_Name], [Base_Price], [mesures_ID], [vendors_ID]) VALUES (24, N'Ketchup Detski "Olineza"', CAST(3.65 AS Decimal(10, 2)), 1, 20)
INSERT [dbo].[Products] ([ID], [Product_Name], [Base_Price], [mesures_ID], [vendors_ID]) VALUES (25, N'Kroasan "7Days"', CAST(0.95 AS Decimal(10, 2)), 3, 17)
INSERT [dbo].[Products] ([ID], [Product_Name], [Base_Price], [mesures_ID], [vendors_ID]) VALUES (26, N'Suha Pasta "7Days"', CAST(0.40 AS Decimal(10, 2)), 3, 17)
INSERT [dbo].[Products] ([ID], [Product_Name], [Base_Price], [mesures_ID], [vendors_ID]) VALUES (27, N'Vafla "7Days"', CAST(0.30 AS Decimal(10, 2)), 3, 17)
INSERT [dbo].[Products] ([ID], [Product_Name], [Base_Price], [mesures_ID], [vendors_ID]) VALUES (28, N'Neskafe "Nestle"', CAST(0.29 AS Decimal(10, 2)), 2, 4)
INSERT [dbo].[Products] ([ID], [Product_Name], [Base_Price], [mesures_ID], [vendors_ID]) VALUES (29, N'Nestea "Nestle"', CAST(3.20 AS Decimal(10, 2)), 1, 4)
INSERT [dbo].[Products] ([ID], [Product_Name], [Base_Price], [mesures_ID], [vendors_ID]) VALUES (30, N'Figaro "Nestle"', CAST(3.88 AS Decimal(10, 2)), 3, 4)
INSERT [dbo].[Products] ([ID], [Product_Name], [Base_Price], [mesures_ID], [vendors_ID]) VALUES (31, N'Almond "Nestle"', CAST(3.99 AS Decimal(10, 2)), 3, 4)
INSERT [dbo].[Products] ([ID], [Product_Name], [Base_Price], [mesures_ID], [vendors_ID]) VALUES (32, N'Vafla "Nestle"', CAST(0.50 AS Decimal(10, 2)), 3, 4)
INSERT [dbo].[Products] ([ID], [Product_Name], [Base_Price], [mesures_ID], [vendors_ID]) VALUES (33, N'Chocolate "Milka"', CAST(2.20 AS Decimal(10, 2)), 3, 18)
INSERT [dbo].[Products] ([ID], [Product_Name], [Base_Price], [mesures_ID], [vendors_ID]) VALUES (34, N'Vafla "Milka"', CAST(0.65 AS Decimal(10, 2)), 3, 18)
INSERT [dbo].[Products] ([ID], [Product_Name], [Base_Price], [mesures_ID], [vendors_ID]) VALUES (35, N'Bonboni "Milka"', CAST(3.99 AS Decimal(10, 2)), 3, 18)
INSERT [dbo].[Products] ([ID], [Product_Name], [Base_Price], [mesures_ID], [vendors_ID]) VALUES (36, N'Biskviti "Milka"', CAST(2.33 AS Decimal(10, 2)), 3, 18)
INSERT [dbo].[Products] ([ID], [Product_Name], [Base_Price], [mesures_ID], [vendors_ID]) VALUES (37, N'Lutenitza "Deroni"', CAST(3.99 AS Decimal(10, 2)), 1, 19)
INSERT [dbo].[Products] ([ID], [Product_Name], [Base_Price], [mesures_ID], [vendors_ID]) VALUES (38, N'Ketchup "Deroni"', CAST(1.99 AS Decimal(10, 2)), 1, 19)
INSERT [dbo].[Products] ([ID], [Product_Name], [Base_Price], [mesures_ID], [vendors_ID]) VALUES (39, N'Majoneza "Deroni"', CAST(3.98 AS Decimal(10, 2)), 1, 19)
INSERT [dbo].[Products] ([ID], [Product_Name], [Base_Price], [mesures_ID], [vendors_ID]) VALUES (40, N'Gorchitza "Deroni"', CAST(1.65 AS Decimal(10, 2)), 1, 19)
INSERT [dbo].[Products] ([ID], [Product_Name], [Base_Price], [mesures_ID], [vendors_ID]) VALUES (41, N'Ketchup Detski "Deroni"', CAST(3.22 AS Decimal(10, 2)), 1, 19)
INSERT [dbo].[Products] ([ID], [Product_Name], [Base_Price], [mesures_ID], [vendors_ID]) VALUES (42, N'Nadenitza "Leki"', CAST(4.55 AS Decimal(10, 2)), 3, 13)
INSERT [dbo].[Products] ([ID], [Product_Name], [Base_Price], [mesures_ID], [vendors_ID]) VALUES (43, N'Lionska Nadenitza "Leki"', CAST(3.66 AS Decimal(10, 2)), 3, 13)
INSERT [dbo].[Products] ([ID], [Product_Name], [Base_Price], [mesures_ID], [vendors_ID]) VALUES (44, N'Nadenitza "Sami M"', CAST(4.22 AS Decimal(10, 2)), 3, 14)
INSERT [dbo].[Products] ([ID], [Product_Name], [Base_Price], [mesures_ID], [vendors_ID]) VALUES (45, N'Teleshki Salam "Sami M"', CAST(3.20 AS Decimal(10, 2)), 3, 14)
INSERT [dbo].[Products] ([ID], [Product_Name], [Base_Price], [mesures_ID], [vendors_ID]) VALUES (46, N'Kamchiq Salam "Sami M"', CAST(3.50 AS Decimal(10, 2)), 3, 14)
INSERT [dbo].[Products] ([ID], [Product_Name], [Base_Price], [mesures_ID], [vendors_ID]) VALUES (47, N'Kajma "Sami M"', CAST(3.99 AS Decimal(10, 2)), 3, 14)
INSERT [dbo].[Products] ([ID], [Product_Name], [Base_Price], [mesures_ID], [vendors_ID]) VALUES (48, N'Kajma "Leki"', CAST(3.66 AS Decimal(10, 2)), 3, 13)
INSERT [dbo].[Products] ([ID], [Product_Name], [Base_Price], [mesures_ID], [vendors_ID]) VALUES (49, N'Sos Tartar "Deroni"', CAST(3.20 AS Decimal(10, 2)), 1, 19)
INSERT [dbo].[Products] ([ID], [Product_Name], [Base_Price], [mesures_ID], [vendors_ID]) VALUES (50, N'Sos Barbecue "Olineza"', CAST(3.50 AS Decimal(10, 2)), 1, 20)
SET IDENTITY_INSERT [dbo].[SellsReport] ON 

INSERT [dbo].[SellsReport] ([ID], [ProductID], [Quantity], [UnitPrice], [Location], [FromDate]) VALUES (1, 1, 37, CAST(1.00 AS Decimal(10, 2)), N'Supermarket “Bourgas – Plaza”', CAST(0x5C370B00 AS Date))
INSERT [dbo].[SellsReport] ([ID], [ProductID], [Quantity], [UnitPrice], [Location], [FromDate]) VALUES (2, 2, 14, CAST(8.50 AS Decimal(10, 2)), N'Supermarket “Bourgas – Plaza”', CAST(0x5C370B00 AS Date))
INSERT [dbo].[SellsReport] ([ID], [ProductID], [Quantity], [UnitPrice], [Location], [FromDate]) VALUES (3, 3, 40, CAST(1.20 AS Decimal(10, 2)), N'Supermarket “Kaspichan – Center”', CAST(0x5C370B00 AS Date))
INSERT [dbo].[SellsReport] ([ID], [ProductID], [Quantity], [UnitPrice], [Location], [FromDate]) VALUES (4, 1, 65, CAST(0.92 AS Decimal(10, 2)), N'Supermarket “Kaspichan – Center”', CAST(0x5C370B00 AS Date))
INSERT [dbo].[SellsReport] ([ID], [ProductID], [Quantity], [UnitPrice], [Location], [FromDate]) VALUES (5, 4, 12, CAST(2.90 AS Decimal(10, 2)), N'Supermarket “Kaspichan – Center”', CAST(0x5C370B00 AS Date))
INSERT [dbo].[SellsReport] ([ID], [ProductID], [Quantity], [UnitPrice], [Location], [FromDate]) VALUES (6, 4, 7, CAST(2.85 AS Decimal(10, 2)), N'Supermarket “Bay Ivan” – Zmeyovo', CAST(0x5C370B00 AS Date))
INSERT [dbo].[SellsReport] ([ID], [ProductID], [Quantity], [UnitPrice], [Location], [FromDate]) VALUES (7, 2, 4, CAST(7.80 AS Decimal(10, 2)), N'Supermarket “Bay Ivan” – Zmeyovo', CAST(0x5C370B00 AS Date))
INSERT [dbo].[SellsReport] ([ID], [ProductID], [Quantity], [UnitPrice], [Location], [FromDate]) VALUES (8, 1, 11, CAST(1.00 AS Decimal(10, 2)), N'Supermarket “Bourgas – Plaza”', CAST(0x5D370B00 AS Date))
INSERT [dbo].[SellsReport] ([ID], [ProductID], [Quantity], [UnitPrice], [Location], [FromDate]) VALUES (9, 2, 20, CAST(8.50 AS Decimal(10, 2)), N'Supermarket “Bourgas – Plaza”', CAST(0x5D370B00 AS Date))
INSERT [dbo].[SellsReport] ([ID], [ProductID], [Quantity], [UnitPrice], [Location], [FromDate]) VALUES (10, 3, 43, CAST(1.20 AS Decimal(10, 2)), N'Supermarket “Kaspichan – Center”', CAST(0x5D370B00 AS Date))
INSERT [dbo].[SellsReport] ([ID], [ProductID], [Quantity], [UnitPrice], [Location], [FromDate]) VALUES (11, 1, 78, CAST(0.92 AS Decimal(10, 2)), N'Supermarket “Kaspichan – Center”', CAST(0x5D370B00 AS Date))
INSERT [dbo].[SellsReport] ([ID], [ProductID], [Quantity], [UnitPrice], [Location], [FromDate]) VALUES (12, 4, 9, CAST(2.90 AS Decimal(10, 2)), N'Supermarket “Kaspichan – Center”', CAST(0x5D370B00 AS Date))
INSERT [dbo].[SellsReport] ([ID], [ProductID], [Quantity], [UnitPrice], [Location], [FromDate]) VALUES (13, 3, 75, CAST(1.05 AS Decimal(10, 2)), N'Supermarket “Plovdiv – Stolipinovo”', CAST(0x5D370B00 AS Date))
INSERT [dbo].[SellsReport] ([ID], [ProductID], [Quantity], [UnitPrice], [Location], [FromDate]) VALUES (14, 1, 146, CAST(0.88 AS Decimal(10, 2)), N'Supermarket “Plovdiv – Stolipinovo”', CAST(0x5D370B00 AS Date))
INSERT [dbo].[SellsReport] ([ID], [ProductID], [Quantity], [UnitPrice], [Location], [FromDate]) VALUES (15, 2, 67, CAST(7.70 AS Decimal(10, 2)), N'Supermarket “Plovdiv – Stolipinovo”', CAST(0x5D370B00 AS Date))
INSERT [dbo].[SellsReport] ([ID], [ProductID], [Quantity], [UnitPrice], [Location], [FromDate]) VALUES (16, 4, 5, CAST(2.85 AS Decimal(10, 2)), N'Supermarket “Bay Ivan” – Zmeyovo', CAST(0x5D370B00 AS Date))
INSERT [dbo].[SellsReport] ([ID], [ProductID], [Quantity], [UnitPrice], [Location], [FromDate]) VALUES (17, 2, 3, CAST(7.80 AS Decimal(10, 2)), N'Supermarket “Bay Ivan” – Zmeyovo', CAST(0x5D370B00 AS Date))
INSERT [dbo].[SellsReport] ([ID], [ProductID], [Quantity], [UnitPrice], [Location], [FromDate]) VALUES (18, 2, 24, CAST(8.50 AS Decimal(10, 2)), N'Supermarket “Bourgas – Plaza”', CAST(0x5E370B00 AS Date))
INSERT [dbo].[SellsReport] ([ID], [ProductID], [Quantity], [UnitPrice], [Location], [FromDate]) VALUES (19, 1, 16, CAST(1.00 AS Decimal(10, 2)), N'Supermarket “Bourgas – Plaza”', CAST(0x5E370B00 AS Date))
INSERT [dbo].[SellsReport] ([ID], [ProductID], [Quantity], [UnitPrice], [Location], [FromDate]) VALUES (20, 1, 90, CAST(0.92 AS Decimal(10, 2)), N'Supermarket “Kaspichan – Center”', CAST(0x5E370B00 AS Date))
INSERT [dbo].[SellsReport] ([ID], [ProductID], [Quantity], [UnitPrice], [Location], [FromDate]) VALUES (21, 4, 14, CAST(2.90 AS Decimal(10, 2)), N'Supermarket “Kaspichan – Center”', CAST(0x5E370B00 AS Date))
INSERT [dbo].[SellsReport] ([ID], [ProductID], [Quantity], [UnitPrice], [Location], [FromDate]) VALUES (22, 3, 18, CAST(1.20 AS Decimal(10, 2)), N'Supermarket “Kaspichan – Center”', CAST(0x5E370B00 AS Date))
INSERT [dbo].[SellsReport] ([ID], [ProductID], [Quantity], [UnitPrice], [Location], [FromDate]) VALUES (23, 2, 12, CAST(7.70 AS Decimal(10, 2)), N'Supermarket “Plovdiv – Stolipinovo”', CAST(0x5E370B00 AS Date))
INSERT [dbo].[SellsReport] ([ID], [ProductID], [Quantity], [UnitPrice], [Location], [FromDate]) VALUES (24, 3, 60, CAST(1.05 AS Decimal(10, 2)), N'Supermarket “Plovdiv – Stolipinovo”', CAST(0x5E370B00 AS Date))
INSERT [dbo].[SellsReport] ([ID], [ProductID], [Quantity], [UnitPrice], [Location], [FromDate]) VALUES (25, 1, 230, CAST(0.88 AS Decimal(10, 2)), N'Supermarket “Plovdiv – Stolipinovo”', CAST(0x5E370B00 AS Date))
SET IDENTITY_INSERT [dbo].[SellsReport] OFF
INSERT [dbo].[Vendors] ([ID], [VendorName]) VALUES (17, N'7Days Corp.')
INSERT [dbo].[Vendors] ([ID], [VendorName]) VALUES (11, N'Amstel OOD')
INSERT [dbo].[Vendors] ([ID], [VendorName]) VALUES (8, N'Ariana Corp.')
INSERT [dbo].[Vendors] ([ID], [VendorName]) VALUES (3, N'Beck''s LTD')
INSERT [dbo].[Vendors] ([ID], [VendorName]) VALUES (7, N'Bourgas Salams LTD')
INSERT [dbo].[Vendors] ([ID], [VendorName]) VALUES (19, N'Deroni Corp')
INSERT [dbo].[Vendors] ([ID], [VendorName]) VALUES (12, N'Haineken LTD')
INSERT [dbo].[Vendors] ([ID], [VendorName]) VALUES (10, N'Haribo Sweets LTD')
INSERT [dbo].[Vendors] ([ID], [VendorName]) VALUES (15, N'Jim Beam LTD')
INSERT [dbo].[Vendors] ([ID], [VendorName]) VALUES (6, N'Kamenitza OOD')
INSERT [dbo].[Vendors] ([ID], [VendorName]) VALUES (13, N'LEKI Corp.')
INSERT [dbo].[Vendors] ([ID], [VendorName]) VALUES (9, N'LIDL Corp.')
INSERT [dbo].[Vendors] ([ID], [VendorName]) VALUES (18, N'Milka OOD')
INSERT [dbo].[Vendors] ([ID], [VendorName]) VALUES (4, N'Nestle Corp.')
INSERT [dbo].[Vendors] ([ID], [VendorName]) VALUES (20, N'Olineza Corp.')
INSERT [dbo].[Vendors] ([ID], [VendorName]) VALUES (14, N'Sami M OOD')
INSERT [dbo].[Vendors] ([ID], [VendorName]) VALUES (16, N'Sobieski OOD')
INSERT [dbo].[Vendors] ([ID], [VendorName]) VALUES (5, N'Svoge LTD')
INSERT [dbo].[Vendors] ([ID], [VendorName]) VALUES (2, N'Vin Prom Targovishte OOD')
INSERT [dbo].[Vendors] ([ID], [VendorName]) VALUES (1, N'Zagorka OOD')
/****** Object:  Index [UQ__Mesures__3214EC2679199CA3]    Script Date: 23.7.2013 г. 13:24:19 ******/
ALTER TABLE [dbo].[Mesures] ADD  CONSTRAINT [UQ__Mesures__3214EC2679199CA3] UNIQUE NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Mesures__39BF7A45147D9FA2]    Script Date: 23.7.2013 г. 13:24:19 ******/
ALTER TABLE [dbo].[Mesures] ADD  CONSTRAINT [UQ__Mesures__39BF7A45147D9FA2] UNIQUE NONCLUSTERED 
(
	[Mesure_Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ__Products__3214EC26F396B24F]    Script Date: 23.7.2013 г. 13:24:19 ******/
ALTER TABLE [dbo].[Products] ADD UNIQUE NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ__Vendors__3214EC26CB2A20B4]    Script Date: 23.7.2013 г. 13:24:19 ******/
ALTER TABLE [dbo].[Vendors] ADD UNIQUE NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Vendors__7320A357BA68C951]    Script Date: 23.7.2013 г. 13:24:19 ******/
ALTER TABLE [dbo].[Vendors] ADD UNIQUE NONCLUSTERED 
(
	[VendorName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Expenses]  WITH CHECK ADD  CONSTRAINT [FK_Expenses_Vendors] FOREIGN KEY([VendorID])
REFERENCES [dbo].[Vendors] ([ID])
GO
ALTER TABLE [dbo].[Expenses] CHECK CONSTRAINT [FK_Expenses_Vendors]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_products_mesures] FOREIGN KEY([mesures_ID])
REFERENCES [dbo].[Mesures] ([ID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_products_mesures]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_products_vendors] FOREIGN KEY([vendors_ID])
REFERENCES [dbo].[Vendors] ([ID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_products_vendors]
GO
ALTER TABLE [dbo].[SellsReport]  WITH CHECK ADD  CONSTRAINT [FK_SellsReport_products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ID])
GO
ALTER TABLE [dbo].[SellsReport] CHECK CONSTRAINT [FK_SellsReport_products]
GO
USE [master]
GO
ALTER DATABASE [supermarket] SET  READ_WRITE 
GO
