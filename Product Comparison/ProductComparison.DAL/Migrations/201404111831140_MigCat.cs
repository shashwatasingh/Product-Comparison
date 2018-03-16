namespace ProductComparison.DAL.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class MigCat : DbMigration
    {
        public override void Up()
        {
            CreateStoredProcedure(
                "dbo.Category_Insert",
                p => new
                    {
                        CategoryID = p.String(maxLength: 30),
                        CategoryName = p.String(maxLength: 40),
                        Description = p.String(maxLength: 100),
                    },
                body:
                    @"INSERT [dbo].[Categories]([CategoryID], [CategoryName], [Description])
                      VALUES (@CategoryID, @CategoryName, @Description)"
            );
            
            CreateStoredProcedure(
                "dbo.Category_Update",
                p => new
                    {
                        CategoryID = p.String(maxLength: 30),
                        CategoryName = p.String(maxLength: 40),
                        Description = p.String(maxLength: 100),
                    },
                body:
                    @"UPDATE [dbo].[Categories]
                      SET [CategoryName] = @CategoryName, [Description] = @Description
                      WHERE ([CategoryID] = @CategoryID)"
            );
            
            CreateStoredProcedure(
                "dbo.Category_Delete",
                p => new
                    {
                        CategoryID = p.String(maxLength: 30),
                    },
                body:
                    @"DELETE [dbo].[Categories]
                      WHERE ([CategoryID] = @CategoryID)"
            );
            
        }
        
        public override void Down()
        {
            DropStoredProcedure("dbo.Category_Delete");
            DropStoredProcedure("dbo.Category_Update");
            DropStoredProcedure("dbo.Category_Insert");
        }
    }
}
