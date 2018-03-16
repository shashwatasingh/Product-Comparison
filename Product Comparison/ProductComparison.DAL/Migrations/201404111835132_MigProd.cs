namespace ProductComparison.DAL.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class MigProd : DbMigration
    {
        public override void Up()
        {
            CreateStoredProcedure(
                "dbo.AirConditioner_Insert",
                p => new
                    {
                        ProductID = p.String(maxLength: 30),
                        ProductName = p.String(maxLength: 40),
                        Price = p.Double(),
                        BrandName = p.String(maxLength: 40),
                        Photo = p.String(maxLength: 100),
                        CategoryID = p.String(maxLength: 30),
                        SubCategoryID = p.String(maxLength: 30),
                        Name = p.String(maxLength: 30),
                        Type = p.String(maxLength: 20),
                        DisplayPanel = p.Boolean(),
                        DisplayPanelType = p.String(maxLength: 20),
                        Capacity = p.String(maxLength: 20),
                        Dimensions = p.String(maxLength: 10),
                        NetWeight = p.Double(),
                        PowerConsumption = p.Double(),
                        PowerSupply = p.String(maxLength: 10),
                    },
                body:
                    @"INSERT [dbo].[Products]([ProductID], [ProductName], [Price], [BrandName], [Photo], [CategoryID], [SubCategoryID])
                      VALUES (@ProductID, @ProductName, @Price, @BrandName, @Photo, @CategoryID, @SubCategoryID)
                      
                      INSERT [dbo].[AirConditioners]([ProductID], [Name], [Type], [DisplayPanel], [DisplayPanelType], [Capacity], [Dimensions], [NetWeight], [PowerConsumption], [PowerSupply])
                      VALUES (@ProductID, @Name, @Type, @DisplayPanel, @DisplayPanelType, @Capacity, @Dimensions, @NetWeight, @PowerConsumption, @PowerSupply)"
            );
            
            CreateStoredProcedure(
                "dbo.AirConditioner_Update",
                p => new
                    {
                        ProductID = p.String(maxLength: 30),
                        ProductName = p.String(maxLength: 40),
                        Price = p.Double(),
                        BrandName = p.String(maxLength: 40),
                        Photo = p.String(maxLength: 100),
                        CategoryID = p.String(maxLength: 30),
                        SubCategoryID = p.String(maxLength: 30),
                        Name = p.String(maxLength: 30),
                        Type = p.String(maxLength: 20),
                        DisplayPanel = p.Boolean(),
                        DisplayPanelType = p.String(maxLength: 20),
                        Capacity = p.String(maxLength: 20),
                        Dimensions = p.String(maxLength: 10),
                        NetWeight = p.Double(),
                        PowerConsumption = p.Double(),
                        PowerSupply = p.String(maxLength: 10),
                    },
                body:
                    @"UPDATE [dbo].[AirConditioners]
                      SET [Name] = @Name, [Type] = @Type, [DisplayPanel] = @DisplayPanel, [DisplayPanelType] = @DisplayPanelType, [Capacity] = @Capacity, [Dimensions] = @Dimensions, [NetWeight] = @NetWeight, [PowerConsumption] = @PowerConsumption, [PowerSupply] = @PowerSupply
                      WHERE ([ProductID] = @ProductID)
                      
                      UPDATE [dbo].[Products]
                      SET [ProductName] = @ProductName, [Price] = @Price, [BrandName] = @BrandName, [Photo] = @Photo, [CategoryID] = @CategoryID, [SubCategoryID] = @SubCategoryID
                      WHERE ([ProductID] = @ProductID)
                      AND @@ROWCOUNT > 0"
            );
            
            CreateStoredProcedure(
                "dbo.AirConditioner_Delete",
                p => new
                    {
                        ProductID = p.String(maxLength: 30),
                    },
                body:
                    @"DELETE [dbo].[AirConditioners]
                      WHERE ([ProductID] = @ProductID)
                      
                      DELETE [dbo].[Products]
                      WHERE ([ProductID] = @ProductID)
                      AND @@ROWCOUNT > 0"
            );
            
            CreateStoredProcedure(
                "dbo.Book_Insert",
                p => new
                    {
                        ProductID = p.String(maxLength: 30),
                        ProductName = p.String(maxLength: 40),
                        Price = p.Double(),
                        BrandName = p.String(maxLength: 40),
                        Photo = p.String(maxLength: 100),
                        CategoryID = p.String(maxLength: 30),
                        SubCategoryID = p.String(maxLength: 30),
                        Genre = p.String(maxLength: 30),
                        Author = p.String(maxLength: 30),
                        BindingType = p.String(maxLength: 30),
                        Publication = p.String(maxLength: 30),
                        PublicationYear = p.String(maxLength: 4),
                        Edition = p.String(maxLength: 10),
                    },
                body:
                    @"INSERT [dbo].[Products]([ProductID], [ProductName], [Price], [BrandName], [Photo], [CategoryID], [SubCategoryID])
                      VALUES (@ProductID, @ProductName, @Price, @BrandName, @Photo, @CategoryID, @SubCategoryID)
                      
                      INSERT [dbo].[Books]([ProductID], [Genre], [Author], [BindingType], [Publication], [PublicationYear], [Edition])
                      VALUES (@ProductID, @Genre, @Author, @BindingType, @Publication, @PublicationYear, @Edition)"
            );
            
            CreateStoredProcedure(
                "dbo.Book_Update",
                p => new
                    {
                        ProductID = p.String(maxLength: 30),
                        ProductName = p.String(maxLength: 40),
                        Price = p.Double(),
                        BrandName = p.String(maxLength: 40),
                        Photo = p.String(maxLength: 100),
                        CategoryID = p.String(maxLength: 30),
                        SubCategoryID = p.String(maxLength: 30),
                        Genre = p.String(maxLength: 30),
                        Author = p.String(maxLength: 30),
                        BindingType = p.String(maxLength: 30),
                        Publication = p.String(maxLength: 30),
                        PublicationYear = p.String(maxLength: 4),
                        Edition = p.String(maxLength: 10),
                    },
                body:
                    @"UPDATE [dbo].[Books]
                      SET [Genre] = @Genre, [Author] = @Author, [BindingType] = @BindingType, [Publication] = @Publication, [PublicationYear] = @PublicationYear, [Edition] = @Edition
                      WHERE ([ProductID] = @ProductID)
                      
                      UPDATE [dbo].[Products]
                      SET [ProductName] = @ProductName, [Price] = @Price, [BrandName] = @BrandName, [Photo] = @Photo, [CategoryID] = @CategoryID, [SubCategoryID] = @SubCategoryID
                      WHERE ([ProductID] = @ProductID)
                      AND @@ROWCOUNT > 0"
            );
            
            CreateStoredProcedure(
                "dbo.Book_Delete",
                p => new
                    {
                        ProductID = p.String(maxLength: 30),
                    },
                body:
                    @"DELETE [dbo].[Books]
                      WHERE ([ProductID] = @ProductID)
                      
                      DELETE [dbo].[Products]
                      WHERE ([ProductID] = @ProductID)
                      AND @@ROWCOUNT > 0"
            );
            
            CreateStoredProcedure(
                "dbo.Camera_Insert",
                p => new
                    {
                        ProductID = p.String(maxLength: 30),
                        ProductName = p.String(maxLength: 40),
                        Price = p.Double(),
                        BrandName = p.String(maxLength: 40),
                        Photo = p.String(maxLength: 100),
                        CategoryID = p.String(maxLength: 30),
                        SubCategoryID = p.String(maxLength: 30),
                        CameraType = p.String(maxLength: 40),
                        Resolution = p.String(maxLength: 40),
                        ScreenSize = p.String(maxLength: 40),
                        Zoom = p.String(maxLength: 40),
                    },
                body:
                    @"INSERT [dbo].[Products]([ProductID], [ProductName], [Price], [BrandName], [Photo], [CategoryID], [SubCategoryID])
                      VALUES (@ProductID, @ProductName, @Price, @BrandName, @Photo, @CategoryID, @SubCategoryID)
                      
                      INSERT [dbo].[Cameras]([ProductID], [CameraType], [Resolution], [ScreenSize], [Zoom])
                      VALUES (@ProductID, @CameraType, @Resolution, @ScreenSize, @Zoom)"
            );
            
            CreateStoredProcedure(
                "dbo.Camera_Update",
                p => new
                    {
                        ProductID = p.String(maxLength: 30),
                        ProductName = p.String(maxLength: 40),
                        Price = p.Double(),
                        BrandName = p.String(maxLength: 40),
                        Photo = p.String(maxLength: 100),
                        CategoryID = p.String(maxLength: 30),
                        SubCategoryID = p.String(maxLength: 30),
                        CameraType = p.String(maxLength: 40),
                        Resolution = p.String(maxLength: 40),
                        ScreenSize = p.String(maxLength: 40),
                        Zoom = p.String(maxLength: 40),
                    },
                body:
                    @"UPDATE [dbo].[Cameras]
                      SET [CameraType] = @CameraType, [Resolution] = @Resolution, [ScreenSize] = @ScreenSize, [Zoom] = @Zoom
                      WHERE ([ProductID] = @ProductID)
                      
                      UPDATE [dbo].[Products]
                      SET [ProductName] = @ProductName, [Price] = @Price, [BrandName] = @BrandName, [Photo] = @Photo, [CategoryID] = @CategoryID, [SubCategoryID] = @SubCategoryID
                      WHERE ([ProductID] = @ProductID)
                      AND @@ROWCOUNT > 0"
            );
            
            CreateStoredProcedure(
                "dbo.Camera_Delete",
                p => new
                    {
                        ProductID = p.String(maxLength: 30),
                    },
                body:
                    @"DELETE [dbo].[Cameras]
                      WHERE ([ProductID] = @ProductID)
                      
                      DELETE [dbo].[Products]
                      WHERE ([ProductID] = @ProductID)
                      AND @@ROWCOUNT > 0"
            );
            
            CreateStoredProcedure(
                "dbo.Car_Insert",
                p => new
                    {
                        ProductID = p.String(maxLength: 30),
                        ProductName = p.String(maxLength: 40),
                        Price = p.Double(),
                        BrandName = p.String(maxLength: 40),
                        Photo = p.String(maxLength: 100),
                        CategoryID = p.String(maxLength: 30),
                        SubCategoryID = p.String(maxLength: 30),
                        CarType = p.String(maxLength: 20),
                        Mileage = p.Double(),
                        Model = p.String(maxLength: 20),
                    },
                body:
                    @"INSERT [dbo].[Products]([ProductID], [ProductName], [Price], [BrandName], [Photo], [CategoryID], [SubCategoryID])
                      VALUES (@ProductID, @ProductName, @Price, @BrandName, @Photo, @CategoryID, @SubCategoryID)
                      
                      INSERT [dbo].[Cars]([ProductID], [CarType], [Mileage], [Model])
                      VALUES (@ProductID, @CarType, @Mileage, @Model)"
            );
            
            CreateStoredProcedure(
                "dbo.Car_Update",
                p => new
                    {
                        ProductID = p.String(maxLength: 30),
                        ProductName = p.String(maxLength: 40),
                        Price = p.Double(),
                        BrandName = p.String(maxLength: 40),
                        Photo = p.String(maxLength: 100),
                        CategoryID = p.String(maxLength: 30),
                        SubCategoryID = p.String(maxLength: 30),
                        CarType = p.String(maxLength: 20),
                        Mileage = p.Double(),
                        Model = p.String(maxLength: 20),
                    },
                body:
                    @"UPDATE [dbo].[Cars]
                      SET [CarType] = @CarType, [Mileage] = @Mileage, [Model] = @Model
                      WHERE ([ProductID] = @ProductID)
                      
                      UPDATE [dbo].[Products]
                      SET [ProductName] = @ProductName, [Price] = @Price, [BrandName] = @BrandName, [Photo] = @Photo, [CategoryID] = @CategoryID, [SubCategoryID] = @SubCategoryID
                      WHERE ([ProductID] = @ProductID)
                      AND @@ROWCOUNT > 0"
            );
            
            CreateStoredProcedure(
                "dbo.Car_Delete",
                p => new
                    {
                        ProductID = p.String(maxLength: 30),
                    },
                body:
                    @"DELETE [dbo].[Cars]
                      WHERE ([ProductID] = @ProductID)
                      
                      DELETE [dbo].[Products]
                      WHERE ([ProductID] = @ProductID)
                      AND @@ROWCOUNT > 0"
            );
            
            CreateStoredProcedure(
                "dbo.CellPhone_Insert",
                p => new
                    {
                        ProductID = p.String(maxLength: 30),
                        ProductName = p.String(maxLength: 40),
                        Price = p.Double(),
                        BrandName = p.String(maxLength: 40),
                        Photo = p.String(maxLength: 100),
                        CategoryID = p.String(maxLength: 30),
                        SubCategoryID = p.String(maxLength: 30),
                        Display = p.String(maxLength: 40),
                        OperatingSystem = p.String(maxLength: 40),
                        Processor = p.String(maxLength: 40),
                        TouchScreen = p.Boolean(),
                        ScreenSize = p.Double(),
                        StandByTime = p.Double(),
                    },
                body:
                    @"INSERT [dbo].[Products]([ProductID], [ProductName], [Price], [BrandName], [Photo], [CategoryID], [SubCategoryID])
                      VALUES (@ProductID, @ProductName, @Price, @BrandName, @Photo, @CategoryID, @SubCategoryID)
                      
                      INSERT [dbo].[CellPhones]([ProductID], [Display], [OperatingSystem], [Processor], [TouchScreen], [ScreenSize], [StandByTime])
                      VALUES (@ProductID, @Display, @OperatingSystem, @Processor, @TouchScreen, @ScreenSize, @StandByTime)"
            );
            
            CreateStoredProcedure(
                "dbo.CellPhone_Update",
                p => new
                    {
                        ProductID = p.String(maxLength: 30),
                        ProductName = p.String(maxLength: 40),
                        Price = p.Double(),
                        BrandName = p.String(maxLength: 40),
                        Photo = p.String(maxLength: 100),
                        CategoryID = p.String(maxLength: 30),
                        SubCategoryID = p.String(maxLength: 30),
                        Display = p.String(maxLength: 40),
                        OperatingSystem = p.String(maxLength: 40),
                        Processor = p.String(maxLength: 40),
                        TouchScreen = p.Boolean(),
                        ScreenSize = p.Double(),
                        StandByTime = p.Double(),
                    },
                body:
                    @"UPDATE [dbo].[CellPhones]
                      SET [Display] = @Display, [OperatingSystem] = @OperatingSystem, [Processor] = @Processor, [TouchScreen] = @TouchScreen, [ScreenSize] = @ScreenSize, [StandByTime] = @StandByTime
                      WHERE ([ProductID] = @ProductID)
                      
                      UPDATE [dbo].[Products]
                      SET [ProductName] = @ProductName, [Price] = @Price, [BrandName] = @BrandName, [Photo] = @Photo, [CategoryID] = @CategoryID, [SubCategoryID] = @SubCategoryID
                      WHERE ([ProductID] = @ProductID)
                      AND @@ROWCOUNT > 0"
            );
            
            CreateStoredProcedure(
                "dbo.CellPhone_Delete",
                p => new
                    {
                        ProductID = p.String(maxLength: 30),
                    },
                body:
                    @"DELETE [dbo].[CellPhones]
                      WHERE ([ProductID] = @ProductID)
                      
                      DELETE [dbo].[Products]
                      WHERE ([ProductID] = @ProductID)
                      AND @@ROWCOUNT > 0"
            );
            
            CreateStoredProcedure(
                "dbo.Moped_Insert",
                p => new
                    {
                        ProductID = p.String(maxLength: 30),
                        ProductName = p.String(maxLength: 40),
                        Price = p.Double(),
                        BrandName = p.String(maxLength: 40),
                        Photo = p.String(maxLength: 100),
                        CategoryID = p.String(maxLength: 30),
                        SubCategoryID = p.String(maxLength: 30),
                        Mileage = p.Double(),
                        BodyType = p.String(maxLength: 20),
                        GroundClearance = p.Int(),
                        FuelTankCapacity = p.Int(),
                        Gears = p.Boolean(),
                        TubelessTyres = p.Boolean(),
                        Weight = p.Double(),
                    },
                body:
                    @"INSERT [dbo].[Products]([ProductID], [ProductName], [Price], [BrandName], [Photo], [CategoryID], [SubCategoryID])
                      VALUES (@ProductID, @ProductName, @Price, @BrandName, @Photo, @CategoryID, @SubCategoryID)
                      
                      INSERT [dbo].[Mopeds]([ProductID], [Mileage], [BodyType], [GroundClearance], [FuelTankCapacity], [Gears], [TubelessTyres], [Weight])
                      VALUES (@ProductID, @Mileage, @BodyType, @GroundClearance, @FuelTankCapacity, @Gears, @TubelessTyres, @Weight)"
            );
            
            CreateStoredProcedure(
                "dbo.Moped_Update",
                p => new
                    {
                        ProductID = p.String(maxLength: 30),
                        ProductName = p.String(maxLength: 40),
                        Price = p.Double(),
                        BrandName = p.String(maxLength: 40),
                        Photo = p.String(maxLength: 100),
                        CategoryID = p.String(maxLength: 30),
                        SubCategoryID = p.String(maxLength: 30),
                        Mileage = p.Double(),
                        BodyType = p.String(maxLength: 20),
                        GroundClearance = p.Int(),
                        FuelTankCapacity = p.Int(),
                        Gears = p.Boolean(),
                        TubelessTyres = p.Boolean(),
                        Weight = p.Double(),
                    },
                body:
                    @"UPDATE [dbo].[Mopeds]
                      SET [Mileage] = @Mileage, [BodyType] = @BodyType, [GroundClearance] = @GroundClearance, [FuelTankCapacity] = @FuelTankCapacity, [Gears] = @Gears, [TubelessTyres] = @TubelessTyres, [Weight] = @Weight
                      WHERE ([ProductID] = @ProductID)
                      
                      UPDATE [dbo].[Products]
                      SET [ProductName] = @ProductName, [Price] = @Price, [BrandName] = @BrandName, [Photo] = @Photo, [CategoryID] = @CategoryID, [SubCategoryID] = @SubCategoryID
                      WHERE ([ProductID] = @ProductID)
                      AND @@ROWCOUNT > 0"
            );
            
            CreateStoredProcedure(
                "dbo.Moped_Delete",
                p => new
                    {
                        ProductID = p.String(maxLength: 30),
                    },
                body:
                    @"DELETE [dbo].[Mopeds]
                      WHERE ([ProductID] = @ProductID)
                      
                      DELETE [dbo].[Products]
                      WHERE ([ProductID] = @ProductID)
                      AND @@ROWCOUNT > 0"
            );
            
            CreateStoredProcedure(
                "dbo.MoterBike_Insert",
                p => new
                    {
                        ProductID = p.String(maxLength: 30),
                        ProductName = p.String(maxLength: 40),
                        Price = p.Double(),
                        BrandName = p.String(maxLength: 40),
                        Photo = p.String(maxLength: 100),
                        CategoryID = p.String(maxLength: 30),
                        SubCategoryID = p.String(maxLength: 30),
                        Mileage = p.Double(),
                        EngineCapacity = p.Double(),
                        NoOfGears = p.Int(),
                        TubelessTyres = p.Boolean(),
                        Weight = p.Double(),
                        GroundClearance = p.Int(),
                    },
                body:
                    @"INSERT [dbo].[Products]([ProductID], [ProductName], [Price], [BrandName], [Photo], [CategoryID], [SubCategoryID])
                      VALUES (@ProductID, @ProductName, @Price, @BrandName, @Photo, @CategoryID, @SubCategoryID)
                      
                      INSERT [dbo].[MotorBikes]([ProductID], [Mileage], [EngineCapacity], [NoOfGears], [TubelessTyres], [Weight], [GroundClearance])
                      VALUES (@ProductID, @Mileage, @EngineCapacity, @NoOfGears, @TubelessTyres, @Weight, @GroundClearance)"
            );
            
            CreateStoredProcedure(
                "dbo.MoterBike_Update",
                p => new
                    {
                        ProductID = p.String(maxLength: 30),
                        ProductName = p.String(maxLength: 40),
                        Price = p.Double(),
                        BrandName = p.String(maxLength: 40),
                        Photo = p.String(maxLength: 100),
                        CategoryID = p.String(maxLength: 30),
                        SubCategoryID = p.String(maxLength: 30),
                        Mileage = p.Double(),
                        EngineCapacity = p.Double(),
                        NoOfGears = p.Int(),
                        TubelessTyres = p.Boolean(),
                        Weight = p.Double(),
                        GroundClearance = p.Int(),
                    },
                body:
                    @"UPDATE [dbo].[MotorBikes]
                      SET [Mileage] = @Mileage, [EngineCapacity] = @EngineCapacity, [NoOfGears] = @NoOfGears, [TubelessTyres] = @TubelessTyres, [Weight] = @Weight, [GroundClearance] = @GroundClearance
                      WHERE ([ProductID] = @ProductID)
                      
                      UPDATE [dbo].[Products]
                      SET [ProductName] = @ProductName, [Price] = @Price, [BrandName] = @BrandName, [Photo] = @Photo, [CategoryID] = @CategoryID, [SubCategoryID] = @SubCategoryID
                      WHERE ([ProductID] = @ProductID)
                      AND @@ROWCOUNT > 0"
            );
            
            CreateStoredProcedure(
                "dbo.MoterBike_Delete",
                p => new
                    {
                        ProductID = p.String(maxLength: 30),
                    },
                body:
                    @"DELETE [dbo].[MotorBikes]
                      WHERE ([ProductID] = @ProductID)
                      
                      DELETE [dbo].[Products]
                      WHERE ([ProductID] = @ProductID)
                      AND @@ROWCOUNT > 0"
            );
            
            CreateStoredProcedure(
                "dbo.MusicSystem_Insert",
                p => new
                    {
                        ProductID = p.String(maxLength: 30),
                        ProductName = p.String(maxLength: 40),
                        Price = p.Double(),
                        BrandName = p.String(maxLength: 40),
                        Photo = p.String(maxLength: 100),
                        CategoryID = p.String(maxLength: 30),
                        SubCategoryID = p.String(maxLength: 30),
                        DimensionMainUnit = p.String(maxLength: 30),
                        DimensionFrontSpeaker = p.String(maxLength: 30),
                        Bluetooth = p.Boolean(),
                        Radio = p.Boolean(),
                        USB = p.Boolean(),
                        Recording = p.Boolean(),
                        SurroundSound = p.Boolean(),
                        NetWeightMainUnit = p.Double(),
                        NetWeightWoofer = p.Double(),
                        PowerConsumption = p.Double(),
                    },
                body:
                    @"INSERT [dbo].[Products]([ProductID], [ProductName], [Price], [BrandName], [Photo], [CategoryID], [SubCategoryID])
                      VALUES (@ProductID, @ProductName, @Price, @BrandName, @Photo, @CategoryID, @SubCategoryID)
                      
                      INSERT [dbo].[MusicSystems]([ProductID], [DimensionMainUnit], [DimensionFrontSpeaker], [Bluetooth], [Radio], [USB], [Recording], [SurroundSound], [NetWeightMainUnit], [NetWeightWoofer], [PowerConsumption])
                      VALUES (@ProductID, @DimensionMainUnit, @DimensionFrontSpeaker, @Bluetooth, @Radio, @USB, @Recording, @SurroundSound, @NetWeightMainUnit, @NetWeightWoofer, @PowerConsumption)"
            );
            
            CreateStoredProcedure(
                "dbo.MusicSystem_Update",
                p => new
                    {
                        ProductID = p.String(maxLength: 30),
                        ProductName = p.String(maxLength: 40),
                        Price = p.Double(),
                        BrandName = p.String(maxLength: 40),
                        Photo = p.String(maxLength: 100),
                        CategoryID = p.String(maxLength: 30),
                        SubCategoryID = p.String(maxLength: 30),
                        DimensionMainUnit = p.String(maxLength: 30),
                        DimensionFrontSpeaker = p.String(maxLength: 30),
                        Bluetooth = p.Boolean(),
                        Radio = p.Boolean(),
                        USB = p.Boolean(),
                        Recording = p.Boolean(),
                        SurroundSound = p.Boolean(),
                        NetWeightMainUnit = p.Double(),
                        NetWeightWoofer = p.Double(),
                        PowerConsumption = p.Double(),
                    },
                body:
                    @"UPDATE [dbo].[MusicSystems]
                      SET [DimensionMainUnit] = @DimensionMainUnit, [DimensionFrontSpeaker] = @DimensionFrontSpeaker, [Bluetooth] = @Bluetooth, [Radio] = @Radio, [USB] = @USB, [Recording] = @Recording, [SurroundSound] = @SurroundSound, [NetWeightMainUnit] = @NetWeightMainUnit, [NetWeightWoofer] = @NetWeightWoofer, [PowerConsumption] = @PowerConsumption
                      WHERE ([ProductID] = @ProductID)
                      
                      UPDATE [dbo].[Products]
                      SET [ProductName] = @ProductName, [Price] = @Price, [BrandName] = @BrandName, [Photo] = @Photo, [CategoryID] = @CategoryID, [SubCategoryID] = @SubCategoryID
                      WHERE ([ProductID] = @ProductID)
                      AND @@ROWCOUNT > 0"
            );
            
            CreateStoredProcedure(
                "dbo.MusicSystem_Delete",
                p => new
                    {
                        ProductID = p.String(maxLength: 30),
                    },
                body:
                    @"DELETE [dbo].[MusicSystems]
                      WHERE ([ProductID] = @ProductID)
                      
                      DELETE [dbo].[Products]
                      WHERE ([ProductID] = @ProductID)
                      AND @@ROWCOUNT > 0"
            );
            
            CreateStoredProcedure(
                "dbo.Product_Insert",
                p => new
                    {
                        ProductID = p.String(maxLength: 30),
                        ProductName = p.String(maxLength: 40),
                        Price = p.Double(),
                        BrandName = p.String(maxLength: 40),
                        Photo = p.String(maxLength: 100),
                        CategoryID = p.String(maxLength: 30),
                        SubCategoryID = p.String(maxLength: 30),
                    },
                body:
                    @"INSERT [dbo].[Products]([ProductID], [ProductName], [Price], [BrandName], [Photo], [CategoryID], [SubCategoryID])
                      VALUES (@ProductID, @ProductName, @Price, @BrandName, @Photo, @CategoryID, @SubCategoryID)"
            );
            
            CreateStoredProcedure(
                "dbo.Product_Update",
                p => new
                    {
                        ProductID = p.String(maxLength: 30),
                        ProductName = p.String(maxLength: 40),
                        Price = p.Double(),
                        BrandName = p.String(maxLength: 40),
                        Photo = p.String(maxLength: 100),
                        CategoryID = p.String(maxLength: 30),
                        SubCategoryID = p.String(maxLength: 30),
                    },
                body:
                    @"UPDATE [dbo].[Products]
                      SET [ProductName] = @ProductName, [Price] = @Price, [BrandName] = @BrandName, [Photo] = @Photo, [CategoryID] = @CategoryID, [SubCategoryID] = @SubCategoryID
                      WHERE ([ProductID] = @ProductID)"
            );
            
            CreateStoredProcedure(
                "dbo.Product_Delete",
                p => new
                    {
                        ProductID = p.String(maxLength: 30),
                    },
                body:
                    @"DELETE [dbo].[Products]
                      WHERE ([ProductID] = @ProductID)"
            );
            
            CreateStoredProcedure(
                "dbo.Tablet_Insert",
                p => new
                    {
                        ProductID = p.String(maxLength: 30),
                        ProductName = p.String(maxLength: 40),
                        Price = p.Double(),
                        BrandName = p.String(maxLength: 40),
                        Photo = p.String(maxLength: 100),
                        CategoryID = p.String(maxLength: 30),
                        SubCategoryID = p.String(maxLength: 30),
                        OperatingSystem = p.String(maxLength: 40),
                        ScreenSize = p.Double(),
                        Processor = p.String(maxLength: 40),
                        Display = p.String(maxLength: 40),
                        StandByTime = p.String(maxLength: 40),
                        TouchScreen = p.Boolean(),
                        WiFi = p.Boolean(),
                    },
                body:
                    @"INSERT [dbo].[Products]([ProductID], [ProductName], [Price], [BrandName], [Photo], [CategoryID], [SubCategoryID])
                      VALUES (@ProductID, @ProductName, @Price, @BrandName, @Photo, @CategoryID, @SubCategoryID)
                      
                      INSERT [dbo].[Tablets]([ProductID], [OperatingSystem], [ScreenSize], [Processor], [Display], [StandByTime], [TouchScreen], [WiFi])
                      VALUES (@ProductID, @OperatingSystem, @ScreenSize, @Processor, @Display, @StandByTime, @TouchScreen, @WiFi)"
            );
            
            CreateStoredProcedure(
                "dbo.Tablet_Update",
                p => new
                    {
                        ProductID = p.String(maxLength: 30),
                        ProductName = p.String(maxLength: 40),
                        Price = p.Double(),
                        BrandName = p.String(maxLength: 40),
                        Photo = p.String(maxLength: 100),
                        CategoryID = p.String(maxLength: 30),
                        SubCategoryID = p.String(maxLength: 30),
                        OperatingSystem = p.String(maxLength: 40),
                        ScreenSize = p.Double(),
                        Processor = p.String(maxLength: 40),
                        Display = p.String(maxLength: 40),
                        StandByTime = p.String(maxLength: 40),
                        TouchScreen = p.Boolean(),
                        WiFi = p.Boolean(),
                    },
                body:
                    @"UPDATE [dbo].[Products]
                      SET [ProductName] = @ProductName, [Price] = @Price, [BrandName] = @BrandName, [Photo] = @Photo, [CategoryID] = @CategoryID, [SubCategoryID] = @SubCategoryID
                      WHERE ([ProductID] = @ProductID)
                      
                      UPDATE [dbo].[Tablets]
                      SET [OperatingSystem] = @OperatingSystem, [ScreenSize] = @ScreenSize, [Processor] = @Processor, [Display] = @Display, [StandByTime] = @StandByTime, [TouchScreen] = @TouchScreen, [WiFi] = @WiFi
                      WHERE ([ProductID] = @ProductID)
                      AND @@ROWCOUNT > 0"
            );
            
            CreateStoredProcedure(
                "dbo.Tablet_Delete",
                p => new
                    {
                        ProductID = p.String(maxLength: 30),
                    },
                body:
                    @"DELETE [dbo].[Tablets]
                      WHERE ([ProductID] = @ProductID)
                      
                      DELETE [dbo].[Products]
                      WHERE ([ProductID] = @ProductID)
                      AND @@ROWCOUNT > 0"
            );
            
            CreateStoredProcedure(
                "dbo.Television_Insert",
                p => new
                    {
                        ProductID = p.String(maxLength: 30),
                        ProductName = p.String(maxLength: 40),
                        Price = p.Double(),
                        BrandName = p.String(maxLength: 40),
                        Photo = p.String(maxLength: 100),
                        CategoryID = p.String(maxLength: 30),
                        SubCategoryID = p.String(maxLength: 30),
                        DisplayType = p.String(maxLength: 15),
                        ScreenSize = p.Double(),
                        HD = p.Boolean(),
                        Resolution = p.String(maxLength: 10),
                        NetWeight = p.Double(),
                        USB = p.Boolean(),
                        PowerConsumption = p.Double(),
                    },
                body:
                    @"INSERT [dbo].[Products]([ProductID], [ProductName], [Price], [BrandName], [Photo], [CategoryID], [SubCategoryID])
                      VALUES (@ProductID, @ProductName, @Price, @BrandName, @Photo, @CategoryID, @SubCategoryID)
                      
                      INSERT [dbo].[Televisions]([ProductID], [DisplayType], [ScreenSize], [HD], [Resolution], [NetWeight], [USB], [PowerConsumption])
                      VALUES (@ProductID, @DisplayType, @ScreenSize, @HD, @Resolution, @NetWeight, @USB, @PowerConsumption)"
            );
            
            CreateStoredProcedure(
                "dbo.Television_Update",
                p => new
                    {
                        ProductID = p.String(maxLength: 30),
                        ProductName = p.String(maxLength: 40),
                        Price = p.Double(),
                        BrandName = p.String(maxLength: 40),
                        Photo = p.String(maxLength: 100),
                        CategoryID = p.String(maxLength: 30),
                        SubCategoryID = p.String(maxLength: 30),
                        DisplayType = p.String(maxLength: 15),
                        ScreenSize = p.Double(),
                        HD = p.Boolean(),
                        Resolution = p.String(maxLength: 10),
                        NetWeight = p.Double(),
                        USB = p.Boolean(),
                        PowerConsumption = p.Double(),
                    },
                body:
                    @"UPDATE [dbo].[Products]
                      SET [ProductName] = @ProductName, [Price] = @Price, [BrandName] = @BrandName, [Photo] = @Photo, [CategoryID] = @CategoryID, [SubCategoryID] = @SubCategoryID
                      WHERE ([ProductID] = @ProductID)
                      
                      UPDATE [dbo].[Televisions]
                      SET [DisplayType] = @DisplayType, [ScreenSize] = @ScreenSize, [HD] = @HD, [Resolution] = @Resolution, [NetWeight] = @NetWeight, [USB] = @USB, [PowerConsumption] = @PowerConsumption
                      WHERE ([ProductID] = @ProductID)
                      AND @@ROWCOUNT > 0"
            );
            
            CreateStoredProcedure(
                "dbo.Television_Delete",
                p => new
                    {
                        ProductID = p.String(maxLength: 30),
                    },
                body:
                    @"DELETE [dbo].[Televisions]
                      WHERE ([ProductID] = @ProductID)
                      
                      DELETE [dbo].[Products]
                      WHERE ([ProductID] = @ProductID)
                      AND @@ROWCOUNT > 0"
            );
            
        }
        
        public override void Down()
        {
            DropStoredProcedure("dbo.Television_Delete");
            DropStoredProcedure("dbo.Television_Update");
            DropStoredProcedure("dbo.Television_Insert");
            DropStoredProcedure("dbo.Tablet_Delete");
            DropStoredProcedure("dbo.Tablet_Update");
            DropStoredProcedure("dbo.Tablet_Insert");
            DropStoredProcedure("dbo.Product_Delete");
            DropStoredProcedure("dbo.Product_Update");
            DropStoredProcedure("dbo.Product_Insert");
            DropStoredProcedure("dbo.MusicSystem_Delete");
            DropStoredProcedure("dbo.MusicSystem_Update");
            DropStoredProcedure("dbo.MusicSystem_Insert");
            DropStoredProcedure("dbo.MoterBike_Delete");
            DropStoredProcedure("dbo.MoterBike_Update");
            DropStoredProcedure("dbo.MoterBike_Insert");
            DropStoredProcedure("dbo.Moped_Delete");
            DropStoredProcedure("dbo.Moped_Update");
            DropStoredProcedure("dbo.Moped_Insert");
            DropStoredProcedure("dbo.CellPhone_Delete");
            DropStoredProcedure("dbo.CellPhone_Update");
            DropStoredProcedure("dbo.CellPhone_Insert");
            DropStoredProcedure("dbo.Car_Delete");
            DropStoredProcedure("dbo.Car_Update");
            DropStoredProcedure("dbo.Car_Insert");
            DropStoredProcedure("dbo.Camera_Delete");
            DropStoredProcedure("dbo.Camera_Update");
            DropStoredProcedure("dbo.Camera_Insert");
            DropStoredProcedure("dbo.Book_Delete");
            DropStoredProcedure("dbo.Book_Update");
            DropStoredProcedure("dbo.Book_Insert");
            DropStoredProcedure("dbo.AirConditioner_Delete");
            DropStoredProcedure("dbo.AirConditioner_Update");
            DropStoredProcedure("dbo.AirConditioner_Insert");
        }
    }
}
