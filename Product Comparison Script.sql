Create Database [ProductComparisonDB]
go

USE [ProductComparisonDB]
GO
/****** Object:  StoredProcedure [dbo].[AirConditioner_Delete]    Script Date: 16-May-14 10:46:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AirConditioner_Delete]
    @ProductID [nvarchar](30)
AS
BEGIN
    DELETE [dbo].[AirConditioners]
    WHERE ([ProductID] = @ProductID)
    
    DELETE [dbo].[Products]
    WHERE ([ProductID] = @ProductID)
    AND @@ROWCOUNT > 0
END

GO
/****** Object:  StoredProcedure [dbo].[AirConditioner_Insert]    Script Date: 16-May-14 10:46:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AirConditioner_Insert]
    @ProductID [nvarchar](30),
    @ProductName [nvarchar](40),
    @Price [float],
    @BrandName [nvarchar](40),
    @Photo [nvarchar](100),
    @CategoryID [nvarchar](30),
    @SubCategoryID [nvarchar](30),
    @Name [nvarchar](30),
    @Type [nvarchar](20),
    @DisplayPanel [bit],
    @DisplayPanelType [nvarchar](20),
    @Capacity [nvarchar](20),
    @Dimensions [nvarchar](10),
    @NetWeight [float],
    @PowerConsumption [float],
    @PowerSupply [nvarchar](10)
AS
BEGIN
    INSERT [dbo].[Products]([ProductID], [ProductName], [Price], [BrandName], [Photo], [CategoryID], [SubCategoryID])
    VALUES (@ProductID, @ProductName, @Price, @BrandName, @Photo, @CategoryID, @SubCategoryID)
    
    INSERT [dbo].[AirConditioners]([ProductID], [Name], [Type], [DisplayPanel], [DisplayPanelType], [Capacity], [Dimensions], [NetWeight], [PowerConsumption], [PowerSupply])
    VALUES (@ProductID, @Name, @Type, @DisplayPanel, @DisplayPanelType, @Capacity, @Dimensions, @NetWeight, @PowerConsumption, @PowerSupply)
END

GO
/****** Object:  StoredProcedure [dbo].[AirConditioner_Update]    Script Date: 16-May-14 10:46:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AirConditioner_Update]
    @ProductID [nvarchar](30),
    @ProductName [nvarchar](40),
    @Price [float],
    @BrandName [nvarchar](40),
    @Photo [nvarchar](100),
    @CategoryID [nvarchar](30),
    @SubCategoryID [nvarchar](30),
    @Name [nvarchar](30),
    @Type [nvarchar](20),
    @DisplayPanel [bit],
    @DisplayPanelType [nvarchar](20),
    @Capacity [nvarchar](20),
    @Dimensions [nvarchar](10),
    @NetWeight [float],
    @PowerConsumption [float],
    @PowerSupply [nvarchar](10)
AS
BEGIN
    UPDATE [dbo].[AirConditioners]
    SET [Name] = @Name, [Type] = @Type, [DisplayPanel] = @DisplayPanel, [DisplayPanelType] = @DisplayPanelType, [Capacity] = @Capacity, [Dimensions] = @Dimensions, [NetWeight] = @NetWeight, [PowerConsumption] = @PowerConsumption, [PowerSupply] = @PowerSupply
    WHERE ([ProductID] = @ProductID)
    
    UPDATE [dbo].[Products]
    SET [ProductName] = @ProductName, [Price] = @Price, [BrandName] = @BrandName, [Photo] = @Photo, [CategoryID] = @CategoryID, [SubCategoryID] = @SubCategoryID
    WHERE ([ProductID] = @ProductID)
    AND @@ROWCOUNT > 0
END

GO
/****** Object:  StoredProcedure [dbo].[Book_Delete]    Script Date: 16-May-14 10:46:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Book_Delete]
    @ProductID [nvarchar](30)
AS
BEGIN
    DELETE [dbo].[Books]
    WHERE ([ProductID] = @ProductID)
    
    DELETE [dbo].[Products]
    WHERE ([ProductID] = @ProductID)
    AND @@ROWCOUNT > 0
END

GO
/****** Object:  StoredProcedure [dbo].[Book_Insert]    Script Date: 16-May-14 10:46:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Book_Insert]
    @ProductID [nvarchar](30),
    @ProductName [nvarchar](40),
    @Price [float],
    @BrandName [nvarchar](40),
    @Photo [nvarchar](100),
    @CategoryID [nvarchar](30),
    @SubCategoryID [nvarchar](30),
    @Genre [nvarchar](30),
    @Author [nvarchar](30),
    @BindingType [nvarchar](30),
    @Publication [nvarchar](30),
    @PublicationYear [nvarchar](4),
    @Edition [nvarchar](10)
AS
BEGIN
    INSERT [dbo].[Products]([ProductID], [ProductName], [Price], [BrandName], [Photo], [CategoryID], [SubCategoryID])
    VALUES (@ProductID, @ProductName, @Price, @BrandName, @Photo, @CategoryID, @SubCategoryID)
    
    INSERT [dbo].[Books]([ProductID], [Genre], [Author], [BindingType], [Publication], [PublicationYear], [Edition])
    VALUES (@ProductID, @Genre, @Author, @BindingType, @Publication, @PublicationYear, @Edition)
END

GO
/****** Object:  StoredProcedure [dbo].[Book_Update]    Script Date: 16-May-14 10:46:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Book_Update]
    @ProductID [nvarchar](30),
    @ProductName [nvarchar](40),
    @Price [float],
    @BrandName [nvarchar](40),
    @Photo [nvarchar](100),
    @CategoryID [nvarchar](30),
    @SubCategoryID [nvarchar](30),
    @Genre [nvarchar](30),
    @Author [nvarchar](30),
    @BindingType [nvarchar](30),
    @Publication [nvarchar](30),
    @PublicationYear [nvarchar](4),
    @Edition [nvarchar](10)
AS
BEGIN
    UPDATE [dbo].[Books]
    SET [Genre] = @Genre, [Author] = @Author, [BindingType] = @BindingType, [Publication] = @Publication, [PublicationYear] = @PublicationYear, [Edition] = @Edition
    WHERE ([ProductID] = @ProductID)
    
    UPDATE [dbo].[Products]
    SET [ProductName] = @ProductName, [Price] = @Price, [BrandName] = @BrandName, [Photo] = @Photo, [CategoryID] = @CategoryID, [SubCategoryID] = @SubCategoryID
    WHERE ([ProductID] = @ProductID)
    AND @@ROWCOUNT > 0
END

GO
/****** Object:  StoredProcedure [dbo].[Camera_Delete]    Script Date: 16-May-14 10:46:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Camera_Delete]
    @ProductID [nvarchar](30)
AS
BEGIN
    DELETE [dbo].[Cameras]
    WHERE ([ProductID] = @ProductID)
    
    DELETE [dbo].[Products]
    WHERE ([ProductID] = @ProductID)
    AND @@ROWCOUNT > 0
END

GO
/****** Object:  StoredProcedure [dbo].[Camera_Insert]    Script Date: 16-May-14 10:46:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Camera_Insert]
    @ProductID [nvarchar](30),
    @ProductName [nvarchar](40),
    @Price [float],
    @BrandName [nvarchar](40),
    @Photo [nvarchar](100),
    @CategoryID [nvarchar](30),
    @SubCategoryID [nvarchar](30),
    @CameraType [nvarchar](40),
    @Resolution [nvarchar](40),
    @ScreenSize [nvarchar](40),
    @Zoom [nvarchar](40)
AS
BEGIN
    INSERT [dbo].[Products]([ProductID], [ProductName], [Price], [BrandName], [Photo], [CategoryID], [SubCategoryID])
    VALUES (@ProductID, @ProductName, @Price, @BrandName, @Photo, @CategoryID, @SubCategoryID)
    
    INSERT [dbo].[Cameras]([ProductID], [CameraType], [Resolution], [ScreenSize], [Zoom])
    VALUES (@ProductID, @CameraType, @Resolution, @ScreenSize, @Zoom)
END

GO
/****** Object:  StoredProcedure [dbo].[Camera_Update]    Script Date: 16-May-14 10:46:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Camera_Update]
    @ProductID [nvarchar](30),
    @ProductName [nvarchar](40),
    @Price [float],
    @BrandName [nvarchar](40),
    @Photo [nvarchar](100),
    @CategoryID [nvarchar](30),
    @SubCategoryID [nvarchar](30),
    @CameraType [nvarchar](40),
    @Resolution [nvarchar](40),
    @ScreenSize [nvarchar](40),
    @Zoom [nvarchar](40)
AS
BEGIN
    UPDATE [dbo].[Cameras]
    SET [CameraType] = @CameraType, [Resolution] = @Resolution, [ScreenSize] = @ScreenSize, [Zoom] = @Zoom
    WHERE ([ProductID] = @ProductID)
    
    UPDATE [dbo].[Products]
    SET [ProductName] = @ProductName, [Price] = @Price, [BrandName] = @BrandName, [Photo] = @Photo, [CategoryID] = @CategoryID, [SubCategoryID] = @SubCategoryID
    WHERE ([ProductID] = @ProductID)
    AND @@ROWCOUNT > 0
END

GO
/****** Object:  StoredProcedure [dbo].[Car_Delete]    Script Date: 16-May-14 10:46:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Car_Delete]
    @ProductID [nvarchar](30)
AS
BEGIN
    DELETE [dbo].[Cars]
    WHERE ([ProductID] = @ProductID)
    
    DELETE [dbo].[Products]
    WHERE ([ProductID] = @ProductID)
    AND @@ROWCOUNT > 0
END

GO
/****** Object:  StoredProcedure [dbo].[Car_Insert]    Script Date: 16-May-14 10:46:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Car_Insert]
    @ProductID [nvarchar](30),
    @ProductName [nvarchar](40),
    @Price [float],
    @BrandName [nvarchar](40),
    @Photo [nvarchar](100),
    @CategoryID [nvarchar](30),
    @SubCategoryID [nvarchar](30),
    @CarType [nvarchar](20),
    @Mileage [float],
    @Model [nvarchar](20)
AS
BEGIN
    INSERT [dbo].[Products]([ProductID], [ProductName], [Price], [BrandName], [Photo], [CategoryID], [SubCategoryID])
    VALUES (@ProductID, @ProductName, @Price, @BrandName, @Photo, @CategoryID, @SubCategoryID)
    
    INSERT [dbo].[Cars]([ProductID], [CarType], [Mileage], [Model])
    VALUES (@ProductID, @CarType, @Mileage, @Model)
END

GO
/****** Object:  StoredProcedure [dbo].[Car_Update]    Script Date: 16-May-14 10:46:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Car_Update]
    @ProductID [nvarchar](30),
    @ProductName [nvarchar](40),
    @Price [float],
    @BrandName [nvarchar](40),
    @Photo [nvarchar](100),
    @CategoryID [nvarchar](30),
    @SubCategoryID [nvarchar](30),
    @CarType [nvarchar](20),
    @Mileage [float],
    @Model [nvarchar](20)
AS
BEGIN
    UPDATE [dbo].[Cars]
    SET [CarType] = @CarType, [Mileage] = @Mileage, [Model] = @Model
    WHERE ([ProductID] = @ProductID)
    
    UPDATE [dbo].[Products]
    SET [ProductName] = @ProductName, [Price] = @Price, [BrandName] = @BrandName, [Photo] = @Photo, [CategoryID] = @CategoryID, [SubCategoryID] = @SubCategoryID
    WHERE ([ProductID] = @ProductID)
    AND @@ROWCOUNT > 0
END

GO
/****** Object:  StoredProcedure [dbo].[Category_Delete]    Script Date: 16-May-14 10:46:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Category_Delete]
    @CategoryID [nvarchar](30)
AS
BEGIN
    DELETE [dbo].[Categories]
    WHERE ([CategoryID] = @CategoryID)
END

GO
/****** Object:  StoredProcedure [dbo].[Category_Insert]    Script Date: 16-May-14 10:46:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Category_Insert]
    @CategoryID [nvarchar](30),
    @CategoryName [nvarchar](40),
    @Description [nvarchar](100)
AS
BEGIN
    INSERT [dbo].[Categories]([CategoryID], [CategoryName], [Description])
    VALUES (@CategoryID, @CategoryName, @Description)
END

GO
/****** Object:  StoredProcedure [dbo].[Category_Update]    Script Date: 16-May-14 10:46:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Category_Update]
    @CategoryID [nvarchar](30),
    @CategoryName [nvarchar](40),
    @Description [nvarchar](100)
AS
BEGIN
    UPDATE [dbo].[Categories]
    SET [CategoryName] = @CategoryName, [Description] = @Description
    WHERE ([CategoryID] = @CategoryID)
END

GO
/****** Object:  StoredProcedure [dbo].[CellPhone_Delete]    Script Date: 16-May-14 10:46:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CellPhone_Delete]
    @ProductID [nvarchar](30)
AS
BEGIN
    DELETE [dbo].[CellPhones]
    WHERE ([ProductID] = @ProductID)
    
    DELETE [dbo].[Products]
    WHERE ([ProductID] = @ProductID)
    AND @@ROWCOUNT > 0
END

GO
/****** Object:  StoredProcedure [dbo].[CellPhone_Insert]    Script Date: 16-May-14 10:46:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CellPhone_Insert]
    @ProductID [nvarchar](30),
    @ProductName [nvarchar](40),
    @Price [float],
    @BrandName [nvarchar](40),
    @Photo [nvarchar](100),
    @CategoryID [nvarchar](30),
    @SubCategoryID [nvarchar](30),
    @Display [nvarchar](40),
    @OperatingSystem [nvarchar](40),
    @Processor [nvarchar](40),
    @TouchScreen [bit],
    @ScreenSize [float],
    @StandByTime [float]
AS
BEGIN
    INSERT [dbo].[Products]([ProductID], [ProductName], [Price], [BrandName], [Photo], [CategoryID], [SubCategoryID])
    VALUES (@ProductID, @ProductName, @Price, @BrandName, @Photo, @CategoryID, @SubCategoryID)
    
    INSERT [dbo].[CellPhones]([ProductID], [Display], [OperatingSystem], [Processor], [TouchScreen], [ScreenSize], [StandByTime])
    VALUES (@ProductID, @Display, @OperatingSystem, @Processor, @TouchScreen, @ScreenSize, @StandByTime)
END

GO
/****** Object:  StoredProcedure [dbo].[CellPhone_Update]    Script Date: 16-May-14 10:46:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CellPhone_Update]
    @ProductID [nvarchar](30),
    @ProductName [nvarchar](40),
    @Price [float],
    @BrandName [nvarchar](40),
    @Photo [nvarchar](100),
    @CategoryID [nvarchar](30),
    @SubCategoryID [nvarchar](30),
    @Display [nvarchar](40),
    @OperatingSystem [nvarchar](40),
    @Processor [nvarchar](40),
    @TouchScreen [bit],
    @ScreenSize [float],
    @StandByTime [float]
AS
BEGIN
    UPDATE [dbo].[CellPhones]
    SET [Display] = @Display, [OperatingSystem] = @OperatingSystem, [Processor] = @Processor, [TouchScreen] = @TouchScreen, [ScreenSize] = @ScreenSize, [StandByTime] = @StandByTime
    WHERE ([ProductID] = @ProductID)
    
    UPDATE [dbo].[Products]
    SET [ProductName] = @ProductName, [Price] = @Price, [BrandName] = @BrandName, [Photo] = @Photo, [CategoryID] = @CategoryID, [SubCategoryID] = @SubCategoryID
    WHERE ([ProductID] = @ProductID)
    AND @@ROWCOUNT > 0
END

GO
/****** Object:  StoredProcedure [dbo].[Moped_Delete]    Script Date: 16-May-14 10:46:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Moped_Delete]
    @ProductID [nvarchar](30)
AS
BEGIN
    DELETE [dbo].[Mopeds]
    WHERE ([ProductID] = @ProductID)
    
    DELETE [dbo].[Products]
    WHERE ([ProductID] = @ProductID)
    AND @@ROWCOUNT > 0
END

GO
/****** Object:  StoredProcedure [dbo].[Moped_Insert]    Script Date: 16-May-14 10:46:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Moped_Insert]
    @ProductID [nvarchar](30),
    @ProductName [nvarchar](40),
    @Price [float],
    @BrandName [nvarchar](40),
    @Photo [nvarchar](100),
    @CategoryID [nvarchar](30),
    @SubCategoryID [nvarchar](30),
    @Mileage [float],
    @BodyType [nvarchar](20),
    @GroundClearance [int],
    @FuelTankCapacity [int],
    @Gears [bit],
    @TubelessTyres [bit],
    @Weight [float]
AS
BEGIN
    INSERT [dbo].[Products]([ProductID], [ProductName], [Price], [BrandName], [Photo], [CategoryID], [SubCategoryID])
    VALUES (@ProductID, @ProductName, @Price, @BrandName, @Photo, @CategoryID, @SubCategoryID)
    
    INSERT [dbo].[Mopeds]([ProductID], [Mileage], [BodyType], [GroundClearance], [FuelTankCapacity], [Gears], [TubelessTyres], [Weight])
    VALUES (@ProductID, @Mileage, @BodyType, @GroundClearance, @FuelTankCapacity, @Gears, @TubelessTyres, @Weight)
END

GO
/****** Object:  StoredProcedure [dbo].[Moped_Update]    Script Date: 16-May-14 10:46:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Moped_Update]
    @ProductID [nvarchar](30),
    @ProductName [nvarchar](40),
    @Price [float],
    @BrandName [nvarchar](40),
    @Photo [nvarchar](100),
    @CategoryID [nvarchar](30),
    @SubCategoryID [nvarchar](30),
    @Mileage [float],
    @BodyType [nvarchar](20),
    @GroundClearance [int],
    @FuelTankCapacity [int],
    @Gears [bit],
    @TubelessTyres [bit],
    @Weight [float]
AS
BEGIN
    UPDATE [dbo].[Mopeds]
    SET [Mileage] = @Mileage, [BodyType] = @BodyType, [GroundClearance] = @GroundClearance, [FuelTankCapacity] = @FuelTankCapacity, [Gears] = @Gears, [TubelessTyres] = @TubelessTyres, [Weight] = @Weight
    WHERE ([ProductID] = @ProductID)
    
    UPDATE [dbo].[Products]
    SET [ProductName] = @ProductName, [Price] = @Price, [BrandName] = @BrandName, [Photo] = @Photo, [CategoryID] = @CategoryID, [SubCategoryID] = @SubCategoryID
    WHERE ([ProductID] = @ProductID)
    AND @@ROWCOUNT > 0
END

GO
/****** Object:  StoredProcedure [dbo].[MoterBike_Delete]    Script Date: 16-May-14 10:46:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MoterBike_Delete]
    @ProductID [nvarchar](30)
AS
BEGIN
    DELETE [dbo].[MotorBikes]
    WHERE ([ProductID] = @ProductID)
    
    DELETE [dbo].[Products]
    WHERE ([ProductID] = @ProductID)
    AND @@ROWCOUNT > 0
END

GO
/****** Object:  StoredProcedure [dbo].[MoterBike_Insert]    Script Date: 16-May-14 10:46:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MoterBike_Insert]
    @ProductID [nvarchar](30),
    @ProductName [nvarchar](40),
    @Price [float],
    @BrandName [nvarchar](40),
    @Photo [nvarchar](100),
    @CategoryID [nvarchar](30),
    @SubCategoryID [nvarchar](30),
    @Mileage [float],
    @EngineCapacity [float],
    @NoOfGears [int],
    @TubelessTyres [bit],
    @Weight [float],
    @GroundClearance [int]
AS
BEGIN
    INSERT [dbo].[Products]([ProductID], [ProductName], [Price], [BrandName], [Photo], [CategoryID], [SubCategoryID])
    VALUES (@ProductID, @ProductName, @Price, @BrandName, @Photo, @CategoryID, @SubCategoryID)
    
    INSERT [dbo].[MotorBikes]([ProductID], [Mileage], [EngineCapacity], [NoOfGears], [TubelessTyres], [Weight], [GroundClearance])
    VALUES (@ProductID, @Mileage, @EngineCapacity, @NoOfGears, @TubelessTyres, @Weight, @GroundClearance)
END

GO
/****** Object:  StoredProcedure [dbo].[MoterBike_Update]    Script Date: 16-May-14 10:46:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MoterBike_Update]
    @ProductID [nvarchar](30),
    @ProductName [nvarchar](40),
    @Price [float],
    @BrandName [nvarchar](40),
    @Photo [nvarchar](100),
    @CategoryID [nvarchar](30),
    @SubCategoryID [nvarchar](30),
    @Mileage [float],
    @EngineCapacity [float],
    @NoOfGears [int],
    @TubelessTyres [bit],
    @Weight [float],
    @GroundClearance [int]
AS
BEGIN
    UPDATE [dbo].[MotorBikes]
    SET [Mileage] = @Mileage, [EngineCapacity] = @EngineCapacity, [NoOfGears] = @NoOfGears, [TubelessTyres] = @TubelessTyres, [Weight] = @Weight, [GroundClearance] = @GroundClearance
    WHERE ([ProductID] = @ProductID)
    
    UPDATE [dbo].[Products]
    SET [ProductName] = @ProductName, [Price] = @Price, [BrandName] = @BrandName, [Photo] = @Photo, [CategoryID] = @CategoryID, [SubCategoryID] = @SubCategoryID
    WHERE ([ProductID] = @ProductID)
    AND @@ROWCOUNT > 0
END

GO
/****** Object:  StoredProcedure [dbo].[MusicSystem_Delete]    Script Date: 16-May-14 10:46:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MusicSystem_Delete]
    @ProductID [nvarchar](30)
AS
BEGIN
    DELETE [dbo].[MusicSystems]
    WHERE ([ProductID] = @ProductID)
    
    DELETE [dbo].[Products]
    WHERE ([ProductID] = @ProductID)
    AND @@ROWCOUNT > 0
END

GO
/****** Object:  StoredProcedure [dbo].[MusicSystem_Insert]    Script Date: 16-May-14 10:46:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MusicSystem_Insert]
    @ProductID [nvarchar](30),
    @ProductName [nvarchar](40),
    @Price [float],
    @BrandName [nvarchar](40),
    @Photo [nvarchar](100),
    @CategoryID [nvarchar](30),
    @SubCategoryID [nvarchar](30),
    @DimensionMainUnit [nvarchar](30),
    @DimensionFrontSpeaker [nvarchar](30),
    @Bluetooth [bit],
    @Radio [bit],
    @USB [bit],
    @Recording [bit],
    @SurroundSound [bit],
    @NetWeightMainUnit [float],
    @NetWeightWoofer [float],
    @PowerConsumption [float]
AS
BEGIN
    INSERT [dbo].[Products]([ProductID], [ProductName], [Price], [BrandName], [Photo], [CategoryID], [SubCategoryID])
    VALUES (@ProductID, @ProductName, @Price, @BrandName, @Photo, @CategoryID, @SubCategoryID)
    
    INSERT [dbo].[MusicSystems]([ProductID], [DimensionMainUnit], [DimensionFrontSpeaker], [Bluetooth], [Radio], [USB], [Recording], [SurroundSound], [NetWeightMainUnit], [NetWeightWoofer], [PowerConsumption])
    VALUES (@ProductID, @DimensionMainUnit, @DimensionFrontSpeaker, @Bluetooth, @Radio, @USB, @Recording, @SurroundSound, @NetWeightMainUnit, @NetWeightWoofer, @PowerConsumption)
END

GO
/****** Object:  StoredProcedure [dbo].[MusicSystem_Update]    Script Date: 16-May-14 10:46:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MusicSystem_Update]
    @ProductID [nvarchar](30),
    @ProductName [nvarchar](40),
    @Price [float],
    @BrandName [nvarchar](40),
    @Photo [nvarchar](100),
    @CategoryID [nvarchar](30),
    @SubCategoryID [nvarchar](30),
    @DimensionMainUnit [nvarchar](30),
    @DimensionFrontSpeaker [nvarchar](30),
    @Bluetooth [bit],
    @Radio [bit],
    @USB [bit],
    @Recording [bit],
    @SurroundSound [bit],
    @NetWeightMainUnit [float],
    @NetWeightWoofer [float],
    @PowerConsumption [float]
AS
BEGIN
    UPDATE [dbo].[MusicSystems]
    SET [DimensionMainUnit] = @DimensionMainUnit, [DimensionFrontSpeaker] = @DimensionFrontSpeaker, [Bluetooth] = @Bluetooth, [Radio] = @Radio, [USB] = @USB, [Recording] = @Recording, [SurroundSound] = @SurroundSound, [NetWeightMainUnit] = @NetWeightMainUnit, [NetWeightWoofer] = @NetWeightWoofer, [PowerConsumption] = @PowerConsumption
    WHERE ([ProductID] = @ProductID)
    
    UPDATE [dbo].[Products]
    SET [ProductName] = @ProductName, [Price] = @Price, [BrandName] = @BrandName, [Photo] = @Photo, [CategoryID] = @CategoryID, [SubCategoryID] = @SubCategoryID
    WHERE ([ProductID] = @ProductID)
    AND @@ROWCOUNT > 0
END

GO
/****** Object:  StoredProcedure [dbo].[Product_Delete]    Script Date: 16-May-14 10:46:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Product_Delete]
    @ProductID [nvarchar](30)
AS
BEGIN
    DELETE [dbo].[Products]
    WHERE ([ProductID] = @ProductID)
END

GO
/****** Object:  StoredProcedure [dbo].[Product_Insert]    Script Date: 16-May-14 10:46:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Product_Insert]
    @ProductID [nvarchar](30),
    @ProductName [nvarchar](40),
    @Price [float],
    @BrandName [nvarchar](40),
    @Photo [nvarchar](100),
    @CategoryID [nvarchar](30),
    @SubCategoryID [nvarchar](30)
AS
BEGIN
    INSERT [dbo].[Products]([ProductID], [ProductName], [Price], [BrandName], [Photo], [CategoryID], [SubCategoryID])
    VALUES (@ProductID, @ProductName, @Price, @BrandName, @Photo, @CategoryID, @SubCategoryID)
END

GO
/****** Object:  StoredProcedure [dbo].[Product_Update]    Script Date: 16-May-14 10:46:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Product_Update]
    @ProductID [nvarchar](30),
    @ProductName [nvarchar](40),
    @Price [float],
    @BrandName [nvarchar](40),
    @Photo [nvarchar](100),
    @CategoryID [nvarchar](30),
    @SubCategoryID [nvarchar](30)
AS
BEGIN
    UPDATE [dbo].[Products]
    SET [ProductName] = @ProductName, [Price] = @Price, [BrandName] = @BrandName, [Photo] = @Photo, [CategoryID] = @CategoryID, [SubCategoryID] = @SubCategoryID
    WHERE ([ProductID] = @ProductID)
END

GO
/****** Object:  StoredProcedure [dbo].[Report_Delete]    Script Date: 16-May-14 10:46:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Report_Delete]
    @ReportID [nvarchar](30)
AS
BEGIN
    DELETE [dbo].[Reports]
    WHERE ([ReportID] = @ReportID)
END

GO
/****** Object:  StoredProcedure [dbo].[Report_Insert]    Script Date: 16-May-14 10:46:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Report_Insert]
    @ReportID [nvarchar](30),
    @FilePath [nvarchar](200),
    @DateOfCreation [datetime],
    @UserID [nvarchar](30)
AS
BEGIN
    INSERT [dbo].[Reports]([ReportID], [FilePath], [DateOfCreation], [UserID])
    VALUES (@ReportID, @FilePath, @DateOfCreation, @UserID)
END

GO
/****** Object:  StoredProcedure [dbo].[Report_Update]    Script Date: 16-May-14 10:46:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Report_Update]
    @ReportID [nvarchar](30),
    @FilePath [nvarchar](200),
    @DateOfCreation [datetime],
    @UserID [nvarchar](30)
AS
BEGIN
    UPDATE [dbo].[Reports]
    SET [FilePath] = @FilePath, [DateOfCreation] = @DateOfCreation, [UserID] = @UserID
    WHERE ([ReportID] = @ReportID)
END

GO
/****** Object:  StoredProcedure [dbo].[SubCategory_Delete]    Script Date: 16-May-14 10:46:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SubCategory_Delete]
    @SubCategoryID [nvarchar](30)
AS
BEGIN
    DELETE [dbo].[SubCategories]
    WHERE ([SubCategoryID] = @SubCategoryID)
END

GO
/****** Object:  StoredProcedure [dbo].[SubCategory_Insert]    Script Date: 16-May-14 10:46:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SubCategory_Insert]
    @SubCategoryID [nvarchar](30),
    @SubCategoryName [nvarchar](40),
    @Description [nvarchar](200),
    @CategoryID [nvarchar](30)
AS
BEGIN
    INSERT [dbo].[SubCategories]([SubCategoryID], [SubCategoryName], [Description], [CategoryID])
    VALUES (@SubCategoryID, @SubCategoryName, @Description, @CategoryID)
END

GO
/****** Object:  StoredProcedure [dbo].[SubCategory_Update]    Script Date: 16-May-14 10:46:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SubCategory_Update]
    @SubCategoryID [nvarchar](30),
    @SubCategoryName [nvarchar](40),
    @Description [nvarchar](200),
    @CategoryID [nvarchar](30)
AS
BEGIN
    UPDATE [dbo].[SubCategories]
    SET [SubCategoryName] = @SubCategoryName, [Description] = @Description, [CategoryID] = @CategoryID
    WHERE ([SubCategoryID] = @SubCategoryID)
END

GO
/****** Object:  StoredProcedure [dbo].[Suggestion_Delete]    Script Date: 16-May-14 10:46:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Suggestion_Delete]
    @SuggestionID [nvarchar](30)
AS
BEGIN
    DELETE [dbo].[Suggestions]
    WHERE ([SuggestionID] = @SuggestionID)
END

GO
/****** Object:  StoredProcedure [dbo].[Suggestion_Insert]    Script Date: 16-May-14 10:46:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Suggestion_Insert]
    @SuggestionID [nvarchar](30),
    @Hits [int],
    @RatingFeatureCritic [int],
    @RatingPerformanceCritic [int],
    @RatingDesignCritic [int],
    @RatingDesignUser [int],
    @RatingPerformanceUser [int],
    @RatingFeatureUser [int],
    @ProductID [nvarchar](30)
AS
BEGIN
    INSERT [dbo].[Suggestions]([SuggestionID], [Hits], [RatingFeatureCritic], [RatingPerformanceCritic], [RatingDesignCritic], [RatingDesignUser], [RatingPerformanceUser], [RatingFeatureUser], [ProductID])
    VALUES (@SuggestionID, @Hits, @RatingFeatureCritic, @RatingPerformanceCritic, @RatingDesignCritic, @RatingDesignUser, @RatingPerformanceUser, @RatingFeatureUser, @ProductID)
END

GO
/****** Object:  StoredProcedure [dbo].[Suggestion_Update]    Script Date: 16-May-14 10:46:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Suggestion_Update]
    @SuggestionID [nvarchar](30),
    @Hits [int],
    @RatingFeatureCritic [int],
    @RatingPerformanceCritic [int],
    @RatingDesignCritic [int],
    @RatingDesignUser [int],
    @RatingPerformanceUser [int],
    @RatingFeatureUser [int],
    @ProductID [nvarchar](30)
AS
BEGIN
    UPDATE [dbo].[Suggestions]
    SET [Hits] = @Hits, [RatingFeatureCritic] = @RatingFeatureCritic, [RatingPerformanceCritic] = @RatingPerformanceCritic, [RatingDesignCritic] = @RatingDesignCritic, [RatingDesignUser] = @RatingDesignUser, [RatingPerformanceUser] = @RatingPerformanceUser, [RatingFeatureUser] = @RatingFeatureUser, [ProductID] = @ProductID
    WHERE ([SuggestionID] = @SuggestionID)
END

GO
/****** Object:  StoredProcedure [dbo].[Tablet_Delete]    Script Date: 16-May-14 10:46:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Tablet_Delete]
    @ProductID [nvarchar](30)
AS
BEGIN
    DELETE [dbo].[Tablets]
    WHERE ([ProductID] = @ProductID)
    
    DELETE [dbo].[Products]
    WHERE ([ProductID] = @ProductID)
    AND @@ROWCOUNT > 0
END

GO
/****** Object:  StoredProcedure [dbo].[Tablet_Insert]    Script Date: 16-May-14 10:46:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Tablet_Insert]
    @ProductID [nvarchar](30),
    @ProductName [nvarchar](40),
    @Price [float],
    @BrandName [nvarchar](40),
    @Photo [nvarchar](100),
    @CategoryID [nvarchar](30),
    @SubCategoryID [nvarchar](30),
    @OperatingSystem [nvarchar](40),
    @ScreenSize [float],
    @Processor [nvarchar](40),
    @Display [nvarchar](40),
    @StandByTime [nvarchar](40),
    @TouchScreen [bit],
    @WiFi [bit]
AS
BEGIN
    INSERT [dbo].[Products]([ProductID], [ProductName], [Price], [BrandName], [Photo], [CategoryID], [SubCategoryID])
    VALUES (@ProductID, @ProductName, @Price, @BrandName, @Photo, @CategoryID, @SubCategoryID)
    
    INSERT [dbo].[Tablets]([ProductID], [OperatingSystem], [ScreenSize], [Processor], [Display], [StandByTime], [TouchScreen], [WiFi])
    VALUES (@ProductID, @OperatingSystem, @ScreenSize, @Processor, @Display, @StandByTime, @TouchScreen, @WiFi)
END

GO
/****** Object:  StoredProcedure [dbo].[Tablet_Update]    Script Date: 16-May-14 10:46:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Tablet_Update]
    @ProductID [nvarchar](30),
    @ProductName [nvarchar](40),
    @Price [float],
    @BrandName [nvarchar](40),
    @Photo [nvarchar](100),
    @CategoryID [nvarchar](30),
    @SubCategoryID [nvarchar](30),
    @OperatingSystem [nvarchar](40),
    @ScreenSize [float],
    @Processor [nvarchar](40),
    @Display [nvarchar](40),
    @StandByTime [nvarchar](40),
    @TouchScreen [bit],
    @WiFi [bit]
AS
BEGIN
    UPDATE [dbo].[Products]
    SET [ProductName] = @ProductName, [Price] = @Price, [BrandName] = @BrandName, [Photo] = @Photo, [CategoryID] = @CategoryID, [SubCategoryID] = @SubCategoryID
    WHERE ([ProductID] = @ProductID)
    
    UPDATE [dbo].[Tablets]
    SET [OperatingSystem] = @OperatingSystem, [ScreenSize] = @ScreenSize, [Processor] = @Processor, [Display] = @Display, [StandByTime] = @StandByTime, [TouchScreen] = @TouchScreen, [WiFi] = @WiFi
    WHERE ([ProductID] = @ProductID)
    AND @@ROWCOUNT > 0
END

GO
/****** Object:  StoredProcedure [dbo].[Television_Delete]    Script Date: 16-May-14 10:46:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Television_Delete]
    @ProductID [nvarchar](30)
AS
BEGIN
    DELETE [dbo].[Televisions]
    WHERE ([ProductID] = @ProductID)
    
    DELETE [dbo].[Products]
    WHERE ([ProductID] = @ProductID)
    AND @@ROWCOUNT > 0
END

GO
/****** Object:  StoredProcedure [dbo].[Television_Insert]    Script Date: 16-May-14 10:46:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Television_Insert]
    @ProductID [nvarchar](30),
    @ProductName [nvarchar](40),
    @Price [float],
    @BrandName [nvarchar](40),
    @Photo [nvarchar](100),
    @CategoryID [nvarchar](30),
    @SubCategoryID [nvarchar](30),
    @DisplayType [nvarchar](15),
    @ScreenSize [float],
    @HD [bit],
    @Resolution [nvarchar](10),
    @NetWeight [float],
    @USB [bit],
    @PowerConsumption [float]
AS
BEGIN
    INSERT [dbo].[Products]([ProductID], [ProductName], [Price], [BrandName], [Photo], [CategoryID], [SubCategoryID])
    VALUES (@ProductID, @ProductName, @Price, @BrandName, @Photo, @CategoryID, @SubCategoryID)
    
    INSERT [dbo].[Televisions]([ProductID], [DisplayType], [ScreenSize], [HD], [Resolution], [NetWeight], [USB], [PowerConsumption])
    VALUES (@ProductID, @DisplayType, @ScreenSize, @HD, @Resolution, @NetWeight, @USB, @PowerConsumption)
END

GO
/****** Object:  StoredProcedure [dbo].[Television_Update]    Script Date: 16-May-14 10:46:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Television_Update]
    @ProductID [nvarchar](30),
    @ProductName [nvarchar](40),
    @Price [float],
    @BrandName [nvarchar](40),
    @Photo [nvarchar](100),
    @CategoryID [nvarchar](30),
    @SubCategoryID [nvarchar](30),
    @DisplayType [nvarchar](15),
    @ScreenSize [float],
    @HD [bit],
    @Resolution [nvarchar](10),
    @NetWeight [float],
    @USB [bit],
    @PowerConsumption [float]
AS
BEGIN
    UPDATE [dbo].[Products]
    SET [ProductName] = @ProductName, [Price] = @Price, [BrandName] = @BrandName, [Photo] = @Photo, [CategoryID] = @CategoryID, [SubCategoryID] = @SubCategoryID
    WHERE ([ProductID] = @ProductID)
    
    UPDATE [dbo].[Televisions]
    SET [DisplayType] = @DisplayType, [ScreenSize] = @ScreenSize, [HD] = @HD, [Resolution] = @Resolution, [NetWeight] = @NetWeight, [USB] = @USB, [PowerConsumption] = @PowerConsumption
    WHERE ([ProductID] = @ProductID)
    AND @@ROWCOUNT > 0
END

GO
/****** Object:  StoredProcedure [dbo].[UserProfile_Delete]    Script Date: 16-May-14 10:46:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UserProfile_Delete]
    @UserID [nvarchar](30)
AS
BEGIN
    DELETE [dbo].[UserProfiles]
    WHERE ([UserID] = @UserID)
END

GO
/****** Object:  StoredProcedure [dbo].[UserProfile_Insert]    Script Date: 16-May-14 10:46:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UserProfile_Insert]
    @UserID [nvarchar](30),
    @UserName [nvarchar](30),
    @Preference1 [nvarchar](30),
    @Preference2 [nvarchar](30),
    @Preference3 [nvarchar](30),
    @City [nvarchar](60),
    @State [nvarchar](60),
    @Gender [nvarchar](60)
AS
BEGIN
    INSERT [dbo].[UserProfiles]([Preference1], [Preference2], [Preference3], [UserID], [UserName], [City], [State], [Gender])
    VALUES (@Preference1, @Preference2, @Preference3, @UserID, @UserName, @City, @State, @Gender)
END

GO
/****** Object:  StoredProcedure [dbo].[UserProfile_Update]    Script Date: 16-May-14 10:46:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UserProfile_Update]
    @UserID [nvarchar](30),
    @UserName [nvarchar](30),
    @Preference1 [nvarchar](30),
    @Preference2 [nvarchar](30),
    @Preference3 [nvarchar](30),
    @City [nvarchar](60),
    @State [nvarchar](60),
    @Gender [nvarchar](60)
AS
BEGIN
    UPDATE [dbo].[UserProfiles]
    SET [Preference1] = @Preference1, [Preference2] = @Preference2, [Preference3] = @Preference3, [UserName] = @UserName, [City] = @City, [State] = @State, [Gender] = @Gender
    WHERE ([UserID] = @UserID)
END

GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 16-May-14 10:46:08 AM ******/
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
/****** Object:  Table [dbo].[AirConditioners]    Script Date: 16-May-14 10:46:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AirConditioners](
	[ProductID] [nvarchar](30) NOT NULL,
	[Name] [nvarchar](30) NULL,
	[Type] [nvarchar](20) NULL,
	[DisplayPanel] [bit] NOT NULL,
	[DisplayPanelType] [nvarchar](20) NULL,
	[Capacity] [nvarchar](20) NULL,
	[Dimensions] [nvarchar](10) NULL,
	[NetWeight] [float] NOT NULL,
	[PowerConsumption] [float] NOT NULL,
	[PowerSupply] [nvarchar](10) NULL,
 CONSTRAINT [PK_dbo.AirConditioners] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Books]    Script Date: 16-May-14 10:46:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Books](
	[ProductID] [nvarchar](30) NOT NULL,
	[Genre] [nvarchar](30) NULL,
	[Author] [nvarchar](30) NULL,
	[BindingType] [nvarchar](30) NULL,
	[Publication] [nvarchar](30) NULL,
	[PublicationYear] [nvarchar](4) NULL,
	[Edition] [nvarchar](10) NULL,
 CONSTRAINT [PK_dbo.Books] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Cameras]    Script Date: 16-May-14 10:46:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cameras](
	[ProductID] [nvarchar](30) NOT NULL,
	[CameraType] [nvarchar](40) NULL,
	[Resolution] [nvarchar](40) NULL,
	[ScreenSize] [nvarchar](40) NULL,
	[Zoom] [nvarchar](40) NULL,
 CONSTRAINT [PK_dbo.Cameras] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Cars]    Script Date: 16-May-14 10:46:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cars](
	[ProductID] [nvarchar](30) NOT NULL,
	[CarType] [nvarchar](20) NULL,
	[Mileage] [float] NOT NULL,
	[Model] [nvarchar](20) NULL,
 CONSTRAINT [PK_dbo.Cars] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Categories]    Script Date: 16-May-14 10:46:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryID] [nvarchar](30) NOT NULL,
	[CategoryName] [nvarchar](40) NULL,
	[Description] [nvarchar](100) NULL,
 CONSTRAINT [PK_dbo.Categories] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CellPhones]    Script Date: 16-May-14 10:46:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CellPhones](
	[ProductID] [nvarchar](30) NOT NULL,
	[Display] [nvarchar](40) NULL,
	[OperatingSystem] [nvarchar](40) NULL,
	[Processor] [nvarchar](40) NULL,
	[TouchScreen] [bit] NOT NULL,
	[ScreenSize] [float] NOT NULL,
	[StandByTime] [float] NOT NULL,
 CONSTRAINT [PK_dbo.CellPhones] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Mopeds]    Script Date: 16-May-14 10:46:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mopeds](
	[ProductID] [nvarchar](30) NOT NULL,
	[Mileage] [float] NOT NULL,
	[BodyType] [nvarchar](20) NULL,
	[GroundClearance] [int] NOT NULL,
	[FuelTankCapacity] [int] NOT NULL,
	[Gears] [bit] NOT NULL,
	[TubelessTyres] [bit] NOT NULL,
	[Weight] [float] NOT NULL,
 CONSTRAINT [PK_dbo.Mopeds] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MotorBikes]    Script Date: 16-May-14 10:46:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MotorBikes](
	[ProductID] [nvarchar](30) NOT NULL,
	[Mileage] [float] NOT NULL,
	[EngineCapacity] [float] NOT NULL,
	[NoOfGears] [int] NOT NULL,
	[TubelessTyres] [bit] NOT NULL,
	[Weight] [float] NOT NULL,
	[GroundClearance] [int] NOT NULL,
 CONSTRAINT [PK_dbo.MotorBikes] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MusicSystems]    Script Date: 16-May-14 10:46:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MusicSystems](
	[ProductID] [nvarchar](30) NOT NULL,
	[DimensionMainUnit] [nvarchar](30) NULL,
	[DimensionFrontSpeaker] [nvarchar](30) NULL,
	[Bluetooth] [bit] NOT NULL,
	[Radio] [bit] NOT NULL,
	[USB] [bit] NOT NULL,
	[Recording] [bit] NOT NULL,
	[SurroundSound] [bit] NOT NULL,
	[NetWeightMainUnit] [float] NOT NULL,
	[NetWeightWoofer] [float] NOT NULL,
	[PowerConsumption] [float] NOT NULL,
 CONSTRAINT [PK_dbo.MusicSystems] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Products]    Script Date: 16-May-14 10:46:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [nvarchar](30) NOT NULL,
	[ProductName] [nvarchar](40) NULL,
	[Price] [float] NOT NULL,
	[BrandName] [nvarchar](40) NULL,
	[Photo] [nvarchar](100) NULL,
	[CategoryID] [nvarchar](30) NULL,
	[SubCategoryID] [nvarchar](30) NULL,
 CONSTRAINT [PK_dbo.Products] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SubCategories]    Script Date: 16-May-14 10:46:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubCategories](
	[SubCategoryID] [nvarchar](30) NOT NULL,
	[SubCategoryName] [nvarchar](40) NULL,
	[Description] [nvarchar](200) NULL,
	[CategoryID] [nvarchar](30) NULL,
 CONSTRAINT [PK_dbo.SubCategories] PRIMARY KEY CLUSTERED 
(
	[SubCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Suggestions]    Script Date: 16-May-14 10:46:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Suggestions](
	[SuggestionID] [nvarchar](30) NOT NULL,
	[Hits] [int] NOT NULL,
	[RatingFeatureCritic] [int] NOT NULL,
	[RatingPerformanceCritic] [int] NOT NULL,
	[RatingDesignCritic] [int] NOT NULL,
	[RatingDesignUser] [int] NOT NULL,
	[RatingPerformanceUser] [int] NOT NULL,
	[RatingFeatureUser] [int] NOT NULL,
	[ProductID] [nvarchar](30) NULL,
 CONSTRAINT [PK_dbo.Suggestions] PRIMARY KEY CLUSTERED 
(
	[SuggestionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tablets]    Script Date: 16-May-14 10:46:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tablets](
	[ProductID] [nvarchar](30) NOT NULL,
	[OperatingSystem] [nvarchar](40) NULL,
	[ScreenSize] [float] NOT NULL,
	[Processor] [nvarchar](40) NULL,
	[Display] [nvarchar](40) NULL,
	[StandByTime] [nvarchar](40) NULL,
	[TouchScreen] [bit] NOT NULL,
	[WiFi] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.Tablets] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Televisions]    Script Date: 16-May-14 10:46:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Televisions](
	[ProductID] [nvarchar](30) NOT NULL,
	[DisplayType] [nvarchar](15) NULL,
	[ScreenSize] [float] NOT NULL,
	[HD] [bit] NOT NULL,
	[Resolution] [nvarchar](10) NULL,
	[NetWeight] [float] NOT NULL,
	[USB] [bit] NOT NULL,
	[PowerConsumption] [float] NOT NULL,
 CONSTRAINT [PK_dbo.Televisions] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserProfiles]    Script Date: 16-May-14 10:46:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserProfiles](
	[Preference1] [nvarchar](30) NULL,
	[Preference2] [nvarchar](30) NULL,
	[Preference3] [nvarchar](30) NULL,
	[UserID] [nvarchar](30) NOT NULL,
	[UserName] [nvarchar](30) NULL,
	[City] [nvarchar](60) NULL,
	[State] [nvarchar](60) NULL,
	[Gender] [nvarchar](60) NULL,
 CONSTRAINT [PK_dbo.UserProfiles] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'201404111826329_InitialCreate', N'ProductComparison.DAL.ProductComparisonDataContext', 0x1F8B0800000000000400ED5DDB6EDCB819BE2FD07718CC555B6C3DB1BDBBD806760B7B1C274637B1E1F176DBDE18F20C672C44234D254D366ED127EB451FA9AF504A94C433C5930E768200818787EF277F7EA4C89FE4CFFFFDE7BF277FFABC8D269F409A85497C3A3D3C78359D807899ACC278733ADDE7EBDFFF30FDD31F7FFDAB9337ABEDE7C95FEA74C7453A9833CE4EA78F79BE7B3D9B65CB47B00DB2836DB84C932C59E707CB643B0B56C9ECE8D5AB3FCC0E0F6700424C21D6647272BB8FF3700BCA1FF0E73C89976097EF83E87DB202515685C39845893AF9106C41B60B96E0747A9326ABFD329F27DB5D908659121F5C9CFD389D9C4561000BB300D17A3A09E238C9831C16F5F54F1958E469126F163B181044774F3B00D3AD83280355155EE3E4BAB5797554D4668633D650CB7D96275B43C0C3E34A3D3336BB9592A78DFAA002DF4045E74F45AD4B259E4ECFC214AA7B1516F0209D4E5891AFE7515A241768BAC40A417650B6D2018DF4CDA425FD370D7D20CB8A7FDF4CE6FB28DFA7E03406FB3C0D608A9BFD43142EFF0C9EEE928F203E8DF751349D9C071940252A5AF7A01243D612D61386EE409A3F55B52CFE9F4EAA5C790AD93C9DBC0F3EFF08E24DFE08F90BE97B197E06AB3AA0E2C34F7108B90FF3E4E91EFE9C296514E80A19473E645C84D92E0A9E6E821844B5ACF324894000B9F101AA2778884003AD8FD547D9E701ECB1907CDDEB680BE282589942D2A10F491F40FE3308378F792DE822818405C62D7193FC028ABE93EDB73BD4CDDDE116FBDD2E52E9DA420327333C7C2807957990834D923EB90C273546670309AD43184705106ABD056BA65E57175C1BCC58009EFE38AFEB406448885A74CB28F8AD97DE07B2651A52341692CF4AD687E053B82979C4485DEC1F30E76E4154A6C91EC35DF59120E2EF71C2CB34D9DE26119DBF89BFBF0BD20D28FA76A248B448F6E9D2B69F50C5B6EF2A04CC987A0B512C9B0EC364EFB9CF10D2C7D36D8EECBA4D8723916E07F5DF3BEB8EA7EC9D7517B6EA9D7062F5D1A55B16F9C7350D7E0BE2B4F379F0D93E7F4CD2AEA59C8771B1286D99B87A1185D41FB4F44DDFA2FE06029512BFF520ED0D5AAC0D3649DC8234709B221608E3EA62A84C2DB4F4F2C9B8055912ED5B1AD08BA4C53205205E84FFECBC4E7F4F92AD5F19067474B27EC0EC632362DAC7AAFE7D188160031C97ACA57AFC1655BFE14114DD3C2631706AFE1A645C24A86C3C5D77DB6BF8032A2CDE2C9EB21C78EEC182AF649A2C41962927195E04DD25FBE5231AFD5CAD6DFC186AD955167910AFCE9FEEC2AD1992767F780FC5AD5CFA420930AE7EE067943A4F564F7D8CA96FD3641FAFE6B0C869102F1B7157717E7C645CE8CB3D88EE82F8236B7EB5437B0BCB94B9F685BBFD03886007BE7B4A8133988505D6A02BE4203D0F3F3A7D1A1A9097D825DEC49B30062CB72CC13E24D76B8A60761C1D9A5E5E3BB43E57F759B8ACBFBF0E6CC530E3E26BB3ADF33E0863389CE65DAFC51B81976912E78B1D083E82EECD1AD11EE449923FBAF2F6365885892BC84F8B73E772806592AE4A5D394EA0F669D98B16C57FAE60CDCE1D4B26DB91ABC6FB3949D6982543EC076A0F1875AF73182CAAF8316D3A5425B1D97020B2F6BCD95049EE63A3E1260D97AE1FFD73F8155BF552D8C7244F14422CB711FBDB0FE9764BCBCBE64BC53DE1C60B1BC76DBA7009441B2E2E1BB7B5002A1D5F4072F3475646328DD3BED05DD1559CC64D8430AEF955CF361C6FF690DE8C413DD9D204F69D6760DEFA39BC0CCD30F4BB1B5CCC7D0AB3721EE4D0E51A947175BB8A552D66A5C3EFC6D4E5DE5DB8AF0A34F6AE467546CFC352A89F69FD2DD825A9D3D709218C69528F4A6433A7C7397B9ED25F8611B809F03ABEB3D33C17704E73BD9EA7803AA05084A24F8829CF3390F639372DE4C1A07558F400C1049088BFAFA98DE77F7C2C776A4F90C4E9CC1E5560FB4E46C08CA9A7D5CD6FDACF7CD1C682AD7D9CEDBF49C11AA4205E82C3FE441DF527EAB86B5173F5C1FFEF3DCD9C731513BC08790BE295D20C6C27453A3E5E866996E3866A1D23B9F4E2C19249C62D9A55694DD7F8F5B0ED6374579593F900689B20C0328957062AE633888BCCA653169E4B6C5A8DBBC73035A905975E5C092699B20E6C5A272BCB62BFD9802C775CF66194317D6571A9EC0EC693B97BFEE2BE0B73C7EDD9DBD2CA7409E7AB50B5F314B6C0D207E00D48D749BA2DF657FD815E802CDCC4BEF18A3EE3B9CABE20AB667187F3B899A23B02361B5AC22B06759FB96F9291170CD858C1F5022E89C9F0769665C9322C4BC55BBEB1ED9DAEE99B7835D1B901814D4E9499FC3D1CBDC21D1CAF60794EA7BFE314D902DF2CA430BC0CFBD5C1C121077F8BBE03C52DEBC2E80107D030CEF9B1318C97E12E88344AC2E4158EACF20B4745DB34D2D8980BB02BE67571AEA16FF76234D29881BF4D63273382466A7671BB3AB2A6976FF1F0864C03464937867A6593AC143D3249A6DF67C5227258696B71E1569C172E8936F0F4C63EFF8C129445A745955722AD782550B79782F4C02ED5B255C605AD352CE60465ACD3679CCEEAB79DD3FE58A7511E9D46979E8D31629E4613E8158630A90DCEBFCAF8A04308D612A1C536211794F8029ED5169236223B738CAEA24E6B8AEDC6D6BCA275E056809E99C4598774DA5C6E2AF23A96498D4C430D66B2020D339AC95AC16C383B1A010959E39E0E39A4963EAF1494D9088762A0A43CC31050D20466FC3B1E887F02138BDCDE20B7B790137A6C0136B165480D357D724C5E8CFEA82557B37319BCF30999CD609E1CE600295D066CB2BF08F2A048043E8B8EB8C0BE54ED0C6495F1906549216401727A811D16D784B0DD8E334F705CA351F05A4A0C442D4C5BB0AA0A8B601ACAB640A0B99308A19E3FB6001023920885FA08B4AAA666A05831B8833340044B448A26FDC4104955FE64580A6B1A579B1A71EDCC750A4D7B2A812887A3FA094CABA11DCEE427D08CDA2CA8671824CA8FD9AA5086D414D8B522A87E27D785D4B8A56DDEB2D588C8A0A5CB370BBD288F09F0FAD136CF181B68883AD2638D42673A26198D7670545B3D82AAB5253226E89A135C75C3580F08B8E6BBE05523FC6108B56ED4CB63F305B2ABBEA44BE2EEC9C49DC0506B4EB9A6335ED5B9EA4DB68EEB466DA2ED5BD1775FBD02D15D835063303181517EF1A5AB0E378DD41BCACDCCB8893B99216FD855C0C94CE236FBE47DB0DB85F18670A35D854C16C887F6FCF70B73CFD25B84315B660207D34D691B497992061BC0C442D1B0A4E5705E4CEC1F8262F77FBEDA72C994EB00C914B416CD4CACF936AC67A57586E26FC9F2A3702ECE38BA16ACA52AA04B58E36DB11A2B2A0F081AD0005C914A8CC5328882547EA8629E44FB6DDCBA529363A163B3240C0AD147407756480414A28F40BBB32691E8183B44BE7C7CAC3E32F6714122E25093326207D574E970B8413BE20B2E5463E2607D2CFE860A45332ED610B9F649CD81D6113CDEC98CE94C9C2582EBBFEE1DBC74FC69DEAD8B6C0375E6CAB127895305E963D47E3B49903A4C1F85F2CB4942511106C4219D6F527A2223ACF090874D09268AD4C76D7C6992784DE048885DB9DC34A736CA3810B949979AF4D88BC3F5D1C8AB87241A19AE8F46DEA924D1C8707D34E4FE92C44121A3A18FCD6C671E0C35C5695C60D2AC494D29D3B8CA22719A40031CE4E5924241416369E0C615A64533D779076AECE67ABE60C26782C3F94120F1B848830F0FF653C0D4B50E3698799317F7A909381931D428467930A0E0C88891501E79BB34A77B996F20AAFB1A8FB03F4B6AA2D6841ACC3F590777D44C948DD4C7E59D5792C07CACC98CB9F43348CF98CB20836E483B1AA43A221DA58F295ACBC91772037599DA2BA64DB7810145DE67DE7558BF97D4AC9F893358CB630798D45A1E073F27727635580C437AC2BDA605ED71EEC1A6479CFB4CA1ED09475B60D39E3285F87412836F15768C497DAC70B0C11210F9C6A4567F28481FA3F4074322940126CBD0C62F26BD0A6D820D265CB46B4C6ACA4547599815C57C11445B60D7DE3285C875649FE6CB8E8796ABACF8FB7AFD1BF1185385FED6628091EC772974E5716CB921DD570AD04C37162A1F953452683673247C5452E3050E36280F72434995070599D822F06D1BDA1C21BF85234763AEEFD03D5E79B367A0CF67E533D19CD828E3401FCDAE6C017ED7DB3E2D0BBEAC28B63680BE2C1EC85F21358F2D43C6D25DB0CF438B2ED3641ED61427DD7F35B52EF8ED2EEF982ABE33AA9BDFED039F9BB7AE33D2E1674F753C3EBCA175B4833824E9638F437C14546BA34396B59F4901FD5EA908CF74E243BD4A4A756432622463A6AAE59255B8AE36762FF7F1322F17BA22B965F2AB38834AA8134EEA3F2A5DB22796D029AC46FC3DCA2D22810E0D6E821486E5C8AD1D1D55BB279ACEE1A20E2A55DC927AEC908841916E82286E3072A8383D312733BA3944497EDAAD60056C1B0CE5FEDA60DE1A8C6E0E51920B3845B16F3094BBCB06BB4EC34D1807B2A36733BAFCA2F14F7BC4E9E8A3485F1E701F5D15B724343E8DCADC5D2C723530F9CF2417D9FD97D2EFCC60A009587DB3C09D65E29B131A049365944FE36BBFD0F4245EEC675A85841D3D535B934DA80187184FCE148D9838836541E518815A19489C250CC620EA0A823B8DC82B8AE65C52E6F6A366150A3F2EE15013A310E15E855ED12BFCAEE8E01DC9F0048E0F74F08E6578828BEC72BC397F34DB70F3B5721FCC18AB72B37310957760E620EE4ABC8F31506723EFB4F898183497786DE605F2CCF24F38E9FE94FE7ECBDDAAAA10914F53CA26148AAE70CA11843E4DE9FD45410253FC1BDEC5292F4390C8540EEDF5941741C7DBA1230FA3326C14EBA01F193C97C4B28D65F854B4F10E9A91F5B5D3D183BB76C62669A45721CDEFE6DA5975E58BBA8B56D6BF58CC95F5CEAAEB67E2F5DEB470D8FC295C15F7BFD016CB4191E060F18F681E85E5F2B34EF03E88C335ECF9C82B73F1B0C60FD3C959140619BA1958DD6E7BCD3A8CD0BAEE76785C5C7703ABED8CCD6E7E69AE40C9B215E5345AFE3223DD5CBD3F7F187F0AD2E563710D82F1D9EBFEBAA110FA5B0ADAF831C3759404B9FB5B86BE8A463E5D28C42C1F2F3403E51F0FC4C89C33942B38EDF87C3AFD5799F7F5E4EAAFF738FB3793EB14F69BD79357937F2B9AD7FA4D43A3625108D625D3762C2FF164AAD5BDE4CBEFF6FEA5D2925B07A38D165E694C992F5CC86CE0F75FE66B56D3B5BEC232A4E35B5FC966B776E2EC4B8334D5D1731C774C9F3FB3608EBF47C67CF1857D43CC57738A9F0C2B6CF6B9FB936146CC4059BB6785D4A4D3EDAB588267A38CD443E4F7F8C516BC306559AAA34E4A75EC58AA638FA59271DBAD63B3CF9669E09A3EB22584FCDE7C7647BEA9E509937E42CB0AD4E61521ABC984EF777A7C31887C86278CCD973D8A4778ECE104A6275748D1033CAE68E4E3365E2AEB0750F0F48E0D986219AF358A56B9BBFF262BBDE00C69EDE8404D5A2DD7C117019DB454CE1E8D278F94671E04FD109AF394F7C5E3B598F8FA9DE7DA631F3DCAE5B02930F74EB59D394BF6C6B4035AED9CC7A1BADA6382C085CE97381254BE7BBC0E05B52B1FAFA094531FAFC8947B9FAE9091931F9515C614BCF1F8D3476F117AE5F912FB0BE909C8AB4D8D3CD5EF1598BCBAE01518390C72803460DFD7491BE14EC8EB34A3F148E0F2F5AE7C0B39144C9F0B12E73F5F22239ADB725EFB3577DBD0F3466A7357D02B2E753BCF7EADC08F96763D82BA7CA80FA4DD0D444E81BEC42EE065F8C27E88BC0EAD9C83117B530BEF7FC81EABF2EF62DF4718A72EF640E6CB5083FE21F6FEF3B58F58F611D6D5900B16E165C89EC603B2D06357D727B4D4AFCF974869811321AF2B77891321BF160DEC50C89EBC9537217B80F2EAB6837CEC45C861D245BB0EB20712F80A721AA758074143D94BB54709A10F932F7180E87611E36B95D0D562A89B85A1604D33AEC51B72ACA29B5FBF53C9BC9C7C891D8B72ACA2323D7F3754A77A77E1F641D3B2C30EB6EDE6F8BDEEE22B247AA0B5ED5944E24123FC721E2A0AF324A6D1EBE6D4437C041C15DEC9A3E68A2BEBFC90A0BA5B6DF4EAAAEAA6BCA9D81E1EEEBD513E0AD911276EEA67BC08A826ECC570A1AED1B3E281FC04BE53971E1D214C3B6A8BD3898E68D12AB5E7A7E5954F81DAB5670B33A807870934A3D7E8AD1862D24ED209A51133D49E0B445215B7F97BE786F0F2855343B650A37E8F9500AB833A218469F3C83C40183042EA12C5445ACF3C503FF2FA7590186C9010B8E8E89D1CCA776CBF7263306E08DCADF4C28DB6577B3BA104712F849EBEE2E0174208A57F1643A13DB081BE15705FB40D86BCBF4C932D7E6039B957DF21B0228E8A35AC38128E8BD3E0E333A150EB7BC523E4517192BC8D3DA2D3E6DE398384902055C8CBE187E4E1DB11B2021D146EE385F85CB57766D462686B5A15F672D8217D3B7694FC68FDE4088E3D77C08C94A5C5CBFAA288DF841D2321EA83CDADB4909D80F64F0E2C89A20811FC8288A27855768474290F00B75145784AD83B4D2A29244A1DF472E8217B857594D4A85ECD6CA787E4906C07146924D134C1C12F892AF29747C748177CB2B49530F243A8FE2943CAA2484345BC20DA285FEE1C2171D061C336CE888F247AA74B2D868469C25E0E49A48FD48D911FCDB9B9568E484FD8F9E709218AE20A19FE82F8A27AA16D70CE34CFB2D0E752EA878D26679B4D0A3630B4398F76BE0FA3FC2A6E7E7F08A360152E6BA026FC2A2B9C8727197598AD798FA568F705D806B0C8CBEC747A1645C92F575BD4E0B0069FD0E32CD309720F7C3A5D3D240C2F1B28C1911AEED860B282BFAF62EEE8257B544F8259FCD244FDB61D55EDBC51045A7ADCA40F020ADEA3913666F5E8D1D7C67C098D593D88F42535A658418CD3F25A18EB609CFB9C557ED0E9E1763AC1276BD94F1B59D3C91DD25A15C93D1CC0E1E313729C001C259240BCE8D426833A88C789A1624592E8E7A3DA84D5676E383975844844FD6A501B38B54BCF49A0624562A8A765DAB586F77F054AC391629DE17735DA0471BB859C342E85482497A8456CB5F5C409ABC24522AAA8564A57FB160246573162425791ADF0421DA16031B086364893298F4D440A2510F12D726ABB1B27A38E10E1D771ADD8D85823C0C791621938BE4D0EB5BEE72551D14259548A1669CD1A9113D4C4886434916DF0E4B2821741C60AC590091851C49C5A3818E353F61322293F2C4B4EE333DB44F4004FBF42CB2F1524C7B789CC54387B2F8AAE9A46B5EBB5A4AACA5C9A2EAACB7CD0CB8C4D98B76A52CA93D75471ECDCAD857AACB2EA40B8A0EADAE7C76DAB40E5134C18B877DDFCAAA09EE6A86B2E3EC9EB56702A3F3D0D23DF45F45B5DEE786F4BC5D5C7819F699BB3C7585B74A03CF5FA8C542038AD29FC90A9CF747AA9303F5967DF9473AFAEDB714481663C9E6FF4A244C942A4CCDFB6BA3057A7FEA93C81EA2C8FF4795113B5702A7389D745E62A313B9226508BC399362FAA61967ED5AC4CBCAEB3518FDE892CA1622C0E73795249CAEAC34BF7B1398D24528CEBA1263F4AE256DF4855F275B5B9C24CCEE30814657D9CC78B8268B341994D6214B0518CF96914A1821C0FB57852146B03A99425B56E5828CCF23C8648693E8E76F8519CC0A88354A732D6982BCFEC4C8240650E871ABC288AB14795F964C6260BF5586DC98BD4E4BEB7EF475DBC7D0DA94C613893AB8D7B8BB6893B9921F35C15007F726FCE9ECC6EF771F1AC19FA855E8069204E20660CE86DA426CD55BC4EEABD78A64475923ABA1E24401EAC823C384BF3701D2CF31BE449AA74C4F69720DAC3246FB60F6075155FEFF3DD3E875506DB8788B2E4141BFA2AF92733AECC27D7E55E63E6A30AB09861B1337C1D175B87ABA6DC9702CF33128862BBED2D884B575FB02D210373B0796A903EC06FBB1E50A5BEE680C31DD8EE2208965DC78BE013B0291B5C0CFF0836C1F2E9A67A3A580ED2DE10B4DA4F2EC2609306DBACC2C0F9E14FC8E1D5F6F31FFF0F768F2831630B0100, N'6.1.0-30225')
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'201404111831140_MigCat', N'ProductComparison.DAL.ProductComparisonDataContext', 0x1F8B0800000000000400ED5DDB6EDCB819BE2FD07718CC555B6C3DB1BDBBD806760B7B1C274637B1E1F176DBDE18F20C672C44234D254D366ED127EB451FA9AF504A94C433C5930E768200818787EF277F7EA4C89FE4CFFFFDE7BF277FFABC8D269F409A85497C3A3D3C78359D807899ACC278733ADDE7EBDFFF30FDD31F7FFDAB9337ABEDE7C95FEA74C7453A9833CE4EA78F79BE7B3D9B65CB47B00DB2836DB84C932C59E707CB643B0B56C9ECE8D5AB3FCC0E0F6700424C21D6647272BB8FF3700BCA1FF0E73C89976097EF83E87DB202515685C39845893AF9106C41B60B96E0747A9326ABFD329F27DB5D908659121F5C9CFD389D9C4561000BB300D17A3A09E238C9831C16F5F54F1958E469126F163B181044774F3B00D3AD83280355155EE3E4BAB5797554D4668633D650CB7D96275B43C0C3E34A3D3336BB9592A78DFAA002DF4045E74F45AD4B259E4ECFC214AA7B1516F0209D4E5891AFE7515A241768BAC40A417650B6D2018DF4CDA425FD370D7D20CB8A7FDF4CE6FB28DFA7E03406FB3C0D608A9BFD43142EFF0C9EEE928F203E8DF751349D9C071940252A5AF7A01243D612D61386EE409A3F55B52CFE9F4EAA5C790AD93C9DBC0F3EFF08E24DFE08F90BE97B197E06AB3AA0E2C34F7108B90FF3E4E91EFE9C296514E80A19473E645C84D92E0A9E6E821844B5ACF324894000B9F101AA2778884003AD8FD547D9E701ECB1907CDDEB680BE282589942D2A10F491F40FE3308378F792DE822818405C62D7193FC028ABE93EDB73BD4CDDDE116FBDD2E52E9DA420327333C7C2807957990834D923EB90C273546670309AD43184705106ABD056BA65E57175C1BCC58009EFE38AFEB406448885A74CB28F8AD97DE07B2651A52341692CF4AD687E053B82979C4485DEC1F30E76E4154A6C91EC35DF59120E2EF71C2CB34D9DE26119DBF89BFBF0BD20D28FA76A248B448F6E9D2B69F50C5B6EF2A04CC987A0B512C9B0EC364EFB9CF10D2C7D36D8EECBA4D8723916E07F5DF3BEB8EA7EC9D7517B6EA9D7062F5D1A55B16F9C7350D7E0BE2B4F379F0D93E7F4CD2AEA59C8771B1286D99B87A1185D41FB4F44DDFA2FE06029512BFF520ED0D5AAC0D3649DC8234709B221608E3EA62A84C2DB4F4F2C9B8055912ED5B1AD08BA4C53205205E84FFECBC4E7F4F92AD5F19067474B27EC0EC632362DAC7AAFE7D188160031C97ACA57AFC1655BFE14114DD3C2631706AFE1A645C24A86C3C5D77DB6BF8032A2CDE2C9EB21C78EEC182AF649A2C41962927195E04DD25FBE5231AFD5CAD6DFC186AD955167910AFCE9FEEC2AD1992767F780FC5AD5CFA420930AE7EE067943A4F564F7D8CA96FD3641FAFE6B0C869102F1B7157717E7C645CE8CB3D88EE82F8236B7EB5437B0BCB94B9F685BBFD03886007BE7B4A8133988505D6A02BE4203D0F3F3A7D1A1A9097D825DEC49B30062CB72CC13E24D76B8A60761C1D9A5E5E3BB43E57F759B8ACBFBF0E6CC530E3E26BB3ADF33E0863389CE65DAFC51B81976912E78B1D083E82EECD1AD11EE449923FBAF2F6365885892BC84F8B73E772806592AE4A5D394EA0F669D98B16C57FAE60CDCE1D4B26DB91ABC6FB3949D6982543EC076A0F1875AF73182CAAF8316D3A5425B1D97020B2F6BCD95049EE63A3E1260D97AE1FFD73F8155BF552D8C7244F14422CB711FBDB0FE9764BCBCBE64BC53DE1C60B1BC76DBA7009441B2E2E1BB7B5002A1D5F4072F3475646328DD3BED05DD1559CC64D8430AEF955CF361C6FF690DE8C413DD9D204F69D6760DEFA39BC0CCD30F4BB1B5CCC7D0AB3721EE4D0E51A947175BB8A552D66A5C3EFC6D4E5DE5DB8AF0A34F6AE467546CFC352A89F69FD2DD825A9D3D709218C69528F4A6433A7C7397B9ED25F8611B809F03ABEB3D33C17704E73BD9EA7803AA05084A24F8829CF3390F639372DE4C1A07558F400C1049088BFAFA98DE77F7C2C776A4F90C4E9CC1E5560FB4E46C08CA9A7D5CD6FDACF7CD1C682AD7D9CEDBF49C11AA4205E82C3FE441DF527EAB86B5173F5C1FFEF3DCD9C731513BC08790BE295D20C6C27453A3E5E866996E3866A1D23B9F4E2C19249C62D9A55694DD7F8F5B0ED6374579593F900689B20C0328957062AE633888BCCA653169E4B6C5A8DBBC73035A905975E5C092699B20E6C5A272BCB62BFD9802C775CF66194317D6571A9EC0EC693B97BFEE2BE0B73C7EDD9DBD2CA7409E7AB50B5F314B6C0D207E00D48D749BA2DF657FD815E802CDCC4BEF18A3EE3B9CABE20AB667187F3B899A23B02361B5AC22B06759FB96F9291170CD858C1F5022E89C9F0769665C9322C4BC55BBEB1ED9DAEE99B7835D1B901814D4E9499FC3D1CBDC21D1CAF60794EA7BFE314D902DF2CA430BC0CFBD5C1C121077F8BBE03C52DEBC2E80107D030CEF9B1318C97E12E88344AC2E4158EACF20B4745DB34D2D8980BB02BE67571AEA16FF76234D29881BF4D63273382466A7671BB3AB2A6976FF1F0864C03464937867A6593AC143D3249A6DF67C5227258696B71E1569C172E8936F0F4C63EFF8C129445A745955722AD782550B79782F4C02ED5B255C605AD352CE60465ACD3679CCEEAB79DD3FE58A7511E9D46979E8D31629E4613E8158630A90DCEBFCAF8A04308D612A1C536211794F8029ED5169236223B738CAEA24E6B8AEDC6D6BCA275E056809E99C4598774DA5C6E2AF23A96498D4C430D66B2020D339AC95AC16C383B1A010959E39E0E39A4963EAF1494D9088762A0A43CC31050D20466FC3B1E887F02138BDCDE20B7B790137A6C0136B165480D357D724C5E8CFEA82557B37319BCF30999CD609E1CE600295D066CB2BF08F2A048043E8B8EB8C0BE54ED0C6495F1906549216401727A811D16D784B0DD8E334F705CA351F05A4A0C442D4C5BB0AA0A8B601ACAB640A0B99308A19E3FB6001023920885FA08B4AAA666A05831B8833340044B448A26FDC4104955FE64580A6B1A579B1A71EDCC750A4D7B2A812887A3FA094CABA11DCEE427D08CDA2CA8671824CA8FD9AA5086D414D8B522A87E27D785D4B8A56DDEB2D588C8A0A5CB370BBD288F09F0FAD136CF181B68883AD2638D42673A26198D7670545B3D82AAB5253226E89A135C75C3580F08B8E6BBE05523FC6108B56ED4CB63F305B2ABBEA44BE2EEC9C49DC0506B4EB9A6335ED5B9EA4DB68EEB466DA2ED5BD1775FBD02D15D835063303181517EF1A5AB0E378DD41BCACDCCB8893B99216FD855C0C94CE236FBE47DB0DB85F18670A35D854C16C887F6FCF70B73CFD25B84315B660207D34D691B497992061BC0C442D1B0A4E5705E4CEC1F8262F77FBEDA72C994EB00C914B416CD4CACF936AC67A57586E26FC9F2A3702ECE38BA16ACA52AA04B58E36DB11A2B2A0F081AD0005C914A8CC5328882547EA8629E44FB6DDCBA529363A163B3240C0AD147407756480414A28F40BBB32691E8183B44BE7C7CAC3E32F6714122E25093326207D574E970B8413BE20B2E5463E2607D2CFE860A45332ED610B9F649CD81D6113CDEC98CE94C9C2582EBBFEE1DBC74FC69DEAD8B6C0375E6CAB127895305E963D47E3B49903A4C1F85F2CB4942511106C4219D6F527A2223ACF090874D09268AD4C76D7C6992784DE048885DB9DC34A736CA3810B949979AF4D88BC3F5D1C8AB87241A19AE8F46DEA924D1C8707D34E4FE92C44121A3A18FCD6C671E0C35C5695C60D2AC494D29D3B8CA22719A40031CE4E5924241416369E0C615A64533D779076AECE67ABE60C26782C3F94120F1B848830F0FF653C0D4B50E3698799317F7A909381931D428467930A0E0C88891501E79BB34A77B996F20AAFB1A8FB03F4B6AA2D6841ACC3F590777D44C948DD4C7E59D5792C07CACC98CB9F43348CF98CB20836E483B1AA43A221DA58F295ACBC91772037599DA2BA64DB7810145DE67DE7558BF97D4AC9F893358CB630798D45A1E073F27727635580C437AC2BDA605ED71EEC1A6479CFB4CA1ED09475B60D39E3285F87412836F15768C497DAC70B0C11210F9C6A4567F28481FA3F4074322940126CBD0C62F26BD0A6D820D265CB46B4C6ACA4547599815C57C11445B60D7DE3285C875649FE6CB8E8796ABACF8FB7AFD1BF1185385FED6628091EC772974E5716CB921DD570AD04C37162A1F953452683673247C5452E3050E36280F72434995070599D822F06D1BDA1C21BF85234763AEEFD03D5E79B367A0CF67E533D19CD828E3401FCDAE6C017ED7DB3E2D0BBEAC28B63680BE2C1EC85F21358F2D43C6D25DB0CF438B2ED3641ED61427DD7F35B52EF8ED2EEF982ABE33AA9BDFED039F9BB7AE33D2E1674F753C3EBCA175B4833824E9638F437C14546BA34396B59F4901FD5EA908CF74E243BD4A4A756432622463A6AAE59255B8AE36762FF7F1322F17BA22B965F2AB38834AA8134EEA3F2A5DB22796D029AC46FC3DCA2D22810E0D6E821486E5C8AD1D1D55BB279ACEE1A20E2A55DC927AEC908841916E82286E3072A8383D312733BA3944497EDAAD60056C1B0CE5FEDA60DE1A8C6E0E51920B3845B16F3094BBCB06BB4EC34D1807B2A36733BAFCA2F14F7BC4E9E8A3485F1E701F5D15B724343E8DCADC5D2C723530F9CF2417D9FD97D2EFCC60A009587DB3C09D65E29B131A049365944FE36BBFD0F4245EEC675A85841D3D535B934DA80187184FCE148D9838836541E518815A19489C250CC620EA0A823B8DC82B8AE65C52E6F6A366150A3F2EE15013A310E15E855ED12BFCAEE8E01DC9F0048E0F74F08E6578828BEC72BC397F34DB70F3B5721FCC18AB72B37310957760E620EE4ABC8F31506723EFB4F898183497786DE605F2CCF24F38E9FE94FE7ECBDDAAAA10914F53CA26148AAE70CA11843E4DE9FD45410253FC1BDEC5292F4390C8540EEDF5941741C7DBA1230FA3326C14EBA01F193C97C4B28D65F854B4F10E9A91F5B5D3D183BB76C62669A45721CDEFE6DA5975E58BBA8B56D6BF58CC95F5CEAAEB67E2F5DEB470D8FC295C15F7BFD016CB4191E060F18F681E85E5F2B34EF03E88C335ECF9C82B73F1B0C60FD3C959140619BA1958DD6E7BCD3A8CD0BAEE76785C5C7703ABED8CCD6E7E69AE40C9B215E5345AFE3223DD5CBD3F7F187F0AD2E563710D82F1D9EBFEBAA110FA5B0ADAF831C3759404B9FB5B86BE8A463E5D28C42C1F2F3403E51F0FC4C89C33942B38EDF87C3AFD5799F7F5E4EAAFF738FB3793EB14F69BD79357937F2B9AD7FA4D43A3625108D625D3762C2FF164AAD5BDE4CBEFF6FEA5D2925B07A38D165E694C992F5CC86CE0F75FE66B56D3B5BEC232A4E35B5FC966B776E2EC4B8334D5D1731C774C9F3FB3608EBF47C67CF1857D43CC57738A9F0C2B6CF6B9FB936146CC4059BB6785D4A4D3EDAB588267A38CD443E4F7F8C516BC306559AAA34E4A75EC58AA638FA59271DBAD63B3CF9669E09A3EB22584FCDE7C7647BEA9E509937E42CB0AD4E61521ABC984EF777A7C31887C86278CCD973D8A4778ECE104A6275748D1033CAE68E4E3365E2AEB0750F0F48E0D986219AF358A56B9BBFF262BBDE00C69EDE8404D5A2DD7C117019DB454CE1E8D278F94671E04FD109AF394F7C5E3B598F8FA9DE7DA631F3DCAE5B02930F74EB59D394BF6C6B4035AED9CC7A1BADA6382C085CE97381254BE7BBC0E05B52B1FAFA094531FAFC8947B9FAE9091931F9515C614BCF1F8D3476F117AE5F912FB0BE909C8AB4D8D3CD5EF1598BCBAE01518390C72803460DFD7491BE14EC8EB34A3F148E0F2F5AE7C0B39144C9F0B12E73F5F22239ADB725EFB3577DBD0F3466A7357D02B2E753BCF7EADC08F96763D82BA7CA80FA4DD0D444E81BEC42EE065F8C27E88BC0EAD9C83117B530BEF7FC81EABF2EF62DF4718A72EF640E6CB5083FE21F6FEF3B58F58F611D6D5900B16E165C89EC603B2D06357D727B4D4AFCF974869811321AF2B77891321BF160DEC50C89EBC9537217B80F2EAB6837CEC45C861D245BB0EB20712F80A721AA758074143D94BB54709A10F932F7180E87611E36B95D0D562A89B85A1604D33AEC51B72ACA29B5FBF53C9BC9C7C891D8B72ACA2323D7F3754A77A77E1F641D3B2C30EB6EDE6F8BDEEE22B247AA0B5ED5944E24123FC721E2A0AF324A6D1EBE6D4437C041C15DEC9A3E68A2BEBFC90A0BA5B6DF4EAAAEAA6BCA9D81E1EEEBD513E0AD911276EEA67BC08A826ECC570A1AED1B3E281FC04BE53971E1D214C3B6A8BD3898E68D12AB5E7A7E5954F81DAB5670B33A807870934A3D7E8AD1862D24ED209A51133D49E0B445215B7F97BE786F0F2855343B650A37E8F9500AB833A218469F3C83C40183042EA12C5445ACF3C503FF2FA7590186C9010B8E8E89D1CCA776CBF7263306E08DCADF4C28DB6577B3BA104712F849EBEE2E0174208A57F1643A13DB081BE15705FB40D86BCBF4C932D7E6039B957DF21B0228E8A35AC38128E8BD3E0E333A150EB7BC523E4517192BC8D3DA2D3E6DE398384902055C8CBE187E4E1DB11B2021D146EE385F85CB57766D462686B5A15F672D8217D3B7694FC68FDE4088E3D77C08C94A5C5CBFAA288DF841D2321EA83CDADB4909D80F64F0E2C89A20811FC8288A27855768474290F00B75145784AD83B4D2A29244A1DF472E8217B857594D4A85ECD6CA787E4906C07146924D134C1C12F892AF29747C748177CB2B49530F243A8FE2943CAA2484345BC20DA285FEE1C2171D061C336CE888F247AA74B2D868469C25E0E49A48FD48D911FCDB9B9568E484FD8F9E709218AE20A19FE82F8A27AA16D70CE34CFB2D0E752EA878D26679B4D0A3630B4398F76BE0FA3FC2A6E7E7F08A360152E6BA026FC2A2B9C8727197598AD798FA568F705D806B0C8CBEC747A1645C92F575BD4E0B0069FD0E32CD309720F7C3A5D3D240C2F1B28C1911AEED860B282BFAF62EEE8257B544F8259FCD244FDB61D55EDBC51045A7ADCA40F020ADEA3913666F5E8D1D7C67C098D593D88F42535A658418CD3F25A18EB609CFB9C557ED0E9E1763AC1276BD94F1B59D3C91DD25A15C93D1CC0E1E313729C001C259240BCE8D426833A88C789A1624592E8E7A3DA84D5676E383975844844FD6A501B38B54BCF49A0624562A8A765DAB586F77F054AC391629DE17735DA0471BB859C342E85482497A8456CB5F5C409ABC24522AAA8564A57FB160246573162425791ADF0421DA16031B086364893298F4D440A2510F12D726ABB1B27A38E10E1D771ADD8D85823C0C791621938BE4D0EB5BEE72551D14259548A1669CD1A9113D4C4886434916DF0E4B2821741C60AC590091851C49C5A3818E353F61322293F2C4B4EE333DB44F4004FBF42CB2F1524C7B789CC54387B2F8AAE9A46B5EBB5A4AACA5C9A2EAACB7CD0CB8C4D98B76A52CA93D75471ECDCAD857AACB2EA40B8A0EADAE7C76DAB40E5134C18B877DDFCAAA09EE6A86B2E3EC9EB56702A3F3D0D23DF45F45B5DEE786F4BC5D5C7819F699BB3C7585B74A03CF5FA8C542038AD29FC90A9CF747AA9303F5967DF9473AFAEDB714481663C9E6FF4A244C942A4CCDFB6BA3057A7FEA93C81EA2C8FF4795113B5702A7389D745E62A313B9226508BC399362FAA61967ED5AC4CBCAEB3518FDE892CA1622C0E73795249CAEAC34BF7B1398D24528CEBA1263F4AE256DF4855F275B5B9C24CCEE30814657D9CC78B8268B341994D6214B0518CF96914A1821C0FB57852146B03A99425B56E5828CCF23C8648693E8E76F8519CC0A88354A732D6982BCFEC4C8240650E871ABC288AB14795F964C6260BF5586DC98BD4E4BEB7EF475DBC7D0DA94C613893AB8D7B8BB6893B9921F35C15007F726FCE9ECC6EF771F1AC19FA855E8069204E20660CE86DA426CD55BC4EEABD78A64475923ABA1E24401EAC823C384BF3701D2CF31BE449AA74C4F69720DAC3246FB60F6075155FEFF3DD3E875506DB8788B2E4141BFA2AF92733AECC27D7E55E63E6A30AB09861B1337C1D175B87ABA6DC9702CF33128862BBED2D884B575FB02D210373B0796A903EC06FBB1E50A5BEE680C31DD8EE2208965DC78BE013B0291B5C0CFF0836C1F2E9A67A3A580ED2DE10B4DA4F2EC2609306DBACC2C0F9E14FC8E1D5F6F31FFF0F768F2831630B0100, N'6.1.0-30225')
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'201404111833452_MigSubCat', N'ProductComparison.DAL.ProductComparisonDataContext', 0x1F8B0800000000000400ED5D6B6FDC3A7AFE5EA0FF61309FDAE2AC2776CE2EB681BD0B5FE2C4E8496C787CF6B4FD62C833F45888469A4A9A6CDC627FD97EE84FEA5F28258AE29DE24D173B4180C0C3CB43F2E5438A7C49BEEFFFFDFD7F8FFFFC6D9BCCBE82BC88B3F4647E78F0663E03E92A5BC7E9E664BE2F1F7FF7C7F99FFFF48FFF70FC7EBDFD36FB0B4EF7B64A0773A6C5C9FCA92C77EF168B62F504B65171B08D577956648FE5C12ADB2EA275B6387AF3E65F1787870B0021E6106B363BBEDDA765BC05F50FF8F33C4B576057EEA3E453B60649D184C398658D3AFB1C6D41B18B56E0647E9367EBFDAA3CCFB6BB288F8B2C3DB838FD653E3B4DE20856660992C7F92C4AD3AC8C4A58D577BF166059E659BA59EE604094DC3DEF004CF7182505689AF08E24376DCD9BA3AA350B921143ADF645996D2D010FDF36E259F0D99D843C6FC50705F81E0ABA7CAE5A5D0BF1647E1AE750DCEBB88207F97CC617F9EE3CC9ABE41249D75831280EEA5E3A60917E9A75A4FFA9A50F6459F5EFA7D9F93E29F7393849C1BECC2398E266FF90C4AB7F03CF77D917909EA4FB2499CFCEA202A01A55BD7BD01443B712B61386EE405E3E37ADACFE9FCF9A5C650ED93C9F7D8ABEFD02D24DF904F90BE97B197F036B1CD0F0E1D73486DC8779CA7C0F7F2EB46554E89A328E4294711117BB247ABE895290E0B2CEB22C0111E4C667289EE821012DB439D610753F8FE08885E4EB5F465B9056C42A34251D8628E933287F03F1E6A9C4055D6490B0C0BA276EB2BF826AEC14FBED0E0D737FB8E57EB74B74B27690C0F1824C1FDA49E53C2AC126CB9F7DA6138CD1DB44C2CA10C6310194586FC123D7AEAB0BA10F163C80487F92D77722B224042EBA6316FC39C8E803C52A8F191A4BC9E754D6E7E86BBCA979C495BADC3F10CEDD82A44E533CC5BBE62341C5DF93849779B6BDCD12367F1B7F7F17E51B508DED4C936899EDF395EB3861AAED3E542898298D16AA5A2E0386CB3EF098A14A9FCEB039721B363DCE44A60334FCE8C4034F3B3AF110761A9D7061F5C5675856F9A7B50CFE00D2BCF775F0E9BE7CCAF2BE4B398BD36A53DAB1700D5214127FD431364317F51F20D209F1E700A5BD479BB5D116895B90477E4BC40A615A430CD5A98396413E19B7A0C8927D4707062969B9CA014897F17FF7DEA6FFCCB26DD8322CE8E8A5FD80D9A746C47C885DFDA73801D106786E596BF184ADAA79C78324B979CA52E0D5FD18645A2468743C7D0FDB6BF8030A2CDD2C9F8B12041EC192AF649EAD4051681719410ABACBF6AB2734FBF96ADBC439D471A82CCB285D9F3DDFC55B3B24E3F1F00916B7F6190B35C0B4C6419859EA2C5B3F0F31A77EC8B37DBA3E8755CEA374D5167795966F8FAC2B7DB907C95D947EE1D5AF6E681F609D0ADFB170B77F00091CC077CF39F00673D0C05A0C8512E467F117AF4F430BF21A87C4FB7413A780E79623D8E7ECFA9121981B47C7A657D0016DCED57D11AFF0F7D783AD04665A7C6D8F753E45710AA7D3B2EFBD785BE0659EA5E57207A22FA07FB546B2076596954FBEBCBD8DD671E60BF2EBF2CCBB1E6095E5EB5A569E0BA87D5E8FA265F59F2F587B72C793C975E6C278BF65D92361C918E781C613061E751E9345133FA54387A6262E070E54D6810F1B9A92873868B8C9E395EF47FF0C7EC5D68354F6292B334D218EC788C39D87F47BA415E4F0A5E19EF4E0858F130E5D8404B203179F835B5C00934EAC207DF8A3AA239DC6EB5CE8AE1A2A5EF3264298D6FA6A601D4E307DC860CAA081746912FDCE0B506FFD165FC67618E6C30D6EE6BEC645BD0EF218722DCAB4865DC3AA0EB5D2E1EFA734E43E5EF8EF0A0CCEAE2675472FC056689865FD2DD865B9D7D709214C69518F6AE4B2A62739075ED25FC609B889C83EBEB7DB3C17704D73FD789E03E68242158A3E21B63C2F403EE4DAB42A0F063DC6D508902C00A9F87B4C6DB2FE1363855B7B92245E77F6980ABB0F320A664A230D77BFED380B451B07B60E71B7FF26078F2007E90A1C0E57D4D17045BDEDBBA873FDC5FF3F045A39973A260429E40348D75A35B05B29CAF9F132CE8B927454E71C29A4974F965C3261D3AC4B6BBBC7C7D37688D95D574FEE0360AC8200AB2C5D5B8858CC20AF329F4E5B7921B16D33EE9EE2DCA615427A7923B864DA36F069BDB42CCBFD66038AD273DB4750A6F49525B572BB184FE71EF88BFB312E3D8F676F6B2DD3255CAF42D19EE7B0075621006F40FE98E5DBEA7C351CE80528E24D1A1AAF1A33819B1C0AB2E9167FB8808729A633607BA0257D6280C7CC7D9B8C7E60C0C74A9E1708496CA6B7D3A2C856715D2B51F34D74EF6C4BDFA7EB99C90B08A27262D4E49FE0EC15EFE07C05EB7332FF1741901DF0ED468AC0ABB0DF1C1C1C0AF0B7E83B50BDB2AE941E70028DD3529C1BE37415EFA2C4A0265C5EE9CCAA7E7054F54D5B1A1F730176D5BA2E2D0DE4ED5F8DB6346EE2EF92D8F182A2919E5DC2A98EAAEBD5473CA222D38251CA83A141D9A4AAC5804C52C9F745B1889E56BA7A5C7A1417844BB2033CB3B92F3CA3247531E951ED9348275E49C41DA42203B04BB76D5571C1680F4B38C128EBCC1967B2FBEDE67438D619D4C7A4D3957763AC9867D0056695A1546AA3F3AF513E981082D74418B14DCA052DBE84675843D245646F8EB14D34E94DB9DED89957AC0CFC2A30309304ED90499FAB554541E732A59269ACC94C55A1716633552FD84D6747132021AFDC33218752D31794822A1DE1580C54D4671C022ABAC08E7F6F47E29F44C5A2D637A8F52DF4829E68806D74194A45CD901C535763386AA9C5EC5D87E07C426A3398A7843940CED681A8EC2FA232AA12816FB22B2E702C35270345A33CE4595215B20425BBC18EAB6742446F27A82704AEB128642F25076236A61D584D8365302D653B20D0DA498680D78F1D00D48C2443613E029DA2C10C940B860C700E8862894CD0B49D182AA9CE9E0C4F6143E56ADB22A19F854161A84FA510D570CC3881690DA423A8FC2492D1AB05CD148354FD095B35C250AA02FB160433EED4B2502AB78CD55BAE129129B44CF9E62017ED3501513EC6EA196B050DD54676AED1C8CC442563D00F9E62C333A85E5A326582A93AC157369CF680826BBF0B4125225E86D0CB46BF3DB6DF20FBCA4BB925EE9F4CC20D0CBDE4B47B3AEB5D9DAFDC54FBB87EC4263BBE957DF7F53B10D33D083307530B18ED175FB9EBF093083E506E57C66DDCF10259C36E028E170AB3D9C79FA2DD2E4E379419ED2664B64436B4CF7FB7B4B72CBD45188B55213130DDD6B62DA9CCF26803B8585834AC693D9D570BFB87A83AFD3F5F6F8564DA7D8062098A8BE616D6621FE25529CE50FDADD87E54C6C53943D792BD540374095BBCAD766355E30145031640A8528DB15C454994AB2F559C67C97E9B76EED4D458E8DA2C0D8342CC11D09B151A01859823B0E6AC692436C60D51AC9F186B8E4C6C5CD08824D4A68EC440355B3B126ED18FE4810BD39924D81C4B7CA1C2D04C88B544C636A905501C21E21D2FB8C124682284F1EB3FC06BC39FF6C3BACA36D2606E0C7BD2384D903906B6DB4983E0307314C62E270DC54458108736BEC9C8898E70C2431636159828D21CB7B5A549E3B5811321766372D39EDA28E348E4A64D6AB2732F093747A39F1ED26874B8391AFDA69246A3C3CDD190F94B1A07854C863E2EAB9DF368AC254E6B0293654D6E4B99D654168DD3065AE0202B970C0A0A9A4A07B7A6301DBA19E71DA9B3DBE7F992059F0D8E600781C613222D3E3CC44E01D7561C6CB1F2A61FEE330B703A62AC598CB160C0C0D11113A13CB276694FF73ADF48540F351F117B96CC42AD0DB5587FF206EE9895281F698E2B1AAFA481C5589B15736D67905D31D74116C3903534C80C4436CA1C53B697536FE4461A32D82AA6CBB0810155DE173E7478BB97CCAA9F8BB3D8CB130398CC5E9E04BF2472F635598C437ACABCA603ED49EED1964782F94CA9EE89443B60B39632A5F86C128B6F15318CC97CAC48B0C51610D9C664767F28C81CA3B6074323D40136DBD0D62E26BB0B6D832D165CAC694C66C9C54639A815E57C91443B60636B9952641C39A4FAB2E7A9E5AAA8FEBE7EFC27F91CD384FEB3C304A338EFD2C82AE0DC72439BAF94A0D91E2C34362A59A4D86EE548D9A864E60B126C511F648692A90F0AB2D14590D736AC3A42FD0A478DC63DDF6147BCF665CF489FCFC666A23DB151C6913E9A7DE902C2EEB7436A164269515C750043693C90BD42661D5B874C65B8109B870E43A6CD3CAE2A4E79FE6AAB5D083B5C3E724DFC68D5B6B0C707210F6F7D57A4E3AF9E703CB9BC6174B583BA2419E28C437E15D4E8A0439575984501EBAF548667BBF061BC923203998E98C89CA9EBB96C1D3F3607BB97FB7455D61B5D59B975F2ABB48042C00967F88F4696FC8D25740BAB2DFE1EE59691C0840637510EC34A64D68E8DC2E689E6E7705307852AEF493376288A41917E0531DCE0CA61E2CC8A395EB0DD214BF2EB6E0D1BE0DA6128F78F0E0BD6616C77C8925CC0258A7B87A1DC7D76D8751E6FE234525D3D5BB0F597CD7FC6334E4F1F45F6F180FFECAA792561F069D4E6EE63936B80297E2685C8FEBF94615706A37C773B9831C0A7977E4763FFF5E5B8C44D0F5CACDF4C2B104C5DD80427F641BE86BD7DEE6992D87FF17F90645A24E969894193C47E95E1469297BFD6C02FCBFCBF25F29773060B0C5546B51A07FB05609538723F033A2462E89FB99AD2865AAC21384BFECC32828BB3500B35867118CD90C258CE682A1CE6099A3F8DE827EAF65CD2E60E23661D8AB82E25A136870294792D56A3ABB1BB658277A4C29318BE31C17BABC293183251E39D8B4F732C2FDF34E6E3B9C38AD2EE1E5C631D9E7B88B1969F638F34D8E8378D2196FFAD1107977DA13AB3FA2B4B9BBF66F76F6AB3DA3A4464D39A391388654FF8D508529BD6ECFD1249025BFC1BD1C4B5588624916D39ACD56BB10836DE0D1D59985661A3580FF9A8E085248E7DACC267A2AD6F50589DBEF53A7B08CF8EF9246DE94D48FBBB7D76DC3CF965DE22D7EDAF56DA75BB8BE6F9B17C313EAF0CF67F8DD7D5FB5F74C47E50253858FE57729EC4F5DE0027F814A5F1231CF9C82A7FE558E98FF3D9691247057A19DEBC6E7EC71B0C327AEE7CF8B67AEE0CD6DB059FDDFED1748552146BC66980DA332FDB5D83BBBF4DBF46F9EAA97A06C7D96CF7F76E2B85FE9981B67666FB986451E9EFCB3654D568D7B552CCDA79AD1DA8E83C96200BC6B0AEE0B2E3DBC9FC7FEABCEF6657FF7E4FB2FF34BBCEE1B879377B33FB9BA67B9D7DDA5A558B4170AE99B1631185256BA3E1A556BF768F2F9D94FC0618AB0E0A4A634603E443660BBF2F2A5BE386AE5534270326BE55B46CF6EB274173374A571DBDC479C7D6FDA50373C239990CC517DE8764A8EE94BB8CAC14AAA5BFCB482B66A0ACFDB342A9D2E9D72BA2C46DA09578A8FC01BFD8120F838EB53AEAA5566F3D6BF53660AD54DCF61BD8BCDB4A035C5B278B52C83FD8AFEE689F8A813059178A4EA02E5EE49C1613A1FDB4856210ED862D4EEDB73D1A276CEE7012D5932FA4CC019B2F1AEDDC2C4863C3004A5CAFB98069B6F146B36893BBFF6FB2D60ADA98DA8E1EC464D4733D7C11D04D7BEDEAD17AF1C8586643D00FB13D4F455B6C41AB499E5F076E3DB1D1A6DD0EDB025357FE7DD459E2357D6F346C9CCDA3B9C67382C484DAF7381334B6DB824E05D8945B5050C6A85B5064C6BC5B5FC8C8C89B4E0B630BDE5A7C1B62B448ADB27D8FE385B6041754A746BFEA0A0A4C3F5D0B0A8C0CC679405AB0EFC7A28D3227177499D15AA4F1F97A37B6E53C2A66CE0585F1B7EF9111ED6BE9A0E3FA7AC7BD360F7C90DABE150F8ACBBCCE76DF2B88B3A5DB88601E9F9B03190F039951B8EF71080499BE881DBAA053AB6060CA5DD522DA9F73C76AEC7BB98F11CEA8973B90FD36D4627CC8ADBFFD18238E63843735E78345599973A7F1882C0C38D4CD09ADB4EBF63D525A62442EE8CE5D61442EAC4683189473276F634DCE1DA036DDE1513EB122E7B1E8624DC7B903496CC579CD53BC81B8B1F4A5C6B384D486D5F73841F4BB8909B54BE86B33D4CFC650B2A799D6E60D19D632CD6F3EA85456AEBEC781C518D6D2A99E7F3FD6A0FA78E1F74133D2C38E76ECE6F9BDEEE32B2473D0DDE516977268473CA7A2AA702E910DDC664BDDE1720EBE1F5488A2876F272FDC1AC314E294A0B3AD61E5755B670FC3B6D8011CB7DF689D02F7C4891BECC691826AC35E0D17708B5E140FD437F0BD86F4E408613B503B8C0EF5448BCE52076086B12B68B7FEEC6006E3709E4263C27B61884D3F29179456CCD05B2E9095AA79CD3F3837A48F2FBC3AB2831AD81F370586837A21846DF7A82C405830426912C5A6B48179A077F2FD6392186D929098E8189C1C5A3FE63FB8311A3724E65606E14697D7F65E2841BD0B6197AF24F89510426B9FC5B2D001D8C0BE0AB8AFFA8640DE5FE6D916B3E4FE2EBBD7BF2170228E8E357C71349C1067C0C71742A14E7FF513E4517593BC8B3DB2DBE6C139830AA1419A90D7C30F85E3F309B2025D14EEE285FC5E757066E062586D5A13F67AD8A1F41D3E497E747E7224D79E7B6046CED3E2757D51E43EC1A748087CB1B99316AA1BD0E1C9414A62284205BF22A268BC8A4F902EF505E02EAA486F0907A749530A8D82835E0F3D545EB827498DC66B72373D1497647BA0485B124B1312FC9AA8A2F63C3D45BA909BA59D84515F420D4F19BA2C86344CC42BA28DD673F30489832E1B7671467E2531385D7031344C1BF67A48A274523A457EB4F7E63A39A2BC61179E2754510C57E8F057C4179D87CED139D3FACC60EFA560D73AB3D3CD26071B18DADE473BDBC7497995B6BF3FC749B48E5718A80DBF2A2AE3E159C15C666BDD6454FDBE04DB085679559CCC4F9324FBEBD51675386CC157E430633E43E6814FE6EB878CE3650B25B952235C1BCCD6F0F7552A5CBDE4AFEA2930AB5F86A83F77A3EA8D37CA406B8B9BEC4540898F106567362E707E74E66BE8CCC655CDF7D49946029238067B4132EAB245EBC8F96E2BB483D1FE88A7FD2498F2F2A6C61F4C1987292F6FDE0DC114B998387F11B84F78DF0EC24EA27141C1AE74E733F2A881DF55D08D9DDD21C1359182CF16019F5C4E160A2051B2122867AA5D653077A0856298585949ACE7D6AEC2F07547A11C1C212B023B6CEB02672E48092530B1B26218AF5EDD5223576F2442239172991197465D0509173584D28414B22285441DC536A7FE42614DB8AC8826AA93D2CD91B184D14D8C9CD04D6427BC544628580E6C200DFAB44AC4A622A52550F11DE5E0230FA10C1C21C3C7719DD8444F2EC12791F232487C57398C6A552C89899696C5A4E828AD55CF0905B531B232DAC82E785AA3231641C74A8BA113704551EA0CE9644C1E38CDA8A4E2B4AC7808C59DD0B3137CEDCD8C040A5A1AC5CB192A3313CE3F49659B66D06CACC6D3355948D34773B90F7A9DB10D0BD64C4678EA966A5EFCF8F5D0804DD6BDC59134DDF8E98E6B13987C920583E05233AC08F03247DF72F9230ABF8A33F9D96518ED92366C738597151D0DD7BFC478A17DCEBF20E89081F6C1C10B1281E4A2BCF443A6BF4E1FA4C1E2629D77E7E9DF5CBF9BE012C904BC5A1E44888A8D489DBF6B77612F4EF30BD112D139DEA60E222666E354E792EF8BEC4562771B5822168FEBC44144C36DFD9A55997C5FE7221EB3CBB052C138DCA30D24929C974790E1E37211542618DFFBA4618424ECBE91A8D4FB6A7B81D95C859408CAF926651001B16A833A9B4229E02218FB8B80520179DE270C24285E07D2084BA9DD701098E3553899D042DCAA0B2338895207894EA7ACB1179EDD753089C83CEE93051114A78FAAF3A9944D0EE271BA0D251393FFB5AA30E212F56B48641AC5995A6C821BF036EE7881D4734D00FC29B8FB3E5EDCEED3CAA324FA859C6FB510C7103305EC31529BE62A7DCCF03528AE4638098EC6930428A3755446A779193F46ABF20619F1AB6D60FE254AF630C9FBED03585FA5D7FB72B72F6193C1F621613439D55D2A5DF9C70BA1CEC7D7F5296611A209B09A7175F27C9D56A787EBB6DE9712A35F0A88EAB8ED03486B2B8BB02F21034BB0796E913EC36FBB195023BEF66ED91DD8EE1208565CA7CBE82B70A91BDC0CFF0236D1EAF9A6F1DAAE06E9EE0856ECC71771B4C9A36DD16090FCF027E4F07AFBED4FFF0FF438F9C6DE160100, N'6.1.0-30225')
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'201404111835132_MigProd', N'ProductComparison.DAL.ProductComparisonDataContext', 0x1F8B0800000000000400ED5D5B6FDC3A927E5F60FF43A39F760767DCB673663013B467E04B9C1873121B6E67CECEBC184A37BB2D442DF548EA4CBC8BFD65FBB03F69FFC252A224DE25DEA4BE840860A479F98A2C168BC51259FCBFFFF9DFE99FBFAFA3D137906661125F8CCF4E4EC72310CF934518AF2EC6DB7CF9DB3F8CFFFCA77FFD97E9BBC5FAFBE8AF75B93745395833CE2EC62F79BE793B9964F317B00EB29375384F932C59E627F3643D0916C9E4FCF4F48F93B3B30980106388351A4D1FB7711EAE41F903FEBC4EE239D8E4DB20FA982C409455E9306756A28E3E056B906D8239B8183FA4C9623BCFAF93F52648C32C894F6E2E7F198F2EA330808D998168391E05719CE4410E9BFAF6730666799AC4ABD9062604D1D3EB06C072CB20CA40D585B7B8B86A6F4ECF8BDE4C70C51A6ABECDF264AD0978F6A662CF84AD6EC4E471C33EC8C07790D1F96BD1EB928917E3CB3085EC5E84053C48C72396E4DBEB282D8A0B385D6285203B2947E98446FA69D451FEA7467CA09415FF7E1A5D6FA37C9B828B186CF33480251EB65FA270FE17F0FA947C05F145BC8DA2F1E82AC8006A5131BA271519B297B09F307503D2FCB5EA65F1773CAA6AE52994E6F1E863F0FD1710AFF21728BF507C6FC3EF60512754F2F0390EA1ECC33A79BA853F27AD340AF4161AE72E68DC84D9260A5E1F82184435ADAB2489400065E313644FF025020DB43AD6106DBF0EE08C85C2D73F8FD6202E042B6BA174E682D22790FF0AC2D54B5E13BA49A0C002ED917848FE098AB9936DD71B34CDEDE166DBCD266AE3B50107A613AC3E5A95CA7590835592BEDAA8931AA3374542F310E65109045B1FC192E9D7DD0D3706131680177F5CD75611690A444DBA430BFEEC64F6816C9E8694180B85CF88D6A7E05BB82AE588A13ADB7EC132F708A2B24CF6126EAA4582C87FC6056FD364FD984474FD26FFF9294857A098DB494BA159B24DE7A6F3846AB6F9542160F669B610CD3299304CF581E70C417D7FA6CDB9D9B4E95113A94E50F7B3B39E78ADB3B39EC246B3131A565F6DA665517FBFCCE0F7204E7BB7832FB7F94B92F64DE52A8C8B4D6987E1EA8414627FD031375D93FA1B08DA98F8B3036AEFD0666D6746E21AA4819D895820ECD714436DEA104B274BC623C89268DB31804E28CDE62900F12CFCCFDEFBF4F72459BBA5A1218E56DE0F587DDF04311D6257FF318C40B002965BD6923D6E9BAA3EF0208A1E5E9218580D7F0DB25F4250F978FA9EB6F7F0076458BC9ABD6639703C8305AB649ACC4196B51A194E083D25DBF90BD27EB6DE365E871A4E95591EC48BABD7A770AD87A43C1F3E42720B9BB95002ECD73C70A3A5AE92C5EB103AF57D9A6CE3C5356C721AC4F386DC5D9CBF39D76EF4ED16444F41FC9575BF9AA1BD876DCA6CE7C2D3F60B88E0047E7A4D813598810756632AE420BD0ABF5A2D0D0DC8314E8977F12A8C012B5B86609F92FB2525606632BA6BF1723AA1D565759B85F37AFDB590560CB35FF2DA7CD6F918843154A779DF7BF186E06D9AC4F96C0382AFA07FB746B4057992E42FB672FB182CC2C416E4F3ECCABA1D609EA48B92579606D4362D67D1ACF8630BD67CB96385C95473D578BF26C9124BC92EBE072A2B8C7AD659288B2A7F9F3E3A542D31F9E040541DF863434579880F0D0F6938B75DF4AFE02AB618A4B12F499EB41031FC8C38DCF7907E3F6939F9F852C99EF0C30B9BC77D74E10A883EB8D87CB8AD0950E5F806921F7F646D24CB587D177A2AA68A95DE4408FB655F0DECC371E60F19CC1934902F4DE0DF3900F7D6AFE16DA887A13EDDE066EE5B98957690C5946B50F66BDA5552D5E1563AFBDD3E4DB90F37F6BB02856F577B7546CFC1566818B3FE116C92D46A754208FB64D4A31699D8F4B8E6C026FD6D18818700EFE37B3BCD73036D9AFBE5750AA8030A452A5A4274E53C03E990B669410F262DC36206080C4022FFB9166D6CFFF1B9DCA93D4111AB337B5483CD271901B34F33AD1E7EDD79E64A6C0CA47588B3FD0F29588214C47370361CA9F3E148BDE99BD475FBC1FFDF3BB29CF336497042E43D8817AD6E60332A52FD781BA6598E07AA534772E5C5CA9229C66D9ADBCAEAEEF16BB5ED42BBB7B5935900945D10609EC40B0D16F315C44D66CBB5369E2BACDB8DA79730D5E905575EDC09A6586B1FD8B2565E96D976B502596EB9EDC328FBB4CAE256991D8C276B0FBCE27E0873CBCFB38FA597E916DAAB90B5D7291C81B90BC007902E93745D7C5F75077A03B27015BBC62BE68CE32EBB82AC86C51ECEE1C714550DD87CD0125E31A8E7CC73538CBC60C0E60AAE17704574D4DB659625F3B06C15EFF9C6BE77BAA7EFE2C548E506047639516EF28F507B851BA8AF607B2EC6BFE118D901DF6CA430BC0CFBF4E4E48C837F44EB4071CBBA707A40051AC639AF1BC3781E6E8248A1254C5DA166955F382AC6A6A1C6E6DC804D61D7C5B902BFED9BD15063147F17C7A613428CDAA58BFBAA231B7AF9271EDE91A92151D20F43834A93AC15034A928CBF072545A45AE91A71E1A73827B224FA80A7A6FBDC4B94A02D2A23DA7A25D248AE04EC76D29001A4AB6DDB2A9305A53D2C9609CA59A72E712ABBDF6E997627750AED511974E9D9182DC9531802B5C6102EB59DCB5FE57C501108D613A1246D425968C517C859ED21E912646B19A3BBA8329A62BFB1B15CD13CB06BC0C092C4798754C65CEE2A72AACBA44EA65D2933598376A3CD64A3A0A7CECEF7400859E79E8A70483D7D4E4550E623DC95044ADAB31B01940C819EFCBDD991FC095C2C727F83DCDF421AF4D803ACE3CB903A6A869431793386132D399BADDBE05C9E90DB0CD6C9610D90D26DC02EFB9B200F8A42E0BBE8880B9C4BD59781AC721EB252521099819CDE6087C53521ECB7E3DC139CACD128782F2506A236A61D58558745308DC8764020DB498450DB8F1D00844612A1508B40276B6A091433064F700688901211A3C9383144D1B67832AC082B3A579B1E71E3CC4D0A457F2A812887A3E6092CABC01DCEE527E04CBB5B50CD3148B41F4B6B0B33A4AEC0BE1941CD3B392FA4CE2D65F7962947440E2D557933E04BEB31019E3FCAEE196D070DD1475AD7B4F04CC525A3300E966CAB35683BB744CE045577822D6F18EF0101D7AC0B4E39C21F8668E74DFBF6587F836CCB2FE996B87F61E24E60B473AE754FA7BDABB3E59B6C1FD70FDB449F6F45EB7EFB0E44750F42E960C280695DF1A5BB0E3B8ED41F941BCBB8C99B4E5034EC2A613A9184CD9E7E0C369B305E1161B4AB94D10CC5D0BEFEED4C3FB2F41A614CE69920C074D3DA86529EA4C10A30B990346C69A9CE0BC3FE4B507CFDBF5EACB962ADFB0089095A93660C6B7E0C6BABB4AE50FC5FB2FD28828B3381AE057BA90AE816F6785DECC68ACE03420C6800AE4925C66C1E44412A3F54719D44DB75DCB9539363A163B3240C4A5147407756480494A28E4087B32691E81C3344BE7D7CAE3A328E714122E2549D36E200D574EB70BAC638E20B2ED460E264752CFE860A25665CAE26721D939A03AD3378BCE984994C9C27829BBFF613BC0CFCA93FAD8B6A3B9ACC55604F12A74A52C7A8E3769220759A3A0A15979384A2323404870CBE49F189CC30C2431136259828531DB789A549E235897B22D855C84D7DD146157724DC64484D5AF7E2747534F2EA218946A6ABA391772A4934325D1D0D85BF247150CADE888F89B5731DECCAC4694260D25293EA8A4C132A8BC46912357050944B0A0525EDCB0037A1300D86B9AEBBA3C16EAEE70B0C3E1D1C2E0E0289C7656A2C3C384E01D3D73A59C3F2262FEE53063899B12B2D464530A0E0C88C3D117914ED525FDCCB7A3B127557FA08C7B3A40CB52655C3FE6403DC5196289BA98ECB07AF2481F95C1D8BB98C33485BCC6592C634A4030D521391CE52C714EDE5E41BB91D4D993A2AA6C9B4810945DD039F3A6CDC4BCAEA67F234F6F2380026B597C7C987249C7D298BDD083D115ED340EC71ED9D99475CF84CA1EF09671B60D3913285F874118DB50A07C6A4162B9CACB10544B131A9DD1F4A52C728E3C190086582CE36B4898B49EF429B640D838B0E8D49995C7496815B512C2F826C03EC3A5AA610B9CE1CD27DD9B36AB9CB8AFFDF2FFF4DAC63AAD47F37503092EF5D2DBC72A85B1EC8F0950234DD0F0B558C4A1A29D4B31C89189594BEC0C91AED416128A9F6A0241D5F04BE6D43BB23E4B770E468CCF51D7AC6B7DEECD9D1F259C54CD4176C5471478B665FBE00B7FB6D979E05575E14531FC0501E0F14AF90B263CB947D992E38E6A1C194692AEFD61527FDFEAAEB5D703B5D3E305DFCA0D537B79F0F5C7EBCB5B548F7DE7A323D8D912CC265F555EF761BCFF3729723A25E16BF8B33C894BAE0A8FE4FB55AB3C755D0111CA611CF084334F914A6DF03DCF9AE418E029B5139757C9AF135B4EA217BC5A3AB64A58989A03C5B32A5A5C6112853EDA009E38D8127722C5B8FEC3AB6F528D50E9AB4CA187C32CB8E0863FD3174985C3B52C2817031066879608051A21D307DA888214067BA2324EC0D5FC056B66A6723275975866D8FF0D924AE2F38CB52A2F0B2C78A15CEB19CDFDC32C64E75AE800382F5F92611AD3A4F8DCC7442AF4FA2229F370B38C9ED563084E15730BF82F915CCAF607E05539528BF8275AF60F4FA242A72032260BB82218CFE56B0FB345C8571203B9D3EA1FB20DA2B2BEF4B073DE43CC06EB920EDF7C8DEC2387E0BA33A84CF90A852EDA0EBA3F90C769D6C2945E4617D568EC83C4B4922CFF0B3F244E63923838EF5CB49A17C3B72CDA97F864C93BEE3AD5EA97EFD06CFAB5FAF7EBDFAF5EA77E87D4AA97EFDEEC4F4A6DA00FB1344DCEF50FC1279FC4B24798992EB0FCEB223421E8E60889059964C234E83B01C23B2EC88A0FB980C3C4ADCB1555F292D6FD77BA5E59596575A8E95564FB670A5B4BC356C74F17E1053D89F66F34BCA0FB1A4A492F52475B19834574C19F826DD121E859160C151EACE0D537F9CC8AB10AF427E0415D29B99E8CF7358C5EE19C252ACE97B7BD12BFBE357F6CD9D48F1B9485B78EE72294386CBB79E1DF55D517E6ED439966762C98B9AECD15832EF001C2AD42556960A99B76BD3BBD1C9DE00F73AD9EB64AF93BD4EDEF95EA6D1C97E4763189A7180DD4C49DBEF64FCAA79FCAB66CF7E251C4E941DEB26C3F290271B31903DEEC9E6DB91E3838E32F4F802B68758CBC88FDC21D632D572FDA70341B216009D6B474A722D4EEF4E5C6F1B25A4EEFD26C9AB7BAFEEBDBAF7EA7E5FD47D4F7B30A4EEFDFECB22CEF7207BB08ABEDF87F985D92FCCB6D7A298A8F4ECED2826DB8E1811B19EA143E4FC588BD9C0F64C8F5BA55A2BFBED92D7CA5E2B7BADECB5F2EEBF2A61ADEC7735560FB90CB1AFC12DF03B1BBF861EFF1A2A785C883BA1C1957044927E6F4846962E65297BF8492256F6708EE5D544F45A117B2B11A5DA419741E319E032CDF63265F3AE117797B2C9B11568EAA9234EA0A95C4B438A7FFD8835A8F8128E48D6CF22C908D6F996DAADAF2893FDED4B8955D5EF4CFDAAEA5755BFAAFA55D5AFAA6A240F7E55EDCBAF40ACAADEB3D0EE597890BDC1388857A1A2EE3D0ADEF6391EDBA7B7DD423D5BFC4EC1CF96239A2D3D5901F56CF11680E92BB703180088B85FFFBD463B1E8D262335F055CC412E303EF47FDFB3E70BB28EAF604ACF180C736B153D08CD9E2E2813776CBC569ADEDBAE5ED37B4DEF35BDD7F4BBD7F43D6DBC2A4DEFF75D1DFB2ED8BE6F61D1975DEDBD9A06F8FD975F958F7F55AE9691B697615DDCF51C6435FEC0F3EA83358306091E3FC06BB33D7DB83EBCE3458486F7FB2EAFE1BD86F71ADE6BF816D8C33BEA4268F81F68BF55E7CF402ECC6673697517828CE592D1F326486B89366F08E2360D566B2812A3599EA4A06913D6ADA2B1EA56D4D7709AAE633E5D382AAD68687512E1A11C75C41B90CDD3B09A12242095C1E341A1A07935C4C6BB6DE406799D069137D8740FB25ED3322021E3C2B0A164835DADC9BC1D5BD1CD80E9DBD07EC076B1283603A6BF24EA0ED8E12F8AD80077B32E1206BDC1D2D85A5B718741AE3F4C96FA8A4654E497492EB3FF95D2AD65B09375B7433206587A891618ACBE036E6439019313DB43C53EC86AD8DB724F0A89FE8AEF8564BF84A427138314127D2BC34C480EDFD678049B24CD5D581908C9C0C09055947BCC8AF2ECEA8A53D557EADB30020F4171E38F44C2A91A3604948EFBE5750A028119C1E4A9A37E86DA94ED679DE6DE823094A0A241B0DD4BC835176244C019C8526B6D376C6E43E1ED529CAA8EF4908225801A740ECE68302AC304EF5C86776E86F74686F746CB602E635251A67299A2B135C80B9B80DE10A024758CF7205E14573349903A6D6F26DB6CBB5A81ACD0236E3686359AD1BE505E59BECAD675F85D2199A33E6A1F42B878514828451DE1B13CF6770BB5F33605D76998877366651115D0C57F00E93249D745902F390D41215D3AD0EC0B57B19C049D6F865EE8343936CAB5E08F0C9E2B6238C6327C2A5B471B361F66685DD8240FAC3DEACCEB24CE833006295BA4A15EA534BFB33AA198EBC10A94AFB666B81EB2B4CB7E679B602E37C6A1019D26DF42A83BE1CC2E0FD49E14054E66FF88AEA3B0DC1BD4053E0671B88433FF29F90AA0457D7E7AFA87F1E8320A830C5605D1723CFABE8EE2ECED7C9BE5091CFC38C94B3BEA62FC92E79BB793495652CC4ED6E13C4DB264999FCC93F524582493F3D3B33793B3B30958AC276CF50A5609E5F48F354A962D2252DB113A9796065A254EFF025ED911AEA5E8112C79419A30A3CDD69FCA65B068CBC538FE16A4F397000AF2C7E0FB2F205EE52F17E337A7E3D1A76D141587412FC6CB20CAB80552028C2C9816E89F29E83CDD2A2097673D10E6324A825CBB71C4790EB74D4307395A30CF4EB541C9FD238BCC0AE7DB3B68767CBF18FF5759F7EDE8EE3F9E71F59F46F7299C376F47A7A3FF6E195E953631DB5A83665108C62D23D55DEBEC123B2BD5A697DCFDDA3DBFDAB86437C16877905331A63C4036C2AC3C3C5277B2DA08B57E19E81EA40E69B61B27CE73B793A13A3F44BDA32C3E2247909AE4C89C3FDD42836BBA9517EC44723B9CAC3309A1170ED5BCBC28A3D9CCDACD612019A86AFF522175E9A88986D891A3625211BE1603F610F51DAED894C7C6AA55E7BDB4EA8D65ABDE386C954CB6ED263676E829E32AA9E9D2E3D502F97B7DEB0E79C09C62D60E310B500D6B42EC60523526E40E25155B82ACED568290830A6186B1FEB647E88FB28513B89E6C216957931B34E49C71D859378094EBC81CAC651BAFA445ABDAFDAFC9976171E47A11162D0169B63FDE8E1ED8A434723DAC08E85A44ABF5A86D3CA20B170F410CA21AFA4BA82FA7244E0FCDC4EF9438EE7D154F36EBD80EEB021377286CDC59FC4D066BB4D976B389DAF9D8D55D659D7095245FBD26282CA4D4B52AB8DCE62F49BBD5A50F7A15C64560DFCEF96BB01DD87E89AA332DFD21FF0D04ED1CF95917FC1D5ACF86992DD7F06F1AF8F95231A2530AF57D6AE4ED39A7C0E48542A7C07F4F92B515A486F479A3ADE4420FD64BF3A29BCDEA5D7E79B56A98BA2C80287A788176BC97081CD6C8E9BCBEDF30B1A51C7F486D623D39C5A5022399EF15786D693623A87050EA40CAD3A07CCBDB4F0137EAEB2A59BCF6A05AB9D712CD5D2DB75BB8750DE2AFEC5ED304AB7AF1D27C8E30EF599A03E96F4335E6479E942F43FA39E2668EB06FB2DA6011EFAE9A8BF10EA5D0E154571768FC24891769D11B4F4E77EE92C79CDC7A34F00B4EE6C25BBDD3640E50063DB1A08F5F5CB230BAE8F794CC81042F2559E929F61DA45DF94B95B5048A9CE91544CF9B1857BB84BE3643FD6C0C057B9AFDDABCA1E0B5AAF5D527551322C94F2C3A0A5A9BEBF977BB9A541F6EEC1634253FECCE3EBB59AED77DAC42975083CDC3520A9B051D5F6E961CB17D172F468F4941A9295035A5B84681432C8D3E6EA33CDC4461B1EDB8189F9E9C709709092CF2482F0947A5D388BFE1E01ED1F1AE3C0CA28253790A8D09EECACB431AC6F37013446C2F98824295D0165B633A69A0D99C1BB0290E34C5B9A0B7F6641B74464975B1633A2104A05D2E2A8D34AC4C544429A826ED6864A1EED141C981FC04BED594DE3B81D09DA81D41877A128B4EAA034806717CFAB9BCA9870FDB4A2544633C3B24833CBC4DA251E9BD4888CE38490D4A2DC9688F5C20A2DA729B7F70D9105EBEB01AC80ED1A808926075522F02A13B3CB208101A12210D89A2436D6039988179122FBC92D83B252108D131B8703CBD84A9978DFD930D41B8954164035F937816B2AB179120EE85D0E62B4E3E1281688DCFA249740069A06F053C176383219F6FD3645D4BC9F353F2DC7E87C04870DAA4862547C271790AF2782022D4CAE53D95A3E2247997F4884E9B3B9719448404A9528E473E047CDC53A9400785BBE4427CAEDAB964D464686F5A95763CD221E4E6DECA47E7922338F6DC8364A4AC581CD78AC233715F05A23ED8DC2916B213D0EE850353A24484483E224191B0754FC5A53C00DC252AC253C2CEC5A4A242A2D449C7231E2256EEAD68E4A03CFBDA2D1E9243B23D8848438916139C7C4CA22266EBBE8A0B3E59DA2930F243A8EE4586A445090D957144622365EE9E0A4EF54C7787CC888F243A17979A0C09D3A41D8F9008B9B9AFF2819F16EC9211E9093BF7724290A264854C3F22799171762F64A6793343E891AD1ED8195DAE5629580539684EA55D6DC328BF8B9BDF9FC2285884F31AAE49BFCB8A10E249461D696B1ECB28467F06D6016CF83C83D4A328F9E7DD1A0D3B6CC737F46CC6788482045F8C175F12463A1BA8EEF39AC515D98BF15DCC9DBF64CFEB89218B1F8AA03FAB80F2D16C315647E5B638B6A6ED9184B015C195F13F3BF05A036B1A0E4457BC4E43580D462AA0498EE58AD0CEBBD1A4017894654521F48E61DB5AA2EE18F7B625E08E5812BB475772E85799811DE775F570A4F175547A379D081E06EAD0E0D5EB575E837B0DEE35B8D7E05E831F9C06AF9EA6FB8134B81297D847400F883F7DA8C08E58F3866B4A7B9879A595456F300FCF5CF183291DCCC3D35CD683A9C420C113C607C4A39E6CB8EEF7320613FBF321AC636D49393CD5E82565379272787AD785A428B1A93C297A783AD7FB44BC4F4413561656DA104E1A51DA10AF3D98B4A94CB7C691B607958490160A6727AE3C7AB4334F42A9ED0ECF6EF0DACE6B3BAFEDBCB633D1768767FB0EE42D2DEFC278CBD7AF0547BF16B43E1061C8CED698648698ADCF4218624A5E845041D3D123DEA6F47AC4EB11AF476CF588B7D624DCF1476FBD8AFD2154ACEC4125C3F347E28716944757F68A924A6B9467B6379EFCCCF633FB1867B63767C4AC69E22A78A3C6ABBEA3577DF2A71F0C79D9FD9286B1D0C81FBF308494BD23A12C8BD23708D411A40FFF892134759837DFBC0EF33ACCEBB043D661DE501532084574F246AA57F047AFE02DB7D32DEFF51AEEEFDBDEEF546E56EB23BDCA28FCF3BCCA55E54FA22A4368DC75D4506ADE6AF54ACD2B35AFD48E4AA9793356C29CBC8A3EE94D59AFF5BDD66FAFFE2E5E85316095AB2ECAA7E47E49A9583DED3CAC8A75B25269AA226F807A55E4559157457BA08ABCD92866101185DA1B8E5E5B1FBDB66E82957D0CC2F8731CE63D40DFA6499CCF3620F80A5CDE278CB6204F92FCC54C3F3FC2199B9855FD3CBB32A409E6495A5C8234FCA4B64DCB656156FC318368E2C8B1C3ADBDC0D640BF26C9120FEB2061E9B435B9B7BBBD26F79ADC6B72AFC90F5D93FB6D8B9045F523167ECBE217BAE35AE8B4C4DFDB795EFC7F60F1F78BA3903DD503617E6DF4CAE1B8948300B6B723E6F6C7B97B38A4EEFC84BEE0C8F91E1CA5FF35BC0D156AEA28436F297965E895A157865E19026F37CBB8831F4EF5B6B35F2E8E7EB9A8146801A7CA80DF0DB0547CB8315394DA61D6867886CCF8834B7F9F170835E7AD62AFE6BC9AF36AEEC8D59CB77751E23BD8C0FC15B6280FC2184F6508781BA6597E13E4C19700F68C6E1BAA350339DDB6F10865A0F6CD40B43C6972C88E8E9E10D3AACC8C130916BFD6010202384B44A1CA0D41370D42D508C850B9224AB8800AB147B0495211BFEA0C110994D70DFE196E54206B9761040414A85C1119A2800AD7562B90A1692A601ACE14F3ACCEEF2644BF869A09A871254424B9421D648BC70444C4AA7411892AAB53A48BC8B722E826472CD0556627BC904728590CACC08D267288109BC8145220F23BE894D73A4534EA0C117E9DD7899D27E5F97F313ECE14D3C0F95D74F0911D21252A5B488B2AD1410DB97144849A1C118D26B30BBE59398524C85C2119B20043EA32CB927958BE342254C6CF58EF124579B58CCB51F8656716A3C784580E1A050F09928913794DC1EA5056A6D2999E4DE8AE2974BBFE8ADDD665AE4C1FDD6516F4B26293E6AC9B14F3E43D258B391DA101BB4C2CAACFA565F5908225484179B189EF7A5B71275DA0EA090C86B22E95EE9405B599D3DEF3AA94D38653F56933ACAC5A2739EDEE0CCCA1D1A13EE45CF96318F3A79730D5E0015BFC5059808DDCE7A651A2858C2BE5BEC3BCB15E69489C6CDD5DDAC07E2EAC84622F9FA7707F993FDFA6C9BAEEE0F353F2CC99E33C67EC00DD3351B21129EB77ED2EF4D9593E66D6D1E76AC3C1B34EBDB27B36511BA7B296785FA4CF92EACD908E7E351B259E2D7A00EE59C36CFD2AAB4CBCAF33614FE724417B3D1163D4AAF6C19294E58793E983435D76F58BD89C0A186300D30393B8DD3762957C5FADCF301450A9A397F54E9B67944E75F70CA2DD0665358953C0843175D880CEDE6117818841FA307D308AF58154CC927A370C18465C59EAEA2BE5E91030CD10AA07C6099C3A88756DCE1A7DE655A7723A3ADB786F7896E901B86714E38F2AEBC99C4D06ECC11F72BA7A487A9E046C3202EA815DBC7F0DB1ACC5712667DB74C27CD669F2A613E49EAB12E04F38E3831528BE204559993A9D3C6E61ED3540BF6E4016AE30C41462C680FE8CD494B98B9709ECED06A465F3C916D545EAEC5A49803C5804797099E6E13298E7D599C0F252E95F83680B8BBC5B7F018BBBF87E9B6FB639EC32587F89284FCE74D24E7F3AE1DA3CBD2FBF2C662EBA009B19164726EEE3E2CBE1A269F72DFA22385180283EB7BD07717952138E2594C01CAC5E1BA44F706D5703AAD8770336205E80387F02EB4D04C1B2FB78167C03266D839BE15FC02A98BFC2F46FE1A2B81C2B03E91E089AEDD39B3058A5C13AAB30707DF813CAF062FDFD4FFF0F09D8B78914160200, N'6.1.0-30225')
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'201404111836375_MigSugg', N'ProductComparison.DAL.ProductComparisonDataContext', 0x1F8B0800000000000400ED5D5B6FE4BA917E5F60FF43A39F768313B7ED390992819DC097F18C91E3B1E1F6E46CF262C8DDEC36316AA923A927E35DEC2FDB87FD49FB17961275E155E24DEACB100318D324F515592C16AB7829FEDFFFFCEFD99FBFAFC2D13790A4308ECEC72747C7E3118866F11C46CBF3F1265BFCF60FE33FFFE95FFFE5ECC37CF57DF4D7AADCBBBC1CFA324ACFC7AF59B67E3F99A4B357B00AD2A3159C25711A2FB2A359BC9A04F378727A7CFCC7C9C9C904208831C21A8DCE1E37510657A0F8817E5EC5D10CACB34D10DEC57310A6653ACA9916A8A3CFC10AA4EB6006CEC70F493CDFCCB2AB78B50E1298C6D1D1F5C52FE3D14508035499290817E3511045711664A8AAEFBFA4609A2571B49CAE5142103EBDAD012AB708C214944D78DF14576DCDF169DE9A49F3610535DBA459BCD2043C7957B267C27E6EC4E471CD3EC4C00F88D1D95BDEEA8289E7E30B982076CF610E0F92F18825F9FE2A4CF2E2024E175810A447452F1DD1483F8D3ACAFF548B0F92B2FCDF4FA3AB4D986D12701E814D9604A8C4C3E62584B3BF80B7A7F82B88CEA34D188E4797410A708DF2DE3D2AC990AD44ED44A96B90646F652BF3BFE351F9559620691E8FEE82EFBF806899BD22F945E27B03BF83799550CAC3970822D947DF64C906FD9CB4D2C8D15B689CBAA0710DD37518BC3D0411082B5A97711C8200C9C667C49EE0250435B43AD61075BF0AD08845C2D73F8F5620CA052B6DA174E282D26790FD0AE0F235AB085DC7486081764F3CC4FF04F9D84937AB351EE6F670D3CD7A1DB6F1DA80036793467DB42A95AB2003CB3879B3512715466F8A84E621CAA31208B63E8205D3AEDB6BAE0F262C002FFECDB7B68A4853202AD21D5AF06727A30FA4B30452622C143E235A9F836F7059C8114375BA796964EE11844599F415AECB4982C87F6E0ADE24F1EA310EE9EFEBFCE7A72059827C6CC72D85A6F12699998E13AADAE6438580D9A5D14254CB64C0309F0F3C6608EABB336C4ECD864D8F9A487580BA1F9DD5C06B1D9DD510361A9DC8B0FA6A332CF3EF77CB0CFE08A2A4773BF86293BDC649DF542E61943BA51D86AB135298FD41C7D8744DEA6F206863E2CF0EA87DC0CEDAD68CC41548023B133147D8AD2186EBD421964EA68C4790C6E1A6A3039D509ACE1200A229FCCFDEDBF4F7385EB9A5A1218E56AB1FE8F35D13C46408AFFE0E862058024B97B5608FDBAAAA773C08C387D7380256DD5F81EC9610946B3C7D0FDB7BF403312C5A4EDFD20C381EC18259328967204D5B8D0C27849EE2CDEC156B3FDBD5365E871A0E95691644F3CBB727B8D243521E0F7788DCDC662C1400BB350EDC68A9CB78FE36844EFD98C49B687E85AA9C04D1AC26771B65EF4EB52B7DB301E153107D65975FCDD03EA23AA5B663E169F3024234809FDE12600D66B002AB311432905CC2AF5653430D728843E243B484116065CB10EC737CBFA004CC4C46B72D5E4E07B4BAAC6E5238ABE65F0B696D60764B5EEB6D9DBB0046489D667DFBE235C19B248EB2E91A045F41FFCB1AE10664719CBDDACAED633087B12DC897E9A5753DC02C4EE605AF2C0DA84D528CA269FEC716ACDEB96385C954735578BFC6F1A291926DEC072A2B8C6AD459288B327F97361DCA9A986C38109F0EBCD950521E62A3E1218133DB49FF12CD62F3412AFB1A67710B11C36DC4E1F643FADDD272B2F952CA9E70E385CDE3365DB802A20D179B8DDB8A00558EAF20B9F923AB2359C66A5FE8291F2A567A1323EC967D35F01A8EB3F590C11683065A4B13ACEFECC1F2D6AFF006EA61A80F37E4CC7D83696107590CB91A65B7865D29551DCB4A27BFDBA521F7E9DADE2B50D8BBDAA9337A0E5CA161CCFA47B08E13ABD90923EC92518F6B6462D3375F0E6CD2DFC0103C048D1FDFDB699E6B64D3DC2FAE12401D50C853F114A22BE7294886B44D737A286901F31120300089FCE74AB41BFB8FCFE54EED098A589DD9A32A6C3EC808985D1A6955F7EB8E3357626320AD439CED7F48C00224209A8193E1489D0E47EA5DDFA4AEDA0FFEFFDE91E59CB5498213221F41346F5D0636A322D58F373049B3A6A33A7524575EAC2C99629CD3DC5656D7C7AFD4B60BEDDE564F6602505E8200B3389A6BB098FF405C65B65C6BE5B9C2BACD787A85894E2BB8F2E24630C55ADBC096B55A65996E964B9066966E5F83B24BB36C532BB383F1E4D703CFB89F6066B93DFB58AC32DD207B15B1F62A413D307301F80092459CACF2FD5577A0D72085CBC8355E3E661C37D91564D92DF6700E3753543560BDA125BC62508D99E7BA1879C180CD155C2FE08AE8A8B78B348D67B0A815BFF2DDACBDD32DFD10CD472A37209A25276A99FC0E692FB846FA0AD5E77CFC1B8E911DF0B523D5C0CBB08F8F8E4E38F8473C0FE4B7ACF3450FA4406194F1BA114633B80E42859A30DF0A35ABFCC251DE37353536E71AAC73BB2ECA14F86D5F8D9A1AA3F8BB38763621C4A85DBAB85D1D59D7CBB778F8854C0D89926E0C0D2A4DB25A0C284932FEEE9514916AA5ABC7855B714E6449B481A7A6FBDC4B94A02E2A3DDA7A25D248AE04EC76529101A4ABCD6D95C982920FDBC804B558A72E712ADE6FB74CBB933A85FAA874BAF46C8C96E42974815A658825B5ADCB5FB9F8A02210EC4A8492B40965A1155F2067D50A4997205BCB18DD4495DE14AF1B1BCB15CD03BB0A0C2C49DCEA904A9FCB978A9CEA32E922D3B69499AC42DBD166B25ED05367A73B2084ECE29E8A704857FA9C8AA06C8D705B1228A9CF760450D2057AF2F76E4BF227586291AF37C8D75B4883BE5901D659CB902ED40C2963F26A0C275A72365BD7C1B93CE16533F44D86BE00095D8766C9FE3AC882BC10F82E3AE282C652B93390968B87AC94E444A620A31D6C985F136AD6EDB8E5094ED66894C6971203518E690756D960114C2DB21D10D876122154F6630700A1914428D424D0C99A4A02C58C6906380344488988D1649C18A2685B3C195684151757EB1671FDCC0D0AC5F55402510E478D135456813BDC929F8033EDCB826A0B8344FD1B696D61867429B06F4650E34ECE0BE9E296F2F2962947440B5AAAF266C097D663023C7F949767B417688836D2BAA685672A4B320AFD60C9B64A83B6734BB498A0BA9C60CB1B66F58080ABE705A71CE10F43B4F3A6DD3DD677906DF9257589FB1726EE04463BE75A7D3A6DAFCE966F323FAE1FB689B66F45F37EBB07A2EA83503A9830605A677CA9D761C7916A43B9B68CEBBCB3098E865D269C4D2461B3CFEE82F51A464B228C7699329AE218DA57BF9DEA47965E618CC92C150498AE6B5B53CAE224580226179146352DD4796ED8BF04F9EEFFD57CC5156BF503242668459A31ACF93EACACD2EA83FCFF12F7230F2ECE04BA16F85225D00D6AF12AF7C6F2C603420C6800AE4A05C674168441223F547115879B55D4E9A9C9B1F0B1591206A7A823E03B2B24024E5147A0C3599348748E19225F3F3E571DB98971412236A93A756C0254D3B56BD235FAB1B9E042756693AC8EC5DF50A1C48CCBD544AE625273A055068F7736610613B712C18D5FFB015E04FED41FD6F9675B1ACC65604F12A74C52C7A8E2769220559A3A0A15979384A2323404870CBE49F189CC30C2C31136259838531DB78EA549E2D5893B22D865C84D7DD1C61F6E49B8C9909AB4EE6DD2D5D1C8AB87241A99AE8E46DEA924D1C87475341CFE92C4C1293B233E26D6CE55B02D13A70E81494B4DA22B3275A82C12A74ED4C0C1512E29149CB42B1D5C87C234E8E6EADB2D75767D3D5F60F0E9E0707110483C2E5363E269E214306DAD92352C6FF2E23E65809319DBD2625404030A8ECCD81191C7D12EF5C5BDF86E4BA2EE4A1F35F12C2943AD4ED5B03FD900779425CA66AAE3F2C12B49603E57C7622EE20CD2167391A4310CE94083D440A4B3D43145BE9CDC91DBD290A9A2629A0C1B94907FBBE743878D7B4959FD4C9E862FDF04C0A47CF926799F84B32F65B11DA127C26B1A887DF3F5D6CC232E7CA670EDA9C936C0A623650AF1E9221A73551318939AAC9A640D1710C7C6A4BC3F9CA48E51C48321118A041D37B48E8B497BA175B286C14587C6A44C2E3ACB6059512C2F826C03EC2A5AA610B9CA1C72F9B267D5729BE6FFBF5FFC9B58C794A9FF6EA06024FB5D2DBC72A85B1EC8F0950234DD8D853246258D04F52C47224625A52F9A648DFAE03094547D7092CE5A4473DB865E8E90DFC291A331D777E811DF7AB3674BD3671933515FB0F1875B9A34FB5A0B70EB6FBB5C5970B58A62BA0630D48A078E5748D9B145CAAE0C9726E6A1C190A93FDEEE529C74FF557775C1ED70F9C434F19356DBDC6E1FB8DCBCB5B54877DE7A323D8D11CFE1A2DCD5BBD944B3ACF07244D48BE2B7518A9852151C55FF29676BF6B80A3E82C354E2196388069FC2F07B409EEF0A6438B0199553C5A7195F21AB1EB157DCBB4A569A9808CEB32553586A1C8122D50E9A30DE187822C7B2F6D8AE636B8F53EDA049AB8CC127B3EC8830D61F4387C9B52325EC08177D80A707061827DA01D3878A180274A63B42C2D6F0056C65AB5A6CE424ABCAB06D517336896B4B93652951CDB4C78A55936339BEB9698C1DEA5C010704ABF34D225A559E1A99B3093D3F898A7C59CFD120B79BC130869FC1FC0CE667303F83F9194C55A2FC0CD63D83D1F393A8C8350881ED0C8631FA9BC1EE13B88451203B9D3EA1DB20F29595FDD2410F390FE02DE7A4BD8FEC2D8CC3B730CA43F80C8932D50EBA3A9ACF6057C99652441ED667E588CCB39424F20C3F2B4F649E3332F858BF9C14CEB723579FFA67C8D4E95B76F50AF5EB1D3CAF7EBDFAF5EAD7ABDFA1FD9442FD7AEFC4F4A6DA00FE0926EE3D143F451EFE14495EA2E4DAD364D911210F473044C82C4BA611A741588E11597644F07D4C061E276ED9AA2F9596B7EBBDD2F24ACB2B2DC74AAB275BB8545ADE1A36BA783F8829EC4FB3F929E587985212C97C92B8984CEA2BA60C7C9D6E098FC348B0E03875EB86A93F4EE4558857213F820AE9CD4CF4E739AC62F70C612956F4BDBDE895FDE12BFBFA4EA4F85CA42D3C77B99421C3E55B8F8EEAAE283F36AA1CCB33B1E4454DF6682C99B7070B2AD42556960A99B76DD3BBD6C9DE00F73AD9EB64AF93BD4EDEBA2F53EB64EFD11886661CC09B29687B4FC6CF9A873F6BF6BCAED4841365FBBACEB03CE4C9460C648F7BB2F976E4F8A0A30C3DBE80ED21D622F2237788B548B59CFFE94090AC0540E7DA91925C8BD3BB13D79BA384D5BD7792BCBAF7EADEAB7BAFEE7745DDF7E4836175EFFD2F8B38DF83F860257DEF87F989D94FCCB6D7A298A8F4ECED2826DB8E1811B19EA143E4FC5893D9C0F64C8FAE52A595BDBBE4B5B2D7CA5E2B7BADBCFD5DA5462B7BAFC6EA219721FC9AA606DEB3F173E8E1CFA182C785B8131A5C094724E9F7866464E95296B2D73C49C4CA5E9363793511BF56C4DE4AC4A976D045D07806B848B3BD4C59BF6BC4DDA5AC736C059A7AEA8813682AD7D290E25F3F620D2ABE842392D5B348328255BEA576EB2BCA647F7E2931AB7ACFD4CFAA7E56F5B3AA9F55FDACAA4672EF67D5BED6158859D5AF2CB4AF2C3CC8DE601C6455A1A4EE5714BCED7338B64F6FDE42355ABCA7E047CB018D969EAC806AB4780BC0F495DB010C004CDCCFFF5EA31D8E4693911AF82AE62017181FFABFEFD9F30559C75730A5670C86B9B58A1F84664F1714895B365E4B4DEF6D57AFE9BDA6F79ADE6BFAED6BFA9E1CAF52D37BBFABC3EF42F5FB06F3B66CCBF7AA2BE0FD2F3F2B1FFEAC5C4E236D2FC3BAB8EB39C86CFC89E7D5276B060D123C7E80D7667BDAB8DEBFE3458486F77E97D7F05EC37B0DEF357C0BECFE1D752134FC0FE46F55F9539009B3D95C5ADD4190B25C327ADE046B2D91F386216E9260B94222319A667102EA3A35BA55D457DD8AFA0A0DD355C4A70B7BA5150DCF4E223C9CA38E780DD25902CB21410252193C1E120A9A574338DE6D3D37C8EB3498BC81D33DC87C4DCB80848C0BC386920D76B626F3B66C45D71DA66F43FB0EDBC6A4587798FE94A8DB61FB3F293606B89B799130E80DA6C6D6AF153D0C72FE61B2D46734E2437E9AE432FB9F29DD5A065B99773B246380A997A881C1EC3BA023CB09989CD80E2AF64166C3DEA67B5248F4677C2F24BB25243D9918A490E85B196642B2FFB6C62358C749E6C2CAC048060686EC43F98A595E9E9D5D9B54F599FA0686E021C86FFC91484DAA860D81A4E37E7195804060463079EAA85F903665DB59A5B9B7200C2528AF10AAF70271CD8518117006B2D4FAB51B36B7A1F0766993AA8EF4908005401A74064E68302AC304EF5486776A86F74E86F74ECB602E625251A67291A2E11A64B94D403B0438491DE32388E6F9D54C12A44ADB99C136DD2C9720CDF5881BC7B04233F20BE51FCB67D9EA1BDE2B2473D47BED13449317858453D4111E8B637F37483B6F127095C00CCE989945544017FF01248B3859E541BEE434048574E920B30F2E2339093ADF0C3DD769726C9C6BC11F193C57C4B08F65F854B68E36AC3766685D5827EF8CB3DF36DA07F1F5AB0A18B9FAA482E0EC7332D37297B7D01FEC3E6F91681B1742A047B8281182322EC80A548B90B4A09C0BF2B4DA1152A68BB8238AC7730B495CC031935BA872A51C8A550B59AA849343422ECE21F5B866542B1B932523AF6CBCB23120EA95CD6E2B9BDED61E6B6563B2F4A8AF6CF665E1B1CABC8AA32C801148D822B5255CA6D4BFD32A21F73B832540150661DA7C87395FB0305D073379E7209626F13788FC78C4CDE272D7515EE068FA8FF02A8485AC5405EE82082E10B79FE2AF0031F9F4F8F80FE3D1450883147D0AC2C578F47D1546E9FBD926CD6234A6A2382B18783E7ECDB2F5FBC9242D28A6472B384BE2345E6447B3783509E6F1E4F4F8E4DDE4E46402E6AB09FB7909AB8472FCC70A254DE72129668447408F1C5A16CFFE02DED81EAE04F2112CF84137617A9BFDFE4C3E5EF3BA9C8FA36F41327B0D9022B80BBEFF02A265F67A3E7E773C1E7DDE84617E31E97CBC08C2945BAC9100E3D5B416E89F29E82CD9282017E78E31E6228C834CBB72C4D962B755C3878A5B304F8EB541C9BD0C169915CEF7B7D11C7C3F1FFF57F1EDFBD1ED7F3C379FFF34BA4FD0B8793F3A1EFD774BF7AAD489D96231A81685605C3352DDB58E2EF1C6B9DAF0921F05E81E5F6D5CB21B60F4D6A45331A676236D8459B97BA4471BD47AA8F5944A77277548B35D3F71BBC85BE9AAD37DD43BCAE223DA9454931CD94664B7D0345FBA95976643D36D77B21B9B183D37B0B3E2D2B66635AB2D3703C9C09FF62F15D2ED4535D1106F2AAA9854C4BE9F017B88EF1DCED8D4EEA155AD4E7BA9D53BCB5ABD73582B996CDB0DEC6673591957494D17BBAF2D90BFD7B7EEF06EAC53CC6A73D60254C39A10EF9DA81A13F2CD4D155B82FCDAAD04E1A5468C09237DB747B884680B275816B485A4D7FBDCA0E1C52D878D7503482DBD9983B5B8F14A5AB4FCBAFF39F902E6D7FFE630AF0948D2DD59EDE8814D4A3DD7C38C80AFE8B65A8FDAC623BEFCFB104420ACA05FA0BE9C92383D54B37933CF71EBCBB70DD20E77581798B8CF6BB39CC5DFAAB5469B6ED6EBB09D8F5DCD55D6099771FCD56B82DC424A5CAB828B4DF61AB75B5DFAA09730CA1F99E81CBF06EEC0E6252CB739FA43FE1B08DA39F2B32EF8073C9F0D335AAED0DF24F0E3A56444A714EAAFA991911C9C0293C12D9C02FF3D8E5756901AD2E78DB6820B3D582FF5EBC236B377B1F36A553175590061F8F08AEC782F114D884DA7E3FA7ECDC43975BC915AC71D758A4B05E934F715786D693622A8D0A4EA40CAC3E00E519BFB21E0467D5DC6F3B71E542BF772B7F952CBCD06B9AE41F495F5354DB0CAD7D7CDC708F3B6BA3990BE1BAA313EB2B878A5DC8F113763E443B4841160E5CF0CEB737CBFA0A4D0448CB728850E87BABA4037CFE3799116BD37EAD473973C2CEA7645A3794DD45C78CB3743CD018A007C16F49BD73F2D8C2EFA6D4F7320C1AB9D567A8A7D93735BEBA5CA5A024771F70AA26727C69597D09733D48F6328F06976CB79C30F29A87EAF3EA8EA709D7E60D11179DB969E7FB7AD41F5E9DA6E42535A87DDDAB69BE57CDDC72C748134D80C1652584FE84DA01DC911DB0FD17CF418E794EA026555F26B144DB8CFD1DD26CCE03A84B9DB713E3E3E3AE2025B1058E4915E128E4AA7117FC3C13DE2E35D190CC29C5359828C09EEFAF54302A3195C0721DB0AA6A05025B4C5793B9BD4D06CCE3558E7079AA24CD05A7BB2353AA3A4BAD871362104A05D2E4A8D34AC4C944429A83AED6064A16AD15EC981FC04BED590DE3981D01DA81D01307B128B4EAA034806717CFAB9B8A9D71CB6954A88467F76480679789B44A3D27B91109D7E921A945A92D11E454B44B525B2D4E0B221BC7C61D5911DA2511224C1AAA45E0442B77B64D1C83424421A9E4F87DAC0723005B3389A7B25B1734A42102E6E70E1787A8589978DDD930D41E8BF41648388C12064572F2241DC0BA1CDD726F94004A2357A9826D101A481BE15F09CF74D03F97C93C4AB4A4A9E9FE2E7F63B044682D326352C39128ECB5390C73D11A1562EEFA81CE527C9BBA44774DADCB9CC60222448997238F221E0E38E4A053E28DC2517E273D5CE25A32243AFA6956987231D426EEEAC7C744E398263CF3D4846C28AC561CD283C13775520AA83CD9D62213B01ED5E381A4A948810C907242812B6EEA8B8140780BB4445784AD8B998945448942AE970C443C4CA9D158D0C14675FBBC5437248B60711A929D162D2241F92A888D9BAABE2D29C2CED1418F92154F72243D2A28486CA3820B19132774705071F36EC9219F19144E7E252912161EAB4C31112213777553E9A67AEBB64447AC2CEBD9C10A4285921D30F485E649CDD0999A963280B5764CB17204617CB6502964106EA5369971B1866B751FDFB330C83399C557075FA6D9A3F7011A7D491B63A7C72DEFB53B00A50C56729A21E86F13F6F57B8DB513DBEE148CAE3110E127C3E9EBFC48C74D650DDE735F32BB2E7E3DB883B7FC99ED71343E63F14417F5601E5A3D936581D1FB7C5B135AD8F2484AD08AE88FFD981D71A58D3B023BAE2751AC26A3052014D722C578476DA8D260DC0A32C2B0AA1770CEBD61275C7B8B52D0177C492D8DDBB9243BFCA0CEC38AFAB87238DAFA3D2BAB38920567C87062F9FD5F01ADC6B70AFC1BD06F71A7CEF3478F956C90FA4C195B8C43E48BF47FCE9430576C49A379C53DAC3CC2BCD2C7A9DB97FE68AEF4C6967EE9FE6B2EE4C25069177F3F64F7BF564C375BF973198D89F0E611D6B4BCAFEA9462F29DB9194FDD3BB2E2445894DC549D1FDD3B97E4DC4AF8968C2CAC24A1BC249234A1BE2B507933695E9D638D2F6A09210D242E1ECC495478F76B6925068BBFDB31BBCB6F3DACE6B3BAFED4CB4DDFED9BE03AD96167761BCE5EBE782839F0B5A1F883064676B4C3243CCD667210C31252F42A8A0E9E8116F537A3DE2F588D723B67AC45B6B12EEF8A3B75EC5FE102A56F6A092E1F923F1430BCABD2B7B4549A536CA23DB1B4F7E64FB917D8823DB9B3362D6D47115BC51E355DFC1AB3EF9D30F86BCEC7E49C35868E48F5F1842CADE91509645E91B04EA08D287FFC4109A3ACC9B6F5E87791DE675D83EEB306FA80A1984233A7923D52BF88357F096EE74CB7BBD86FE7DDBFB9DCAD56A7DA45719857F9E57F953F993A8CA101A771D35949AB75ABD52F34ACD2BB583526ADE8C9530272BA34F7A53D66B7DAFF5DB3FFF102D610458E5AA8BF239BE5F502A564F3B0FAB629DCC549AAAC81BA05E157955E455D10EA8226F368A194444A1F686A3D7D607AFADEB606577018CBE4430EB01FA2689A36CBA06C157E0F23E61B801591C67AF66FAF9118DD8D8ECD32FD34B439A601627F92548C32DB54D524C0BD3FC8F19441D478EED6EED09B602FA358E174DB70E12964E5B937BBBDB6B72AFC9BD26F79A7CDF35B9775B842CAA1EB1F02E8B9FE80E6BA2D3127F6FE779F1FF81C5DF4F8E42F6940F84F9B9D12B87C3520E02D8DE8E98DB1FE7EEE190BAF313FA8223E73B7094FE57780315BED45186DE52F2CAD02B43AF0CBD3204DE6E9671A77938D5DBCE7EBA38F8E9A254A0399C2A037E37C054F1E9DA4C516A87591BE21932E30D97FEB6170835E7AD62AFE6BC9AF36AEEC0D59CB777851C9A6E964B9066FB69EF369577A92B3EC1CCF004F563E178DF8020DB24E02A81A8A136400F2059C4C92A3F0B6D0F760D52B88C5CE17C499B4313964DB3852AD96D0E33F438DB3F83CB8F333FCEF66F9CEDDF8CEF609C8999F401D5317B4395CA021835F63B02BC81499A5D0759F012A0C6D1D5C35F4D414677E078843370FDA6205C1CD539645B474F986F6566CA09088B5F19FE02024D968842990B41370DC2BF1090A17245949A022AC41EC13A4E44FCAA324424705E37783E10116B173004020A54AE880C5140856B95600A99D6648A7956E57713A29F404F05D4B81222925CA10EB2F90B42226265BA884499D529D279B87B11749D2316E832B3135EC8239C2C0656E0461D2E4C884D640A2910F91D748A580E221A558608BFCAEBC4CEE2E2D29F18BFC914D368F2BBE834E7748594A86C212DAA440735BC77232254E78868D4995DF0B5BB2C2441E60AC99005185217691ACF60F1BC9850193F377A9728CAABE5A61C855F34663E7A8C89E9A056F088209938917F29981D8A8FA974A66513BA690ACDAE8EAEB535992BD347739909BDF8B04E73D64C8A79F29692C59CF6D0804D2626D5E7C2B27A48C00224A0B8CDCC37BDADB8932650DF090C86E25B2ADD290B2A33A7BDE56529A715A7BEA7CDB0E2D32AC96973A760868C0EF52EE7CA1F429F3FBDC24483076CF17D6501E177D695124D645C29F70DE68DF5524336C9D6CDA50DECE7DC4AC817F0B304F997D9F34D12AFAA063E3FC5CF9C39CE73C60ED03D13258E48F17D9777A1CFCEE205D38E36970E07CF3AF58FDDB389729C8AAFC47E913E4BCA87C23ADA553B4A3C5BF400DCB38671FD4AAB4CECD799B0A77390605F4FC418B54FFB6049C2F2C3C9F069E25B77B58B704E058C3180E981499CF78D5925F7ABF51986A32876B4B2F2B47946E97CEE9E41F4B241F1996451C0843159192BA8B375CD12818841FA307D308A5D032999255DDD306018714FB9ABADD44A87806986503D304EB0A88359D7B658A3CFBCF2286E4763EBD51B9E657A00EE19C5AC4715DFC9169B0CD8D39CDEE86A21B9F224609311500FECE2D7D730CB5A16CEE46C3B9B30DB3A75DED9042FCF9509E8271AF1C112E43B48615AA49E4D1E37E8EB15C0BFF06E630D71863023406F23D5656EA3458C5ABB0649517DB24655912ABB5212200BE641165C24195C04B3ACBC08504492F86B106E50910FAB1730BF8DEE37D97A93A12683D54B48ADE49C4DDAE99F4DB83A9FDD17C78952174D40D584F9B6FD7D946F1ECEEB7ADFE04DC1890244BEDDF61144C5F50CD497480233B07CAB913EA3B95D0DA864DF355883680EA2EC09ACD621024BEFA369F00D98D40D39C3BF8065307B43E9DFE03CDFE29581747704CDF6B36B182C9360959618CDF7E82792E1F9EAFB9FFE1FCE95C69495280200, N'6.1.0-30225')
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'201404111837509_MigRep', N'ProductComparison.DAL.ProductComparisonDataContext', 0x1F8B0800000000000400ED5D5B6FE4BA917E5F60FF43A39F768313B7ED390992819DC097F18C91E3B1E1F6E46CF262C8DDEC36316AA923A927E35DEC2FDB87FD49FB17961275E155E24DEACB100318D3BC7C45168BC562912CFDDFFFFCEFD99FBFAFC2D13790A4308ECEC72747C7E3118866F11C46CBF3F1265BFCF60FE33FFFE95FFFE5ECC37CF57DF4D7AADCBBBC1CAA19A5E7E3D72C5BBF9F4CD2D92B5805E9D10ACE92388D17D9D12C5E4D82793C393D3EFEE3E4E4640210C418618D46678F9B28832B50FC403FAFE26806D6D92608EFE23908D3321DE54C0BD4D1E76005D2753003E7E387249E6F66D955BC5A07094CE3E8E8FAE297F1E82284016ACC14848BF12888A2380B32D4D4F75F5230CD92385A4ED72821089FDED600955B04610ACA2EBC6F8AABF6E6F834EFCDA4A95841CD366916AF34014FDE95EC99B0D58D983CAED98718F801313A7BCB7B5D30F17C7C0113C4EE39CCE141321EB124DF5F85495E5CC0E9020B82F4A818A5231AE9A75147F99F6AF1415296FFFB6974B509B34D02CE23B0C992009578D8BC8470F617F0F6147F05D179B409C3F1E83248016E513EBA472519B297A89F28750D92ECADEC65FE773C2A6B650992E6F1E82EF8FE0B8896D92B925F24BE37F03B985709A53C7C8920927D54274B36E8E7A495468EDE42E3D4058D6B98AEC3E0ED21884058D1BA8CE3100448363E23F6042F21A8A1D5B18668FB5580662C12BEFE79B402512E58690BA51317943E83EC570097AF5945E83A46020BB447E221FE27C8E74EBA59ADF134B7879B6ED6EBB08DD7061C389B34EAA355A95C051958C6C99B8D3AA9307A5324340F511E9540B0F5112C987EDD5E736330610178F16FEADA2A224D81A8487768C19F9DCC3E90CE124889B150F88C687D0EBEC16521470CD5E9E6A591B947101665D257B82E170922FFB9297893C4ABC738A4EBD7F9CF4F41B204F9DC8E5B0A4DE34D32339D2754B3CDA70A01B34BB3856896C98461AA0F3C6708EABB336D4ECDA64D8F9A487582BA9F9DD5C46B9D9DD514369A9DC8B0FA6A332DF3FABB65067F0451D2BB1D7CB1C95EE3A46F2A9730CA37A51D86AB135298FD41C7DC744DEA6F206863E2CF0EA87DC09BB5AD19892B90047626628EB05B530CB7A9432C9D2C198F208DC34DC7003AA1349D25004453F89FBDF7E9EF71BC724B43431CADBC1FA8FAAE096232C4AEFE0E86205802CB2D6BC11EB74D551F7810860FAF7104AC86BF02D92D21287D3C7D4FDB7BF403312C5A4EDFD20C389EC18255328967204D5B8D0C27849EE2CDEC156B3F5B6F1BAF430DA7CA340BA2F9E5DB135CE92129CF873B446E6E33170A80DD9A076EB4D4653C7F1B42A77E4CE24D34BF424D4E82685693BB8DB277A7DA8DBED980F02988BEB2EE5733B48FA84DA9ED5C78DABC80104DE0A7B704588319786035A64206924BF8D56A69A8410E714A7C88963002AC6C19827D8EEF17948099C9E8B6C5CBE9845697D54D0A67D5FA6B21AD0DCC6EC96B7DAC7317C008A9D3ACEFBD784DF02689A36CBA06C157D0BF5B23DC802C8EB3575BB97D0CE630B605F932BDB46E0798C5C9BCE095A501B5498A5934CDFFD882D52777AC30996AAE0AEFD7385E3452B28DF340658551CD3A0B6551E6EFD2A143D912930307A2EAC0870D25E5210E1A1E1238B35DF42FD12A361FA4B1AF7116B710313C461CEE3CA4DF232D27872FA5EC090F5ED83CEED0852B203A70B139B8AD0850E5F80692873FB2369265ACCE859EF2A962A53731C26ED95703FB709CF9430673060DE44B13F877F6C0BDF52BBC817A18EAD30D6DE6BEC1B4B0832CA65C8DB25BD3AE94AA0EB7D2C9EF7669CA7DBAB6DF15289C5DEDD41D3D075BA161CCFA47B08E13ABD50923EC92518F5B6462D337350736E96F60081E82661FDFDB6D9E6B64D3DC2FAE12405D50C853F112A22BE7294886B44D737A286901F31920300089FCE74AB41BFB8FCFE56EED098A58DDD9A31A6C3EC908985D9A69D5F0EBCE3357626320AD43DCED7F48C00224209A8193E1489D0E47EA5DDFA4AEDA2FFEFFDE91E59CB5498213221F41346F75039B5191EAC71B98A45933509D3A922B2F56964C316ED3DC5656778F5FA96D17DABDAD9DCC02A0EC8200B3389A6BB098AF206E325BAEB5F15C61DD6E3CBDC244A7175C7971279862AD7D60CB5A7959A69BE512A499E5B6AF41D9A555B66995D9C578B2F6C02BEE2798591ECF3E165EA61B64AF22D65E256804662E001F40B28893557EBEEA0EF41AA47019B9C6CBE78CE32EBB822C87C51ECEE1618AAA06AC0FB4844F0CAA39F35C17231F18B0B982E7055C111DF57691A6F10C16ADE23DDF8DEF9DEEE987683E527901D1B89C2837F91DD25E708DF4156ACFF9F8371C233BE0EB8D54032FC33E3E3A3AE1E01FF13A90BFB2CE9D1E4881C228E375238C66701D840A2D61EA0A35ABFCC1513E36353536E71AAC73BB2ECA14F86DDF8C9A1AA3F8BB38763621C4A85DBAB8531DD9D0CB8F787847A68644490F86069526592B069424197FF74A8A48B5D235E2C2A33827B2243AC053D37DEE254AD01695116D7D1269245702763B69C800D2D5B66D95C982D21EB69109CA59A72E712ABBDF6E997627750AED511974E9DD182DC9531802B5C6102EB5ADCB5FE97C501108D613A1246D425968C517C859E521E912646B19A3BBA8329A62BFB1B15CD13CB06BC0C092C4798754C65CEE2A72AACBA44EA66D29335983B6A3CD64A3A0A7CE4E77400859E79E8A70483D7D4E4550E623DC96044ADAB31D01940C819EFCBDDB92FC095C2C727F83DCDF421AF48D0758C7972175D40C2963F2660C275A72365BB7C1B93C61B719AA93A11A20A1DBD0B8ECAF832CC80B81EFA22B2E682E95270369E93C64A52427320519BDC186F933A1C66FC7B9273859A3519ABD941888DA987660951D16C1D422DB01816D271142653F7600101A4984422D029DACA92450CC9866823340849488184DC689218AB6C593614558D1B95AF7881B676E5228FA530944391C354F505905EE702E3F0167DADD826A8E41A2FD8DB4B63043EA0AEC9B11D4BC93F342EADC52766F997244E4D052953703BEB45E13E0F9A3EC9ED176D0107DA4754D0BCF545C320AE360C9B64A83B6734BE44C507527D8F286F11E1070F5BAE09423FC658876DEB46F8FF537C8B6FC926E89FB1726EE06463BE75AF774DABB3A5BBEC9F671FDB04D747C2B5AF7DB7720AA7B104A0713064CEB8A2FDD75D871A43A50AE2DE33AEF6C82A3619709671349D8ECB3BB60BD86D19208A35DA68CA63886F6D56FA7FA91A5571863324B0501A6EBD6D694B238099680C945A4514B0B759E1BF62F417EFA7F355F71C55AF7011213B422CD18D6FC185656695521FFBF64FB91071767025D0BF65225D00DEAF12ADF8DE59D078418D0005C930A8CE92C0883447EA9E22A0E37ABA873A726C7C2D76649189CA28E80DFAC900838451D810E674D22D13966887CFBF85C75E426C60589D8A4EAB4B109504DB7AE49D718C7E6810B35984DB23A16FF428512332E5713B98A49CD8156193CDED984994C9C27829BBFF613BC08FCA93FADF36A5B9ACC65604F12A74C52C7A8E2769220559A3A0A15979384A2323404870CBE49F189CC30C2C31136259838531DB78EA549E2D5893B22D865C84D7DD1C615B724DC64484D5AF736E9EA68E4D343128D4C574723DF54926864BA3A1A0E7F49E2E0949D111F136BE72AD896895387C0A4A526D115993A54168953276AE0E02897140A4EDA9501AE43611A0C7355774B835D3FCF17187C3A385C1C04128FCBD458789A38054C5FAB640DCB9B7CB84F19E064C6B6B41815C1808223337644E471B44B7D712FEA6D49D45DE9A3269E2565A8D5A91AF6271BE08EB244D94C755C3E782509CCE7EA58CC459C41DA622E9234A6211D68909A8874963AA6682F27DFC86D69CA5451314DA60D4AC8EBEEF9D461E35E52563F93A7B1976F0260527BF926799F84B32F65B11DA127C26B1A887D537B6BE611173E53E87B6AB20DB0E94899427CBA88C65AD504C6A416AB2659630B88636352BB3F9CA48E51C48321118A049D6D681D1793DE85D6C91A06171D1A9332B9E82C03B7A2585E04D906D855B44C21729539A4FBB267D5729BE6FFBF5FFC9B58C794A9FF6EA06024E75D2DBC72A85B1EC8F0950234DD83853246258D04F52C47224625A52F9A648DF6E03094547B70928E2FA2796D43BB23E4AF70E468CCF31D7AC6B7BEECD9D2F259C64CD4176C5C714B8B665FBE00B7FB6D979E05575E14531FC0501E0F1CAF90B2638B945D992E4DCC4383295357DEAE2B4E7AFEAAEB5D703B5D3E315DFCA4D537B7C7072E0F6F6D2DD29DB79E4C6F63C473B8284FF56E36D12C2B763922EA45F1DB28454CA90A8EAAFF94AB357B5D055FC1611AF18C3144934F61FA3DA09DEF0A6438B0199553C5A7195F21AB1EB1573CBA4A569A9808CEB32553586A1C8122D50E9A30DE187822C7B2F5D8AE635B8F53EDA049AB8CC127B3EC8830D61F4387C9B523251C081763809707061827DA01D3978A180274A63B42C2DEF0056C65AB723672925565D8F6A8B99BC4F5A5C9B294A866D963C5AAC9B19CDFDC32C64E75AE800382D5FD2611AD2A4F8DCCD9845E9F4445BEACE76892DBAD6018C3AF607E05F32B985FC1FC0AA62A517E05EB5EC1E8F54954E41A84C07605C318FDAD60F7095CC22890DD4E9FD07D10ED9595F7A5835E721E60B79C93F67B646F611CBE85515EC2674894A976D0D5D57C06BB4AB69422F2B23E2B47649EA5249177F8597922F39C91C1D7FAE5A470BE1DB9FAD63F43A64EDFF256AF50BF7E83E7D5AF57BF5EFD7AF53BF43EA550BF7E7762FA526D80FD0926EE77287E893CFC25927C44C9F5A7C9B223425E8E60889059964C236E83B01C23B2EC88E0F7980C3C4EDCB2555F2A2D6FD77BA5E59596575A8E95564FB670A9B4BC356CF4F07E1053D8DF66F34BCA0FB1A42492F52471B198D44F4C19F83ADD121E879160C171EAD60D537F9DC8AB10AF427E0415D29B99E8EF7358C5EE19C252ACE87B7BD12BFBC357F6F59B48F1BD485B78EE71294386CBB79E1DD55B517E6E5439967762C9879AECD558326F0F1C2AD42356960A99B76DD3BBD6C9DE00F73AD9EB64AF93BD4EDEFA5EA6D6C97E4763189A7180DD4C41DBEF64FCAA79F8AB66CF7EA5269C283BD67586E5254F3662207BDD93CDB723C7071D65E8F1056C2FB116911FB94BAC45AAE5FA4F0782642D003AD78E94E4599CDE9BB8DE364A58DDFB4D9257F75EDD7B75EFD5FDAEA8FB9EF66058DDFBFD97459CEF41F660257DBF0FF30BB35F986D9F453151E9D9D7514CB61D3122623D4387C8F9B116B381ED991EB74A9556F6DB25AF95BD56F65AD96BE5ED9F2A355AD9EF6AAC3EE432C4BEA66981DFD9F835F4F0D750C1C785B81B1A5C094724E9EF0DC9C8D2A52C65AFF924112B7B4D8EE5D344FCB522F655224EB5832E82C633C0459AED63CAFABB46DC5BCA3AC756A0A94F1D71024DE55A1A52FCD78F58838A2FE18864F5592419C12ADF52BBF51565B2BF7D29B1AAFA9DA95F55FDAAEA5755BFAAFA55558DE4DEAFAA7DF9158855D57B16DA3D0B0FB26F300EE25528A97B8F82B77D0EC7F6E96DB750CD16BF53F0B3E580664B4F5640355BBC0560FA95DB010C004CDCAFFF5EA31D8E4693911AF829E6200F181FFA7FEFD9F30359C74F30A5770C8679B58A3F08CDDE2E2812B76CBC969ADEDBAE5ED37B4DEF35BDD7F4DBD7F43D6DBC4A4DEFF75D1DFB2ED4BE6F30EFCBB6F65E7503FCFECBAFCA87BF2A97CB48DB97615DBCF51C6435FEC4F3EA93358306091E3FC0D7667B3AB8DEBFEB458486F7FB2EAFE1BD86F71ADE6BF816D8FDBBEA4268F81F68BF55E54F4126CC667369750741CA72C9E8F326586B89366F18E22609962B2412A3691627A06E53A35B4563D5ADA8AFD0345D457CBA70545AD1F0EA24C2C339EA88D7209D25B09C12242095C1E321A1A07935C4C6BB6DE406F93A0D266FB0E91E64BDA6654042C6856143C906BB5A93795BB6A2EB01D3B7A1FD806D6351AC074C7F49D41DB0FD5F141B03DCCDBA4818F4064B636B6DC51D06B9FE3059EA2B1A51915F26B9CCFE574AB796C156D6DD0EC91860E9255A60B0FA0EB891E5044C4E6C0715FB20AB616FCB3D2924FA2BBE1792DD12929E4C0C5248F4AD0C3321D97F5BE311ACE32473616560240303435651EE31CBCBB3AB6B93AABE52DFC0103C04F98B3F12A949D5B0219074DC2FAE121008CC08264F1DF50BD2A66C3FABB41DB120E4A33E80F180891BD80D8DB0702ED72AC34E653632C41068322C553F2354ACF667B22D7DBBA5CCB1EEDD3279CBD6412905FA868197826D48414FCB7F2905FA2BBF8E14ECFF7A9F8F1662C00209A08B459F803358F95B6BBB5914DB50782F4293AA8EF490800540023F03273418956182772AC33B35C37B27C37BA7E5DE282208528E8D2245C39193E58A9A76DFE024758C8F209AE70FE949902ACDBD6964ECC85B2E419ACF71376EBC0ACDC88B27AF2CDF135575781F1E99A33E6A9F20DA6A504838451DE1B1B8A47D8356B44D02AE1298C119B30F1015D0C57F00C9224E56794846390D41215D3A68930E97919C049D6F869EEB343936CEB5E08F0C9E2B6238C6327C2A5B471BD6C7E8B42EAC93776463D53EDB07F1CC560D3072CC920A82F3A690999677720AFDC1DECA29126DA3F808F40817D34750C60559816A1192169473419E563B42CA74117744F17C6E21890B3866720B55AE9443B16A214B957072A5D3C5ADD11E3DFCB5B23171F07B65E3958D0151AF6C765BD9F47652542B1B9383227D65B32F6EA32AF32A8EB2004620618BD496709952FF4EAB847CDF192C016A3008D3A61EE67CC1C2741DCCE48383589AC4DF20DAC7236E164F718FF20247D37F8457212C64A52A7017447081B8FD147F0588C9A7C7C77F188F2E4218A4A82A0817E3D1F75518A5EF679B348BD19C8AE2AC60E0F9F835CBD6EF2793B4A0981EADE02C89D378911DCDE2D52498C793D3E393779393930998AF266CF5125609E5F88F154A9ACE4352CC881D013D7368593CFB0B786347B812C847B0E027DD84196DB6FE997CBEE66D391F47DF8264F61A204570177CFF0544CBECF57CFCEE783CFABC09C3FC19E9F978118429E7AC9100636F5A0BF4CF1474966C14908B5722187311C641A6DD38E22588DBA6E127202D9827C7DAA0E4C9338BCC0AE7FBDB680EBE9F8FFFABA8FB7E74FB1FCF4DF59F46F7099A37EF47C7A3FF6E195E95363107E206CDA2108C5B46AABBD6D925BEE6A436BDE417B7BAE7571B97EC26187D91C4A9185377476C84597978A417D1D446A8F54E61F7207548B3DD3871777EB63254A7FBA87794C547740B414D7264D746BA85A6A9E9565E9AB361B7C3C91E0663F4DCC0CE8A101B9ACDAC8EDC0C240357ED5F2AA4C78B6AA2213E545431A988733F03F610F51DAED8D4E9A155AB4E7B69D53BCB56BD73D82A996CDB4DECE670591957494D17A7AF2D90BFD7B7EEF069AC53CCEA70D60254C39A109F9DA81A13F2C34D155B82ACED5682B0AB1163C2487FDB237421DAC209DC82B690B4BFCF0D1A766E39ECAC1B40CAF5660ED6B28D57D2A265EDFED7E40B983FD69EC3BC25204977C7DBD1039B9446AE871501075468B51EB58D471CAAE12188405841BF407D3925717A6866F38553C7BD2FBF4493766C87758189E80B36EE2C3E068235DA74B35E87ED7CECEAAEB24EB88CE3AF5E13E41652E25A155C6CB2D7B8DDEAD207BD8451FE49A0CEF96BB01DD8BC84E531477FC87F03413B477ED605FF80D7B36166CB15FA9B047EBE948CE894427D9F1A1977C72930198AC829F0DFE3786505A9217DDE682BB8D083F5527F0BDE66F52E4E5EAD1AA62E0B200C1F5E911DEF25A20988EC745EDFAF99A8D48E0F52EB28D14E71A990CAE67B055E5B9ACD082A90B43A90F234B843D4E67E0AB8515F97F1FCAD07D5FAB1F8BCE4156A6092FB6E6C5C2D371BB4750DA2AFEC5ED304EB23C897538B39F2B47901219AC34F6F09B002D2DF866ACC8F2C4E2EE157BF4C389A231FA2258C002B7F66589FE3FB0525852662BC45297438D5D505BAF998A91769D1D7A19DEEDC259F8176EBD168BEFD6C2EBCE5179ECD018A70A916F49B6F355B185DF49798CD8104DF58B6D253EC1794B7E52F55D612F89B1B5E41F4BC8971B54BE86B33D4CFC650B0A7D9ADCD1BFEEC8D6A7DF549550757F6138B8E9FDEE67AFEDDB626D5A76BBB054DC90FBBB56337CBF5BA8F55E80269B0192CA4B05ED09BB068922BB61FA2F9E831CE29D505CAA6E4CF289AE0CCA3BB4D98C17508F36DC7F9F8F8E8880B6C416091577A49382A9D46FC0D07F788AF77653008734E65093226B8E7D70F098C66701D846C2F98824295D01695F36C5243B339D7609D5F688A32416FEDC9D6E88C92EA62C7D984108076B92835D2B0325112A5A0EAB4839185AA477B2507F21BF856537AE7044277A276842BEE492C3AA90E2019C4F5E9E7E2A55E73D9562A211AE3D92119E4E56D128D4AEF454274C6496A506A49467B142D11D596C85283CB86F0F185D540768846499004AB927A1108DDE1914523D3900869584D1D6A03CBC114CCE268EE95C4CE290941B8B8C185E3E915265E36764F3604A1FF06910D220683905DBD8804F12E84365F9BE4031188D6E8619A44079006FA55C0733E360DE4F34D12AF2A29797E8A9FDBDF1018094E9BD4B0E448382E4F411EF744845AB9BCA37294DF24EF921ED16D73E7328389902065CAE1C887808F3B2A15F8A270975C88EF553B978C8A0CED4D2BD30E473A84DCDC59F9E85C7204D79E7B908C84158BC35A517826EEAA4054179B3BC5427603DABD703494281121920F4850246CDD5171292E0077898AF096B0733129A9902855D2E1888788953B2B1A1928EEBE768B87E4926C0F225253A2C5A4493E245111B37557C5A5B959DA2930F24BA8EE4586A445090D957140622365EE8E0A0EBE6CD82533E22B89CEC5A52243C2D469872324426EEEAA7CD4F7E63A65447AC3CEBD9C10A4285921D30F485E649CDD0999A963280B3DB2E517204617CB6502964106EA5B69971B1866B751FDFB330C83399C557075FA6D9A7FE0224EA92B6D75F8E47CF4A76015A086CF52443D0CE37FDEAEF0B0A3767CC39194C7231C24F87C3C7F8919E9ACA1BAEF6BE64F64CFC7B71177FF92BDAF2786CC7F2882FEAC02CA47B36DB03A2AB7C5B1356D8F2484AD08AE88FFD981D71A58D37020BAE2751AC26A3052014D722D578476DA8D260DC0A32C2B0AA1770CDBD61275C7B8B72D0177C492D83DBA924BBFCA0CECB8AFAB87238DAFA3D2BBB38920567C87062F3FABE135B8D7E05E837B0DEE35F8DE69F0F25B253F900657E252FDBA65FFF6287DA8C08E58F3866B4A7B9879A595456F30F7CF5CF183291DCCFDD35CD683A9C420F26DDEFE69AF9E6CB8EEEF650C26F6A74358C7DA92B27FAAD14BCA762465FFF4AE0B49516253715374FF74AEF789789F8826AC2CACB4219C34A2B4215E7B306953996E8D236D0F2A09212D14CE4E5C79F468679E8442DBED9FDDE0B59DD7765EDB796D67A2EDF6CFF61DC85B5ABC85F196AF5F0B0E7E2D68FD4084213B5B63921962B67E16C21053F2450815341D3DE26D4AAF47BC1EF17AC4568F786B4DC21D7FF5D6ABD81F42C5CA3EA86478FF48FCA105E5D1957D4549A535CA33DB1B4F7E66FB997D8833DB9B3362D6D47115BC51E355DFC1AB3EF9A71F0C79D9FD250D63A1917FFCC21052F61D096559947E83401D41FAE13F3184A60EF3E69BD7615E87791DB6CF3ACC1BAA4206E1884EDE48F50AFEE015BCE576BAE57BBD86FBFBB6EF772A37ABF523BDCA28FCE77995ABCA3F89AA0CA1F1D65143A979ABD52B35AFD4BC523B28A5E6CD580973B232FAA43765BDD6F75ABFBDFA87680923C02A575D94CFF1FD8252B17ADA795815EB64A5D25445DE00F5AAC8AB22AF8A76401579B351CC20220AB5371CBDB63E786D5D072BBB0B60F42582590FD037491C65D33508BE0297EF09C30DC8E2387B35D3CF8F68C6C66655BF4C2F0D6982599CE48F200D8FD43649B12C4CF33F6610751C3976B8B517D80AE8D7385E34C33A48583A6D4DEEED6EAFC9BD26F79ADC6BF27DD7E47EDB226451F5110BBF65F10BDD612D745AE2EFED3C2FFE3FB0F8FBC551C89EF203617E6DF4CAE1B0948300B6B72BE6F6D7B97BB8A4EEFC86BEE0CAF90E5CA5FF15DE40859A3ACAD05B4A5E197A65E895A15786C0DBCD32EE341F4EF5B6B35F2E0E7EB92815680EA7CA80DF0DB0547CBA365394DA61D686F80C99F1814B7FC70B849AF356B157735ECD793577E06ACEDBBB420E3D82759CECA39F1837DCA58EB8812178089A0B199DAF0015D40EE2E4FDE22A0154B0FE7CBDCD8A0DA6FADC42C3338820EC9F35E005A11741D83F7D6929088A5F5B5B2E419AEDA77BA069BCCBD9F20966860F4E1E0B3FE50D9A139B045C251075D406E801248B3859E54F47ECC1AE410A97912B9C7CD63AEA9A2D54C96E739841CC12629EEDDF8AE4E7999F67FB37CFF66FC17730CFC44CFA80DA98BDA14665018C1A770702BC81499A21632E780950E7E8E6E15A5390D103381EE10CDCBE29081747750ED9D7D113E65B99997202C2E2577E120181264B44A1CC85A09B06E18E1190A17245949A022AC4B00127A053658848E0BC6EF07C2222D62E906D2FA040E58AC8100554B85609A690694DA69867557E37A10B98FB4DF017D640FEEE97A3C6951091E40A7590CD3FB8262256A68B4894599D229D7F1D44045DE78805BACCEC8417F208278B8115B851475714621399420A447E079D22F48D88469521C2AFF23AB1B3B878232DC66F32C5349AFC2E3ACDB30621252A5B488B2AD1410D1F758B08D539221A7566177CED5D149220738564C8020CA98B348D67B070160895F173A37789A2BC5A6ECA51F84567E6A3C798580E6A058F08928913794DC1EA5054A6D2999E4DE8AE2974BBBAE9DBD665AE4C1FDD6516F4A2629DE6AC9B14F3E43D258B391DA101BB4C2CAACF8565F5908005484011FC81EF7A5B71275DA0EA090C86A22E95EE94059599D3DEF3B294D38653F56933ACA85A2539EDEE14CC90D1A13EE45CF94318F3A7579868F0802DBEAF2C20F69D75A3440B1957CA7D877963BDD4904DB275776903FB39B712F2F3CE2C41FBCBECF926895755079F9FE267CE1CE7396307E89E89928D4851BF6B77A1CFCEE283CF1D7D2E371C3CEBD42BBB6713B5712A6A89F745FA2C29BFABD8D1AF7AA3C4B3450FC03D6B98AD5F699589F77526ECE99C2478AF27628C5AD53E5892B0FC70327D9ACF0174F58BD89C0A186300D30393B8DD3766957C5FADCF301C74B6A397D54E9B67944E75F70CA2DD0645358953C0843159195AADB3778D8B40C4207D983E18C5FA404A6649BD1B060C23C23A74F595F27408986608D503E3044E1DCCBA36678D3EF3CA970B1D9DADBD373CCBF400DC338AF14715F564CE2603F63497DDBA7A487A9E046C3202EA815DBC7F0DB3ACC5712667DBD98439D6A9F3CE26D83D5726A09F68C6074B909F208569917A3679DC44F9551DFC0B9F36D61067083302F431525DE6365AC4A8B76B9014CD275B5415A9B22B2501B2601E64C14592C14530CBCA775345E09DBF06E10615F9B07A01F3DBE87E93AD3719EA3258BD849427E76CD24EFF6CC2B5F9ECBEB87D99BAE8026A26CC8FEDEFA3FCF0705EB7FB061F0A4E1420F2E3B68F202A5EB3A1B144129881E55B8DF419ADED6A4025FBAEC11A447310654F60B50E11587A1F4D836FC0A46D6833FC0B5806B33794FE0DCEF3235E1948F740D06C3FBB86C13209566989D1D4473F910CCF57DFFFF4FFD0F601F172330200, N'6.1.0-30225')
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'201404111839109_MigUP', N'ProductComparison.DAL.ProductComparisonDataContext', 0x1F8B0800000000000400ED5D5B6FDC3A927E5F60FF43A39F760767DCBE9C19CC04F60CE2769C04731C1B6E67CECEBC184A37BB2D442DF648EA4CBC8BFD65FBB03F69FFC252A22EBC4ABC497D0911C04893D45754B1AA582C92A5FFFB9FFFBDFCF3F77534FA06923484F1D5F8ECE4743C02F11C2EC2787535DE66CBDFFE61FCE73FFDEBBF5CBE5BACBF8FFE5AB5BBC8DBA127E3F46AFC92659B3793493A7F01EB203D5987F304A670999DCCE17A122CE0E4FCF4F48F93B3B30940106384351A5D3E6EE32C5C83E207FA3985F11C6CB26D10DDC10588D2B21CD5CC0AD4D1A7600DD24D300757E387042EB6F36C0AD79B200953189FDCBCFD653C7A1B8501EACC0C44CBF1288863980519EAEA9BCF299865098C57B30D2A08A2A7D70D40ED96419482F215DE34CD55DFE6F43C7F9B49F3600535DFA6195C6B029E5D94EC99B08F1B31795CB30F31F01D6274F69ABF75C1C4ABF1DB3041EC5E84393C48C62396E49B6994E4CD059C2EB042909E14A3744223FD34EA68FF532D3E48CAF27F3F8DA6DB28DB26E02A06DB2C09508B87ED97289CFF05BC3EC1AF20BE8AB751341E5D0729C03DCA47F7A42443BE257A4F54BA0149F65ABE65FE773C2A9FCA1224CDE3D15DF0FD1710AFB21724BF487C6FC3EF60511594F2F0390E91ECA367B2648B7E4E5A69E4E82D34CE5DD0B809D34D14BC3E0431882A5AD710462040B2F109B127F812811A5A1D6B88BE4F03A4B148F8FAE7D11AC4B960A52D94CE5C50FA04B25F41B87AC92A423710092CD01E8907F84F90EB4EBA5D6FB09ADBC3CDB69B4DD4C66B030E5C4E1AF3D16A54A64106563079B5312715466F8684E621AAA30A08B63E8225F35E1F6FB83198B000BCF837CFDA1A224D81A8487758C19F9D681F48E7494889B150F88C687D0ABE85AB428E18AAB3ED9746E61E4154B4495FC24D394910F5CF4DC3DB04AE1F61443F5FD73F3F05C90AE4BA0D5B1ACDE036999BEA09D56D73552160F6495B886E99280CF3F8C03A4350DF1FB53937539B1E2D91AA82BAD7CE4AF15AB5B3526123ED448ED5571BB5CC9FDF2F37F83D8893DEFDE0B7DBEC05267D53B90EE37C51DAE1B83A2185D91F74E8A66B527F03411B137F7640ED1D5EACEDCC495C8324B073117384FD5231DCA70EB17432653C821446DB8E01744269364F008867E17FF6FE4E7F8770ED968686385A453FD0E3FB2688C910ABFABB3002C10A582E590BF6B8EDAAFAC083287A788131B01AFE0A64BF84A08CF1F4ADB6F7E8076258BC9ABDA61970ACC1825932817390A6AD4E8613424F703B7FC1D6CF36DAC6DB504355996541BCB87E7D0AD77A48CAFA7087C82D6C74A100D82F3D7063A5AEE1E275089BFA3E81DB7831455D4E82785E93FB186717E7DA9DBEDD82E82988BFB2E15733B4F7A84FA9AD2E3C6DBF800829F0D36B02ACC10C22B01AAA9081E43AFC6A3535D420C7A812EFE255180356B60CC13EC1FB2525606632BA6BF172AAD0EAB2BA4DC37935FF5A486B03B35FF25A6FEBDC05618CCC69D6F75ABC26789BC0389B6D40F015F41FD688B62083307BB195DBC76011425B90CFB36BEB7E80394C1605AF2C1DA86D5268D12CFF630B56EFDCB1C2646AB92ABC5F215C3652B28BFD40658351699D85B128EBF769D3A1EC89C98603F1E8C09B0D25E521361A1E92706E3BE95FA3596C3148675F60065B88186E230EB71FD2EF969693CD9752F6841B2F6C1DB7E9C235106DB8D86CDC5604A8767C07C9CD1F591FC93656FB424FB9AA58D94D8CB05FFED5C0311C67F190C1824103C5D204F19D03086FFD1ADE867A18EAEA861673DFC2B4F0832C54AE46D92FB52BA5AA23AC74F6BB7D52B90F37F6AB0285BDABBD3AA3E76029348C5BFF083630B19A9D30C23E39F5B847263E7DF3E4C02EFD6D188187A059C7F7769AE706F934F7CB6902A8030A79299E4274E53C05C990BE694E0F152DC35C03040E2051FF5C8976E3FFF1B5DCA93D4113AB337B5487CD958C80D9274DAB865F57CF5C898D81B40E71B6FF21014B9080780ECE8623753E1CA98BBE494DDB0FFEFFDE91E79CB549821322EF41BC680D039B5191DAC7DB3049B366A03A6D24D75E6C2C9966DCA2B9ADADEE1ABF32DB2EAC7B5B3F990940390401E6305E68B0987F40DC65B65D6BE7B9C6BAAFF1F412263A6FC1B517BF04D3ACF51DD8B6565196D976B5026966B9EC6B50F669966D7A6576309E7C7AE019F74398596ECF3E1651A65BE4AF22D64E1334027317800F2059C2649DEFAFBA03BD0169B88A5DE3E53AE3F8955D4196C3620FE7703345D502D61B5AC22B0695CE3CD7CDC80B066CADE07A01D744C7BCBD4D53380F8B5EF191EF26F64EBFE9BB783152B901D1849CA830F91DB25EE106D92BD49FABF16F384676C0D70BA9065E867D7A7272C6C13FE27920BF659D073D90010DE38CB78D613C0F3741A4D013E659A165955F38CAC7A6A6C6D6DC804DEED7C59902BFEDBB5153630C7F17C72E278418B54B17B7AB231B7AF9160F1FC8D49028E9C6D0A0D224EBC5809224E3EF4149116956BA465CB815E74496441B786AB6CFBD4409FAA232A2AD57228DE44AC06E271D1940BADA96AD3259505AC336324105EBD4254E65F5DB2DD3EEA44EA13F2A832E3D1BA325790A43A0D61922A4B673F92B830F2A02C1462294A44D280BADF80239AB22245D826C2D63F42BAA8CA6386E6C2C57340FEC3A30B02471D121953197878A9CDA3269906957C64CD6A1DD5833D928E899B3F33D104236B8A7221CD2489F531194C50877258192FEEC46002543A0277F173B923F4188451E6F90C75B4887BE8900EBC432A4819A21654CDE8DE1444BCE66EB3E3897271C3643CF64E80990D07D6842F6374116E48DC077D11117A44BE5CE405A060F5929C989CC40462FB0C3FC9A5013B7E3C2139CACD128CD5A4A0C442D4C3BB0CA1716C1D422DB01817D271142E53F760010164984424D029DACA92450CC9846C11920424A448C26F3C4104DDBF2C9B022AC185CADDF881B674E2914E3A904A21C8ED213D456813B5CC84FC099F6B0A05A6090E87F23AD2DCC908602FB6604A577725E48835BCAE12D538E88025AAAF266C097D663023C7F94C333DA011AE21D695BD3C23395908CC23858B2ADB2A0EDDC12051354C309B6BC61A207045C3D2F38E5087F18A29D37EDCB63FD05B22DBFA44BE2FE85893B81D1CEB9D6359DF6AACE966FB2755C3F6C136DDF8AE6FDF61588EA1A84B2C18403D33AE34B571D761CA936946BCFB8AEBB9CE06CD865C1E5449236FBF22ED86CC27845A4D12E4B46339C437BFADB997E66E935C698CC534182E9BAB735A50C26C10A30B58834EA6961CE73C7FE4B90EFFE4F176BAE59EB3A40E28256A419C79A1FC3CA2BAD1EC8FF2F597EE4C9C59944D782B55409748BDE789DAFC6F297078418D0005C970A8CD93C8882447EA8620AA3ED3AEE5CA9C9B1F0B159120697A823E03B2B24022E5147A0D3599348748D1922DF3FBE561DB9C971412236A53A7D6C1254D3BD6BCA35C6B1B9E0420D6653AC8EC5DF50A1C48CABD544AE725273A055058F77396194898B4470FA6BAFE045E24F7DB5CE1FDB913297893D499CB2481DA3CADB49825465EA28545E4E128AAAD0101C32F926C527B2C2080F67D89460E24A75DC3A9726895717EE8960972937F5451B3FB823E126536AD2B6B729574723AF1E926864B93A1A79A7924423CBD5D170FA4B120797EC8DF898783BD360572E4E9D0293969A445764EA5459244E5DA88183B35C5228B8685F06B84E856930CCD5B33B1AECFA7ABEC0E1D3C1E1F22090785CA5C6C4D3E42960DEB52AD6F0BCC98BFB94034E56ECCA8A51190C2838B2624F441E67BBD417F7E2B91D89BA2B7BD4E4B3A41CB5BA54C3FF6413DC519E285BA98ECB27AF2481F95A1D8FB9C833487BCC4591861AD289062945A4ABD431456B39F9426E472A5365C534511B54903F7BE0AAC3E6BDA4BC7EA64E632DDF24C0A4D6F24DF12109675FC66237424FA4D73410FBE6E99DB9475CFA4C61ECA9A936C0A633650AF1E9261A73559318939AAC9A628D2520CE8D49ADFE70913A46910F8644280A7496A1755E4C7A155A176B385C746A4CCAE5A2AB0CC28A627911541B6057D93285C855E590E1CB9E4DCBC734FFFFFDF2DFC436A62CFD77030323D9EF6AE19543DBF240A6AF14A0E96E2C94392A69A450CF7324725452F6A229D6E80F4E4349F50717E9C4229ADB367438427E0B478EC65CDFA135BEF566CF8EA6CF3267A2BE60E307773469F6150B70BBDE761959701545318D010C15F1C0F90A293FB628D9177569721E1AA84CFDF06E4371D2FD57DDE8825B75F9C0BCE207AD7773BB7DE072F3D6D623DD7BEFC9F434065C84CB7257EF761BCFB3629523A25E34FF18A7882955C351F59F72B6668FABE023384C279E318648F914D4EF01AD7CD720C389CDA89A2A3FCD788ABC7AC45EF1E82A79696222B8CE964CE1A971048A523B68C27963E0891ACBDE63BF8EED3D2EB58326BD32069FACB223C2787F0C1DA6D68E9470205C8C019E1E18605C68074C1F2A6208D095EE0809DF866F602B5B55B09193ACAAC2F68D9AB349DCBB34559612D54C7BAC58353596FACD4D63ACAA730D1C10ACCE37896855756A642E27F4FC246AF279B3404A6E3783610C3F83F919CCCF607E06F33398AA44F919AC7B06A3E72751931B1001DB190C63F43783DD27E12A8C03D9E9F409FD0EA2B5B2F2BA74D043CE03AC9673D27E8DEC3D8CE3F730CA43F80C89B2D40EBA3A9ACF6057C59652441ED667E588ACB39424F20C3F2B4F649D3332F858BF9C14AEB723579FFA67C8D4E53B5EEA15E6D72FF0BCF9F5E6D79B5F6F7E875EA714E6D7AF4E4C6FAA0DB03EC1C4FD0AC54F91C73F45929728B9F769AAEC889087231822649525D388D3202CC7882A3B22F83E26038F0B77ECD59746CBFBF5DE6879A3E58D9663A3D5932F5C1A2DEF0D1B5DBC1FC415F6A7D9FC94F2434C2989643E495C4C26F5155306BE2EB784C7692458705CBA73C7D41F27F226C49B901FC184F4E626FAF31C56B97B86F0142BFADE5FF4C6FEF88D7D7D27527C2ED2169EBB5CCA90E1EAADB5A3BA2BCAEB465563792696BCA8C91E8D25EB0E20A0425D6265A99075BB76BD6B9BEC1D706F93BD4DF636D9DBE49DAF656A9BEC573486A9190758CD14B4FD4AC6CF9AC73F6BF61C576AD289B2635D57581EF2643306B2C73DD97A3B727CD251861EDFC0F6106B91F9913BC45A945ACEFF742248D603A06BED4849AEC5E9DD89EB6DA184CDBD5F247973EFCDBD37F7DEDCEF8BB9EF690D86CDBD5F7F59E4F91E640D56D2F7EB303F31FB89D9F65A1493959EBD1DC554DB112332D63374889A1F6B321BD89FE971A9545965BF5CF256D95B656F95BD55DEFDAE526395FDAAC6EA432E43AC6B9A1EF8958D9F438F7F0E157C5C883BA1C1B5704492FEDE908C2CDDCA52F69A4F12B1B2D7D4585E4DC45F2B626F25E2523BE822693C035C94D95EA6ACBF6BC4DDA5AC6B6C059AFAD41127D054ADA523C57FFD8875A8F8168E48569F459211ACEA2DAD5B5F5926FB5B9712B3AA5F99FA59D5CFAA7E56F5B3AA9F55D5481EFCACDA575C8198557D64A13DB2F020FB06E320518592BA8F2878DFE7787C9FDE560B95B6F89582D79623D2969EBC804A5BBC0760FA95DB011C004CDCCFFFDEA21D8F4593911AF82AE62017181FFABFEFD9F30559C75730A5670C86B9B58A3F08CD9E2E280A77ECBC9696DEFBAEDED27B4BEF2DBDB7F4BBB7F43D2DBC4A4BEFD75D1DEB2ED4BF6F61FE2EBB5A7BD51DF0EB2F3F2B1FFFAC5C4E236D5F867571D77390D9F803CFAB0FD60C1A2479FC005F9BED69E3FAF08E171116DEAFBBBC85F716DE5B786FE15B600FEFA80B61E17FA0F556553F0399B09AADA5CD5D0852964B469F37C1564BB478C310B749B05A239118CD329880BA4F8D6D158D55B7A19E22355DC77CB970545AD1F0EC24C2C335EA8837209D2761A912242055C1E321A1A07935C4C2BB6DE406F93A0D266FB0E81E64BEA6654042C6856343C9063B5B93753BF6A2EB01D3F7A1FD80ED6252AC074C7F4AD41DB0C39F141B07DCCDBC4838F4065363EBD38A2B0C72FE61AAD46734E2417E9AE42AFB9F29DD7A063B99773B246380A997E881C1EC3BE04296133039B13D34EC83CC86BD4DF7A490E8CFF85E48F64B487A72314821D1F732CC84E4F07D8D47B08149E6C2CBC048060E86EC4179C42C6FCFCEAE4DA9FA4C7D1B46E021C86FFC91484DA9860F81A4E37E394D40207023983A75D4CFC89AB2EF5995ED8907211FF5019C074CDCC06F6884850BB956157626B391218640536169FA19A162AD3F536D19DB2D658E0DEF96C53BF60E4A29D0770CBC14EC420A7A9AFE4B29D09FF975A4E0F0E7FB7CB410039648005D4CFA049CC1CCDFFAB49B49B10D858F2234A5EA480F09580224F07370468351152678E732BC7333BC0B19DE855678A3C8204805368A128D404E961B6A3A7C838BD431DE8378915FA42741AAB23D718D3A746300FF88E8818193E4C4DE77EB9F00DEC5DA98D23E6E2F95A87345E6BC85CCB93B32172D642EAC57FAA2E4A1530729434BFDE68F7867F61F7228B59EC1AE8A77EC9C922AA8EFA17A15D422E355B00578FF55B0A79501A982FACB0355153CFCA5C16CBB5A813427EB66D3B14233DA73943F2C8FE056CFF03B8E648DBA8FF921CC521A0997A8233C1657CA6ED1FA7B9B80691266E19C895A8A1AE8E23F80640993759E405A4E43D04897CE0D48C3552C2741D79BA1E77A25C7C6B516FC91C1734D0CC758864F55EBACDDEA437FF4CAAD2EDE93B54EBBB60FB28F5C75C0681B993410DCDE0F59697982B8B01FEC19E2A2D036E7A0C08EB0F12C511B176405A645485AD0CE0579DAEC0829D34DDC11C5FADC42123770CCE416AA5C2B8762D542966AE1E4028A8B3B2E3D9E47A88D8DC971046F6CBCB13120EA8DCD7E1B9BDECEB5D4C6C6E4588BBEB13994956C5539857116843148D826B5275C96D4BFD3AA205F77062B803A0CA2B4790E73BE6061BA09E6F2C1412C4DE0B7700112C4CD2271C849DEE064F68F681A8585AC540DEE82385C226E3FC1AF0031F9FCF4F40FE3D1DB280C52F4288896E3D1F77514A76FE6DB348348A76298150CBC1ABF64D9E6CD64921614D39375384F600A97D9C91CAE27C1024ECE4FCF2E26676713B0584FD8C74B582594D33F562869BA884831235604B4E6D0B278F917F0CA8E7025908F60C92BDD84196DF6F94BB9BEE67DB91AC7DF8264FE12204370177CFF05C4ABECE56A7C713A1E7DDA46519EF4E26ABC0CA294DB5A9200E3A8670BF4CF1474966C15908B3BAD187319C120D3EE1C716FD56DD7F085D516CCB3536D50F29C1C8BCC0AE79B8FF1027CBF1AFF57F1EC9BD1C7FF786E1EFF69749F20BD79333A1DFD77CBF0AAF48939BE67D02D0AC1B867A4B96BD52EF1A16C35F5921F33EFD6AF362ED929187DECD5A91853275D6D84597978A4C7E6D546A8F50644F7207548B3DD38712794773254E787687794C5477466524D7264875CBB85A679D2ADBC3427D9DC0E277B740DA3E70E76562404D3EC66B55D632019F8D1FEA5427A5C444D34C447A0545C2A6223D6803DC4F30E676C6ADFD6AA57E7BDF4EAC2B257170E7B25936D3BC56E0E0128E32A99E96227BB05F2F7FADE1DDEC2768A596D5D5B806A7813E2BD13556742BEB9A9E24B904FBB95201C6AC49861ACBFEC1186106DE10461415B483ADEE7060D07B71CBEAC1B402AF4660ED6B28C57B2A2E5D3FDCFC96FC33CB5CC22CC7B0292747FA21D3DB04969E47A981170FAA756EF51DB79C489A51E82184415F497505F4E499C1EBAD97C8FDDF1DB97DFCD4B3B96C3BAC044AE289B70169FB1C91A6DB6DD6CA2763E76BDAEB24DB886F0ABB704B98794B836056FB7D90B6CF7BAF441AFC338FF8061A7FE1A2C07B65FA2729BA33FE4BF81A09D233FEB82BFC3F3D930DA32457F93C0EB4BC9884E29D48FA99159029D029389139D02FF1DC2B515A486F479A7ADE0420FDECB5D18816065B9B555ECBC5A754C5D1640143DBC203FDE4B44F3F906A77A7DBF61BEA1E17823B5FEA685535CEA0310E66B05DE5A9A6904F5D90B75206535B843D4165E05DC98AF6BB878EDC1B4BE2F3E863D451D4CF2D88D4DA8E5768B96AE41FC955D6B9A60BD07F9746AA1234FDB2F20423AFCF49A002B20FD65A8867E6430B90EBFFA69C2918EBC8B57610C58F933C3FA04EF9794149A88F10EA5D0A1AAAB0B74F3E9752FD24D70EC2E08E3CF7198B59A6EFD957B8D7F9BC0389B6D40F0B5631FC920A2116D410661B3E96E22BC8FC1228436004572770BFA600E933C3063E5746D93427F66F91F1BA03AB4C98A85A19DAAE07E8570D98CFFF0F152652B81BF10E60D44CF8B1857AB84BE1643FD2C0C056B9AFD5ABCE18FF4A93EAFAE54F5A720BC62D15F7B690B3DFF6E574AF5E1C66E42538AC3EE6CDBCD72BEEE63167A8B2CD83C2CA4B09ED09B24AE9223B6EFE2C5E811E694EA066557F26B14CDA7244677DB280B3751982F3BAEC6A727275C1A2E028B3CD24BC251E534E26F38B8477CBC2B0B8328E75496206782BB7EFD9084F13CDC0411FB164C43A14968CB217E39A9A1D99A1BB0C90F34C599E06DEDC9D6E88C91EA62C7E584108076B9282DD2B0325112A5A0EAB2A39185EA8D0E4A0EE427F0AD547AEF044257513B3EAED0935874521D4032C82C3FC54DBDE6B0AD544234C6B34332C8C3DB241A55DE8B84E88C93D4A1D4928CF6BC8622AA2D793007970DE1E50BAB81EC108D9220095615F52210BAC323CB9DAA2111D224E03AD40696831998C378E18DC4DE19094172DBC185E3E9254CBC6CEC9F6C0812150F221B440E0621BB7A1109E25E08EDBE36C5472210ADD9C334890E200DF4AD80E77C6C1AC8E7DB04AE2B29797E82CFED77088C04A74D6A5872241C57A7208F072242AD5CDE5339CA4F9277498FE8B4B97399C1444890B2E478E443C0C73D950A7C50B84B2EC4E7AA9D4B4645868EA69565C7231D426EEEAD7C744E398263CF3D4846C28AC571CD283C13F75520AA83CD9D62213B01ED5E381A4A948810C547242812B6EEA9B8140780BB4445784AD8B99894544894AAE878C443C4CABD158D0C14675FBBC5437248B60711A929D162D2141F93A888D9BAAFE2D29C2CED1418F92154F72243D2A28486AA3822B19132774F05071F36EC9219F19144E7E252912161EAB2E311122137F7553EEA73739D32223D61E75E4E085294AC90E547242F32CEEE85CCD439948511D9F20B10A3B7AB5502564106EA5369D7DB30CA3EC6F5EF4F61142CC2790557977F4CF30F5CC0943AD256A74FCE477F06D601EAF83C45D4A308FEF3E31A0F3BEAC7379C49793CC24982AFC68B2F9091CE1AAAFBBC667E45F66AFC31E6CE5FB2E7F5C490F90F45D09F5540F96CB60D56C7C36D796C4DFB2349612B822BF27F76E0B526D6341C88AE7C9D86B01A8C5440931CCB15A19D77A34913F028CB8A42EA1DC3BEB564DD317EDB96843B6249EC1E5DC9A15F6506769CD7D5C391E6D75179BBCB8920577C87052F3FABE12DB8B7E0DE827B0BEE2DF8C159F0F25B253F900557E2527DBBE5F0D6287D98C08E5CF386734A7B9A79A599456F300FCF5DF183291DCCC3B35CD683A9C420F26EDEE159AF9E7CB8EEEF650C26F6E74378C7DA927278A6D14BCA6E24E5F0ECAE0B495162537152F4F06CAE8F89F8988826AC2CADB4219C34A3B4215E7B326953996ECD236D0F2A49212D14CE4E5C79F668679184C2DA1D9EDFE0AD9DB776DEDA796B6762ED0ECFF71D285A5ADC85F19EAF9F0B8E7E2E68FD4084213B5B73921962B67E16C21053F2450815341D3BE27D4A6F47BC1DF176C4D68E786F4DC21D7FF4D69BD81FC2C4CA3EA86478FE48FCA105E5D1957D4549A537CA9AED9D27AFD95EB38F51B3BD3B23664D9D57C13B35DEF41DBDE9937FFAC19097DD5FD230161AF9C72F0C2165DF91509645E93708D411A41FFE134368DA30EFBE791BE66D98B761876CC3BCA32A6410CEE8E49D546FE08FDEC05B2EA75BBED76BB8BE6FFB7EA772B75A3FD2AB8CC27F9E57F951F92751952134EE3A6A1835EFB57AA3E68D9A376A4765D4BC1B2B614E56669FF4AEACB7FADEEAB73FFE2E5E8531608DAB2ECA2778BFA44CAC9E751ED6C43A99A9344D917740BD29F2A6C89BA23D3045DE6D143388C842ED1D476FAD8FDE5AD7C9CAEE8230FE1C87590FD0B7098CB3D906045F81CBFB84D1166410662F66F6F911692C347BF4F3ECDA902698C324BF0469B8A5B64D8A696196FF3183A8F3C8B1C3AD3DC15640BF42B86C867590B474DA96DCFBDDDE927B4BEE2DB9B7E4876EC9FDB245C8A2EA23167EC9E227BAE39AE8B4C4DFFB795EFC7F60F1F793A3903DE507C2FCDCE88DC3711907016C6F47CCED8F73F77048DDF9097DC191F33D384AFF6B781B2A3CA9630CBDA7E48DA13786DE187A6308BCDF2CE34EF3E154EF3BFBE9E2E8A78BD280E670AA0CF8DD0053C5871B3343A99D666D88CF90196FB8F4B7BD409839EF157B33E7CD9C3773476EE6BCBF2BE4D023D8C0E410E3C4B8E32E6DC46D188187A03990D1790B50C1EC204EDE2FA709A092F5E7F36D562C30D5750B0DCF20827078DE8017845E04E1F0ECA5A520283127673FB2CB4B2421076833AD844782A7E1A22AF9E160091210CFC1591FA0E77D805EB8039DAA7F93FBF74AB1CC4C756C14E0DE8378A17C0292C5D3D6AEC39B88BC7679ED3A14ED3ABCD9BD7FC767B65DAD409A1D66E8BFE9BC4B13F421CC0C2F933E167B90B7C8DFDD26609A84E8456D801E40B284C93ABF166A0F7603D27015BBC2C905D3D1ABD94295EC36871924E440E8D9E14DF25ECFBC9E1D9E9E1DDE74EF40CFC44C7A87FA98BDA24E65411837AE2102BC0D9334BB09B2E04B805E8EEE1E7E6A06327A00C7235C81FB3703D1F2A4AE21DF75F484F95656A69C80B0F8D51E8880405325A250D686A09B06B1D5222043D58A28350D5488E1E08C804E55212281EBBAC109CF564081AA1591211AA870AD124C21D39A4A31CFAAFA6E426FC37C4F047F3D15E4393D386A5C0B1149AE5107D9FC63AA226265B9884459D529D2F997BF44D0758D58A0CBCA4E78218F70B11858811B75E66421365129A440D477D029D2DA8968541522FCAAAE133B8345FE13317E5329A6D1D477D169AE2C0A2951D5425A548B0E6AF8189B88505D23A2515776C1D73B87421264AD900CD98021F5364DE13C2C360284C6F8B9B1BB4453DE2C37ED28FCE26516A347484C07B5814704C9C289FC49C1EC503C4C95336F36A15F4DE1B5AB5B3C6DAFCCB5E9E3759909BD78B02E73F69A14F3E46F4A36733A4203BE32196D2A3CAB26A4277AF5B6E64E5E817A4EE03014CF52E54E5950B939ED6F5EB672DA71EA79DA0D2B1EAD8A9CBEEE0CCC91D3A13EE45CFB6318F3A79730D1E001DBFC505940AC3BEB4E892632AE95FB17E69DF5D24236C5D6AF4B3BD8CFB997909F65CA12B4BECC9E6F13B8AE5EF0F9093E73EE38CF193B40F74C942C448AE7BB5617FAECCC17135DEF5C2E3878D6A93FEC9E4DD4C2A9784ABC2ED26749F9CDE48EF7AA174A3C5BF400DCB38659FA955E99785D67C29E4E25C16B3D1163D41EED832509CB0F27EAD37CEAA7EBBD88C5A9803106303D30895B7D6356C9D7D5FA0CC309E53BDEB25A69F38CD279DC3D83E8B041F198242860C298AC4C9BDAF9764D8840C4207D983E18C5C6404A6649A31B060C23523675BD2B15E91030CD10AA07C609823A98756DC11A7DE695B7123B5EB68EDEF02CD30370CF28261E553C270B3619B0A739C8DEF58664E449C02623A01ED8C5C7D730CB5A026772B65D4E986D9DBAEE7282C3736501FA89343E58817C07294A8BD2CBC9E336CE8FE1E25F78B7B186B8449831A0B791EA361FE325446FBB0149D17DB2475593AABA3212200B164116BC4DB27019CCB3F24E749154EFAF41B4454DDEADBF80C5C7F87E9B6DB6197A65B0FE1251919CCB493BFDCB09D7E7CBFBE26645EAE2155037C37CDBFE3ECE370F1775BF6FF1A6E0440122DF6E7B0FE2E2A63A1A4B24811958BDD6489FD0DCAE0654B2EF066CF2E35371F604D69B0881A5F7F12CF8064CFA8616C3BF8055307F45E5DFC2E24C960CA47B2068B65FDE84C12A09D66989D13C8F7E22195EACBFFFE9FF01650E4BB7FC430200, N'6.1.0-30225')
INSERT [dbo].[AirConditioners] ([ProductID], [Name], [Type], [DisplayPanel], [DisplayPanelType], [Capacity], [Dimensions], [NetWeight], [PowerConsumption], [PowerSupply]) VALUES (N'33', N'Panasonic', N'Split', 0, N'na', N'2 ton', N'107x 22x29', 1.5, 2060, N'230')
INSERT [dbo].[AirConditioners] ([ProductID], [Name], [Type], [DisplayPanel], [DisplayPanelType], [Capacity], [Dimensions], [NetWeight], [PowerConsumption], [PowerSupply]) VALUES (N'34', N'LG', N'Window', 1, N'LED', N'1 ton', N'66x67x43cm', 1, 1110, N'230')
INSERT [dbo].[AirConditioners] ([ProductID], [Name], [Type], [DisplayPanel], [DisplayPanelType], [Capacity], [Dimensions], [NetWeight], [PowerConsumption], [PowerSupply]) VALUES (N'35', N'LG', N'Window', 1, N'LED', N'1.5 ton', N'66x67x43cm', 1.5, 1830, N'230')
INSERT [dbo].[AirConditioners] ([ProductID], [Name], [Type], [DisplayPanel], [DisplayPanelType], [Capacity], [Dimensions], [NetWeight], [PowerConsumption], [PowerSupply]) VALUES (N'36', N'LG', N'Window', 1, N'LED', N'1.5 ton', N'66x77x43cm', 1.5, 1610, N'230')
INSERT [dbo].[AirConditioners] ([ProductID], [Name], [Type], [DisplayPanel], [DisplayPanelType], [Capacity], [Dimensions], [NetWeight], [PowerConsumption], [PowerSupply]) VALUES (N'37', N'LG', N'Window', 0, N'na', N'1.5 ton', N'66x77x43cm', 1.5, 1610, N'230')
INSERT [dbo].[AirConditioners] ([ProductID], [Name], [Type], [DisplayPanel], [DisplayPanelType], [Capacity], [Dimensions], [NetWeight], [PowerConsumption], [PowerSupply]) VALUES (N'38', N'LG', N'Split', 0, N'na', N'1 ton', N'89x21x28cm', 1.5, 1080, N'230')
INSERT [dbo].[AirConditioners] ([ProductID], [Name], [Type], [DisplayPanel], [DisplayPanelType], [Capacity], [Dimensions], [NetWeight], [PowerConsumption], [PowerSupply]) VALUES (N'39', N'LG', N'Split', 1, N'LED', N'1.5 ton', N'109x21x30c', 1.5, 1760, N'230')
INSERT [dbo].[AirConditioners] ([ProductID], [Name], [Type], [DisplayPanel], [DisplayPanelType], [Capacity], [Dimensions], [NetWeight], [PowerConsumption], [PowerSupply]) VALUES (N'40', N'LG', N'Split', 1, N'LED', N'2 ton', N'109x21x30c', 1.5, 2000, N'230')
INSERT [dbo].[AirConditioners] ([ProductID], [Name], [Type], [DisplayPanel], [DisplayPanelType], [Capacity], [Dimensions], [NetWeight], [PowerConsumption], [PowerSupply]) VALUES (N'41', N'Panasonic', N'Split', 0, N'na', N'1.5 ton', N'107x22x29', 1.5, 1730, N'230')
INSERT [dbo].[Books] ([ProductID], [Genre], [Author], [BindingType], [Publication], [PublicationYear], [Edition]) VALUES (N'50', N'Fiction', N'Donna Tartt', N'PaperBack', N'Hachette', N'2013', N'I')
INSERT [dbo].[Books] ([ProductID], [Genre], [Author], [BindingType], [Publication], [PublicationYear], [Edition]) VALUES (N'51', N'Fiction', N'Jeffrey Archer', N'PaperBack', N'Pan Macmillian India', N'2014', N'I')
INSERT [dbo].[Books] ([ProductID], [Genre], [Author], [BindingType], [Publication], [PublicationYear], [Edition]) VALUES (N'52', N'Fiction', N'Dan Brown', N'Hardcover', N'Random House', N'2013', N'I')
INSERT [dbo].[Books] ([ProductID], [Genre], [Author], [BindingType], [Publication], [PublicationYear], [Edition]) VALUES (N'53', N'Fiction', N'F. Scott Fitzgerald', N'PaperBack', N'Picador', N'2013', N'V')
INSERT [dbo].[Books] ([ProductID], [Genre], [Author], [BindingType], [Publication], [PublicationYear], [Edition]) VALUES (N'54', N'Fiction', N'Jeffrey Archer', N'PaperBack', N'Pan Macmillian India', N'2013', N'I')
INSERT [dbo].[Books] ([ProductID], [Genre], [Author], [BindingType], [Publication], [PublicationYear], [Edition]) VALUES (N'55', N'Fiction', N'Green John', N'PaperBack', N'PENGUIN', N'2013', N'I')
INSERT [dbo].[Books] ([ProductID], [Genre], [Author], [BindingType], [Publication], [PublicationYear], [Edition]) VALUES (N'56', N'Fiction', N'Green John', N'PaperBack', N'PENGUIN', N'2013', N'I')
INSERT [dbo].[Books] ([ProductID], [Genre], [Author], [BindingType], [Publication], [PublicationYear], [Edition]) VALUES (N'57', N'Fiction', N'Sidney Sheldon', N'PaperBack', N'HyperCollins', N'2013', N'I')
INSERT [dbo].[Books] ([ProductID], [Genre], [Author], [BindingType], [Publication], [PublicationYear], [Edition]) VALUES (N'58', N'Non Fiction', N'Sanjaya Baru', N'Hardcover', N'PENGUIN', N'2014', N'I')
INSERT [dbo].[Books] ([ProductID], [Genre], [Author], [BindingType], [Publication], [PublicationYear], [Edition]) VALUES (N'59', N'Non Fiction', N'Ramchandra Guha', N'PaperBack', N'Picador India', N'2008', N'I')
INSERT [dbo].[Books] ([ProductID], [Genre], [Author], [BindingType], [Publication], [PublicationYear], [Edition]) VALUES (N'60', N'Non Fiction', N'Parak IAS', N'Hardcover', N'Neha Publishers', N'2014', N'I')
INSERT [dbo].[Books] ([ProductID], [Genre], [Author], [BindingType], [Publication], [PublicationYear], [Edition]) VALUES (N'61', N'Non Fiction', N'APJ Abdul Kalam', N'Hardcover', N'Universities Press', N'2000', N'I')
INSERT [dbo].[Books] ([ProductID], [Genre], [Author], [BindingType], [Publication], [PublicationYear], [Edition]) VALUES (N'62', N'Non Fiction', N'Walter Isaacson', N'Hardcover', N'Little, Brown Book Group', N'2011', N'I')
INSERT [dbo].[Cameras] ([ProductID], [CameraType], [Resolution], [ScreenSize], [Zoom]) VALUES (N'20', N'Point & Shoot', N'16', N'3', N'8x')
INSERT [dbo].[Cameras] ([ProductID], [CameraType], [Resolution], [ScreenSize], [Zoom]) VALUES (N'21', N'Point & Shoot', N'20', N'3', N'5x')
INSERT [dbo].[Cameras] ([ProductID], [CameraType], [Resolution], [ScreenSize], [Zoom]) VALUES (N'22', N'Point & Shoot', N'16', N'2.7', N'8x')
INSERT [dbo].[Cameras] ([ProductID], [CameraType], [Resolution], [ScreenSize], [Zoom]) VALUES (N'24', N'Mirrorless', N'12.3', N'3', NULL)
INSERT [dbo].[Cameras] ([ProductID], [CameraType], [Resolution], [ScreenSize], [Zoom]) VALUES (N'25', N'Mirrorless', N'16', N'3', NULL)
INSERT [dbo].[Cameras] ([ProductID], [CameraType], [Resolution], [ScreenSize], [Zoom]) VALUES (N'26', N'Mirrorless', N'18', N'3', NULL)
INSERT [dbo].[Cameras] ([ProductID], [CameraType], [Resolution], [ScreenSize], [Zoom]) VALUES (N'27', N'DSLR', N'24', N'3', N'10x')
INSERT [dbo].[Cameras] ([ProductID], [CameraType], [Resolution], [ScreenSize], [Zoom]) VALUES (N'28', N'DSLR', N'12', N'2.7', N'10x')
INSERT [dbo].[Cameras] ([ProductID], [CameraType], [Resolution], [ScreenSize], [Zoom]) VALUES (N'3', N'Point and Shoot', N'20', N'2.7', N'8x')
INSERT [dbo].[Cars] ([ProductID], [CarType], [Mileage], [Model]) VALUES (N'63', N'SUV', 12, NULL)
INSERT [dbo].[Cars] ([ProductID], [CarType], [Mileage], [Model]) VALUES (N'64', N'Hatchback', 16, NULL)
INSERT [dbo].[Cars] ([ProductID], [CarType], [Mileage], [Model]) VALUES (N'65', N'Sedan', 4, NULL)
INSERT [dbo].[Cars] ([ProductID], [CarType], [Mileage], [Model]) VALUES (N'66', N'Sports', 3, NULL)
INSERT [dbo].[Cars] ([ProductID], [CarType], [Mileage], [Model]) VALUES (N'67', N'Sedan', 3, NULL)
INSERT [dbo].[Cars] ([ProductID], [CarType], [Mileage], [Model]) VALUES (N'68', N'SUV', 8, NULL)
INSERT [dbo].[Cars] ([ProductID], [CarType], [Mileage], [Model]) VALUES (N'69', N'Sports', 5, NULL)
INSERT [dbo].[Cars] ([ProductID], [CarType], [Mileage], [Model]) VALUES (N'70', N'Sedan', 3, NULL)
INSERT [dbo].[Cars] ([ProductID], [CarType], [Mileage], [Model]) VALUES (N'71', N'HatchBack', 17, NULL)
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description]) VALUES (N'CatBks', N'Books', N'Book Data')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description]) VALUES (N'CatEle', N'Electronics', N'Electronic Data')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description]) VALUES (N'CatVeh', N'Vehicles', N'vehicleData')
INSERT [dbo].[CellPhones] ([ProductID], [Display], [OperatingSystem], [Processor], [TouchScreen], [ScreenSize], [StandByTime]) VALUES (N'1', N'TFT', N'Android', N'Dual-Core', 1, 4, 240)
INSERT [dbo].[CellPhones] ([ProductID], [Display], [OperatingSystem], [Processor], [TouchScreen], [ScreenSize], [StandByTime]) VALUES (N'10', N'LCD', N'Android', N'Quad-Core', 1, 5, 220)
INSERT [dbo].[CellPhones] ([ProductID], [Display], [OperatingSystem], [Processor], [TouchScreen], [ScreenSize], [StandByTime]) VALUES (N'11', N'LCD', N'Symbian', N'Single-Core', 0, 1.4, 300)
INSERT [dbo].[CellPhones] ([ProductID], [Display], [OperatingSystem], [Processor], [TouchScreen], [ScreenSize], [StandByTime]) VALUES (N'4', N'LCD', N'Windows Phone', N'Dual-Core', 1, 4, 360)
INSERT [dbo].[CellPhones] ([ProductID], [Display], [OperatingSystem], [Processor], [TouchScreen], [ScreenSize], [StandByTime]) VALUES (N'5', N'TFT', N'Android', N'Single-Core', 1, 4, 200)
INSERT [dbo].[CellPhones] ([ProductID], [Display], [OperatingSystem], [Processor], [TouchScreen], [ScreenSize], [StandByTime]) VALUES (N'6', N'LCD', N'Android', N'Dual-Core', 1, 4, 380)
INSERT [dbo].[CellPhones] ([ProductID], [Display], [OperatingSystem], [Processor], [TouchScreen], [ScreenSize], [StandByTime]) VALUES (N'7', N'LCD', N'IOS', N'Dual-Core', 1, 4, 240)
INSERT [dbo].[CellPhones] ([ProductID], [Display], [OperatingSystem], [Processor], [TouchScreen], [ScreenSize], [StandByTime]) VALUES (N'9', N'TFT', N'Android', N'Quad-Core', 1, 5, 240)
INSERT [dbo].[Mopeds] ([ProductID], [Mileage], [BodyType], [GroundClearance], [FuelTankCapacity], [Gears], [TubelessTyres], [Weight]) VALUES (N'80', 40, N'Plastic', 20, 5, 0, 1, 80)
INSERT [dbo].[Mopeds] ([ProductID], [Mileage], [BodyType], [GroundClearance], [FuelTankCapacity], [Gears], [TubelessTyres], [Weight]) VALUES (N'81', 46, N'Metal', 20, 6, 1, 0, 110)
INSERT [dbo].[Mopeds] ([ProductID], [Mileage], [BodyType], [GroundClearance], [FuelTankCapacity], [Gears], [TubelessTyres], [Weight]) VALUES (N'82', 40, N'Plastic', 20, 5, 1, 0, 80)
INSERT [dbo].[Mopeds] ([ProductID], [Mileage], [BodyType], [GroundClearance], [FuelTankCapacity], [Gears], [TubelessTyres], [Weight]) VALUES (N'84', 46, N'Metal', 15, 3, 0, 1, 75)
INSERT [dbo].[MotorBikes] ([ProductID], [Mileage], [EngineCapacity], [NoOfGears], [TubelessTyres], [Weight], [GroundClearance]) VALUES (N'75', 45, 45, 5, 1, 32, 45)
INSERT [dbo].[MotorBikes] ([ProductID], [Mileage], [EngineCapacity], [NoOfGears], [TubelessTyres], [Weight], [GroundClearance]) VALUES (N'76', 35, 63, 4, 1, 69, 32)
INSERT [dbo].[MotorBikes] ([ProductID], [Mileage], [EngineCapacity], [NoOfGears], [TubelessTyres], [Weight], [GroundClearance]) VALUES (N'77', 50, 120, 6, 1, 80, 30)
INSERT [dbo].[MotorBikes] ([ProductID], [Mileage], [EngineCapacity], [NoOfGears], [TubelessTyres], [Weight], [GroundClearance]) VALUES (N'78', 36, 85, 4, 0, 70, 20)
INSERT [dbo].[MotorBikes] ([ProductID], [Mileage], [EngineCapacity], [NoOfGears], [TubelessTyres], [Weight], [GroundClearance]) VALUES (N'79', 45, 45, 5, 1, 32, 45)
INSERT [dbo].[MusicSystems] ([ProductID], [DimensionMainUnit], [DimensionFrontSpeaker], [Bluetooth], [Radio], [USB], [Recording], [SurroundSound], [NetWeightMainUnit], [NetWeightWoofer], [PowerConsumption]) VALUES (N'29', N'200 x 300 x 185', N'', 1, 0, 1, 1, 1, 2.2, 0.5, 55)
INSERT [dbo].[MusicSystems] ([ProductID], [DimensionMainUnit], [DimensionFrontSpeaker], [Bluetooth], [Radio], [USB], [Recording], [SurroundSound], [NetWeightMainUnit], [NetWeightWoofer], [PowerConsumption]) VALUES (N'30', N'152 x 170 x 210', N'', 0, 1, 1, 0, 1, 1.5, 0.2, 20)
INSERT [dbo].[MusicSystems] ([ProductID], [DimensionMainUnit], [DimensionFrontSpeaker], [Bluetooth], [Radio], [USB], [Recording], [SurroundSound], [NetWeightMainUnit], [NetWeightWoofer], [PowerConsumption]) VALUES (N'31', N'120 x 150 x 210', N'', 0, 1, 1, 0, 0, 1.5, 0.2, 20)
INSERT [dbo].[MusicSystems] ([ProductID], [DimensionMainUnit], [DimensionFrontSpeaker], [Bluetooth], [Radio], [USB], [Recording], [SurroundSound], [NetWeightMainUnit], [NetWeightWoofer], [PowerConsumption]) VALUES (N'32', N'120 x 150 x 210', N'', 1, 0, 0, 0, 0, 1.5, 0.2, 20)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [BrandName], [Photo], [CategoryID], [SubCategoryID]) VALUES (N'1', N'Galaxy S Duos', 8587, N'Samsung', N'~/Images/cell1.jpg', N'CatEle', N'SCatGad')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [BrandName], [Photo], [CategoryID], [SubCategoryID]) VALUES (N'10', N'One M8', 49000, N'HTC', N'~/Images/cell8.jpg', N'CatEle', N'SCatGad')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [BrandName], [Photo], [CategoryID], [SubCategoryID]) VALUES (N'11', N'Nokia 105', 1193, N'Nokia', N'~/Images/cell9.jpg', N'CatEle', N'SCatGad')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [BrandName], [Photo], [CategoryID], [SubCategoryID]) VALUES (N'13', N'Galaxy Tab', 14799, N'Samsung', N'~/Images/tab2.jpg', N'CatEle', N'SCatGad')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [BrandName], [Photo], [CategoryID], [SubCategoryID]) VALUES (N'14', N'iPad Mini', 19990, N'Apple', N'~/Images/tab3.jpg', N'CatEle', N'SCatGad')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [BrandName], [Photo], [CategoryID], [SubCategoryID]) VALUES (N'15', N'Idea Tab', 6479, N'Lenovo', N'~/Images/tab4.jpg', N'CatEle', N'SCatGad')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [BrandName], [Photo], [CategoryID], [SubCategoryID]) VALUES (N'16', N'Yoga Tab', 19499, N'Lenovo', N'~/Images/tab5.jpg', N'CatEle', N'SCatGad')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [BrandName], [Photo], [CategoryID], [SubCategoryID]) VALUES (N'17', N'iPad Mini', 19990, N'Apple', N'~/Images/tab3.jpg', N'CatEle', N'SCatGad')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [BrandName], [Photo], [CategoryID], [SubCategoryID]) VALUES (N'18', N'Yoga Tab', 19499, N'Lenovo', N'~/Images/tab5.jpg', N'CatEle', N'SCatGad')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [BrandName], [Photo], [CategoryID], [SubCategoryID]) VALUES (N'19', N'Galaxy Tab', 14799, N'Samsung', N'~/Images/tab2.jpg', N'CatEle', N'SCatGad')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [BrandName], [Photo], [CategoryID], [SubCategoryID]) VALUES (N'2', N'Venue', 9795, N'Dell', N'~/Images/tab1.jpg', N'CatEle', N'SCatGad')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [BrandName], [Photo], [CategoryID], [SubCategoryID]) VALUES (N'20', N'Coolpix L830', 14790, N'Nikon', N'~/Images/cam2.jpg', N'CatEle', N'SCatGad')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [BrandName], [Photo], [CategoryID], [SubCategoryID]) VALUES (N'21', N'Coolpix L30', 5695, N'Nikon', N'~/Images/cam3.jpg', N'CatEle', N'SCatGad')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [BrandName], [Photo], [CategoryID], [SubCategoryID]) VALUES (N'22', N'PowerShot IXUS 145', 6156, N'Canon', N'~/Images/cam4.jpg', N'CatEle', N'SCatGad')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [BrandName], [Photo], [CategoryID], [SubCategoryID]) VALUES (N'24', N'PEN Lite E-PL3', 21242, N'Olympus', N'~/Images/cam6.jpg', N'CatEle', N'SCatGad')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [BrandName], [Photo], [CategoryID], [SubCategoryID]) VALUES (N'25', N'NEX-3NL', 25990, N'Sony', N'~/Images/cam7.jpg', N'CatEle', N'SCatGad')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [BrandName], [Photo], [CategoryID], [SubCategoryID]) VALUES (N'26', N'EOS-M', 29746, N'Canon', N'~/Images/cam8.jpg', N'CatEle', N'SCatGad')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [BrandName], [Photo], [CategoryID], [SubCategoryID]) VALUES (N'27', N'D3200', 28263, N'Nikon', N'~/Images/cam9.jpg', N'CatEle', N'SCatGad')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [BrandName], [Photo], [CategoryID], [SubCategoryID]) VALUES (N'28', N'EOS 1100D', 27000, N'Canon', N'~/Images/cam10.jpg', N'CatEle', N'SCatGad')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [BrandName], [Photo], [CategoryID], [SubCategoryID]) VALUES (N'29', N'Mini', 16150, N'Sony', N'~/Images/ms1.jpg', N'CatEle', N'SCatApp')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [BrandName], [Photo], [CategoryID], [SubCategoryID]) VALUES (N'3', N'Coolpix S3600', 6269, N'Nikon', N'~/Images/cam1.jpg', N'CatEle', N'SCatGad')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [BrandName], [Photo], [CategoryID], [SubCategoryID]) VALUES (N'30', N'Micro', 8550, N'Philips', N'~/Images/ms2.jpg', N'CatEle', N'SCatApp')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [BrandName], [Photo], [CategoryID], [SubCategoryID]) VALUES (N'31', N'PA Mini', 13999, N'Panasonic', N'~/Images/ms3.jpg', N'CatEle', N'SCatApp')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [BrandName], [Photo], [CategoryID], [SubCategoryID]) VALUES (N'32', N'SO Mini', 6000, N'Sony', N'~/Images/ms4.jpg', N'CatEle', N'SCatApp')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [BrandName], [Photo], [CategoryID], [SubCategoryID]) VALUES (N'33', N'CS UC24', 47990, N'Panasonic', N'~/Images/ac1.jpg', N'CatEle', N'SCatApp')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [BrandName], [Photo], [CategoryID], [SubCategoryID]) VALUES (N'34', N'LWA3GP4F', 23400, N'LG', N'~/Images/ac2.jpg', N'CatEle', N'SCatApp')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [BrandName], [Photo], [CategoryID], [SubCategoryID]) VALUES (N'35', N'LWA3GP2F', 22777, N'LG', N'~/Images/ac3.jpg', N'CatEle', N'SCatApp')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [BrandName], [Photo], [CategoryID], [SubCategoryID]) VALUES (N'36', N'LWA5CP3F', 25400, N'LG', N'~/Images/ac4.jpg', N'CatEle', N'SCatApp')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [BrandName], [Photo], [CategoryID], [SubCategoryID]) VALUES (N'37', N'LWA5BP3F', 24800, N'LG', N'~/Images/ac5.jpg', N'CatEle', N'SCatApp')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [BrandName], [Photo], [CategoryID], [SubCategoryID]) VALUES (N'38', N'LSA3AU2F', 27777, N'LG', N'~/Images/ac6.jpg', N'CatEle', N'SCatApp')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [BrandName], [Photo], [CategoryID], [SubCategoryID]) VALUES (N'39', N'LSA5AU2F', 31111, N'LG', N'~/Images/ac7.jpg', N'CatEle', N'SCatApp')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [BrandName], [Photo], [CategoryID], [SubCategoryID]) VALUES (N'4', N'Lumia 520', 7999, N'Nokia', N'~/Images/cell2.jpg', N'CatEle', N'SCatGad')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [BrandName], [Photo], [CategoryID], [SubCategoryID]) VALUES (N'40', N'LSA6ES3M', 40500, N'LG', N'~/Images/ac8.jpg', N'CatEle', N'SCatApp')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [BrandName], [Photo], [CategoryID], [SubCategoryID]) VALUES (N'41', N'CS UC18', 38000, N'Panasonic', N'~/Images/ac9.jpg', N'CatEle', N'SCatApp')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [BrandName], [Photo], [CategoryID], [SubCategoryID]) VALUES (N'42', N'42LB5820', 54690, N'LG', N'~/Images/tv1.jpg', N'CatEle', N'SCatApp')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [BrandName], [Photo], [CategoryID], [SubCategoryID]) VALUES (N'43', N'Bravia KLV', 56900, N'Sony', N'~/Images/tv2.jpg', N'CatEle', N'SCatApp')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [BrandName], [Photo], [CategoryID], [SubCategoryID]) VALUES (N'44', N'40PFL4758', 37000, N'Philips', N'~/Images/tv3.jpg', N'CatEle', N'SCatApp')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [BrandName], [Photo], [CategoryID], [SubCategoryID]) VALUES (N'45', N'40B6', 50900, N'Panasonic', N'~/Images/tv4.jpg', N'CatEle', N'SCatApp')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [BrandName], [Photo], [CategoryID], [SubCategoryID]) VALUES (N'46', N'28LN5155', 19850, N'LG', N'~/Images/tv5.jpg', N'CatEle', N'SCatApp')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [BrandName], [Photo], [CategoryID], [SubCategoryID]) VALUES (N'47', N'29PFL4738', 18990, N'Philips', N'~/Images/tv6.jpg', N'CatEle', N'SCatApp')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [BrandName], [Photo], [CategoryID], [SubCategoryID]) VALUES (N'48', N'28A400', 21900, N'Panasonic', N'~/Images/tv7.jpg', N'CatEle', N'SCatApp')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [BrandName], [Photo], [CategoryID], [SubCategoryID]) VALUES (N'49', N'KLV 28', 24900, N'Sony', N'~/Images/tv8.jpg', N'CatEle', N'SCatApp')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [BrandName], [Photo], [CategoryID], [SubCategoryID]) VALUES (N'5', N'Galaxy Star', 5391, N'Samsung', N'~/Images/cell3.jpg', N'CatEle', N'SCatGad')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [BrandName], [Photo], [CategoryID], [SubCategoryID]) VALUES (N'50', N'The Goldfinch', 600, N'Hachette', N'~/Images/book1.jpg', N'CatBks', NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [BrandName], [Photo], [CategoryID], [SubCategoryID]) VALUES (N'51', N'Be Careful What You Wish For', 210, N'Pan Macmillian India', N'~/Images/book2.jpg', N'CatBks', NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [BrandName], [Photo], [CategoryID], [SubCategoryID]) VALUES (N'52', N'Inferno', 405, N'Random House', N'~/Images/book3.jpg', N'CatBks', NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [BrandName], [Photo], [CategoryID], [SubCategoryID]) VALUES (N'53', N'The Great Gatsby', 145, N'Picador', N'~/Images/book4.jpg', N'CatBks', NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [BrandName], [Photo], [CategoryID], [SubCategoryID]) VALUES (N'54', N'Best Kept Secret', 195, N'Pan Macmillian India', N'~/Images/book5.jpg', N'CatBks', NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [BrandName], [Photo], [CategoryID], [SubCategoryID]) VALUES (N'55', N'The Fault in Our Stars', 350, N'PENGUIN UK', N'~/Images/book6.jpg', N'CatBks', NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [BrandName], [Photo], [CategoryID], [SubCategoryID]) VALUES (N'56', N'Looking For Alaska', 200, N'PENGUIN UK', N'~/Images/book7.jpg', N'CatBks', NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [BrandName], [Photo], [CategoryID], [SubCategoryID]) VALUES (N'57', N'The Tides of Memory', 165, N'HyperCollins', N'~/Images/book8.jpg', N'CatBks', NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [BrandName], [Photo], [CategoryID], [SubCategoryID]) VALUES (N'58', N'The Accidental Prime Minister', 335, N'PENGUIN', N'~/Images/book9.jpg', N'CatBks', NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [BrandName], [Photo], [CategoryID], [SubCategoryID]) VALUES (N'59', N'India After Gandhi', 375, N'Picador India', N'~/Images/book10.jpg', N'CatBks', NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [BrandName], [Photo], [CategoryID], [SubCategoryID]) VALUES (N'6', N'Nokia X', 6955, N'Nokia', N'~/Images/cell4.jpg', N'CatEle', N'SCatGad')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [BrandName], [Photo], [CategoryID], [SubCategoryID]) VALUES (N'60', N'Crusader or Conspirator?', 300, N'Neha Publishers', N'~/Images/book11.jpg', N'CatBks', NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [BrandName], [Photo], [CategoryID], [SubCategoryID]) VALUES (N'61', N'Wings of Fire', 158, N'Universities Press', N'~/Images/book12.jpg', N'CatBks', NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [BrandName], [Photo], [CategoryID], [SubCategoryID]) VALUES (N'62', N'Steve Jobs', 611, N'Little, Brown Book Group', N'~/Images/book13.jpg', N'CatBks', NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [BrandName], [Photo], [CategoryID], [SubCategoryID]) VALUES (N'63', N'Koleos', 600000, N'Renault', N'~/Images/Koleos.jpg', N'CatVeh', N'SCatFW')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [BrandName], [Photo], [CategoryID], [SubCategoryID]) VALUES (N'64', N'Swift', 4.21, N'Maruti', N'~/Images/Swift.jpg', N'CatVeh', N'SCatFW')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [BrandName], [Photo], [CategoryID], [SubCategoryID]) VALUES (N'65', N'ML 63AMG', 12000000, N'Mercedes', N'~/Images/ml63.jpg', N'CatVeh', N'SCatFW')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [BrandName], [Photo], [CategoryID], [SubCategoryID]) VALUES (N'66', N'Audi TT', 5300000, N'Audi', N'~/Images/AudiTT.jpg', N'CatVeh', N'SCatFW')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [BrandName], [Photo], [CategoryID], [SubCategoryID]) VALUES (N'67', N'S6', 8300000, N'Audi', N'~/Images/S6.jpg', N'CatVeh', N'SCatFW')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [BrandName], [Photo], [CategoryID], [SubCategoryID]) VALUES (N'68', N'Q7', 56, N'Audi', N'~/Images/Q7.jpg', N'CatVeh', N'SCatFW')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [BrandName], [Photo], [CategoryID], [SubCategoryID]) VALUES (N'69', N'Z4', 13100000, N'BMW', N'~/Images/Z4.jpg', N'CatVeh', N'SCatFW')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [BrandName], [Photo], [CategoryID], [SubCategoryID]) VALUES (N'7', N'IPhone 5S', 47599, N'Apple', N'~/Images/cell5.jpg', N'CatEle', N'ScatGad')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [BrandName], [Photo], [CategoryID], [SubCategoryID]) VALUES (N'70', N'7 Series', 10300000, N'BMW', N'~/Images/7s.jpg', N'CatVeh', N'SCatFW')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [BrandName], [Photo], [CategoryID], [SubCategoryID]) VALUES (N'71', N'Go', 400000, N'Maruti', N'~/Images/Go.jpg', N'CatVeh', N'SCatFW')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [BrandName], [Photo], [CategoryID], [SubCategoryID]) VALUES (N'75', N'CBR', 1000000, N'Honda', N'~/Images/CBR.jpg', N'CatVeh', N'SCatTW')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [BrandName], [Photo], [CategoryID], [SubCategoryID]) VALUES (N'76', N'CBR250R', 250000, N'Honda', N'~/Images/CBR250R.jpg', N'CatVeh', N'SCatTW')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [BrandName], [Photo], [CategoryID], [SubCategoryID]) VALUES (N'77', N'Apache 160', 82000, N'TVS', N'~/Images/Apache160.jpg', N'CatVeh', N'SCatTW')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [BrandName], [Photo], [CategoryID], [SubCategoryID]) VALUES (N'78', N'Apache180', 95000, N'TVS', N'~/Images/Apache180.jpg', N'CatVeh', N'SCatTW')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [BrandName], [Photo], [CategoryID], [SubCategoryID]) VALUES (N'79', N'R15', 120000, N'Yamaha', N'~/Images/R15.jpg', N'CatVeh', N'SCatTW')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [BrandName], [Photo], [CategoryID], [SubCategoryID]) VALUES (N'80', N'Scooty', 40000, N'TVS', N'~/Images/scooty.jpg', N'CatVeh', N'SCatTW')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [BrandName], [Photo], [CategoryID], [SubCategoryID]) VALUES (N'81', N'Activa', 60000, N'Honda', N'~/Images/activa.jpg', N'CatVeh', N'SCatTW')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [BrandName], [Photo], [CategoryID], [SubCategoryID]) VALUES (N'82', N'Vespa', 85000, N'Vespa', N'~/Images/vespa.jpg', N'CatVeh', N'SCatTW')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [BrandName], [Photo], [CategoryID], [SubCategoryID]) VALUES (N'84', N'YES', 50000, N'Yamaha', N'~/Images/yes.jpg', N'CatVeh', N'SCatTW')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Price], [BrandName], [Photo], [CategoryID], [SubCategoryID]) VALUES (N'9', N'Desire 700', 22500, N'HTC', N'~/Images/cell7.jpg', N'CatEle', N'SCatGad')
INSERT [dbo].[SubCategories] ([SubCategoryID], [SubCategoryName], [Description], [CategoryID]) VALUES (N'SCatApp', N'Appliances', N'Appliance Description', N'CatEle')
INSERT [dbo].[SubCategories] ([SubCategoryID], [SubCategoryName], [Description], [CategoryID]) VALUES (N'SCatFW', N'Four Wheeler', N'Four Wheeler Description', N'CatVeh')
INSERT [dbo].[SubCategories] ([SubCategoryID], [SubCategoryName], [Description], [CategoryID]) VALUES (N'SCatGad', N'Gadgets', N'Gadget Description', N'CatEle')
INSERT [dbo].[SubCategories] ([SubCategoryID], [SubCategoryName], [Description], [CategoryID]) VALUES (N'SCatTW', N'Two Wheeler', N'Two Wheeler', N'CatVeh')
INSERT [dbo].[Suggestions] ([SuggestionID], [Hits], [RatingFeatureCritic], [RatingPerformanceCritic], [RatingDesignCritic], [RatingDesignUser], [RatingPerformanceUser], [RatingFeatureUser], [ProductID]) VALUES (N'1', 1, 2, 5, 5, 5, 3, 3, N'1')
INSERT [dbo].[Suggestions] ([SuggestionID], [Hits], [RatingFeatureCritic], [RatingPerformanceCritic], [RatingDesignCritic], [RatingDesignUser], [RatingPerformanceUser], [RatingFeatureUser], [ProductID]) VALUES (N'10', 1, 4, 4, 5, 2, 3, 5, N'10')
INSERT [dbo].[Suggestions] ([SuggestionID], [Hits], [RatingFeatureCritic], [RatingPerformanceCritic], [RatingDesignCritic], [RatingDesignUser], [RatingPerformanceUser], [RatingFeatureUser], [ProductID]) VALUES (N'11', 1, 3, 5, 5, 2, 3, 5, N'11')
INSERT [dbo].[Suggestions] ([SuggestionID], [Hits], [RatingFeatureCritic], [RatingPerformanceCritic], [RatingDesignCritic], [RatingDesignUser], [RatingPerformanceUser], [RatingFeatureUser], [ProductID]) VALUES (N'13', 2, 2, 4, 2, 2, 3, 5, N'13')
INSERT [dbo].[Suggestions] ([SuggestionID], [Hits], [RatingFeatureCritic], [RatingPerformanceCritic], [RatingDesignCritic], [RatingDesignUser], [RatingPerformanceUser], [RatingFeatureUser], [ProductID]) VALUES (N'14', 1, 1, 1, 1, 2, 3, 5, N'14')
INSERT [dbo].[Suggestions] ([SuggestionID], [Hits], [RatingFeatureCritic], [RatingPerformanceCritic], [RatingDesignCritic], [RatingDesignUser], [RatingPerformanceUser], [RatingFeatureUser], [ProductID]) VALUES (N'15', 5, 4, 4, 5, 2, 3, 5, N'15')
INSERT [dbo].[Suggestions] ([SuggestionID], [Hits], [RatingFeatureCritic], [RatingPerformanceCritic], [RatingDesignCritic], [RatingDesignUser], [RatingPerformanceUser], [RatingFeatureUser], [ProductID]) VALUES (N'16', 5, 4, 4, 5, 2, 3, 5, N'16')
INSERT [dbo].[Suggestions] ([SuggestionID], [Hits], [RatingFeatureCritic], [RatingPerformanceCritic], [RatingDesignCritic], [RatingDesignUser], [RatingPerformanceUser], [RatingFeatureUser], [ProductID]) VALUES (N'17', 5, 4, 1, 5, 2, 1, 1, N'17')
INSERT [dbo].[Suggestions] ([SuggestionID], [Hits], [RatingFeatureCritic], [RatingPerformanceCritic], [RatingDesignCritic], [RatingDesignUser], [RatingPerformanceUser], [RatingFeatureUser], [ProductID]) VALUES (N'18', 5, 1, 2, 4, 2, 3, 5, N'18')
INSERT [dbo].[Suggestions] ([SuggestionID], [Hits], [RatingFeatureCritic], [RatingPerformanceCritic], [RatingDesignCritic], [RatingDesignUser], [RatingPerformanceUser], [RatingFeatureUser], [ProductID]) VALUES (N'19', 5, 4, 4, 3, 2, 3, 5, N'19')
INSERT [dbo].[Suggestions] ([SuggestionID], [Hits], [RatingFeatureCritic], [RatingPerformanceCritic], [RatingDesignCritic], [RatingDesignUser], [RatingPerformanceUser], [RatingFeatureUser], [ProductID]) VALUES (N'2', 2, 5, 4, 3, 3, 3, 3, N'2')
INSERT [dbo].[Suggestions] ([SuggestionID], [Hits], [RatingFeatureCritic], [RatingPerformanceCritic], [RatingDesignCritic], [RatingDesignUser], [RatingPerformanceUser], [RatingFeatureUser], [ProductID]) VALUES (N'20', 5, 4, 4, 1, 5, 3, 5, N'20')
INSERT [dbo].[Suggestions] ([SuggestionID], [Hits], [RatingFeatureCritic], [RatingPerformanceCritic], [RatingDesignCritic], [RatingDesignUser], [RatingPerformanceUser], [RatingFeatureUser], [ProductID]) VALUES (N'21', 5, 1, 5, 1, 2, 3, 5, N'21')
INSERT [dbo].[Suggestions] ([SuggestionID], [Hits], [RatingFeatureCritic], [RatingPerformanceCritic], [RatingDesignCritic], [RatingDesignUser], [RatingPerformanceUser], [RatingFeatureUser], [ProductID]) VALUES (N'22', 5, 4, 4, 4, 4, 3, 5, N'22')
INSERT [dbo].[Suggestions] ([SuggestionID], [Hits], [RatingFeatureCritic], [RatingPerformanceCritic], [RatingDesignCritic], [RatingDesignUser], [RatingPerformanceUser], [RatingFeatureUser], [ProductID]) VALUES (N'24', 5, 4, 4, 5, 1, 3, 5, N'24')
INSERT [dbo].[Suggestions] ([SuggestionID], [Hits], [RatingFeatureCritic], [RatingPerformanceCritic], [RatingDesignCritic], [RatingDesignUser], [RatingPerformanceUser], [RatingFeatureUser], [ProductID]) VALUES (N'25', 5, 2, 4, 2, 5, 3, 5, N'25')
INSERT [dbo].[Suggestions] ([SuggestionID], [Hits], [RatingFeatureCritic], [RatingPerformanceCritic], [RatingDesignCritic], [RatingDesignUser], [RatingPerformanceUser], [RatingFeatureUser], [ProductID]) VALUES (N'26', 5, 5, 5, 5, 2, 3, 5, N'26')
INSERT [dbo].[Suggestions] ([SuggestionID], [Hits], [RatingFeatureCritic], [RatingPerformanceCritic], [RatingDesignCritic], [RatingDesignUser], [RatingPerformanceUser], [RatingFeatureUser], [ProductID]) VALUES (N'27', 5, 4, 4, 4, 3, 3, 5, N'27')
INSERT [dbo].[Suggestions] ([SuggestionID], [Hits], [RatingFeatureCritic], [RatingPerformanceCritic], [RatingDesignCritic], [RatingDesignUser], [RatingPerformanceUser], [RatingFeatureUser], [ProductID]) VALUES (N'28', 5, 4, 2, 5, 2, 3, 5, N'28')
INSERT [dbo].[Suggestions] ([SuggestionID], [Hits], [RatingFeatureCritic], [RatingPerformanceCritic], [RatingDesignCritic], [RatingDesignUser], [RatingPerformanceUser], [RatingFeatureUser], [ProductID]) VALUES (N'29', 5, 4, 4, 5, 5, 3, 5, N'29')
INSERT [dbo].[Suggestions] ([SuggestionID], [Hits], [RatingFeatureCritic], [RatingPerformanceCritic], [RatingDesignCritic], [RatingDesignUser], [RatingPerformanceUser], [RatingFeatureUser], [ProductID]) VALUES (N'3', 2, 5, 4, 3, 3, 3, 3, N'3')
INSERT [dbo].[Suggestions] ([SuggestionID], [Hits], [RatingFeatureCritic], [RatingPerformanceCritic], [RatingDesignCritic], [RatingDesignUser], [RatingPerformanceUser], [RatingFeatureUser], [ProductID]) VALUES (N'30', 5, 1, 4, 1, 1, 3, 5, N'30')
INSERT [dbo].[Suggestions] ([SuggestionID], [Hits], [RatingFeatureCritic], [RatingPerformanceCritic], [RatingDesignCritic], [RatingDesignUser], [RatingPerformanceUser], [RatingFeatureUser], [ProductID]) VALUES (N'31', 1, 2, 3, 5, 4, 1, 2, N'31')
INSERT [dbo].[Suggestions] ([SuggestionID], [Hits], [RatingFeatureCritic], [RatingPerformanceCritic], [RatingDesignCritic], [RatingDesignUser], [RatingPerformanceUser], [RatingFeatureUser], [ProductID]) VALUES (N'32', 1, 2, 3, 5, 4, 1, 2, N'32')
INSERT [dbo].[Suggestions] ([SuggestionID], [Hits], [RatingFeatureCritic], [RatingPerformanceCritic], [RatingDesignCritic], [RatingDesignUser], [RatingPerformanceUser], [RatingFeatureUser], [ProductID]) VALUES (N'33', 2, 2, 5, 1, 2, 3, 5, N'33')
INSERT [dbo].[Suggestions] ([SuggestionID], [Hits], [RatingFeatureCritic], [RatingPerformanceCritic], [RatingDesignCritic], [RatingDesignUser], [RatingPerformanceUser], [RatingFeatureUser], [ProductID]) VALUES (N'34', 2, 2, 5, 1, 2, 3, 5, N'34')
INSERT [dbo].[Suggestions] ([SuggestionID], [Hits], [RatingFeatureCritic], [RatingPerformanceCritic], [RatingDesignCritic], [RatingDesignUser], [RatingPerformanceUser], [RatingFeatureUser], [ProductID]) VALUES (N'35', 2, 2, 5, 1, 2, 3, 5, N'35')
INSERT [dbo].[Suggestions] ([SuggestionID], [Hits], [RatingFeatureCritic], [RatingPerformanceCritic], [RatingDesignCritic], [RatingDesignUser], [RatingPerformanceUser], [RatingFeatureUser], [ProductID]) VALUES (N'36', 2, 2, 5, 1, 2, 3, 5, N'36')
INSERT [dbo].[Suggestions] ([SuggestionID], [Hits], [RatingFeatureCritic], [RatingPerformanceCritic], [RatingDesignCritic], [RatingDesignUser], [RatingPerformanceUser], [RatingFeatureUser], [ProductID]) VALUES (N'37', 2, 2, 5, 1, 2, 3, 5, N'37')
INSERT [dbo].[Suggestions] ([SuggestionID], [Hits], [RatingFeatureCritic], [RatingPerformanceCritic], [RatingDesignCritic], [RatingDesignUser], [RatingPerformanceUser], [RatingFeatureUser], [ProductID]) VALUES (N'38', 2, 2, 5, 1, 2, 3, 5, N'38')
INSERT [dbo].[Suggestions] ([SuggestionID], [Hits], [RatingFeatureCritic], [RatingPerformanceCritic], [RatingDesignCritic], [RatingDesignUser], [RatingPerformanceUser], [RatingFeatureUser], [ProductID]) VALUES (N'39', 2, 4, 2, 2, 1, 4, 2, N'39')
INSERT [dbo].[Suggestions] ([SuggestionID], [Hits], [RatingFeatureCritic], [RatingPerformanceCritic], [RatingDesignCritic], [RatingDesignUser], [RatingPerformanceUser], [RatingFeatureUser], [ProductID]) VALUES (N'4', 2, 2, 5, 5, 5, 3, 3, N'4')
INSERT [dbo].[Suggestions] ([SuggestionID], [Hits], [RatingFeatureCritic], [RatingPerformanceCritic], [RatingDesignCritic], [RatingDesignUser], [RatingPerformanceUser], [RatingFeatureUser], [ProductID]) VALUES (N'40', 2, 1, 3, 5, 1, 4, 2, N'40')
INSERT [dbo].[Suggestions] ([SuggestionID], [Hits], [RatingFeatureCritic], [RatingPerformanceCritic], [RatingDesignCritic], [RatingDesignUser], [RatingPerformanceUser], [RatingFeatureUser], [ProductID]) VALUES (N'41', 2, 4, 3, 5, 1, 4, 2, N'41')
INSERT [dbo].[Suggestions] ([SuggestionID], [Hits], [RatingFeatureCritic], [RatingPerformanceCritic], [RatingDesignCritic], [RatingDesignUser], [RatingPerformanceUser], [RatingFeatureUser], [ProductID]) VALUES (N'42', 2, 1, 2, 5, 1, 4, 2, N'42')
INSERT [dbo].[Suggestions] ([SuggestionID], [Hits], [RatingFeatureCritic], [RatingPerformanceCritic], [RatingDesignCritic], [RatingDesignUser], [RatingPerformanceUser], [RatingFeatureUser], [ProductID]) VALUES (N'43', 2, 1, 1, 5, 1, 4, 2, N'43')
INSERT [dbo].[Suggestions] ([SuggestionID], [Hits], [RatingFeatureCritic], [RatingPerformanceCritic], [RatingDesignCritic], [RatingDesignUser], [RatingPerformanceUser], [RatingFeatureUser], [ProductID]) VALUES (N'44', 2, 4, 1, 1, 1, 4, 2, N'44')
INSERT [dbo].[Suggestions] ([SuggestionID], [Hits], [RatingFeatureCritic], [RatingPerformanceCritic], [RatingDesignCritic], [RatingDesignUser], [RatingPerformanceUser], [RatingFeatureUser], [ProductID]) VALUES (N'45', 2, 5, 2, 5, 1, 4, 2, N'45')
INSERT [dbo].[Suggestions] ([SuggestionID], [Hits], [RatingFeatureCritic], [RatingPerformanceCritic], [RatingDesignCritic], [RatingDesignUser], [RatingPerformanceUser], [RatingFeatureUser], [ProductID]) VALUES (N'46', 2, 1, 1, 5, 1, 4, 2, N'46')
INSERT [dbo].[Suggestions] ([SuggestionID], [Hits], [RatingFeatureCritic], [RatingPerformanceCritic], [RatingDesignCritic], [RatingDesignUser], [RatingPerformanceUser], [RatingFeatureUser], [ProductID]) VALUES (N'47', 2, 1, 2, 5, 1, 4, 2, N'47')
INSERT [dbo].[Suggestions] ([SuggestionID], [Hits], [RatingFeatureCritic], [RatingPerformanceCritic], [RatingDesignCritic], [RatingDesignUser], [RatingPerformanceUser], [RatingFeatureUser], [ProductID]) VALUES (N'48', 2, 1, 2, 5, 1, 4, 2, N'48')
INSERT [dbo].[Suggestions] ([SuggestionID], [Hits], [RatingFeatureCritic], [RatingPerformanceCritic], [RatingDesignCritic], [RatingDesignUser], [RatingPerformanceUser], [RatingFeatureUser], [ProductID]) VALUES (N'49', 2, 1, 2, 5, 1, 4, 2, N'49')
INSERT [dbo].[Suggestions] ([SuggestionID], [Hits], [RatingFeatureCritic], [RatingPerformanceCritic], [RatingDesignCritic], [RatingDesignUser], [RatingPerformanceUser], [RatingFeatureUser], [ProductID]) VALUES (N'5', 5, 3, 2, 3, 2, 2, 2, N'5')
INSERT [dbo].[Suggestions] ([SuggestionID], [Hits], [RatingFeatureCritic], [RatingPerformanceCritic], [RatingDesignCritic], [RatingDesignUser], [RatingPerformanceUser], [RatingFeatureUser], [ProductID]) VALUES (N'50', 2, 1, 2, 5, 1, 4, 2, N'50')
INSERT [dbo].[Suggestions] ([SuggestionID], [Hits], [RatingFeatureCritic], [RatingPerformanceCritic], [RatingDesignCritic], [RatingDesignUser], [RatingPerformanceUser], [RatingFeatureUser], [ProductID]) VALUES (N'51', 2, 1, 2, 5, 1, 4, 2, N'51')
INSERT [dbo].[Suggestions] ([SuggestionID], [Hits], [RatingFeatureCritic], [RatingPerformanceCritic], [RatingDesignCritic], [RatingDesignUser], [RatingPerformanceUser], [RatingFeatureUser], [ProductID]) VALUES (N'52', 2, 1, 2, 5, 1, 4, 2, N'52')
INSERT [dbo].[Suggestions] ([SuggestionID], [Hits], [RatingFeatureCritic], [RatingPerformanceCritic], [RatingDesignCritic], [RatingDesignUser], [RatingPerformanceUser], [RatingFeatureUser], [ProductID]) VALUES (N'53', 2, 1, 2, 5, 1, 4, 2, N'53')
INSERT [dbo].[Suggestions] ([SuggestionID], [Hits], [RatingFeatureCritic], [RatingPerformanceCritic], [RatingDesignCritic], [RatingDesignUser], [RatingPerformanceUser], [RatingFeatureUser], [ProductID]) VALUES (N'54', 2, 1, 2, 5, 1, 4, 2, N'54')
INSERT [dbo].[Suggestions] ([SuggestionID], [Hits], [RatingFeatureCritic], [RatingPerformanceCritic], [RatingDesignCritic], [RatingDesignUser], [RatingPerformanceUser], [RatingFeatureUser], [ProductID]) VALUES (N'55', 2, 1, 2, 5, 1, 4, 2, N'55')
INSERT [dbo].[Suggestions] ([SuggestionID], [Hits], [RatingFeatureCritic], [RatingPerformanceCritic], [RatingDesignCritic], [RatingDesignUser], [RatingPerformanceUser], [RatingFeatureUser], [ProductID]) VALUES (N'56', 2, 1, 2, 5, 1, 4, 2, N'56')
INSERT [dbo].[Suggestions] ([SuggestionID], [Hits], [RatingFeatureCritic], [RatingPerformanceCritic], [RatingDesignCritic], [RatingDesignUser], [RatingPerformanceUser], [RatingFeatureUser], [ProductID]) VALUES (N'57', 2, 1, 2, 5, 1, 4, 2, N'57')
INSERT [dbo].[Suggestions] ([SuggestionID], [Hits], [RatingFeatureCritic], [RatingPerformanceCritic], [RatingDesignCritic], [RatingDesignUser], [RatingPerformanceUser], [RatingFeatureUser], [ProductID]) VALUES (N'58', 2, 1, 2, 5, 1, 4, 2, N'58')
INSERT [dbo].[Suggestions] ([SuggestionID], [Hits], [RatingFeatureCritic], [RatingPerformanceCritic], [RatingDesignCritic], [RatingDesignUser], [RatingPerformanceUser], [RatingFeatureUser], [ProductID]) VALUES (N'59', 2, 1, 2, 5, 1, 4, 2, N'59')
INSERT [dbo].[Suggestions] ([SuggestionID], [Hits], [RatingFeatureCritic], [RatingPerformanceCritic], [RatingDesignCritic], [RatingDesignUser], [RatingPerformanceUser], [RatingFeatureUser], [ProductID]) VALUES (N'6', 2, 4, 4, 5, 2, 3, 2, N'6')
INSERT [dbo].[Suggestions] ([SuggestionID], [Hits], [RatingFeatureCritic], [RatingPerformanceCritic], [RatingDesignCritic], [RatingDesignUser], [RatingPerformanceUser], [RatingFeatureUser], [ProductID]) VALUES (N'60', 2, 1, 2, 5, 1, 4, 2, N'60')
INSERT [dbo].[Suggestions] ([SuggestionID], [Hits], [RatingFeatureCritic], [RatingPerformanceCritic], [RatingDesignCritic], [RatingDesignUser], [RatingPerformanceUser], [RatingFeatureUser], [ProductID]) VALUES (N'61', 2, 1, 2, 5, 1, 4, 2, N'61')
INSERT [dbo].[Suggestions] ([SuggestionID], [Hits], [RatingFeatureCritic], [RatingPerformanceCritic], [RatingDesignCritic], [RatingDesignUser], [RatingPerformanceUser], [RatingFeatureUser], [ProductID]) VALUES (N'62', 2, 1, 2, 5, 1, 4, 2, N'62')
INSERT [dbo].[Suggestions] ([SuggestionID], [Hits], [RatingFeatureCritic], [RatingPerformanceCritic], [RatingDesignCritic], [RatingDesignUser], [RatingPerformanceUser], [RatingFeatureUser], [ProductID]) VALUES (N'63', 1, 2, 5, 5, 5, 3, 3, N'63')
INSERT [dbo].[Suggestions] ([SuggestionID], [Hits], [RatingFeatureCritic], [RatingPerformanceCritic], [RatingDesignCritic], [RatingDesignUser], [RatingPerformanceUser], [RatingFeatureUser], [ProductID]) VALUES (N'64', 1, 4, 4, 5, 2, 3, 5, N'64')
INSERT [dbo].[Suggestions] ([SuggestionID], [Hits], [RatingFeatureCritic], [RatingPerformanceCritic], [RatingDesignCritic], [RatingDesignUser], [RatingPerformanceUser], [RatingFeatureUser], [ProductID]) VALUES (N'65', 1, 3, 5, 5, 2, 3, 5, N'65')
INSERT [dbo].[Suggestions] ([SuggestionID], [Hits], [RatingFeatureCritic], [RatingPerformanceCritic], [RatingDesignCritic], [RatingDesignUser], [RatingPerformanceUser], [RatingFeatureUser], [ProductID]) VALUES (N'66', 1, 3, 3, 4, 1, 2, 5, N'66')
INSERT [dbo].[Suggestions] ([SuggestionID], [Hits], [RatingFeatureCritic], [RatingPerformanceCritic], [RatingDesignCritic], [RatingDesignUser], [RatingPerformanceUser], [RatingFeatureUser], [ProductID]) VALUES (N'67', 2, 2, 4, 2, 2, 3, 5, N'67')
INSERT [dbo].[Suggestions] ([SuggestionID], [Hits], [RatingFeatureCritic], [RatingPerformanceCritic], [RatingDesignCritic], [RatingDesignUser], [RatingPerformanceUser], [RatingFeatureUser], [ProductID]) VALUES (N'68', 1, 1, 1, 1, 2, 3, 5, N'68')
INSERT [dbo].[Suggestions] ([SuggestionID], [Hits], [RatingFeatureCritic], [RatingPerformanceCritic], [RatingDesignCritic], [RatingDesignUser], [RatingPerformanceUser], [RatingFeatureUser], [ProductID]) VALUES (N'69', 5, 4, 4, 5, 2, 3, 5, N'69')
INSERT [dbo].[Suggestions] ([SuggestionID], [Hits], [RatingFeatureCritic], [RatingPerformanceCritic], [RatingDesignCritic], [RatingDesignUser], [RatingPerformanceUser], [RatingFeatureUser], [ProductID]) VALUES (N'7', 1, 4, 5, 4, 1, 2, 5, N'7')
INSERT [dbo].[Suggestions] ([SuggestionID], [Hits], [RatingFeatureCritic], [RatingPerformanceCritic], [RatingDesignCritic], [RatingDesignUser], [RatingPerformanceUser], [RatingFeatureUser], [ProductID]) VALUES (N'70', 5, 4, 4, 5, 2, 3, 5, N'70')
INSERT [dbo].[Suggestions] ([SuggestionID], [Hits], [RatingFeatureCritic], [RatingPerformanceCritic], [RatingDesignCritic], [RatingDesignUser], [RatingPerformanceUser], [RatingFeatureUser], [ProductID]) VALUES (N'71', 5, 4, 1, 5, 2, 1, 1, N'71')
INSERT [dbo].[Suggestions] ([SuggestionID], [Hits], [RatingFeatureCritic], [RatingPerformanceCritic], [RatingDesignCritic], [RatingDesignUser], [RatingPerformanceUser], [RatingFeatureUser], [ProductID]) VALUES (N'75', 5, 4, 4, 1, 5, 3, 5, N'75')
INSERT [dbo].[Suggestions] ([SuggestionID], [Hits], [RatingFeatureCritic], [RatingPerformanceCritic], [RatingDesignCritic], [RatingDesignUser], [RatingPerformanceUser], [RatingFeatureUser], [ProductID]) VALUES (N'76', 5, 1, 5, 1, 2, 3, 5, N'76')
INSERT [dbo].[Suggestions] ([SuggestionID], [Hits], [RatingFeatureCritic], [RatingPerformanceCritic], [RatingDesignCritic], [RatingDesignUser], [RatingPerformanceUser], [RatingFeatureUser], [ProductID]) VALUES (N'77', 5, 4, 4, 4, 4, 3, 5, N'77')
INSERT [dbo].[Suggestions] ([SuggestionID], [Hits], [RatingFeatureCritic], [RatingPerformanceCritic], [RatingDesignCritic], [RatingDesignUser], [RatingPerformanceUser], [RatingFeatureUser], [ProductID]) VALUES (N'78', 5, 4, 4, 5, 2, 3, 5, N'78')
INSERT [dbo].[Suggestions] ([SuggestionID], [Hits], [RatingFeatureCritic], [RatingPerformanceCritic], [RatingDesignCritic], [RatingDesignUser], [RatingPerformanceUser], [RatingFeatureUser], [ProductID]) VALUES (N'79', 5, 4, 4, 5, 1, 3, 5, N'79')
INSERT [dbo].[Suggestions] ([SuggestionID], [Hits], [RatingFeatureCritic], [RatingPerformanceCritic], [RatingDesignCritic], [RatingDesignUser], [RatingPerformanceUser], [RatingFeatureUser], [ProductID]) VALUES (N'80', 5, 2, 4, 2, 5, 3, 5, N'80')
INSERT [dbo].[Suggestions] ([SuggestionID], [Hits], [RatingFeatureCritic], [RatingPerformanceCritic], [RatingDesignCritic], [RatingDesignUser], [RatingPerformanceUser], [RatingFeatureUser], [ProductID]) VALUES (N'81', 5, 5, 5, 5, 2, 3, 5, N'81')
INSERT [dbo].[Suggestions] ([SuggestionID], [Hits], [RatingFeatureCritic], [RatingPerformanceCritic], [RatingDesignCritic], [RatingDesignUser], [RatingPerformanceUser], [RatingFeatureUser], [ProductID]) VALUES (N'82', 5, 4, 4, 4, 3, 3, 5, N'82')
INSERT [dbo].[Suggestions] ([SuggestionID], [Hits], [RatingFeatureCritic], [RatingPerformanceCritic], [RatingDesignCritic], [RatingDesignUser], [RatingPerformanceUser], [RatingFeatureUser], [ProductID]) VALUES (N'84', 5, 4, 2, 5, 2, 3, 5, N'84')
INSERT [dbo].[Suggestions] ([SuggestionID], [Hits], [RatingFeatureCritic], [RatingPerformanceCritic], [RatingDesignCritic], [RatingDesignUser], [RatingPerformanceUser], [RatingFeatureUser], [ProductID]) VALUES (N'9', 1, 4, 1, 5, 4, 5, 5, N'9')
INSERT [dbo].[Tablets] ([ProductID], [OperatingSystem], [ScreenSize], [Processor], [Display], [StandByTime], [TouchScreen], [WiFi]) VALUES (N'13', N'Android', 7, N'Dual-Core', N'TFT', N'230', 1, 1)
INSERT [dbo].[Tablets] ([ProductID], [OperatingSystem], [ScreenSize], [Processor], [Display], [StandByTime], [TouchScreen], [WiFi]) VALUES (N'14', N'IOS', 7, N'Dual-Core', N'LCD', N'300', 1, 1)
INSERT [dbo].[Tablets] ([ProductID], [OperatingSystem], [ScreenSize], [Processor], [Display], [StandByTime], [TouchScreen], [WiFi]) VALUES (N'15', N'Adroid', 7, N'Dual-Core', N'LCD', N'230', 1, 1)
INSERT [dbo].[Tablets] ([ProductID], [OperatingSystem], [ScreenSize], [Processor], [Display], [StandByTime], [TouchScreen], [WiFi]) VALUES (N'16', N'Android', 8, N'Quad-Core', N'LCD', N'300', 1, 1)
INSERT [dbo].[Tablets] ([ProductID], [OperatingSystem], [ScreenSize], [Processor], [Display], [StandByTime], [TouchScreen], [WiFi]) VALUES (N'17', N'IOS', 7, N'Dual-Core', N'LCD', N'300', 1, 0)
INSERT [dbo].[Tablets] ([ProductID], [OperatingSystem], [ScreenSize], [Processor], [Display], [StandByTime], [TouchScreen], [WiFi]) VALUES (N'18', N'Android', 8, N'Quad-Core', N'LCD', N'300', 1, 0)
INSERT [dbo].[Tablets] ([ProductID], [OperatingSystem], [ScreenSize], [Processor], [Display], [StandByTime], [TouchScreen], [WiFi]) VALUES (N'19', N'Android', 7, N'Dual-Core', N'TFT', N'230', 1, 0)
INSERT [dbo].[Tablets] ([ProductID], [OperatingSystem], [ScreenSize], [Processor], [Display], [StandByTime], [TouchScreen], [WiFi]) VALUES (N'2', N'Android', 7, N'Dual-Core', N'LCD', N'48', 1, 0)
INSERT [dbo].[Televisions] ([ProductID], [DisplayType], [ScreenSize], [HD], [Resolution], [NetWeight], [USB], [PowerConsumption]) VALUES (N'42', N'Plasma', 42, 1, N'1080', 1, 0, 70)
INSERT [dbo].[Televisions] ([ProductID], [DisplayType], [ScreenSize], [HD], [Resolution], [NetWeight], [USB], [PowerConsumption]) VALUES (N'43', N'LED', 40, 1, N'720', 1, 0, 75)
INSERT [dbo].[Televisions] ([ProductID], [DisplayType], [ScreenSize], [HD], [Resolution], [NetWeight], [USB], [PowerConsumption]) VALUES (N'44', N'LED', 39, 1, N'1080', 1, 1, 100)
INSERT [dbo].[Televisions] ([ProductID], [DisplayType], [ScreenSize], [HD], [Resolution], [NetWeight], [USB], [PowerConsumption]) VALUES (N'45', N'Plasma', 40, 1, N'1080', 1, 0, 105)
INSERT [dbo].[Televisions] ([ProductID], [DisplayType], [ScreenSize], [HD], [Resolution], [NetWeight], [USB], [PowerConsumption]) VALUES (N'46', N'LCD', 28, 1, N'720', 1, 1, 35)
INSERT [dbo].[Televisions] ([ProductID], [DisplayType], [ScreenSize], [HD], [Resolution], [NetWeight], [USB], [PowerConsumption]) VALUES (N'47', N'LED', 28, 1, N'720', 1, 0, 50)
INSERT [dbo].[Televisions] ([ProductID], [DisplayType], [ScreenSize], [HD], [Resolution], [NetWeight], [USB], [PowerConsumption]) VALUES (N'48', N'LCD', 28, 1, N'1080', 1, 0, 35)
INSERT [dbo].[Televisions] ([ProductID], [DisplayType], [ScreenSize], [HD], [Resolution], [NetWeight], [USB], [PowerConsumption]) VALUES (N'49', N'LED', 28, 1, N'720', 1, 1, 45)
INSERT [dbo].[UserProfiles] ([Preference1], [Preference2], [Preference3], [UserID], [UserName], [City], [State], [Gender]) VALUES (NULL, NULL, NULL, N'Aieshwarya', N'Aieshwarya', N'Pune', N'Maharashtra', N'Female')
INSERT [dbo].[UserProfiles] ([Preference1], [Preference2], [Preference3], [UserID], [UserName], [City], [State], [Gender]) VALUES (NULL, NULL, NULL, N'ass', N'as', N'ss', N'ss', N'Male')
INSERT [dbo].[UserProfiles] ([Preference1], [Preference2], [Preference3], [UserID], [UserName], [City], [State], [Gender]) VALUES (NULL, NULL, NULL, N'Mayur', N'Mayur', N'mumbai', N'mh', N'Male')
INSERT [dbo].[UserProfiles] ([Preference1], [Preference2], [Preference3], [UserID], [UserName], [City], [State], [Gender]) VALUES (NULL, NULL, NULL, N'Porva', N'porva', N'Pune', N'Maharashtra', N'Female')
INSERT [dbo].[UserProfiles] ([Preference1], [Preference2], [Preference3], [UserID], [UserName], [City], [State], [Gender]) VALUES (NULL, NULL, NULL, N'rohit', N'rohit', N'pune', N'Mah', N'Male')
INSERT [dbo].[UserProfiles] ([Preference1], [Preference2], [Preference3], [UserID], [UserName], [City], [State], [Gender]) VALUES (NULL, NULL, NULL, N'Shash', N'Shash', N'Pune', N'Maharashtra', N'Female')
INSERT [dbo].[UserProfiles] ([Preference1], [Preference2], [Preference3], [UserID], [UserName], [City], [State], [Gender]) VALUES (NULL, NULL, NULL, N'Vaibhav', N'Vaibhav', N'Pune', N'Maharashtra', N'Male')
INSERT [dbo].[UserProfiles] ([Preference1], [Preference2], [Preference3], [UserID], [UserName], [City], [State], [Gender]) VALUES (NULL, NULL, NULL, N'zzzz', N'zzzz', N'pune', N'mah', N'Female')
ALTER TABLE [dbo].[AirConditioners]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AirConditioners_dbo.Products_ProductID] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[AirConditioners] CHECK CONSTRAINT [FK_dbo.AirConditioners_dbo.Products_ProductID]
GO
ALTER TABLE [dbo].[Books]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Books_dbo.Products_ProductID] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[Books] CHECK CONSTRAINT [FK_dbo.Books_dbo.Products_ProductID]
GO
ALTER TABLE [dbo].[Cameras]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Cameras_dbo.Products_ProductID] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[Cameras] CHECK CONSTRAINT [FK_dbo.Cameras_dbo.Products_ProductID]
GO
ALTER TABLE [dbo].[Cars]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Cars_dbo.Products_ProductID] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[Cars] CHECK CONSTRAINT [FK_dbo.Cars_dbo.Products_ProductID]
GO
ALTER TABLE [dbo].[CellPhones]  WITH CHECK ADD  CONSTRAINT [FK_dbo.CellPhones_dbo.Products_ProductID] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[CellPhones] CHECK CONSTRAINT [FK_dbo.CellPhones_dbo.Products_ProductID]
GO
ALTER TABLE [dbo].[Mopeds]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Mopeds_dbo.Products_ProductID] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[Mopeds] CHECK CONSTRAINT [FK_dbo.Mopeds_dbo.Products_ProductID]
GO
ALTER TABLE [dbo].[MotorBikes]  WITH CHECK ADD  CONSTRAINT [FK_dbo.MotorBikes_dbo.Products_ProductID] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[MotorBikes] CHECK CONSTRAINT [FK_dbo.MotorBikes_dbo.Products_ProductID]
GO
ALTER TABLE [dbo].[MusicSystems]  WITH CHECK ADD  CONSTRAINT [FK_dbo.MusicSystems_dbo.Products_ProductID] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[MusicSystems] CHECK CONSTRAINT [FK_dbo.MusicSystems_dbo.Products_ProductID]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Products_dbo.Categories_CategoryID] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([CategoryID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_dbo.Products_dbo.Categories_CategoryID]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Products_dbo.SubCategories_SubCategoryID] FOREIGN KEY([SubCategoryID])
REFERENCES [dbo].[SubCategories] ([SubCategoryID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_dbo.Products_dbo.SubCategories_SubCategoryID]
GO
ALTER TABLE [dbo].[SubCategories]  WITH CHECK ADD  CONSTRAINT [FK_dbo.SubCategories_dbo.Categories_CategoryID] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([CategoryID])
GO
ALTER TABLE [dbo].[SubCategories] CHECK CONSTRAINT [FK_dbo.SubCategories_dbo.Categories_CategoryID]
GO
ALTER TABLE [dbo].[Suggestions]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Suggestions_dbo.Products_ProductID] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[Suggestions] CHECK CONSTRAINT [FK_dbo.Suggestions_dbo.Products_ProductID]
GO
ALTER TABLE [dbo].[Tablets]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Tablets_dbo.Products_ProductID] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[Tablets] CHECK CONSTRAINT [FK_dbo.Tablets_dbo.Products_ProductID]
GO
ALTER TABLE [dbo].[Televisions]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Televisions_dbo.Products_ProductID] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[Televisions] CHECK CONSTRAINT [FK_dbo.Televisions_dbo.Products_ProductID]
GO
ALTER TABLE [dbo].[UserProfiles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.UserProfiles_dbo.Products_Preference1] FOREIGN KEY([Preference1])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[UserProfiles] CHECK CONSTRAINT [FK_dbo.UserProfiles_dbo.Products_Preference1]
GO
ALTER TABLE [dbo].[UserProfiles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.UserProfiles_dbo.Products_Preference2] FOREIGN KEY([Preference2])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[UserProfiles] CHECK CONSTRAINT [FK_dbo.UserProfiles_dbo.Products_Preference2]
GO
ALTER TABLE [dbo].[UserProfiles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.UserProfiles_dbo.Products_Preference3] FOREIGN KEY([Preference3])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[UserProfiles] CHECK CONSTRAINT [FK_dbo.UserProfiles_dbo.Products_Preference3]
GO
