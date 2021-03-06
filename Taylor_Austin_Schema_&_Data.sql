﻿ALTER DATABASE [s16quest54] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [s16quest54].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [s16quest54] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [s16quest54] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [s16quest54] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [s16quest54] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [s16quest54] SET ARITHABORT OFF 
GO
ALTER DATABASE [s16quest54] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [s16quest54] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [s16quest54] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [s16quest54] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [s16quest54] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [s16quest54] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [s16quest54] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [s16quest54] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [s16quest54] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [s16quest54] SET  DISABLE_BROKER 
GO
ALTER DATABASE [s16quest54] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [s16quest54] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [s16quest54] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [s16quest54] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [s16quest54] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [s16quest54] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [s16quest54] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [s16quest54] SET RECOVERY FULL 
GO
ALTER DATABASE [s16quest54] SET  MULTI_USER 
GO
ALTER DATABASE [s16quest54] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [s16quest54] SET DB_CHAINING OFF 
GO
ALTER DATABASE [s16quest54] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [s16quest54] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [s16quest54] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N's16quest54', N'ON'
GO
USE [s16quest54]
GO
/****** Object:  Table [dbo].[address]    Script Date: 5/3/2016 8:06:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[address](
	[addressID] [int] IDENTITY(1,1) NOT NULL,
	[streetAddress] [varchar](32) NULL,
	[zipCode] [numeric](5, 0) NULL,
	[stateInitials] [varchar](2) NULL,
	[cityName] [varchar](32) NULL,
	[countryName] [varchar](50) NULL,
 CONSTRAINT [PK_address] PRIMARY KEY CLUSTERED 
(
	[addressID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[company]    Script Date: 5/3/2016 8:06:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[company](
	[companyID] [int] IDENTITY(1,1) NOT NULL,
	[addressID] [int] NULL,
	[companyName] [varchar](32) NOT NULL,
 CONSTRAINT [PK_company] PRIMARY KEY CLUSTERED 
(
	[companyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[customer]    Script Date: 5/3/2016 8:06:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[customer](
	[customerID] [int] IDENTITY(1,1) NOT NULL,
	[firstName] [varchar](32) NOT NULL,
	[lastName] [varchar](32) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[phoneID] [int] NOT NULL,
	[companyID] [int] NOT NULL,
 CONSTRAINT [PK_customer] PRIMARY KEY CLUSTERED 
(
	[customerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[customerDownload]    Script Date: 5/3/2016 8:06:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customerDownload](
	[customerDownloadID] [int] IDENTITY(1,1) NOT NULL,
	[customerID] [int] NOT NULL,
	[downloadDate] [date] NOT NULL,
 CONSTRAINT [PK_customerDownload] PRIMARY KEY CLUSTERED 
(
	[customerDownloadID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[customerRelease]    Script Date: 5/3/2016 8:06:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customerRelease](
	[customerDownloadID] [int] NOT NULL,
	[versionID] [int] NOT NULL,
	[setNew] [bit] NOT NULL,
	[releaseDate] [date] NOT NULL,
	[description] [text] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[features]    Script Date: 5/3/2016 8:06:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[features](
	[featureID] [int] IDENTITY(1,1) NOT NULL,
	[description] [text] NULL,
 CONSTRAINT [PK_features] PRIMARY KEY CLUSTERED 
(
	[featureID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[phone]    Script Date: 5/3/2016 8:06:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[phone](
	[phoneID] [int] IDENTITY(1,1) NOT NULL,
	[phoneLocationID] [int] NOT NULL,
	[phoneNumber] [numeric](18, 0) NOT NULL,
 CONSTRAINT [PK_phone] PRIMARY KEY CLUSTERED 
(
	[phoneID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[phoneLocation]    Script Date: 5/3/2016 8:06:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[phoneLocation](
	[phoneLocationID] [int] IDENTITY(1,1) NOT NULL,
	[phoneLocation] [varchar](8) NOT NULL,
 CONSTRAINT [PK_phoneLocation] PRIMARY KEY CLUSTERED 
(
	[phoneLocationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[platform]    Script Date: 5/3/2016 8:06:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[platform](
	[platformID] [int] IDENTITY(1,1) NOT NULL,
	[platformName] [varchar](16) NOT NULL,
 CONSTRAINT [PK_platform] PRIMARY KEY CLUSTERED 
(
	[platformID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[product]    Script Date: 5/3/2016 8:06:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[product](
	[productID] [int] IDENTITY(1,1) NOT NULL,
	[productName] [varchar](32) NOT NULL,
	[productDescription] [text] NULL,
 CONSTRAINT [PK_product] PRIMARY KEY CLUSTERED 
(
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[version]    Script Date: 5/3/2016 8:06:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[version](
	[versionID] [int] IDENTITY(1,1) NOT NULL,
	[productID] [int] NOT NULL,
	[platformID] [int] NOT NULL,
	[versionNumber] [numeric](6, 3) NOT NULL,
 CONSTRAINT [PK_version] PRIMARY KEY CLUSTERED 
(
	[versionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[versionFeatures]    Script Date: 5/3/2016 8:06:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[versionFeatures](
	[versionID] [int] NOT NULL,
	[featureID] [int] NULL
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[address] ON 

INSERT [dbo].[address] ([addressID], [streetAddress], [zipCode], [stateInitials], [cityName], [countryName]) VALUES (1, N'123 Privet Street', CAST(91601 AS Numeric(5, 0)), N'CA', N'Los Angeles', N'United States')
INSERT [dbo].[address] ([addressID], [streetAddress], [zipCode], [stateInitials], [cityName], [countryName]) VALUES (2, N'348 Jinx Road', NULL, N'', N'London', N'England')
SET IDENTITY_INSERT [dbo].[address] OFF
SET IDENTITY_INSERT [dbo].[company] ON 

INSERT [dbo].[company] ([companyID], [addressID], [companyName]) VALUES (1, 1, N'ABC records')
INSERT [dbo].[company] ([companyID], [addressID], [companyName]) VALUES (2, 2, N'ZYX Corp
')
INSERT [dbo].[company] ([companyID], [addressID], [companyName]) VALUES (3, NULL, N'99 Store
')
SET IDENTITY_INSERT [dbo].[company] OFF
SET IDENTITY_INSERT [dbo].[customer] ON 

INSERT [dbo].[customer] ([customerID], [firstName], [lastName], [email], [phoneID], [companyID]) VALUES (4, N'Peter
', N'Smith
', N'p.smith@abc.com', 1, 1)
INSERT [dbo].[customer] ([customerID], [firstName], [lastName], [email], [phoneID], [companyID]) VALUES (6, N'Maria
', N'Bounte
', N'maria@zyx.com
', 6, 2)
INSERT [dbo].[customer] ([customerID], [firstName], [lastName], [email], [phoneID], [companyID]) VALUES (8, N'David
', N'Sommerset
', N'david.sommerset@99cents.store
', 8, 3)
INSERT [dbo].[customer] ([customerID], [firstName], [lastName], [email], [phoneID], [companyID]) VALUES (9, N'Maria
', N'Bounte
', N'maria.bounte@99cents.store
', 9, 3)
SET IDENTITY_INSERT [dbo].[customer] OFF
SET IDENTITY_INSERT [dbo].[customerDownload] ON 

INSERT [dbo].[customerDownload] ([customerDownloadID], [customerID], [downloadDate]) VALUES (1, 4, CAST(N'2000-06-01' AS Date))
INSERT [dbo].[customerDownload] ([customerDownloadID], [customerID], [downloadDate]) VALUES (2, 6, CAST(N'2000-06-01' AS Date))
INSERT [dbo].[customerDownload] ([customerDownloadID], [customerID], [downloadDate]) VALUES (3, 8, CAST(N'2000-07-01' AS Date))
INSERT [dbo].[customerDownload] ([customerDownloadID], [customerID], [downloadDate]) VALUES (4, 9, CAST(N'2000-09-01' AS Date))
SET IDENTITY_INSERT [dbo].[customerDownload] OFF
INSERT [dbo].[customerRelease] ([customerDownloadID], [versionID], [setNew], [releaseDate], [description]) VALUES (1, 8, 1, CAST(N'2000-05-01' AS Date), N'new features release
')
INSERT [dbo].[customerRelease] ([customerDownloadID], [versionID], [setNew], [releaseDate], [description]) VALUES (2, 8, 1, CAST(N'2000-06-13' AS Date), N'new features release
')
INSERT [dbo].[customerRelease] ([customerDownloadID], [versionID], [setNew], [releaseDate], [description]) VALUES (3, 10, 1, CAST(N'2000-06-13' AS Date), N'bug-fix release
')
INSERT [dbo].[customerRelease] ([customerDownloadID], [versionID], [setNew], [releaseDate], [description]) VALUES (4, 10, 1, CAST(N'2000-06-13' AS Date), N'bug-fix release
')
SET IDENTITY_INSERT [dbo].[features] ON 

INSERT [dbo].[features] ([featureID], [description]) VALUES (1, N'login module
')
INSERT [dbo].[features] ([featureID], [description]) VALUES (2, N'patient registration
')
INSERT [dbo].[features] ([featureID], [description]) VALUES (3, N'patient profile
')
INSERT [dbo].[features] ([featureID], [description]) VALUES (4, N'patient release form
')
INSERT [dbo].[features] ([featureID], [description]) VALUES (5, N'physician profile
')
INSERT [dbo].[features] ([featureID], [description]) VALUES (6, N'address verification
')
INSERT [dbo].[features] ([featureID], [description]) VALUES (7, N'login module
')
INSERT [dbo].[features] ([featureID], [description]) VALUES (8, N'patient authentication
')
INSERT [dbo].[features] ([featureID], [description]) VALUES (9, N'patient medication form
')
INSERT [dbo].[features] ([featureID], [description]) VALUES (10, N'patient e-bill
')
INSERT [dbo].[features] ([featureID], [description]) VALUES (11, N'patient reporting
')
INSERT [dbo].[features] ([featureID], [description]) VALUES (12, N'patient reporting bug fix
')
SET IDENTITY_INSERT [dbo].[features] OFF
SET IDENTITY_INSERT [dbo].[phone] ON 

INSERT [dbo].[phone] ([phoneID], [phoneLocationID], [phoneNumber]) VALUES (1, 2, CAST(8186213618 AS Numeric(18, 0)))
INSERT [dbo].[phone] ([phoneID], [phoneLocationID], [phoneNumber]) VALUES (6, 2, CAST(128397863896 AS Numeric(18, 0)))
INSERT [dbo].[phone] ([phoneID], [phoneLocationID], [phoneNumber]) VALUES (8, 3, CAST(17939787968 AS Numeric(18, 0)))
INSERT [dbo].[phone] ([phoneID], [phoneLocationID], [phoneNumber]) VALUES (9, 3, CAST(17876398764 AS Numeric(18, 0)))
SET IDENTITY_INSERT [dbo].[phone] OFF
SET IDENTITY_INSERT [dbo].[phoneLocation] ON 

INSERT [dbo].[phoneLocation] ([phoneLocationID], [phoneLocation]) VALUES (1, N'home')
INSERT [dbo].[phoneLocation] ([phoneLocationID], [phoneLocation]) VALUES (2, N'work')
INSERT [dbo].[phoneLocation] ([phoneLocationID], [phoneLocation]) VALUES (3, N'mobile')
SET IDENTITY_INSERT [dbo].[phoneLocation] OFF
SET IDENTITY_INSERT [dbo].[platform] ON 

INSERT [dbo].[platform] ([platformID], [platformName]) VALUES (1, N'Windows')
INSERT [dbo].[platform] ([platformID], [platformName]) VALUES (2, N'Linux')
SET IDENTITY_INSERT [dbo].[platform] OFF
SET IDENTITY_INSERT [dbo].[product] ON 

INSERT [dbo].[product] ([productID], [productName], [productDescription]) VALUES (1, N'EHR System', N'health records system for the patients
')
SET IDENTITY_INSERT [dbo].[product] OFF
SET IDENTITY_INSERT [dbo].[version] ON 

INSERT [dbo].[version] ([versionID], [productID], [platformID], [versionNumber]) VALUES (5, 1, 1, CAST(1.100 AS Numeric(6, 3)))
INSERT [dbo].[version] ([versionID], [productID], [platformID], [versionNumber]) VALUES (6, 1, 2, CAST(1.100 AS Numeric(6, 3)))
INSERT [dbo].[version] ([versionID], [productID], [platformID], [versionNumber]) VALUES (7, 1, 2, CAST(1.200 AS Numeric(6, 3)))
INSERT [dbo].[version] ([versionID], [productID], [platformID], [versionNumber]) VALUES (8, 1, 1, CAST(2.100 AS Numeric(6, 3)))
INSERT [dbo].[version] ([versionID], [productID], [platformID], [versionNumber]) VALUES (9, 1, 2, CAST(2.100 AS Numeric(6, 3)))
INSERT [dbo].[version] ([versionID], [productID], [platformID], [versionNumber]) VALUES (10, 1, 2, CAST(2.200 AS Numeric(6, 3)))
SET IDENTITY_INSERT [dbo].[version] OFF
INSERT [dbo].[versionFeatures] ([versionID], [featureID]) VALUES (9, 8)
INSERT [dbo].[versionFeatures] ([versionID], [featureID]) VALUES (6, 6)
INSERT [dbo].[versionFeatures] ([versionID], [featureID]) VALUES (8, 8)
INSERT [dbo].[versionFeatures] ([versionID], [featureID]) VALUES (8, 9)
INSERT [dbo].[versionFeatures] ([versionID], [featureID]) VALUES (5, 1)
INSERT [dbo].[versionFeatures] ([versionID], [featureID]) VALUES (5, 2)
INSERT [dbo].[versionFeatures] ([versionID], [featureID]) VALUES (5, 3)
INSERT [dbo].[versionFeatures] ([versionID], [featureID]) VALUES (8, 10)
INSERT [dbo].[versionFeatures] ([versionID], [featureID]) VALUES (8, 11)
INSERT [dbo].[versionFeatures] ([versionID], [featureID]) VALUES (5, 4)
INSERT [dbo].[versionFeatures] ([versionID], [featureID]) VALUES (5, 5)
INSERT [dbo].[versionFeatures] ([versionID], [featureID]) VALUES (5, 6)
INSERT [dbo].[versionFeatures] ([versionID], [featureID]) VALUES (7, 2)
INSERT [dbo].[versionFeatures] ([versionID], [featureID]) VALUES (7, 3)
INSERT [dbo].[versionFeatures] ([versionID], [featureID]) VALUES (7, 4)
INSERT [dbo].[versionFeatures] ([versionID], [featureID]) VALUES (7, 5)
INSERT [dbo].[versionFeatures] ([versionID], [featureID]) VALUES (7, 7)
INSERT [dbo].[versionFeatures] ([versionID], [featureID]) VALUES (9, 9)
INSERT [dbo].[versionFeatures] ([versionID], [featureID]) VALUES (9, 10)
INSERT [dbo].[versionFeatures] ([versionID], [featureID]) VALUES (9, 11)
ALTER TABLE [dbo].[company]  WITH CHECK ADD  CONSTRAINT [FK_company_address] FOREIGN KEY([addressID])
REFERENCES [dbo].[address] ([addressID])
GO
ALTER TABLE [dbo].[company] CHECK CONSTRAINT [FK_company_address]
GO
ALTER TABLE [dbo].[customer]  WITH CHECK ADD  CONSTRAINT [FK_customer_company] FOREIGN KEY([companyID])
REFERENCES [dbo].[company] ([companyID])
GO
ALTER TABLE [dbo].[customer] CHECK CONSTRAINT [FK_customer_company]
GO
ALTER TABLE [dbo].[customer]  WITH CHECK ADD  CONSTRAINT [FK_customer_phone] FOREIGN KEY([phoneID])
REFERENCES [dbo].[phone] ([phoneID])
GO
ALTER TABLE [dbo].[customer] CHECK CONSTRAINT [FK_customer_phone]
GO
ALTER TABLE [dbo].[customerDownload]  WITH CHECK ADD  CONSTRAINT [FK_customerDownload_customer] FOREIGN KEY([customerID])
REFERENCES [dbo].[customer] ([customerID])
GO
ALTER TABLE [dbo].[customerDownload] CHECK CONSTRAINT [FK_customerDownload_customer]
GO
ALTER TABLE [dbo].[customerRelease]  WITH CHECK ADD  CONSTRAINT [FK_customerRelease_customerDownload] FOREIGN KEY([customerDownloadID])
REFERENCES [dbo].[customerDownload] ([customerDownloadID])
GO
ALTER TABLE [dbo].[customerRelease] CHECK CONSTRAINT [FK_customerRelease_customerDownload]
GO
ALTER TABLE [dbo].[customerRelease]  WITH CHECK ADD  CONSTRAINT [FK_customerRelease_version] FOREIGN KEY([versionID])
REFERENCES [dbo].[version] ([versionID])
GO
ALTER TABLE [dbo].[customerRelease] CHECK CONSTRAINT [FK_customerRelease_version]
GO
ALTER TABLE [dbo].[phone]  WITH CHECK ADD  CONSTRAINT [FK_phone_phoneLocation] FOREIGN KEY([phoneLocationID])
REFERENCES [dbo].[phoneLocation] ([phoneLocationID])
GO
ALTER TABLE [dbo].[phone] CHECK CONSTRAINT [FK_phone_phoneLocation]
GO
ALTER TABLE [dbo].[version]  WITH CHECK ADD  CONSTRAINT [FK_version_platform] FOREIGN KEY([platformID])
REFERENCES [dbo].[platform] ([platformID])
GO
ALTER TABLE [dbo].[version] CHECK CONSTRAINT [FK_version_platform]
GO
ALTER TABLE [dbo].[version]  WITH CHECK ADD  CONSTRAINT [FK_version_product] FOREIGN KEY([productID])
REFERENCES [dbo].[product] ([productID])
GO
ALTER TABLE [dbo].[version] CHECK CONSTRAINT [FK_version_product]
GO
ALTER TABLE [dbo].[versionFeatures]  WITH CHECK ADD  CONSTRAINT [FK_versionFeatures_features] FOREIGN KEY([featureID])
REFERENCES [dbo].[features] ([featureID])
GO
ALTER TABLE [dbo].[versionFeatures] CHECK CONSTRAINT [FK_versionFeatures_features]
GO
ALTER TABLE [dbo].[versionFeatures]  WITH CHECK ADD  CONSTRAINT [FK_versionFeatures_version] FOREIGN KEY([versionID])
REFERENCES [dbo].[version] ([versionID])
GO
ALTER TABLE [dbo].[versionFeatures] CHECK CONSTRAINT [FK_versionFeatures_version]
GO
/****** Object:  StoredProcedure [dbo].[CountNewFeatures]    Script Date: 5/3/2016 8:06:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CountNewFeatures]
	@getVersion float,
	@getProduct varchar(32),
	@getPlatform varchar(32)

AS
BEGIN
	DECLARE @error varchar(100)

	SET NOCOUNT ON;

	IF EXISTS (Select platformID from [dbo].[platform] where platformName = @getPlatform )
		BEGIN
			DECLARE @foundPlatformID int
			SET @foundPlatformID = (Select platformID from [dbo].[platform] where platformName = @getPlatform )
		END
	ELSE
		BEGIN
			SET @error = 'Platform does not exist'
			RAISERROR (@error,10, 1) 	
		END
	
	IF EXISTS (Select productID from [dbo].[product] where productName = @getProduct)
		BEGIN
			DECLARE @foundProductID int
			SET @foundProductID = (Select productID from [dbo].[product] where productName = @getProduct)
		END
	ELSE
		BEGIN
			SET @error = 'Product does not exist'
			RAISERROR (@error,10, 1) 	
		END
	
	IF EXISTS (Select [versionID] from [dbo].[version] where versionNumber = @getVersion AND productID = @foundProductID AND platformID = @foundPlatformID)
		BEGIN
			DECLARE @foundVersionID int
			SET @foundVersionID = (Select versionID from [dbo].[version] where versionNumber = @getVersion AND productID = @foundProductID AND platformID = @foundPlatformID)
		END
	ELSE
		BEGIN
			SET @error = 'Version does not exist'
			RAISERROR (@error,10, 1) 	
		END

	IF EXISTS (Select [featureID] from [dbo].[versionFeatures] where [versionID] = @foundVersionID)
		BEGIN
			DECLARE @Count int
				SET @Count = (Select COUNT([featureID]) from [dbo].[versionFeatures] where [versionID] = @foundVersionID)
				PRINT str(@count) + ' features are in the ' + CONVERT (VARCHAR(50), @getVersion,128) + ' release'
			END
			
		ELSE
			BEGIN
				SET @error = 'It is a bug –fix release. There are no new features'
				RAISERROR (@error,10, 1) 	
			END			
END
GO
/****** Object:  StoredProcedure [dbo].[DisplayNewFeatures]    Script Date: 5/3/2016 8:06:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DisplayNewFeatures]
	@getVersion float,
	@getProduct varchar(32),
	@getPlatform varchar(32)

AS
BEGIN

	DECLARE @error varchar(100)

	SET NOCOUNT ON;

	IF EXISTS (Select platformID from [dbo].[platform] where platformName = @getPlatform )
		BEGIN
			DECLARE @foundPlatformID int
			SET @foundPlatformID = (Select platformID from [dbo].[platform] where platformName = @getPlatform )
		END
	ELSE
		BEGIN
			SET @error = 'Platform does not exist'
			RAISERROR (@error,10, 1) 	
		END
	
	IF EXISTS (Select productID from [dbo].[product] where productName = @getProduct)
		BEGIN
			DECLARE @foundProductID int
			SET @foundProductID = (Select productID from [dbo].[product] where productName = @getProduct)
		END
	ELSE
		BEGIN
			SET @error = 'Product does not exist'
			RAISERROR (@error,10, 1) 	
		END
	
	IF EXISTS (Select [versionID] from [dbo].[version] where versionNumber = @getVersion AND productID = @foundProductID AND platformID = @foundPlatformID)
		BEGIN
			DECLARE @foundVersionID int
			SET @foundVersionID = (Select versionID from [dbo].[version] where versionNumber = @getVersion AND productID = @foundProductID AND platformID = @foundPlatformID)
		END
	ELSE
		BEGIN
			SET @error = 'Version does not exist'
			RAISERROR (@error,10, 1) 	
		END


	IF EXISTS (Select [featureID] from [dbo].[versionFeatures] where [versionID] = @foundVersionID)
		BEGIN
			SELECT [description] FROM features WHERE featureID = ANY(Select [featureID] from [dbo].[versionFeatures] where [versionID] = @foundVersionID)
		END
	ELSE
		BEGIN
			SET @error = 'Feature does not exist'
			RAISERROR (@error,10, 1) 	
		END
		
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DownloadsPerMonth] 
	@getVersion float,
	@getProduct varchar(32),
	@getPlatform varchar(32),
	@getMonth int

AS
BEGIN
	DECLARE @error varchar(100)

	SET NOCOUNT ON;

	IF EXISTS (Select platformID from [dbo].[platform] where platformName = @getPlatform )
		BEGIN
			DECLARE @foundPlatformID int
			SET @foundPlatformID = (Select platformID from [dbo].[platform] where platformName = @getPlatform )
		END
	ELSE
		BEGIN
			SET @error = 'Platform does not exist'
			RAISERROR (@error,10, 1) 	
		END
	
	IF EXISTS (Select productID from [dbo].[product] where productName = @getProduct)
		BEGIN
			DECLARE @foundProductID int
			SET @foundProductID = (Select productID from [dbo].[product] where productName = @getProduct)
		END
	ELSE
		BEGIN
			SET @error = 'Product does not exist'
			RAISERROR (@error,10, 1) 	
		END
	
	IF EXISTS (Select [versionID] from [dbo].[version] where versionNumber = @getVersion AND productID = @foundProductID AND platformID = @foundPlatformID)
		BEGIN
			DECLARE @foundVersionID int
			SET @foundVersionID = (Select versionID from [dbo].[version] where versionNumber = @getVersion AND productID = @foundProductID AND platformID = @foundPlatformID)
		END
	ELSE
		BEGIN
			SET @error = 'Version does not exist'
			RAISERROR (@error,10, 1) 	
		END
	IF EXISTS (Select customerID from [dbo].[customerDownload] where MONTH([downloadDate]) = @getMonth AND customerDownloadID = 1)
		BEGIN
			DECLARE @Count int
				SET @Count = (Select COUNT([customerID]) from [dbo].[customerDownload] where MONTH([downloadDate]) = @getMonth 
				AND customerDownloadID = Any((Select [customerDownloadID] from [dbo].[customerRelease] where versionID = @foundVersionID)))
			
			Print  'Product: ' +CONVERT (VARCHAR(50), @getProduct,128) + ', Version: ' + CONVERT (VARCHAR(50), @getVersion,128) + ', Month: ' + CONVERT (VARCHAR(50), @getMonth,128) + ', Number of Downloads: ' + CONVERT (VARCHAR(50), @Count,128) 
			
		END
			
		ELSE
			BEGIN
				SET @error = 'There are 0'
				RAISERROR (@error,10, 1) 	
			END			
	
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertAddress] 
	@setStreetAddress varchar(32),
	@setZipCode numeric(5, 0),
	@setStateInitials varchar(2),
	@setCityName varchar(32),
	@setCountryName varchar(50)

AS
BEGIN
	DECLARE @error varchar(100)

	SET NOCOUNT ON;

	INSERT INTO [dbo].[address]
           ([streetAddress]
           ,[zipCode]
           ,[stateInitials]
           ,[cityName]
           ,[countryName])
     VALUES
           (@setStreetAddress
           ,@setZipCode
           ,@setStateInitials
           ,@setCityName
           ,@setCountryName)
	
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertPlatform] 
	@setPlatform varchar(16)
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO [dbo].[platform]
           ([platformName])
     VALUES
           (@setPlatform)
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateProductVersion] 
	@getVersion float,
	@getProduct varchar(32),
	@getPlatform varchar(32),
	@updateVersion float

AS
BEGIN
	DECLARE @error varchar(100)

	SET NOCOUNT ON;

	IF EXISTS (Select platformID from [dbo].[platform] where platformName = @getPlatform )
		BEGIN
			DECLARE @foundPlatformID int
			SET @foundPlatformID = (Select platformID from [dbo].[platform] where platformName = @getPlatform )
		END
	ELSE
		BEGIN
			SET @error = 'Platform does not exist'
			RAISERROR (@error,10, 1) 	
		END
	
	IF EXISTS (Select productID from [dbo].[product] where productName = @getProduct)
		BEGIN
			DECLARE @foundProductID int
			SET @foundProductID = (Select productID from [dbo].[product] where productName = @getProduct)
		END
	ELSE
		BEGIN
			SET @error = 'Product does not exist'
			RAISERROR (@error,10, 1) 	
		END
	
	IF EXISTS (Select [versionID] from [dbo].[version] where versionNumber = @getVersion AND productID = @foundProductID AND platformID = @foundPlatformID)
		BEGIN
			UPDATE [dbo].[version]
			SET [versionNumber] = @updateVersion
			WHERE platformID = @foundPlatformID AND productID = @foundProductID AND versionNumber = @getVersion
		END
	ELSE
		BEGIN
			SET @error = 'Version does not exist'
			RAISERROR (@error,10, 1) 	
		END

	
END
GO
USE [master]
GO
ALTER DATABASE [s16quest54] SET  READ_WRITE 
GO
