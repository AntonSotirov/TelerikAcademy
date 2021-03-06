USE [master]
GO
/****** Object:  Database [BlogSystem]    Script Date: 18.9.2013 г. 18:56:58 ******/
CREATE DATABASE [BlogSystem]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BlogSystem', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\BlogSystem.mdf' , SIZE = 4160KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'BlogSystem_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\BlogSystem_log.ldf' , SIZE = 1040KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [BlogSystem] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BlogSystem].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BlogSystem] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BlogSystem] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BlogSystem] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BlogSystem] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BlogSystem] SET ARITHABORT OFF 
GO
ALTER DATABASE [BlogSystem] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BlogSystem] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [BlogSystem] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BlogSystem] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BlogSystem] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BlogSystem] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BlogSystem] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BlogSystem] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BlogSystem] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BlogSystem] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BlogSystem] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BlogSystem] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BlogSystem] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BlogSystem] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BlogSystem] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BlogSystem] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BlogSystem] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [BlogSystem] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BlogSystem] SET RECOVERY FULL 
GO
ALTER DATABASE [BlogSystem] SET  MULTI_USER 
GO
ALTER DATABASE [BlogSystem] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BlogSystem] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BlogSystem] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BlogSystem] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'BlogSystem', N'ON'
GO
USE [BlogSystem]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 18.9.2013 г. 18:56:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 18.9.2013 г. 18:56:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetTokens]    Script Date: 18.9.2013 г. 18:56:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetTokens](
	[Id] [nvarchar](128) NOT NULL,
	[Value] [nvarchar](max) NULL,
	[ValidUntilUtc] [datetime] NOT NULL,
 CONSTRAINT [PK_dbo.AspNetTokens] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 18.9.2013 г. 18:56:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Key] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 18.9.2013 г. 18:56:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserManagement]    Script Date: 18.9.2013 г. 18:56:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserManagement](
	[UserId] [nvarchar](128) NOT NULL,
	[DisableSignIn] [bit] NOT NULL,
	[LastSignInTimeUtc] [datetime] NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserManagement] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 18.9.2013 г. 18:56:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[RoleId] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 18.9.2013 г. 18:56:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[UserName] [nvarchar](max) NULL,
	[IsActive] [bit] NOT NULL,
	[Email] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserSecrets]    Script Date: 18.9.2013 г. 18:56:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserSecrets](
	[UserName] [nvarchar](128) NOT NULL,
	[Secret] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserSecrets] PRIMARY KEY CLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Categories]    Script Date: 18.9.2013 г. 18:56:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Image] [nvarchar](max) NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[News]    Script Date: 18.9.2013 г. 18:56:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[News](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[Text] [nvarchar](max) NOT NULL,
	[Image] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_News] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Posts]    Script Date: 18.9.2013 г. 18:56:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Posts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PostContent] [nvarchar](max) NOT NULL,
	[Image] [nvarchar](max) NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[TopicId] [int] NOT NULL,
 CONSTRAINT [PK_Posts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Topics]    Script Date: 18.9.2013 г. 18:56:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Topics](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[CategoryId] [int] NOT NULL,
	[Image] [nvarchar](max) NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_Topics] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'201309170802233_InitialCreate', N'Microsoft.AspNet.Identity.EntityFramework.DefaultIdentityDbContext', 0x1F8B0800000000000400DD5CCD72A43610BEA72AEF40714A52B583ED5C365B33BBE5F54FCA95B59DF2D87B75C9A019AB1604018D633F5B0E79A4BC42C48F40E807040318EF65D7465277ABFB93D46A3EFCDF3FFF2E3F3D07BEF504E3048578651F2E0E6C0B6237F410DEAEEC1DD9BC7B6F7FFAF8E30FCB332F78B6BEB27EBFA6FDE8489CACEC4742A20F8E93B88F3000C922406E1C26E1862CDC307080173A470707BF3987870EA4226C2ACBB296373B4C5000B35FE8AF272176614476C0BF0C3DE827C573DAB2CEA45A57208049045CB8B22F4BF9C7497405C9E2C283541879599C65FF9DC7B4EFDF61FCCDB68E7D04A8816BE86F6C0B601C1240A8F91FEE12B8267188B7EB883E00FEED4B0469BF0DF013584CEB43D5DD74860747E90C9D6A602F0FD9E5DCE9ECF319A5E6651E58D937A10FF91EB4CF1FF0A5F6803EFA330E231893971BB829C65D78B6E5D4C739E2C072183726554D1D48620A07DBBA04CF5F20DE92470A94A3F7B6758E9EA1C79E14DEBBC388A2870E22F18EFE7AB5F37DF0E0C3B2DD69D499FEDBA095FE68A4555072059ED0360B89A08E02214E5D9AD8D60DF4B31EC9238A72C82C58EB7DE675EB3C0E83F4A76A58D6707F0BE22D24D4EA50D5BA0E77B12B98B474AAC036869B89EA13F2749C1C7665D7544D1F84301553A384D93BBA5E2D707244F4C70C43851A330C515D60ACB5E6BE0078DD94FCA912BB45D3DEC0FD9EF7A9747E13EF555FC22DC2FA8D2A6BBECF91500F75D5A20C37D7AC0A7993499700832D0CE8F1AB35ABEAA2B44D68561A28F6E96A65F306DFB83C54CB545839BD9747E6F73E6B241B481F3F212F75A8C1FECE3A53F1DD9797A06EEA9556B3FDCD1E3483ECE4464B5C0559C50ED01BB6DC9AEF81DDBE99C66427BEA0F7142569EF35DAE20BCCD47F0EA96701EE2CEC0B48482EE996DE7DEE88CB049E0202D3477B24248DC0E9B809AB20A4DBA87BE1E836FC067B6D7D6F253DF80AFCDD08B981AC057977D4B97E772C755AF3273E40419F78F53A70BEAB9D5E50937932D5313A38324D23E1B0DF2E9459A4DC80AA16E5DEC335EF7D7CADA11BC3DE47579EF2F739BC5A2E0B23A1BA98EDB000D0F9FB38494217659117CA17F78A1AC619F6ACC69B716E327FA7A696EF7C82221FB954FDCAFE459ABE4E6879ADA884AA041EDA220CAEF129F42181D6B19B97024F40E2024F0102AABAFE842207C6696512F827742D9018204C649821ECA208F84D660B830C4FC6D4A852BCD8720A2388D3BA69530C4CF46AAB4C4EA94270549B5F960E07A4767C71497113165419721D61F97DAC23C45477EBBA5851E2C162712809ED8D1559FF446091FD69A2589DFE4F881631136E8AAD362DAE07982F821884BA59872188064490C6828960A4F1F19BC05251396A0AAF58466A8BEA80C78FD2100DBCCC0ED7DE10AB7B612264D567FC2600C525C84DB15465CBF578E6F7B58E479922CB9EF42893F54F8414D99F33434B9E6ED331848E80312B4DC10DA0E1606FBF4F1FD20EF059BCDBE483D790D4ABE1550A5FCB872584D40773EF4B2501D54662204427C068307B13A29450A4710662F8835B298AEFD0222FAB68A94CCA4B5D26E66430D4CDAA58D10662F22B9F4E0EBB100A8238E0C9C12E5E65727D94EF3AC575D076C12B8DAFC14A5A4E6D573A4E8C52446D55D16E8613E76BEDEA99EB2E1E26570F61EE0CD02D93575C36044143CD5E2A18AB5DD0984D1BE7D3C21CF4ABCE387B1EC92BEC55A1DA19AA74B02D216C33B42D8F3359433D27CB57EBD413D6A52B26098B6038DBFB5A66AF4851F60835AB6395076BD9B67472DA59F160E968F869CB4B1045086F39BE5AF1C45AE764B59377EBEE2CB02097E1B889820C565A5B6A22614C5781D04A55534BCF519C905340C003488B7A275E2075EB9A4630B57C3621478D1D3DAC77FA73C11930A5EF2D54A74AE561DA6F9BAEFC6CFE503805E461564A25043E88156F874E427F17607D3EA91F9D5775F9F1AA0A718E21C16E296D949C26DDF0EA11308A4FB52B8C13A332E9EB1E27FD509DB759AD91F7B7AEFEA897C212775E8A2E997FD5B88D19B39EF19A6A5D556F4CC428CD707D15D9DB78C15230858C23A619AB73BC40F6E1BDDF423BD2CBAC317878890DB4A43670BC8905ACA3CA0C0A0EBD12438434091826043A2902B98617263499CB54706C6A20969B670399A286300E5414941B238468C68DB3ED1774055E40F1A8930C9E1423C8E29B661378EE0634DE3EA1E0F01801A061AC2E04D2463FEA06AF93C2516D7841DCE38EB214E8E49FCF0A4EAC0A381E9E54441A6340E9060F970FEA24B102282F475D141D3D8252FD41EC526A2FEB1042BD6159DCFDDB3F9A938A017917DB623918F5C24B4260B0483B2CD67FF9273ECA4A70AC034D13D00626243B1056F6D1C1E191F0815D8F8FDD9C24F1FC397EF1869F40EC3E82582669EDF1411B13FA53009E7FE6259973AC24F7A86FD133FD426C30AF3273F6123BF38F990675D614307CD31FB40CE66DC5F72AAF08FB3D433A878F3D06F39EF25B8E074486FB8EC303049201B9F7AFF49DC4601EAFD1CF3B6C3B4A49F2A70E43BB5B73D599E65387596D12B254E9C385BDC2297F9C30D6A13407BEFF60A1ADD3F90770595FCA7ECE0899924D2FD340A664316A5E718D46C3FFAEA8F7FD78840AEA4B5FCA7E6F4AE2A464FAB9B10EF727D0F7A0B1EBF83DFBB2EE670F81C6D73833C48101F9FD35F9EE531F105342C5F8807875901812DA8738200A826C3F22FCEC43AE7B7933435ABA4C3B13C326F3D1B574F4BC4A4D6F7A0F218D6D9EDDE62F27D454475178B5EA250555935E899E53A952A4A5B4372B30135EA43A4A0D455BB31A35C7787F627CB3D6AE147A3D835EAF8771EF4D39F6CD14FBE6F9A889AA0D44FC161E7EB3B692CB3F295D9F5F3015A3D28499AF2424CF8F902F9969C6BC57D3F6E7CCB8EF3E5179E91BF0F25F8F4EDF7D8263C37440DA7CF7C9D5B63781BD310A2F5E7EFF4CF309EE4FBBD2642641DB4A44FA875E31746B9944D9E7026F4296D00816B12EE2DF9F83047834CD388E09DA0097D066172649F6472EB2EAE2CA3E0B1EA07781AF7724DA113A65183CF8B5426D9A1835E9CFC8FF759B97D751F6E74D86984256D806045EE3CF3BE47BA5DDE78A3AB646449A71FD0EE9F33C9634812370FB524ABA0AB1A1A0C27D65A2780B83C8A7C2926BBC064F506F5BBB0FEB1E5B9E22B08D41901432AAF1F4570A3F2F78FEF83F0637A30F9C580000, N'6.0.0-rc1-20726')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'1', N'Admin')
INSERT [dbo].[AspNetUserLogins] ([LoginProvider], [ProviderKey], [UserId]) VALUES (N'Local', N'bgbgbg', N'578cfdd5-2aa3-4450-9ced-96d256d37ab9')
INSERT [dbo].[AspNetUserLogins] ([LoginProvider], [ProviderKey], [UserId]) VALUES (N'Local', N'niki', N'57cdedcf-b529-4e95-856b-03fc0f0a4977')
INSERT [dbo].[AspNetUserLogins] ([LoginProvider], [ProviderKey], [UserId]) VALUES (N'Local', N'nikii', N'c1e56b3e-f55a-492f-b4d1-043553d963f5')
INSERT [dbo].[AspNetUserManagement] ([UserId], [DisableSignIn], [LastSignInTimeUtc]) VALUES (N'578cfdd5-2aa3-4450-9ced-96d256d37ab9', 0, CAST(0x0000A23D00E1E4A5 AS DateTime))
INSERT [dbo].[AspNetUserManagement] ([UserId], [DisableSignIn], [LastSignInTimeUtc]) VALUES (N'57cdedcf-b529-4e95-856b-03fc0f0a4977', 0, CAST(0x0000A23D00E1DD69 AS DateTime))
INSERT [dbo].[AspNetUserManagement] ([UserId], [DisableSignIn], [LastSignInTimeUtc]) VALUES (N'c1e56b3e-f55a-492f-b4d1-043553d963f5', 0, CAST(0x0000A23D00B63DF7 AS DateTime))
INSERT [dbo].[AspNetUserRoles] ([RoleId], [UserId]) VALUES (N'1', N'578cfdd5-2aa3-4450-9ced-96d256d37ab9')
INSERT [dbo].[AspNetUserRoles] ([RoleId], [UserId]) VALUES (N'1', N'57cdedcf-b529-4e95-856b-03fc0f0a4977')
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [IsActive], [Email]) VALUES (N'578cfdd5-2aa3-4450-9ced-96d256d37ab9', N'bgbgbg', 1, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [IsActive], [Email]) VALUES (N'57cdedcf-b529-4e95-856b-03fc0f0a4977', N'niki', 0, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [IsActive], [Email]) VALUES (N'c1e56b3e-f55a-492f-b4d1-043553d963f5', N'nikii', 1, NULL)
INSERT [dbo].[AspNetUserSecrets] ([UserName], [Secret]) VALUES (N'bgbgbg', N'ALupzK6NQsMzMdQFOYT2RtEX8Kg60j0kFgTbDjCPsvKHSpelVJLn5Ukt/LmdMFR5/A==')
INSERT [dbo].[AspNetUserSecrets] ([UserName], [Secret]) VALUES (N'niki', N'AGB5CowMSIKN4yUcJXzEc1I9brX1oNzU0jm4HjBjR1X/FuR6Nicp8CGEQXGHPuNrwQ==')
INSERT [dbo].[AspNetUserSecrets] ([UserName], [Secret]) VALUES (N'nikii', N'ADDoSrvHPiOo786c7qsRmGwdMCRq+k00FRfIZryJSGxJ9cy+aaC1ieaXmm+s2yBfWA==')
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Id], [Name], [Description], [Image]) VALUES (10, N'Social network', N'Don''t you hate when your parents post on your wall? I hate Facebook Friends that post pictures of food, or Selfies, and especially people that post 20 times a day! HATE IT.', N'ef2047cd-c0ee-40c8-bec6-66d41f28d9b3_social-network.jpg')
INSERT [dbo].[Categories] ([Id], [Name], [Description], [Image]) VALUES (11, N'Annoying people', N'Hate my mom always texting me. Hate ex''s that stalk me and get caught. Hate my Spanish teacher. Hate sales girls who are pushy. Hate used cars sales men.', N'211379ba-2500-451c-ad0b-34e2080602e3_annoying-people.jpg')
INSERT [dbo].[Categories] ([Id], [Name], [Description], [Image]) VALUES (12, N'Celebrities', N'Bieberfever, i hate when celebrities tweet sponsored ads, i hate when celebrities mash their names together tomkat, kimye, Benifer, etc. I hate when celebrities get arrested again and again.', N'c3a1c15a-6222-4286-ae6e-7ef8f2923e83_celebrities.jpg')
INSERT [dbo].[Categories] ([Id], [Name], [Description], [Image]) VALUES (13, N'Dating', N'I hate first Dates. Bad breath don''t bother. Girls who wear too much makeup. Hate when guys check out other girls at dinner... its always obvious. Hate girls who text the whole time. Hate being setup by married friends. Hate having to write my dating profile. HATE IT!', N'c740e5af-e7bf-45d7-b620-96cc4104598a_dating.jpg')
INSERT [dbo].[Categories] ([Id], [Name], [Description], [Image]) VALUES (14, N'Bad services', N'I hate when i have to wait 20 minutes for a table but they keep saying 5 minutes. I hate when a waiter forgets what i order. I hate when i can''t get a decent cup of coffee.', N'4b7a372d-31d6-4ac0-81a0-9c620bb82c8d_bad-services.jpg')
INSERT [dbo].[Categories] ([Id], [Name], [Description], [Image]) VALUES (16, N'Fashion', N'I hate sideburns and true religion. I hate men who wear mom jeans. Women who wear yoga pants all day every day. Bad highlights, camo, heeled sneakers, i hate Canadian Tuxedos.', N'0892bde1-8fd8-45af-ad51-9a42c599e39b_fashion.jpg')
INSERT [dbo].[Categories] ([Id], [Name], [Description], [Image]) VALUES (17, N'School', N'I hate the dress code, i hate the popular kids, the jocks and the nerds. I hate crowded hallways. I hate bullies! I hate friends who want to be cool. I hate when my teacher gives us a lot of homework over the weekend. I hate how everyone is so phony in school.', N'c1c6544a-a111-408e-bcaa-dadc514316a0_school.jpg')
INSERT [dbo].[Categories] ([Id], [Name], [Description], [Image]) VALUES (18, N'Hate for good', N'Use Hater to create awareness for a cause. I hate the fact that 14 million children in America suffer from hunger. I hate cancer! I hate when the local factory dumps toxic materials in the drain. I hate the fact that over 30 thousand people die from gun violence every year in the US. I HATE it so much, i want to change it..', N'fbe4faa7-8b87-4f08-8cbb-e476f7280323_good-haters.jpg')
SET IDENTITY_INSERT [dbo].[Categories] OFF
SET IDENTITY_INSERT [dbo].[News] ON 

INSERT [dbo].[News] ([Id], [Title], [Text], [Image]) VALUES (1, N'Telerik exam', N'Thousand of haters are gathering for the yet another exam at Telerik Academy.', N'ninja1.png')
INSERT [dbo].[News] ([Id], [Title], [Text], [Image]) VALUES (2, N'Toilets chronicles', N'Yet another week we''re waiting in line for the toilet in our favorite academy.', N'912333a3-d2b7-46cf-a8f8-cd3e606fc5af_toilet.jpg')
SET IDENTITY_INSERT [dbo].[News] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 18.9.2013 г. 18:56:58 ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 18.9.2013 г. 18:56:58 ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 18.9.2013 г. 18:56:58 ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserManagement]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_RoleId]    Script Date: 18.9.2013 г. 18:56:58 ******/
CREATE NONCLUSTERED INDEX [IX_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 18.9.2013 г. 18:56:58 ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserRoles]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetUsers] ADD  CONSTRAINT [DF_AspNetUsers_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserManagement]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserManagement_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[AspNetUserManagement] CHECK CONSTRAINT [FK_dbo.AspNetUserManagement_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Posts]  WITH CHECK ADD  CONSTRAINT [FK_Posts_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Posts] CHECK CONSTRAINT [FK_Posts_AspNetUsers]
GO
ALTER TABLE [dbo].[Posts]  WITH CHECK ADD  CONSTRAINT [FK_Posts_Topics] FOREIGN KEY([TopicId])
REFERENCES [dbo].[Topics] ([Id])
GO
ALTER TABLE [dbo].[Posts] CHECK CONSTRAINT [FK_Posts_Topics]
GO
ALTER TABLE [dbo].[Topics]  WITH CHECK ADD  CONSTRAINT [FK_Topics_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Topics] CHECK CONSTRAINT [FK_Topics_AspNetUsers]
GO
ALTER TABLE [dbo].[Topics]  WITH CHECK ADD  CONSTRAINT [FK_Topics_Categories] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
GO
ALTER TABLE [dbo].[Topics] CHECK CONSTRAINT [FK_Topics_Categories]
GO
USE [master]
GO
ALTER DATABASE [BlogSystem] SET  READ_WRITE 
GO
