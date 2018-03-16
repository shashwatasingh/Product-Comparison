namespace ProductComparison.DAL.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class MigRep : DbMigration
    {
        public override void Up()
        {
            CreateStoredProcedure(
                "dbo.Report_Insert",
                p => new
                    {
                        ReportID = p.String(maxLength: 30),
                        FilePath = p.String(maxLength: 200),
                        DateOfCreation = p.DateTime(),
                        UserID = p.String(maxLength: 30),
                    },
                body:
                    @"INSERT [dbo].[Reports]([ReportID], [FilePath], [DateOfCreation], [UserID])
                      VALUES (@ReportID, @FilePath, @DateOfCreation, @UserID)"
            );
            
            CreateStoredProcedure(
                "dbo.Report_Update",
                p => new
                    {
                        ReportID = p.String(maxLength: 30),
                        FilePath = p.String(maxLength: 200),
                        DateOfCreation = p.DateTime(),
                        UserID = p.String(maxLength: 30),
                    },
                body:
                    @"UPDATE [dbo].[Reports]
                      SET [FilePath] = @FilePath, [DateOfCreation] = @DateOfCreation, [UserID] = @UserID
                      WHERE ([ReportID] = @ReportID)"
            );
            
            CreateStoredProcedure(
                "dbo.Report_Delete",
                p => new
                    {
                        ReportID = p.String(maxLength: 30),
                    },
                body:
                    @"DELETE [dbo].[Reports]
                      WHERE ([ReportID] = @ReportID)"
            );
            
        }
        
        public override void Down()
        {
            DropStoredProcedure("dbo.Report_Delete");
            DropStoredProcedure("dbo.Report_Update");
            DropStoredProcedure("dbo.Report_Insert");
        }
    }
}
