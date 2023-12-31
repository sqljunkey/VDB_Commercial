USE [master]
GO
/****** Object:  Database [CommercialBuildingSystems]    Script Date: 9/10/2023 2:56:25 PM ******/
CREATE DATABASE [CommercialBuildingSystems]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CommercialBuildingSystems', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSQLSERVER2\MSSQL\DATA\CommercialBuildingSystems.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CommercialBuildingSystems_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSQLSERVER2\MSSQL\DATA\CommercialBuildingSystems_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [CommercialBuildingSystems] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CommercialBuildingSystems].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CommercialBuildingSystems] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CommercialBuildingSystems] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CommercialBuildingSystems] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CommercialBuildingSystems] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CommercialBuildingSystems] SET ARITHABORT OFF 
GO
ALTER DATABASE [CommercialBuildingSystems] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CommercialBuildingSystems] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CommercialBuildingSystems] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CommercialBuildingSystems] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CommercialBuildingSystems] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CommercialBuildingSystems] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CommercialBuildingSystems] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CommercialBuildingSystems] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CommercialBuildingSystems] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CommercialBuildingSystems] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CommercialBuildingSystems] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CommercialBuildingSystems] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CommercialBuildingSystems] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CommercialBuildingSystems] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CommercialBuildingSystems] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CommercialBuildingSystems] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CommercialBuildingSystems] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CommercialBuildingSystems] SET RECOVERY FULL 
GO
ALTER DATABASE [CommercialBuildingSystems] SET  MULTI_USER 
GO
ALTER DATABASE [CommercialBuildingSystems] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CommercialBuildingSystems] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CommercialBuildingSystems] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CommercialBuildingSystems] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CommercialBuildingSystems] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CommercialBuildingSystems] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'CommercialBuildingSystems', N'ON'
GO
ALTER DATABASE [CommercialBuildingSystems] SET QUERY_STORE = OFF
GO
USE [CommercialBuildingSystems]
GO
/****** Object:  Table [dbo].[AHU]    Script Date: 9/10/2023 2:56:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AHU](
	[AHU_ID] [int] IDENTITY(1,1) NOT NULL,
	[BRAND] [varchar](50) NULL,
	[Serial_Name] [varchar](50) NULL,
	[Max_CFM_Capacity] [varchar](50) NULL,
	[Location_ID] [int] NULL,
 CONSTRAINT [PK_AHU] PRIMARY KEY CLUSTERED 
(
	[AHU_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AHU_Maintenance_Log]    Script Date: 9/10/2023 2:56:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AHU_Maintenance_Log](
	[Log_ID] [int] IDENTITY(1,1) NOT NULL,
	[AHU_ID] [int] NULL,
	[Date] [date] NULL,
	[Maintenance_Description] [varchar](50) NULL,
	[Building_Manager_Id] [int] NULL,
 CONSTRAINT [PK_AHU_Maintenance] PRIMARY KEY CLUSTERED 
(
	[Log_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AHU_Time_Series]    Script Date: 9/10/2023 2:56:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AHU_Time_Series](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TIMESTAMP] [time](7) NULL,
	[AHU_ID] [int] NULL,
	[Watt_Consumption] [int] NULL,
 CONSTRAINT [PK_AHU_Time_Series] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Building_Area]    Script Date: 9/10/2023 2:56:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Building_Area](
	[Location_ID] [int] IDENTITY(1,1) NOT NULL,
	[Floor] [int] NULL,
	[Area_Name] [varchar](50) NULL,
	[Area_Purpose] [varchar](50) NULL,
 CONSTRAINT [PK_Location] PRIMARY KEY CLUSTERED 
(
	[Location_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Building_Manager]    Script Date: 9/10/2023 2:56:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Building_Manager](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Position] [varchar](50) NULL,
 CONSTRAINT [PK_Building_Manager] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sensor]    Script Date: 9/10/2023 2:56:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sensor](
	[Sensor_ID] [int] IDENTITY(1,1) NOT NULL,
	[Serial_Name] [varchar](50) NULL,
	[Location_ID] [int] NULL,
	[Type] [int] NULL,
 CONSTRAINT [PK_Sensor] PRIMARY KEY CLUSTERED 
(
	[Sensor_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sensor_Maintenance_Log]    Script Date: 9/10/2023 2:56:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sensor_Maintenance_Log](
	[Log_ID] [int] IDENTITY(1,1) NOT NULL,
	[Sensor_ID] [int] NULL,
	[Date] [date] NULL,
	[Maintenance_Description] [varchar](50) NULL,
	[Building_Manager_Id] [int] NULL,
 CONSTRAINT [PK_Sensor_Maintenance_Log] PRIMARY KEY CLUSTERED 
(
	[Log_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sensor_Time_Series]    Script Date: 9/10/2023 2:56:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sensor_Time_Series](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TIMESTAMP] [time](7) NULL,
	[SENSOR_ID] [int] NULL,
	[Measured_Value] [int] NULL,
 CONSTRAINT [PK_Sensor_Time_Series] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sensor_Type]    Script Date: 9/10/2023 2:56:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sensor_Type](
	[Sensor_Type_ID] [int] IDENTITY(1,1) NOT NULL,
	[Type_Name] [varchar](50) NULL,
 CONSTRAINT [PK_Sensor_Type] PRIMARY KEY CLUSTERED 
(
	[Sensor_Type_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[AHU] ON 

INSERT [dbo].[AHU] ([AHU_ID], [BRAND], [Serial_Name], [Max_CFM_Capacity], [Location_ID]) VALUES (1, N'Carrier', N'DAACC223', N'4000', 0)
INSERT [dbo].[AHU] ([AHU_ID], [BRAND], [Serial_Name], [Max_CFM_Capacity], [Location_ID]) VALUES (2, N'Carrier', N'CFX_999', N'3400', 0)
INSERT [dbo].[AHU] ([AHU_ID], [BRAND], [Serial_Name], [Max_CFM_Capacity], [Location_ID]) VALUES (3, N'Lennox', N'GG_3002', N'4000', 0)
SET IDENTITY_INSERT [dbo].[AHU] OFF
GO
SET IDENTITY_INSERT [dbo].[AHU_Maintenance_Log] ON 

INSERT [dbo].[AHU_Maintenance_Log] ([Log_ID], [AHU_ID], [Date], [Maintenance_Description], [Building_Manager_Id]) VALUES (1, 1, CAST(N'2023-10-10' AS Date), N'Installed', 1)
INSERT [dbo].[AHU_Maintenance_Log] ([Log_ID], [AHU_ID], [Date], [Maintenance_Description], [Building_Manager_Id]) VALUES (2, 2, CAST(N'2023-10-10' AS Date), N'Serviced Motor', 1)
INSERT [dbo].[AHU_Maintenance_Log] ([Log_ID], [AHU_ID], [Date], [Maintenance_Description], [Building_Manager_Id]) VALUES (3, 3, CAST(N'2023-10-10' AS Date), N'Rebalance', 1)
INSERT [dbo].[AHU_Maintenance_Log] ([Log_ID], [AHU_ID], [Date], [Maintenance_Description], [Building_Manager_Id]) VALUES (4, 2, CAST(N'2018-10-09' AS Date), N'Re Oiled', 1)
INSERT [dbo].[AHU_Maintenance_Log] ([Log_ID], [AHU_ID], [Date], [Maintenance_Description], [Building_Manager_Id]) VALUES (5, 1, CAST(N'2023-10-11' AS Date), N'System Failure', 2)
INSERT [dbo].[AHU_Maintenance_Log] ([Log_ID], [AHU_ID], [Date], [Maintenance_Description], [Building_Manager_Id]) VALUES (6, 2, CAST(N'2023-10-12' AS Date), N'System Inspection', 1)
INSERT [dbo].[AHU_Maintenance_Log] ([Log_ID], [AHU_ID], [Date], [Maintenance_Description], [Building_Manager_Id]) VALUES (7, 3, CAST(N'2023-10-02' AS Date), N'Fan Coil Replaced', 1)
SET IDENTITY_INSERT [dbo].[AHU_Maintenance_Log] OFF
GO
SET IDENTITY_INSERT [dbo].[AHU_Time_Series] ON 

INSERT [dbo].[AHU_Time_Series] ([ID], [TIMESTAMP], [AHU_ID], [Watt_Consumption]) VALUES (1, CAST(N'23:24:00' AS Time), 1, 4000)
INSERT [dbo].[AHU_Time_Series] ([ID], [TIMESTAMP], [AHU_ID], [Watt_Consumption]) VALUES (2, CAST(N'00:25:00' AS Time), 1, 3985)
INSERT [dbo].[AHU_Time_Series] ([ID], [TIMESTAMP], [AHU_ID], [Watt_Consumption]) VALUES (3, CAST(N'01:13:00' AS Time), 1, 2904)
INSERT [dbo].[AHU_Time_Series] ([ID], [TIMESTAMP], [AHU_ID], [Watt_Consumption]) VALUES (4, CAST(N'02:14:00' AS Time), 2, 3094)
INSERT [dbo].[AHU_Time_Series] ([ID], [TIMESTAMP], [AHU_ID], [Watt_Consumption]) VALUES (5, CAST(N'03:40:23' AS Time), 2, 3119)
INSERT [dbo].[AHU_Time_Series] ([ID], [TIMESTAMP], [AHU_ID], [Watt_Consumption]) VALUES (6, CAST(N'03:12:00' AS Time), 1, 4521)
INSERT [dbo].[AHU_Time_Series] ([ID], [TIMESTAMP], [AHU_ID], [Watt_Consumption]) VALUES (7, CAST(N'04:04:00' AS Time), 2, 2011)
SET IDENTITY_INSERT [dbo].[AHU_Time_Series] OFF
GO
SET IDENTITY_INSERT [dbo].[Building_Area] ON 

INSERT [dbo].[Building_Area] ([Location_ID], [Floor], [Area_Name], [Area_Purpose]) VALUES (1, 1, N'office1', N'lawyer office')
INSERT [dbo].[Building_Area] ([Location_ID], [Floor], [Area_Name], [Area_Purpose]) VALUES (2, 1, N'lobby', N'reception')
INSERT [dbo].[Building_Area] ([Location_ID], [Floor], [Area_Name], [Area_Purpose]) VALUES (3, 1, N'utility', N'storage')
INSERT [dbo].[Building_Area] ([Location_ID], [Floor], [Area_Name], [Area_Purpose]) VALUES (4, 1, N'kitchen', N'break room')
INSERT [dbo].[Building_Area] ([Location_ID], [Floor], [Area_Name], [Area_Purpose]) VALUES (5, 2, N'lobby', N'bank reception')
INSERT [dbo].[Building_Area] ([Location_ID], [Floor], [Area_Name], [Area_Purpose]) VALUES (6, 2, N'office1', N'manager office')
INSERT [dbo].[Building_Area] ([Location_ID], [Floor], [Area_Name], [Area_Purpose]) VALUES (7, 2, N'office2', N'employee office')
INSERT [dbo].[Building_Area] ([Location_ID], [Floor], [Area_Name], [Area_Purpose]) VALUES (8, 2, N'office3', N'employee office')
INSERT [dbo].[Building_Area] ([Location_ID], [Floor], [Area_Name], [Area_Purpose]) VALUES (9, 1, N'office2', N'law library')
INSERT [dbo].[Building_Area] ([Location_ID], [Floor], [Area_Name], [Area_Purpose]) VALUES (10, 1, N'bathroom', N'bathroom')
INSERT [dbo].[Building_Area] ([Location_ID], [Floor], [Area_Name], [Area_Purpose]) VALUES (11, 2, N'vault', N'bank vault')
INSERT [dbo].[Building_Area] ([Location_ID], [Floor], [Area_Name], [Area_Purpose]) VALUES (12, 2, N'bathroom1', N'customer bathroom')
INSERT [dbo].[Building_Area] ([Location_ID], [Floor], [Area_Name], [Area_Purpose]) VALUES (13, 2, N'bathroom2', N'employee bathroom')
INSERT [dbo].[Building_Area] ([Location_ID], [Floor], [Area_Name], [Area_Purpose]) VALUES (14, 0, N'utility1', N'mechanical room')
INSERT [dbo].[Building_Area] ([Location_ID], [Floor], [Area_Name], [Area_Purpose]) VALUES (15, 0, N'utility2', N'garage')
INSERT [dbo].[Building_Area] ([Location_ID], [Floor], [Area_Name], [Area_Purpose]) VALUES (16, 0, N'office1', N'building control')
INSERT [dbo].[Building_Area] ([Location_ID], [Floor], [Area_Name], [Area_Purpose]) VALUES (17, 0, N'utility3', N'mechanical room')
INSERT [dbo].[Building_Area] ([Location_ID], [Floor], [Area_Name], [Area_Purpose]) VALUES (18, 0, N'bathroom', N'bathroom')
SET IDENTITY_INSERT [dbo].[Building_Area] OFF
GO
SET IDENTITY_INSERT [dbo].[Building_Manager] ON 

INSERT [dbo].[Building_Manager] ([id], [Name], [Position]) VALUES (1, N'Richard Lombok', N'Manager')
INSERT [dbo].[Building_Manager] ([id], [Name], [Position]) VALUES (2, N'Carl Jarl', N'Assistant')
INSERT [dbo].[Building_Manager] ([id], [Name], [Position]) VALUES (3, N'Heather Mayfield', N'Assistant')
SET IDENTITY_INSERT [dbo].[Building_Manager] OFF
GO
SET IDENTITY_INSERT [dbo].[Sensor] ON 

INSERT [dbo].[Sensor] ([Sensor_ID], [Serial_Name], [Location_ID], [Type]) VALUES (1, N'JJ04', 1, 1)
INSERT [dbo].[Sensor] ([Sensor_ID], [Serial_Name], [Location_ID], [Type]) VALUES (2, N'JJ05', 2, 1)
INSERT [dbo].[Sensor] ([Sensor_ID], [Serial_Name], [Location_ID], [Type]) VALUES (3, N'JJ06', 3, 1)
INSERT [dbo].[Sensor] ([Sensor_ID], [Serial_Name], [Location_ID], [Type]) VALUES (4, N'JJ07', 4, 1)
INSERT [dbo].[Sensor] ([Sensor_ID], [Serial_Name], [Location_ID], [Type]) VALUES (5, N'JJ08', 5, 1)
INSERT [dbo].[Sensor] ([Sensor_ID], [Serial_Name], [Location_ID], [Type]) VALUES (6, N'JJ09', 6, 1)
INSERT [dbo].[Sensor] ([Sensor_ID], [Serial_Name], [Location_ID], [Type]) VALUES (7, N'JJ10', 7, 1)
INSERT [dbo].[Sensor] ([Sensor_ID], [Serial_Name], [Location_ID], [Type]) VALUES (8, N'FI19', 2, 1)
INSERT [dbo].[Sensor] ([Sensor_ID], [Serial_Name], [Location_ID], [Type]) VALUES (9, N'FI20', 4, 2)
INSERT [dbo].[Sensor] ([Sensor_ID], [Serial_Name], [Location_ID], [Type]) VALUES (10, N'FI30', 5, 3)
SET IDENTITY_INSERT [dbo].[Sensor] OFF
GO
SET IDENTITY_INSERT [dbo].[Sensor_Maintenance_Log] ON 

INSERT [dbo].[Sensor_Maintenance_Log] ([Log_ID], [Sensor_ID], [Date], [Maintenance_Description], [Building_Manager_Id]) VALUES (1, 1, CAST(N'2023-10-02' AS Date), N'Installed', 1)
INSERT [dbo].[Sensor_Maintenance_Log] ([Log_ID], [Sensor_ID], [Date], [Maintenance_Description], [Building_Manager_Id]) VALUES (2, 1, CAST(N'2024-01-02' AS Date), N'Installed', 2)
INSERT [dbo].[Sensor_Maintenance_Log] ([Log_ID], [Sensor_ID], [Date], [Maintenance_Description], [Building_Manager_Id]) VALUES (3, 1, CAST(N'2023-10-03' AS Date), N'Replaced', 1)
INSERT [dbo].[Sensor_Maintenance_Log] ([Log_ID], [Sensor_ID], [Date], [Maintenance_Description], [Building_Manager_Id]) VALUES (4, 1, CAST(N'2022-10-04' AS Date), N'Replaced', 1)
INSERT [dbo].[Sensor_Maintenance_Log] ([Log_ID], [Sensor_ID], [Date], [Maintenance_Description], [Building_Manager_Id]) VALUES (5, 2, CAST(N'2023-02-01' AS Date), N'FireDrill', 2)
INSERT [dbo].[Sensor_Maintenance_Log] ([Log_ID], [Sensor_ID], [Date], [Maintenance_Description], [Building_Manager_Id]) VALUES (6, 3, CAST(N'2021-02-01' AS Date), N'Inspected', 3)
SET IDENTITY_INSERT [dbo].[Sensor_Maintenance_Log] OFF
GO
SET IDENTITY_INSERT [dbo].[Sensor_Time_Series] ON 

INSERT [dbo].[Sensor_Time_Series] ([ID], [TIMESTAMP], [SENSOR_ID], [Measured_Value]) VALUES (1, CAST(N'23:10:00' AS Time), 1, 70)
INSERT [dbo].[Sensor_Time_Series] ([ID], [TIMESTAMP], [SENSOR_ID], [Measured_Value]) VALUES (2, CAST(N'00:12:00' AS Time), 1, 72)
INSERT [dbo].[Sensor_Time_Series] ([ID], [TIMESTAMP], [SENSOR_ID], [Measured_Value]) VALUES (3, CAST(N'01:13:00' AS Time), 2, 71)
INSERT [dbo].[Sensor_Time_Series] ([ID], [TIMESTAMP], [SENSOR_ID], [Measured_Value]) VALUES (4, CAST(N'02:30:00' AS Time), 1, 73)
INSERT [dbo].[Sensor_Time_Series] ([ID], [TIMESTAMP], [SENSOR_ID], [Measured_Value]) VALUES (5, CAST(N'02:13:00' AS Time), 1, 74)
INSERT [dbo].[Sensor_Time_Series] ([ID], [TIMESTAMP], [SENSOR_ID], [Measured_Value]) VALUES (6, CAST(N'20:22:00' AS Time), 2, 73)
INSERT [dbo].[Sensor_Time_Series] ([ID], [TIMESTAMP], [SENSOR_ID], [Measured_Value]) VALUES (7, CAST(N'10:24:00' AS Time), 1, 71)
INSERT [dbo].[Sensor_Time_Series] ([ID], [TIMESTAMP], [SENSOR_ID], [Measured_Value]) VALUES (8, CAST(N'03:29:00' AS Time), 1, 69)
SET IDENTITY_INSERT [dbo].[Sensor_Time_Series] OFF
GO
SET IDENTITY_INSERT [dbo].[Sensor_Type] ON 

INSERT [dbo].[Sensor_Type] ([Sensor_Type_ID], [Type_Name]) VALUES (1, N'temperature')
INSERT [dbo].[Sensor_Type] ([Sensor_Type_ID], [Type_Name]) VALUES (2, N'humidity')
INSERT [dbo].[Sensor_Type] ([Sensor_Type_ID], [Type_Name]) VALUES (3, N'pressure')
INSERT [dbo].[Sensor_Type] ([Sensor_Type_ID], [Type_Name]) VALUES (4, N'smoke')
INSERT [dbo].[Sensor_Type] ([Sensor_Type_ID], [Type_Name]) VALUES (5, N'fire')
SET IDENTITY_INSERT [dbo].[Sensor_Type] OFF
GO
USE [master]
GO
ALTER DATABASE [CommercialBuildingSystems] SET  READ_WRITE 
GO
