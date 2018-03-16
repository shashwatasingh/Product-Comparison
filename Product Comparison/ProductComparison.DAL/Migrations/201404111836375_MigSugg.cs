namespace ProductComparison.DAL.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class MigSugg : DbMigration
    {
        public override void Up()
        {
            CreateStoredProcedure(
                "dbo.Suggestion_Insert",
                p => new
                    {
                        SuggestionID = p.String(maxLength: 30),
                        Hits = p.Int(),
                        RatingFeatureCritic = p.Int(),
                        RatingPerformanceCritic = p.Int(),
                        RatingDesignCritic = p.Int(),
                        RatingDesignUser = p.Int(),
                        RatingPerformanceUser = p.Int(),
                        RatingFeatureUser = p.Int(),
                        ProductID = p.String(maxLength: 30),
                    },
                body:
                    @"INSERT [dbo].[Suggestions]([SuggestionID], [Hits], [RatingFeatureCritic], [RatingPerformanceCritic], [RatingDesignCritic], [RatingDesignUser], [RatingPerformanceUser], [RatingFeatureUser], [ProductID])
                      VALUES (@SuggestionID, @Hits, @RatingFeatureCritic, @RatingPerformanceCritic, @RatingDesignCritic, @RatingDesignUser, @RatingPerformanceUser, @RatingFeatureUser, @ProductID)"
            );
            
            CreateStoredProcedure(
                "dbo.Suggestion_Update",
                p => new
                    {
                        SuggestionID = p.String(maxLength: 30),
                        Hits = p.Int(),
                        RatingFeatureCritic = p.Int(),
                        RatingPerformanceCritic = p.Int(),
                        RatingDesignCritic = p.Int(),
                        RatingDesignUser = p.Int(),
                        RatingPerformanceUser = p.Int(),
                        RatingFeatureUser = p.Int(),
                        ProductID = p.String(maxLength: 30),
                    },
                body:
                    @"UPDATE [dbo].[Suggestions]
                      SET [Hits] = @Hits, [RatingFeatureCritic] = @RatingFeatureCritic, [RatingPerformanceCritic] = @RatingPerformanceCritic, [RatingDesignCritic] = @RatingDesignCritic, [RatingDesignUser] = @RatingDesignUser, [RatingPerformanceUser] = @RatingPerformanceUser, [RatingFeatureUser] = @RatingFeatureUser, [ProductID] = @ProductID
                      WHERE ([SuggestionID] = @SuggestionID)"
            );
            
            CreateStoredProcedure(
                "dbo.Suggestion_Delete",
                p => new
                    {
                        SuggestionID = p.String(maxLength: 30),
                    },
                body:
                    @"DELETE [dbo].[Suggestions]
                      WHERE ([SuggestionID] = @SuggestionID)"
            );
            
        }
        
        public override void Down()
        {
            DropStoredProcedure("dbo.Suggestion_Delete");
            DropStoredProcedure("dbo.Suggestion_Update");
            DropStoredProcedure("dbo.Suggestion_Insert");
        }
    }
}
