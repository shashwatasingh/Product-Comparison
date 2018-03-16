namespace ProductComparison.DAL.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class MigUP : DbMigration
    {
        public override void Up()
        {
            CreateStoredProcedure(
                "dbo.UserProfile_Insert",
                p => new
                    {
                        UserID = p.String(maxLength: 30),
                        UserName = p.String(maxLength: 30),
                        Preference1 = p.String(maxLength: 30),
                        Preference2 = p.String(maxLength: 30),
                        Preference3 = p.String(maxLength: 30),
                        City = p.String(maxLength: 60),
                        State = p.String(maxLength: 60),
                        Gender = p.String(maxLength: 60),
                    },
                body:
                    @"INSERT [dbo].[UserProfiles]([Preference1], [Preference2], [Preference3], [UserID], [UserName], [City], [State], [Gender])
                      VALUES (@Preference1, @Preference2, @Preference3, @UserID, @UserName, @City, @State, @Gender)"
            );
            
            CreateStoredProcedure(
                "dbo.UserProfile_Update",
                p => new
                    {
                        UserID = p.String(maxLength: 30),
                        UserName = p.String(maxLength: 30),
                        Preference1 = p.String(maxLength: 30),
                        Preference2 = p.String(maxLength: 30),
                        Preference3 = p.String(maxLength: 30),
                        City = p.String(maxLength: 60),
                        State = p.String(maxLength: 60),
                        Gender = p.String(maxLength: 60),
                    },
                body:
                    @"UPDATE [dbo].[UserProfiles]
                      SET [Preference1] = @Preference1, [Preference2] = @Preference2, [Preference3] = @Preference3, [UserName] = @UserName, [City] = @City, [State] = @State, [Gender] = @Gender
                      WHERE ([UserID] = @UserID)"
            );
            
            CreateStoredProcedure(
                "dbo.UserProfile_Delete",
                p => new
                    {
                        UserID = p.String(maxLength: 30),
                    },
                body:
                    @"DELETE [dbo].[UserProfiles]
                      WHERE ([UserID] = @UserID)"
            );
            
        }
        
        public override void Down()
        {
            DropStoredProcedure("dbo.UserProfile_Delete");
            DropStoredProcedure("dbo.UserProfile_Update");
            DropStoredProcedure("dbo.UserProfile_Insert");
        }
    }
}
