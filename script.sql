USE [master]
GO
/****** Object:  Database [DbRegister]    Script Date: 9/13/2022 2:21:06 PM ******/
CREATE DATABASE [DbRegister]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DbRegister', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SA\MSSQL\DATA\DbRegister.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DbRegister_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SA\MSSQL\DATA\DbRegister_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DbRegister].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DbRegister] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DbRegister] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DbRegister] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DbRegister] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DbRegister] SET ARITHABORT OFF 
GO
ALTER DATABASE [DbRegister] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [DbRegister] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DbRegister] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DbRegister] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DbRegister] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DbRegister] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DbRegister] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DbRegister] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DbRegister] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DbRegister] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DbRegister] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DbRegister] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DbRegister] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DbRegister] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DbRegister] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DbRegister] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [DbRegister] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DbRegister] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DbRegister] SET  MULTI_USER 
GO
ALTER DATABASE [DbRegister] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DbRegister] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DbRegister] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DbRegister] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DbRegister] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DbRegister] SET QUERY_STORE = OFF
GO
USE [DbRegister]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 9/13/2022 2:21:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Object:  Table [dbo].[Users]    Script Date: 9/13/2022 2:21:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](max) NULL,
	[Email] [nvarchar](250) NOT NULL,
	[Password] [nvarchar](250) NOT NULL,
	[Age] [int] NOT NULL,
	[Biography] [nvarchar](max) NULL,
	[Job] [int] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
 CONSTRAINT [PK_dbo.Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'202209130716288_initDb', N'Web_Form_Register.Migrations.Configuration', 0x1F8B0800000000000400CD58CD6EE33610BE17E83B083AB568D68A93B66803791759272ED2AEE320CE6E8F0B5A1A2BC4F24725A9D47EB61EFA487D850EF54B4B8E2D27D96DE18B4571BE99F938339CD13F7FFD1DBE5971E63D80D2548A913F1C1CFB1E8848C65424233F33CB573FF96F5E7FFD557819F395F7A1DA776AF7A1A4D023FFDE98F42C0874740F9CE801A791925A2ECD20923C20B10C4E8E8F7F0E86C30010C2472CCF0B6F33612887FC011FC75244909A8CB0A98C81E9721DDFCC7354EF9A70D0298960E4FF0E8B8F13A9F8C75B48A836A00617C4104430B032BE77CE2841A3E6C096BE478490861834F9ECBD86B9515224F3141708BB5BA780FB968469285D396BB6F7F5EAF8C47A1534821554946923F98180C3D392A6A02DFE24B2FD9A4624F21209376BEB754EE6C8474294CE572968DF6B6B3C1B336577EF217C50E00E36D08EBC8ECC511D3B1862F677E48D3366320523019951841D7937D982D1E83758DFC94F20462263CC75019DC0771B0BB874A3640ACAAC6F61593A7615FB5EB02917B4056B3147A6F0F64A981FBFF7BD6B544E160CEA087198991BA9E01710A08881F88618F44F580CC8B9E8686FE99A20B4FD5769C4B0C464F3BD2959BD039198FB918F7F7D6F425710572BA515EF05C5DC4421A332D8A7E89213CA766839F9E1B897960E17BBD5DE10ADFF942AFEF29ACF938654CCFF013EDBA78371DE52992892DEAF3FFB11FD2A171B16E3F3932C1E2BB0B1786E2A344C51B8A37C1F5218347561B35A64DCA9153591577AC248D2D4CD67568DB1E45C0AABECBB52C50B960E3C8918145BE3C9D5A97D7AD2AA2853E00B505549B402C353DFFB405886CFC30EED1BDB676AC650A0DE7ED2E5B6607107B3F5817F3E664B15FF29B313BC79CDA5882FE001988DDCBE1CBF25D1A7AD723DC9B664586A081535E618CB77DD2F7478C69BACA45A9739BC695E813907E3DEA3BED7E45199CAADFB755BD6D58635FD4E50343C5563143CD219855392A648BFD329952BDEBC6893C6AFE687370DBCC00822BDA577A8ADAD35E13D481268BDB5FCC630A14A1B1B970B62A3791CF32DDB9A637884E24A93CB74BB016888AF76DBFF85C4EE54D93CA1166EC3E8049DE478B5E7FE426D5BBB83EAC8E7DD2B61446DE935C692655C3CD6AFEC926EBA0717A359ED8F54B6072E4CB9D41FA3B9EB5D9866B53F527E77BB20F9427F79E7CE76519CE5FE58F9ADECA2E40BFDE59DDBD8457196BB5861D00AB7769C079D406FF5B8EDACD95570DA5B6AED75E1691598B04CF6FDF35927FB8B2DBE87243DD0D866FE7C8DB9C8F35C1CCCFF606346D1DF66C39408BA046D8A1BC7C7B9E8A435D7FD7F66AC40EB981D32687DF1816641136AD9DD3BB51CD872B6C718F14054744FD4379CACBE75D10E1E552AA4EEC8F0CC49E4C5809D4123E7F6B9F3C5B3B8736688A718D3191D627C34CF191DB6F75CED9EA04757D5744FFBBAABA2C6A0ED0B896E1436978DD9131BAF6EBD0B03F7AB5578019A260D84FD862520B285A401ADF65C89A5AC68471F5D8BAA2DAD539982217810E45C19BA2491C1D711689D4FA165077C896D727C256699493373AE35B6CD6CE39A0B83DDFAF3EE72D3E67096DA27FD122EA099D4C6D24CBCCD288B6BBB275B62E911081B3565C942AB700A47B8645D235D4BD113A8A4EF025210B6E0DD014F1982E999989307788A6D185EEF2021D1BABAB61E07D97F109BB48717946081E0BAC468E4ED97D8C07E8A7DFD2F449C09CFBC150000, N'6.4.4')
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [FullName], [Email], [Password], [Age], [Biography], [Job], [CreatedAt]) VALUES (1, N'1', N'1@gmail.com', N'123', 0, N'Biography 123', 2, CAST(N'2022-09-13T14:18:17.770' AS DateTime))
INSERT [dbo].[Users] ([Id], [FullName], [Email], [Password], [Age], [Biography], [Job], [CreatedAt]) VALUES (2, N'Trần Minh Hoàng', N'tranminhhoang@gmail.com', N'123', 0, N'Biography Trần Minh Hoàng', 1, CAST(N'2022-09-13T14:19:17.197' AS DateTime))
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
USE [master]
GO
ALTER DATABASE [DbRegister] SET  READ_WRITE 
GO
