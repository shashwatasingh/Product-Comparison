namespace ProductComparison.DAL.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class MigSubCat : DbMigration
    {
        public override void Up()
        {
            CreateStoredProcedure(
                "dbo.SubCategory_Insert",
                p => new
                    {
                        SubCategoryID = p.String(maxLength: 30),
                        SubCategoryName = p.String(maxLength: 40),
                        Description = p.String(maxLength: 200),
                        CategoryID = p.String(maxLength: 30),
                    },
                body:
                    @"INSERT [dbo].[SubCategories]([SubCategoryID], [SubCategoryName], [Description], [CategoryID])
                      VALUES (@SubCategoryID, @SubCategoryName, @Description, @CategoryID)"
            );
            
            CreateStoredProcedure(
                "dbo.SubCategory_Update",
                p => new
                    {
                        SubCategoryID = p.String(maxLength: 30),
                        SubCategoryName = p.String(maxLength: 40),
                        Description = p.String(maxLength: 200),
                        CategoryID = p.String(maxLength: 30),
                    },
                body:
                    @"UPDATE [dbo].[SubCategories]
                      SET [SubCategoryName] = @SubCategoryName, [Description] = @Description, [CategoryID] = @CategoryID
                      WHERE ([SubCategoryID] = @SubCategoryID)"
            );
            
            CreateStoredProcedure(
                "dbo.SubCategory_Delete",
                p => new
                    {
                        SubCategoryID = p.String(maxLength: 30),
                    },
                body:
                    @"DELETE [dbo].[SubCategories]
                      WHERE ([SubCategoryID] = @SubCategoryID)"
            );
            
        }
        
        public override void Down()
        {
            DropStoredProcedure("dbo.SubCategory_Delete");
            DropStoredProcedure("dbo.SubCategory_Update");
            DropStoredProcedure("dbo.SubCategory_Insert");
        }
    }
}
