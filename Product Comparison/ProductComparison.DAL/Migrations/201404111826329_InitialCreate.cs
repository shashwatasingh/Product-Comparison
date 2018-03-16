namespace ProductComparison.DAL.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class InitialCreate : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.Products",
                c => new
                    {
                        ProductID = c.String(nullable: false, maxLength: 30),
                        ProductName = c.String(maxLength: 40),
                        Price = c.Double(nullable: false),
                        BrandName = c.String(maxLength: 40),
                        Photo = c.String(maxLength: 100),
                        CategoryID = c.String(maxLength: 30),
                        SubCategoryID = c.String(maxLength: 30),
                    })
                .PrimaryKey(t => t.ProductID)
                .ForeignKey("dbo.Categories", t => t.CategoryID)
                .ForeignKey("dbo.SubCategories", t => t.SubCategoryID)
                .Index(t => t.CategoryID)
                .Index(t => t.SubCategoryID);
            
            CreateTable(
                "dbo.Categories",
                c => new
                    {
                        CategoryID = c.String(nullable: false, maxLength: 30),
                        CategoryName = c.String(maxLength: 40),
                        Description = c.String(maxLength: 100),
                    })
                .PrimaryKey(t => t.CategoryID);
            
            CreateTable(
                "dbo.SubCategories",
                c => new
                    {
                        SubCategoryID = c.String(nullable: false, maxLength: 30),
                        SubCategoryName = c.String(maxLength: 40),
                        Description = c.String(maxLength: 200),
                        CategoryID = c.String(maxLength: 30),
                    })
                .PrimaryKey(t => t.SubCategoryID)
                .ForeignKey("dbo.Categories", t => t.CategoryID)
                .Index(t => t.CategoryID);
            
            CreateTable(
                "dbo.Reports",
                c => new
                    {
                        ReportID = c.String(nullable: false, maxLength: 30),
                        FilePath = c.String(maxLength: 200),
                        DateOfCreation = c.DateTime(nullable: false),
                        UserID = c.String(maxLength: 30),
                    })
                .PrimaryKey(t => t.ReportID)
                .ForeignKey("dbo.UserProfiles", t => t.UserID)
                .Index(t => t.UserID);
            
            CreateTable(
                "dbo.UserProfiles",
                c => new
                    {
                        Preference1 = c.String(maxLength: 30),
                        Preference2 = c.String(maxLength: 30),
                        Preference3 = c.String(maxLength: 30),
                        UserID = c.String(nullable: false, maxLength: 30),
                        UserName = c.String(maxLength: 30),
                        City = c.String(maxLength: 60),
                        State = c.String(maxLength: 60),
                        Gender = c.String(maxLength: 60),
                    })
                .PrimaryKey(t => t.UserID)
                .ForeignKey("dbo.Products", t => t.Preference1)
                .ForeignKey("dbo.Products", t => t.Preference2)
                .ForeignKey("dbo.Products", t => t.Preference3)
                .Index(t => t.Preference1)
                .Index(t => t.Preference2)
                .Index(t => t.Preference3);
            
            CreateTable(
                "dbo.Suggestions",
                c => new
                    {
                        SuggestionID = c.String(nullable: false, maxLength: 30),
                        Hits = c.Int(nullable: false),
                        RatingFeatureCritic = c.Int(nullable: false),
                        RatingPerformanceCritic = c.Int(nullable: false),
                        RatingDesignCritic = c.Int(nullable: false),
                        RatingDesignUser = c.Int(nullable: false),
                        RatingPerformanceUser = c.Int(nullable: false),
                        RatingFeatureUser = c.Int(nullable: false),
                        ProductID = c.String(maxLength: 30),
                    })
                .PrimaryKey(t => t.SuggestionID)
                .ForeignKey("dbo.Products", t => t.ProductID)
                .Index(t => t.ProductID);
            
            CreateTable(
                "dbo.AirConditioners",
                c => new
                    {
                        ProductID = c.String(nullable: false, maxLength: 30),
                        Name = c.String(maxLength: 30),
                        Type = c.String(maxLength: 20),
                        DisplayPanel = c.Boolean(nullable: false),
                        DisplayPanelType = c.String(maxLength: 20),
                        Capacity = c.String(maxLength: 20),
                        Dimensions = c.String(maxLength: 10),
                        NetWeight = c.Double(nullable: false),
                        PowerConsumption = c.Double(nullable: false),
                        PowerSupply = c.String(maxLength: 10),
                    })
                .PrimaryKey(t => t.ProductID)
                .ForeignKey("dbo.Products", t => t.ProductID)
                .Index(t => t.ProductID);
            
            CreateTable(
                "dbo.Books",
                c => new
                    {
                        ProductID = c.String(nullable: false, maxLength: 30),
                        Genre = c.String(maxLength: 30),
                        Author = c.String(maxLength: 30),
                        BindingType = c.String(maxLength: 30),
                        Publication = c.String(maxLength: 30),
                        PublicationYear = c.String(maxLength: 4),
                        Edition = c.String(maxLength: 10),
                    })
                .PrimaryKey(t => t.ProductID)
                .ForeignKey("dbo.Products", t => t.ProductID)
                .Index(t => t.ProductID);
            
            CreateTable(
                "dbo.Cameras",
                c => new
                    {
                        ProductID = c.String(nullable: false, maxLength: 30),
                        CameraType = c.String(maxLength: 40),
                        Resolution = c.String(maxLength: 40),
                        ScreenSize = c.String(maxLength: 40),
                        Zoom = c.String(maxLength: 40),
                    })
                .PrimaryKey(t => t.ProductID)
                .ForeignKey("dbo.Products", t => t.ProductID)
                .Index(t => t.ProductID);
            
            CreateTable(
                "dbo.Cars",
                c => new
                    {
                        ProductID = c.String(nullable: false, maxLength: 30),
                        CarType = c.String(maxLength: 20),
                        Mileage = c.Double(nullable: false),
                        Model = c.String(maxLength: 20),
                    })
                .PrimaryKey(t => t.ProductID)
                .ForeignKey("dbo.Products", t => t.ProductID)
                .Index(t => t.ProductID);
            
            CreateTable(
                "dbo.CellPhones",
                c => new
                    {
                        ProductID = c.String(nullable: false, maxLength: 30),
                        Display = c.String(maxLength: 40),
                        OperatingSystem = c.String(maxLength: 40),
                        Processor = c.String(maxLength: 40),
                        TouchScreen = c.Boolean(nullable: false),
                        ScreenSize = c.Double(nullable: false),
                        StandByTime = c.Double(nullable: false),
                    })
                .PrimaryKey(t => t.ProductID)
                .ForeignKey("dbo.Products", t => t.ProductID)
                .Index(t => t.ProductID);
            
            CreateTable(
                "dbo.Mopeds",
                c => new
                    {
                        ProductID = c.String(nullable: false, maxLength: 30),
                        Mileage = c.Double(nullable: false),
                        BodyType = c.String(maxLength: 20),
                        GroundClearance = c.Int(nullable: false),
                        FuelTankCapacity = c.Int(nullable: false),
                        Gears = c.Boolean(nullable: false),
                        TubelessTyres = c.Boolean(nullable: false),
                        Weight = c.Double(nullable: false),
                    })
                .PrimaryKey(t => t.ProductID)
                .ForeignKey("dbo.Products", t => t.ProductID)
                .Index(t => t.ProductID);
            
            CreateTable(
                "dbo.MotorBikes",
                c => new
                    {
                        ProductID = c.String(nullable: false, maxLength: 30),
                        Mileage = c.Double(nullable: false),
                        EngineCapacity = c.Double(nullable: false),
                        NoOfGears = c.Int(nullable: false),
                        TubelessTyres = c.Boolean(nullable: false),
                        Weight = c.Double(nullable: false),
                        GroundClearance = c.Int(nullable: false),
                    })
                .PrimaryKey(t => t.ProductID)
                .ForeignKey("dbo.Products", t => t.ProductID)
                .Index(t => t.ProductID);
            
            CreateTable(
                "dbo.MusicSystems",
                c => new
                    {
                        ProductID = c.String(nullable: false, maxLength: 30),
                        DimensionMainUnit = c.String(maxLength: 30),
                        DimensionFrontSpeaker = c.String(maxLength: 30),
                        Bluetooth = c.Boolean(nullable: false),
                        Radio = c.Boolean(nullable: false),
                        USB = c.Boolean(nullable: false),
                        Recording = c.Boolean(nullable: false),
                        SurroundSound = c.Boolean(nullable: false),
                        NetWeightMainUnit = c.Double(nullable: false),
                        NetWeightWoofer = c.Double(nullable: false),
                        PowerConsumption = c.Double(nullable: false),
                    })
                .PrimaryKey(t => t.ProductID)
                .ForeignKey("dbo.Products", t => t.ProductID)
                .Index(t => t.ProductID);
            
            CreateTable(
                "dbo.Tablets",
                c => new
                    {
                        ProductID = c.String(nullable: false, maxLength: 30),
                        OperatingSystem = c.String(maxLength: 40),
                        ScreenSize = c.Double(nullable: false),
                        Processor = c.String(maxLength: 40),
                        Display = c.String(maxLength: 40),
                        StandByTime = c.String(maxLength: 40),
                        TouchScreen = c.Boolean(nullable: false),
                        WiFi = c.Boolean(nullable: false),
                    })
                .PrimaryKey(t => t.ProductID)
                .ForeignKey("dbo.Products", t => t.ProductID)
                .Index(t => t.ProductID);
            
            CreateTable(
                "dbo.Televisions",
                c => new
                    {
                        ProductID = c.String(nullable: false, maxLength: 30),
                        DisplayType = c.String(maxLength: 15),
                        ScreenSize = c.Double(nullable: false),
                        HD = c.Boolean(nullable: false),
                        Resolution = c.String(maxLength: 10),
                        NetWeight = c.Double(nullable: false),
                        USB = c.Boolean(nullable: false),
                        PowerConsumption = c.Double(nullable: false),
                    })
                .PrimaryKey(t => t.ProductID)
                .ForeignKey("dbo.Products", t => t.ProductID)
                .Index(t => t.ProductID);
            
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.Televisions", "ProductID", "dbo.Products");
            DropForeignKey("dbo.Tablets", "ProductID", "dbo.Products");
            DropForeignKey("dbo.MusicSystems", "ProductID", "dbo.Products");
            DropForeignKey("dbo.MotorBikes", "ProductID", "dbo.Products");
            DropForeignKey("dbo.Mopeds", "ProductID", "dbo.Products");
            DropForeignKey("dbo.CellPhones", "ProductID", "dbo.Products");
            DropForeignKey("dbo.Cars", "ProductID", "dbo.Products");
            DropForeignKey("dbo.Cameras", "ProductID", "dbo.Products");
            DropForeignKey("dbo.Books", "ProductID", "dbo.Products");
            DropForeignKey("dbo.AirConditioners", "ProductID", "dbo.Products");
            DropForeignKey("dbo.Suggestions", "ProductID", "dbo.Products");
            DropForeignKey("dbo.UserProfiles", "Preference3", "dbo.Products");
            DropForeignKey("dbo.UserProfiles", "Preference2", "dbo.Products");
            DropForeignKey("dbo.Reports", "UserID", "dbo.UserProfiles");
            DropForeignKey("dbo.UserProfiles", "Preference1", "dbo.Products");
            DropForeignKey("dbo.Products", "SubCategoryID", "dbo.SubCategories");
            DropForeignKey("dbo.Products", "CategoryID", "dbo.Categories");
            DropForeignKey("dbo.SubCategories", "CategoryID", "dbo.Categories");
            DropIndex("dbo.Televisions", new[] { "ProductID" });
            DropIndex("dbo.Tablets", new[] { "ProductID" });
            DropIndex("dbo.MusicSystems", new[] { "ProductID" });
            DropIndex("dbo.MotorBikes", new[] { "ProductID" });
            DropIndex("dbo.Mopeds", new[] { "ProductID" });
            DropIndex("dbo.CellPhones", new[] { "ProductID" });
            DropIndex("dbo.Cars", new[] { "ProductID" });
            DropIndex("dbo.Cameras", new[] { "ProductID" });
            DropIndex("dbo.Books", new[] { "ProductID" });
            DropIndex("dbo.AirConditioners", new[] { "ProductID" });
            DropIndex("dbo.Suggestions", new[] { "ProductID" });
            DropIndex("dbo.UserProfiles", new[] { "Preference3" });
            DropIndex("dbo.UserProfiles", new[] { "Preference2" });
            DropIndex("dbo.UserProfiles", new[] { "Preference1" });
            DropIndex("dbo.Reports", new[] { "UserID" });
            DropIndex("dbo.SubCategories", new[] { "CategoryID" });
            DropIndex("dbo.Products", new[] { "SubCategoryID" });
            DropIndex("dbo.Products", new[] { "CategoryID" });
            DropTable("dbo.Televisions");
            DropTable("dbo.Tablets");
            DropTable("dbo.MusicSystems");
            DropTable("dbo.MotorBikes");
            DropTable("dbo.Mopeds");
            DropTable("dbo.CellPhones");
            DropTable("dbo.Cars");
            DropTable("dbo.Cameras");
            DropTable("dbo.Books");
            DropTable("dbo.AirConditioners");
            DropTable("dbo.Suggestions");
            DropTable("dbo.UserProfiles");
            DropTable("dbo.Reports");
            DropTable("dbo.SubCategories");
            DropTable("dbo.Categories");
            DropTable("dbo.Products");
        }
    }
}
