using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;
using ProductComparisonEntities.Model;
//using ProductComparison.DAL;
using Product_Comparison.DAL;
namespace SampleUI
{
    class Program
    {
        static void Main(string[] args)
        {


            Book b = new Book()
            {
                Author = "a",
                BindingType = "a",
                BrandName = "z",
                CategoryID = "Books",
                //SubCategoryID = "1",
                Edition = "d",
                //Genre = "1",

                Photo = "1",
                Price = Convert.ToDouble(23),
                ProductID = "shs7",
                ProductName = "sshs",
                PublicationYear = "sjsj",
                Publication = "hshs"



            };

            BookOperations bOp = new BookOperations();
            bOp.InsertBook(b);
            //ProductComparisonDataContext dataContext = new ProductComparisonDataContext();
            //dataContext.Database.Log = Console.Write;

            ////Insert Categories

            //dataContext.Categories.Add(new Category
            //{
            //    CategoryID = "Books",
            //    CategoryName = "Electronics",
            //    Description = "Electronic Data",

            //});
            //dataContext.SaveChanges();
            
            //Fetch 
            
            //var cats = dataContext.Categories.ToList();
            //foreach (Category c in cats)
            //{
            //    Console.WriteLine("CategoryID {0} CategoryName {1} Description {2}",c.CategoryID,c.CategoryName,c.Description);
            //}
            //Console.WriteLine("");
            
            ////Update Categories
            
            //var query = dataContext.Categories.Where(c => c.CategoryID == "EleID123").First();
            //query.CategoryID = "EleID123";
            //query.CategoryName = "Entc";
            //query.Description = "Electronic data123";
            //dataContext.SaveChanges();

            //Delete code
            
            //var query = dataContext.Categories.Where(c => c.CategoryID == "EleID123").First();
            //dataContext.Categories.Remove(query);
            //dataContext.SaveChanges();

            //Insert Subcategories
            
            //dataContext.SubCategories.Add(new SubCategory
            //{
            //    SubCategoryID = "EcsTablets",
            //    SubCategoryName = "Tablets",
            //    CategoryID = "EleID1111"
            //});
            //dataContext.SaveChanges();
            //Console.WriteLine("");
            
            //Insert Tablet

            //dataContext.Tablets.Add(new Tablet
            //{
            //    ProductID = "Tab123",
            //    ProductName = "Tab",
            //    BrandName = "Apple",
            //    Price = 30000.00 ,
            //    SubCategoryID = "EcsTablets",
            //    Display="LED",
            //    OperatingSystem="Apple-OS",
            //    Photo="lllll",
            // });
            //dataContext.SaveChanges();
            //Console.WriteLine("");

            //Insert Suggestion

            //dataContext.Suggestions.Add(new Suggestion()
            //{
            //    SuggestionID = "SugTabs",
            //    Hits = 7,
            //    RatingFeatureCritic = 2,
            //    RatingPerformanceCritic = 2,
            //    RatingDesignCritic = 4,
            //    RatingDesignUser = 7,
            //    RatingPerformanceUser = 8,
            //    RatingFeatureUser = 8,
            //    ProductID = "Tab123"
            //});
            //dataContext.SaveChanges();

            //update suggestion

            //var query = (from sugg in dataContext.Suggestions
            //             where sugg.SuggestionID == "SugTabs"
            //             select sugg).First();
            //query.RatingDesignCritic = 3;
            //dataContext.SaveChanges();
            //Console.WriteLine("");
            
            //fetching records of a particular category for a particular product

            //var query1 = from cat in dataContext.Categories
            //            join subCats in dataContext.SubCategories
            //            on cat.CategoryID equals subCats.CategoryID
            //            join tabs in dataContext.Tablets
            //            on subCats.SubCategoryID equals tabs.SubCategoryID
            //             where tabs.ProductName == "Tab"
            //            select new
            //            {
            //                TabName = tabs.ProductName,
            //                CategoryName = cat.CategoryName
            //            };
            
            //fetching
            
            //foreach (var item in query1)
            //{
            //    Console.WriteLine("TabName {0} CategoryName {1}", item.TabName, item.CategoryName);
            //}

            //inset userprofile

            //dataContext.UserProfiles.Add(new UserProfile() 
            //{
            //    Preference1 = "Tab123",
            //    State="Maharashtra",
            //    UserID="A2",
            //    UserName="Aieshwarya",
            //    City="Pune",
            //    Gender="Female"
            // });
            //dataContext.SaveChanges();

            //var query = from u in dataContext.UserProfiles
            //            join p in dataContext.Products
            //            on u.Preference1 equals p.ProductID
            //            select new {ProductName = p.ProductName, ProductID =u.Preference1, UserID = u.UserID};
            //foreach (var item in query)
            //{
            //    Console.WriteLine("ProductID {0} for ProductName {1} UserID {2} ", item.ProductID,item.ProductName,item.UserID);    
            //}
            
            Console.WriteLine("Done!!");
            Console.ReadKey();
        }
    }
}
