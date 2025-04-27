USE [master]
GO
/****** Object:  Database [N12]    Script Date: 4/23/2025 11:57:51 PM ******/
CREATE DATABASE [N12]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'N12', FILENAME = N'D:\Kỳ 8\Data Warehouse & Data Mining\SSMS Proj\N12.mdf' , SIZE = 204800KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'N12_log', FILENAME = N'D:\Kỳ 8\Data Warehouse & Data Mining\SSMS Proj\N12_log.ldf' , SIZE = 204800KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [N12] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [N12].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [N12] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [N12] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [N12] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [N12] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [N12] SET ARITHABORT OFF 
GO
ALTER DATABASE [N12] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [N12] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [N12] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [N12] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [N12] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [N12] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [N12] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [N12] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [N12] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [N12] SET  DISABLE_BROKER 
GO
ALTER DATABASE [N12] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [N12] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [N12] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [N12] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [N12] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [N12] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [N12] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [N12] SET RECOVERY FULL 
GO
ALTER DATABASE [N12] SET  MULTI_USER 
GO
ALTER DATABASE [N12] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [N12] SET DB_CHAINING OFF 
GO
ALTER DATABASE [N12] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [N12] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [N12] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [N12] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'N12', N'ON'
GO
ALTER DATABASE [N12] SET QUERY_STORE = ON
GO
ALTER DATABASE [N12] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [N12]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 4/23/2025 11:57:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[orderID] [nvarchar](20) NOT NULL,
	[orderDate] [datetime2](7) NOT NULL,
	[customerID] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[orderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StoredItem]    Script Date: 4/23/2025 11:57:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StoredItem](
	[storeID] [nvarchar](20) NOT NULL,
	[itemID] [nvarchar](20) NOT NULL,
	[quantity] [int] NOT NULL,
	[lastUpdateDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_StoredItem] PRIMARY KEY CLUSTERED 
(
	[storeID] ASC,
	[itemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Time_View]    Script Date: 4/23/2025 11:57:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Time_View]
AS
WITH AllDates AS (SELECT CAST(orderDate AS DATE) AS theDate
                                     FROM      dbo.[Order]
                                     UNION
                                     SELECT CAST(lastUpdateDate AS DATE) AS Expr1
                                     FROM     dbo.StoredItem)
    SELECT DISTINCT theDate AS fullDate, MONTH(theDate) AS month, DATEPART(QUARTER, theDate) AS quarter, YEAR(theDate) AS year
    FROM     AllDates AS AllDates_1
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 4/23/2025 11:57:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[customerID] [nvarchar](20) NOT NULL,
	[customerName] [nvarchar](50) NOT NULL,
	[citytID] [nvarchar](20) NOT NULL,
	[firstOrderDate] [datetime2](0) NOT NULL,
 CONSTRAINT [PK_Customer_1] PRIMARY KEY CLUSTERED 
(
	[customerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Customer_View]    Script Date: 4/23/2025 11:57:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Customer_View]
AS
SELECT customerID, customerName
FROM     dbo.Customer
GO
/****** Object:  Table [dbo].[Item]    Script Date: 4/23/2025 11:57:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Item](
	[itemID] [nvarchar](20) NOT NULL,
	[des] [nvarchar](200) NOT NULL,
	[size] [nvarchar](10) NOT NULL,
	[weight] [float] NOT NULL,
	[price] [money] NOT NULL,
	[firstImportedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Item] PRIMARY KEY CLUSTERED 
(
	[itemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Item_View]    Script Date: 4/23/2025 11:57:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Item_View]
AS
SELECT itemID, size, weight, price
FROM     dbo.Item
GO
/****** Object:  Table [dbo].[Office]    Script Date: 4/23/2025 11:57:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Office](
	[cityID] [nvarchar](20) NOT NULL,
	[cityName] [nvarchar](50) NOT NULL,
	[officeAddress] [nvarchar](100) NOT NULL,
	[state] [nvarchar](20) NOT NULL,
	[establishmentDate] [date] NOT NULL,
 CONSTRAINT [PK_Office] PRIMARY KEY CLUSTERED 
(
	[cityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Store]    Script Date: 4/23/2025 11:57:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Store](
	[storeID] [nvarchar](20) NOT NULL,
	[cityID] [nvarchar](20) NOT NULL,
	[phone] [nvarchar](20) NOT NULL,
	[openingDate] [date] NOT NULL,
 CONSTRAINT [PK_Store] PRIMARY KEY CLUSTERED 
(
	[storeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Store_View]    Script Date: 4/23/2025 11:57:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Store_View]
AS
SELECT dbo.Store.storeID, dbo.Office.cityID, dbo.Office.state
FROM     dbo.Store INNER JOIN
                  dbo.Office ON dbo.Store.cityID = dbo.Office.cityID
GO
/****** Object:  Table [dbo].[OrderedItem]    Script Date: 4/23/2025 11:57:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderedItem](
	[orderID] [nvarchar](20) NOT NULL,
	[itemID] [nvarchar](20) NOT NULL,
	[orderedAmount] [int] NOT NULL,
	[orderedPrice] [money] NOT NULL,
 CONSTRAINT [PK_OrderedItem] PRIMARY KEY CLUSTERED 
(
	[orderID] ASC,
	[itemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Sale_View]    Script Date: 4/23/2025 11:57:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Sale_View]
AS
SELECT DISTINCT 
                  N12_DW.dbo.Dim_Time.fullDate, N12_DW.dbo.Dim_Customer.customerID, N12_DW.dbo.Dim_Item.itemID, AVG(dbo.OrderedItem.orderedPrice) AS unitPrice, SUM(dbo.OrderedItem.orderedAmount) AS amount, 
                  SUM(dbo.OrderedItem.orderedAmount * dbo.OrderedItem.orderedPrice) AS totalPrice
FROM     dbo.OrderedItem INNER JOIN
                  dbo.[Order] ON dbo.OrderedItem.orderID = dbo.[Order].orderID INNER JOIN
                  dbo.Item ON dbo.OrderedItem.itemID = dbo.Item.itemID INNER JOIN
                  N12_DW.dbo.Dim_Item ON dbo.OrderedItem.itemID = N12_DW.dbo.Dim_Item.itemID INNER JOIN
                  N12_DW.dbo.Dim_Customer ON dbo.[Order].customerID = N12_DW.dbo.Dim_Customer.customerID INNER JOIN
                  N12_DW.dbo.Dim_Time ON N12_DW.dbo.Dim_Time.fullDate = CONVERT(varchar, dbo.[Order].orderDate, 23)
GROUP BY N12_DW.dbo.Dim_Time.fullDate, N12_DW.dbo.Dim_Customer.customerID, N12_DW.dbo.Dim_Item.itemID
GO
/****** Object:  View [dbo].[Inventory_View]    Script Date: 4/23/2025 11:57:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Inventory_View]
AS
SELECT N12_DW.dbo.Dim_Time.fullDate, N12_DW.dbo.Dim_Store.storeID, N12_DW.dbo.Dim_Item.itemID, dbo.StoredItem.quantity
FROM     dbo.StoredItem INNER JOIN
                  dbo.Item ON dbo.StoredItem.itemID = dbo.Item.itemID INNER JOIN
                  N12_DW.dbo.Dim_Item ON dbo.StoredItem.itemID = N12_DW.dbo.Dim_Item.itemID INNER JOIN
                  dbo.Store ON dbo.StoredItem.storeID = dbo.Store.storeID INNER JOIN
                  N12_DW.dbo.Dim_Store ON dbo.StoredItem.storeID = N12_DW.dbo.Dim_Store.storeID INNER JOIN
                  N12_DW.dbo.Dim_Time ON N12_DW.dbo.Dim_Time.fullDate = CONVERT(varchar, dbo.StoredItem.lastUpdateDate, 23)
GO
/****** Object:  Table [dbo].[PostalCustomer]    Script Date: 4/23/2025 11:57:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PostalCustomer](
	[customerID] [nvarchar](20) NOT NULL,
	[postOfficeAddr] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_PostalCustomer] PRIMARY KEY CLUSTERED 
(
	[customerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TouristCustomer]    Script Date: 4/23/2025 11:57:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TouristCustomer](
	[customerID] [nvarchar](20) NOT NULL,
	[tourGuide] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TouristCustomer] PRIMARY KEY CLUSTERED 
(
	[customerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Customer]  WITH NOCHECK ADD  CONSTRAINT [FK_Customer_Office] FOREIGN KEY([citytID])
REFERENCES [dbo].[Office] ([cityID])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_Office]
GO
ALTER TABLE [dbo].[Order]  WITH NOCHECK ADD  CONSTRAINT [FK_Order_Customer] FOREIGN KEY([customerID])
REFERENCES [dbo].[Customer] ([customerID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Customer]
GO
ALTER TABLE [dbo].[OrderedItem]  WITH NOCHECK ADD  CONSTRAINT [FK_OrderedItem_Item] FOREIGN KEY([itemID])
REFERENCES [dbo].[Item] ([itemID])
GO
ALTER TABLE [dbo].[OrderedItem] CHECK CONSTRAINT [FK_OrderedItem_Item]
GO
ALTER TABLE [dbo].[OrderedItem]  WITH NOCHECK ADD  CONSTRAINT [FK_OrderedItem_Order] FOREIGN KEY([orderID])
REFERENCES [dbo].[Order] ([orderID])
GO
ALTER TABLE [dbo].[OrderedItem] CHECK CONSTRAINT [FK_OrderedItem_Order]
GO
ALTER TABLE [dbo].[PostalCustomer]  WITH NOCHECK ADD  CONSTRAINT [FK_PostalCustomer_Customer] FOREIGN KEY([customerID])
REFERENCES [dbo].[Customer] ([customerID])
GO
ALTER TABLE [dbo].[PostalCustomer] CHECK CONSTRAINT [FK_PostalCustomer_Customer]
GO
ALTER TABLE [dbo].[Store]  WITH NOCHECK ADD  CONSTRAINT [FK_Store_Office] FOREIGN KEY([cityID])
REFERENCES [dbo].[Office] ([cityID])
GO
ALTER TABLE [dbo].[Store] CHECK CONSTRAINT [FK_Store_Office]
GO
ALTER TABLE [dbo].[StoredItem]  WITH NOCHECK ADD  CONSTRAINT [FK_StoredItem_Item] FOREIGN KEY([itemID])
REFERENCES [dbo].[Item] ([itemID])
GO
ALTER TABLE [dbo].[StoredItem] CHECK CONSTRAINT [FK_StoredItem_Item]
GO
ALTER TABLE [dbo].[StoredItem]  WITH NOCHECK ADD  CONSTRAINT [FK_StoredItem_Store] FOREIGN KEY([storeID])
REFERENCES [dbo].[Store] ([storeID])
GO
ALTER TABLE [dbo].[StoredItem] CHECK CONSTRAINT [FK_StoredItem_Store]
GO
ALTER TABLE [dbo].[TouristCustomer]  WITH NOCHECK ADD  CONSTRAINT [FK_TouristCustomer_Customer] FOREIGN KEY([customerID])
REFERENCES [dbo].[Customer] ([customerID])
GO
ALTER TABLE [dbo].[TouristCustomer] CHECK CONSTRAINT [FK_TouristCustomer_Customer]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[20] 2[14] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Customer"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 244
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Customer_View'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Customer_View'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[45] 4[16] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "StoredItem"
            Begin Extent = 
               Top = 22
               Left = 476
               Bottom = 185
               Right = 688
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Item"
            Begin Extent = 
               Top = 68
               Left = 32
               Bottom = 231
               Right = 246
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Dim_Item (N12_DW.dbo)"
            Begin Extent = 
               Top = 275
               Left = 206
               Bottom = 438
               Right = 400
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Store"
            Begin Extent = 
               Top = 243
               Left = 819
               Bottom = 406
               Right = 1013
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Dim_Store (N12_DW.dbo)"
            Begin Extent = 
               Top = 185
               Left = 1147
               Bottom = 326
               Right = 1341
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Dim_Time (N12_DW.dbo)"
            Begin Extent = 
               Top = 14
               Left = 1045
               Bottom = 177
               Right = 1239
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
   ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Inventory_View'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'      Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 2220
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1356
         SortOrder = 1416
         GroupBy = 1350
         Filter = 1356
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Inventory_View'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Inventory_View'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Item"
            Begin Extent = 
               Top = 65
               Left = 247
               Bottom = 293
               Right = 461
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Item_View'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Item_View'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[20] 2[16] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "OrderedItem"
            Begin Extent = 
               Top = 182
               Left = 423
               Bottom = 345
               Right = 624
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Order"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 148
               Right = 258
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Item"
            Begin Extent = 
               Top = 221
               Left = 64
               Bottom = 384
               Right = 278
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Dim_Item (N12_DW.dbo)"
            Begin Extent = 
               Top = 179
               Left = 890
               Bottom = 342
               Right = 1084
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Dim_Customer (N12_DW.dbo)"
            Begin Extent = 
               Top = 23
               Left = 153
               Bottom = 142
               Right = 349
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Dim_Time (N12_DW.dbo)"
            Begin Extent = 
               Top = 15
               Left = 1084
               Bottom = 178
               Right = 1278
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
   ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Sale_View'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'      Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1176
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1356
         SortOrder = 1416
         GroupBy = 1350
         Filter = 1356
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Sale_View'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Sale_View'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Store"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Office"
            Begin Extent = 
               Top = 54
               Left = 357
               Bottom = 217
               Right = 576
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1176
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1356
         SortOrder = 1416
         GroupBy = 1350
         Filter = 1356
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Store_View'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Store_View'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[20] 2[16] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "AllDates_1"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 104
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1176
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1356
         SortOrder = 1416
         GroupBy = 1350
         Filter = 1356
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Time_View'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Time_View'
GO
USE [master]
GO
ALTER DATABASE [N12] SET  READ_WRITE 
GO
