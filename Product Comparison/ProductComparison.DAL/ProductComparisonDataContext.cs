using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.Entity;
using System.Configuration;
using ProductComparisonEntities.Model;

namespace ProductComparison.DAL
{
    public class ProductComparisonDataContext:DbContext
    {
        public ProductComparisonDataContext():base(ConfigurationManager.ConnectionStrings["ProductComparisonConnString"].ConnectionString)
        {

        }

        public DbSet<AirConditioner> AirConditioners { get; set; }
        public DbSet<Book> Books { get; set; }
        public DbSet<Camera> Cameras { get; set; }
        public DbSet<Car> Cars { get; set; }
        public DbSet<Category> Categories { get; set; }
        public DbSet<CellPhone> CellPhones { get; set; }
        public DbSet<Moped> Mopeds { get; set; }
        public DbSet<MoterBike> MoterBikes { get; set; }
        public DbSet<MusicSystem> MusicSystems { get; set; }
        public DbSet<Product> Products { get; set; }
        public DbSet<Report> Reports { get; set; }
        public DbSet<SubCategory> SubCategories { get; set; }
        public DbSet<Suggestion> Suggestions { get; set; }
        public DbSet<Tablet> Tablets { get; set; }
        public DbSet<Television> Televisions { get; set; }
        public DbSet<UserProfile> UserProfiles { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Category>().MapToStoredProcedures();
            modelBuilder.Entity<SubCategory>().MapToStoredProcedures();
            modelBuilder.Entity<Product>().MapToStoredProcedures();
            modelBuilder.Entity<Suggestion>().MapToStoredProcedures();
            modelBuilder.Entity<Report>().MapToStoredProcedures();
            modelBuilder.Entity<UserProfile>().MapToStoredProcedures();

            //modelBuilder.Types().Configure(all => all.MapToStoredProcedures());
        } 

    }
}
