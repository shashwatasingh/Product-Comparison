using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ProductComparisonEntities.Model;
using ProductComparison.DAL;
using System.Data.Entity.Infrastructure;

namespace Product_Comparison.DAL
{
   public class SubCategoryDAL
    {
       ProductComparisonDataContext datacontext = new ProductComparisonDataContext();
       PCErrorLoggerEntities4 dc = new PCErrorLoggerEntities4();
       public bool Insert(SubCategory subcat)
       {
           try
           {

               datacontext.SubCategories.Add(subcat);
               int res = datacontext.SaveChanges();
               
            }

           catch (DbUpdateException ex)
           {
               dc.PCErrorLoggers.Add(new PCErrorLogger()
               {
                   ErrorDate = DateTime.Now,
                   ErrorMessage = ex.Message,
                   ErrorSource = ex.Source
               });
               dc.SaveChanges();
               throw new DbUpdateException("Please enter valid Foreign keys");

           }
           catch (System.FormatException fe)
           {
               dc.PCErrorLoggers.Add(new PCErrorLogger()
               {
                   ErrorDate = DateTime.Now,
                   ErrorMessage = fe.Message,
                   ErrorSource = fe.Source
               });
               dc.SaveChanges();
               throw new System.FormatException();
           }
           catch (Exception q)
           {

               dc.PCErrorLoggers.Add(new PCErrorLogger()
               {
                   ErrorDate = DateTime.Now,
                   ErrorMessage = q.Message,
                   ErrorSource = q.Source
               });
               dc.SaveChanges();
               throw new Exception("Incorrect Format");
           }
           return true;
       }

       public List<SubCategory> FetchSubCategory()
       {
           var query = from subcat in datacontext.SubCategories
                       select subcat;
           return query.ToList();
           
       }
       public bool Update(SubCategory subcat)
       {
           try
           {
           var query1 = (from sc in datacontext.SubCategories
                        where sc.SubCategoryID==subcat.SubCategoryID
                        select sc).First();

           
               query1.SubCategoryID = subcat.SubCategoryID;
               query1.SubCategoryName = subcat.SubCategoryName;
               query1.Description = subcat.Description;
               query1.CategoryID = subcat.CategoryID;
              	        
		        datacontext.SaveChanges();
	            }
           catch (DbUpdateException ex)
           {
               dc.PCErrorLoggers.Add(new PCErrorLogger()
               {
                   ErrorDate = DateTime.Now,
                   ErrorMessage = ex.Message,
                   ErrorSource = ex.Source
               });
               dc.SaveChanges();
               throw new DbUpdateException("Please enter valid Foreign keys");

           }
           catch (System.FormatException fe)
           {
               dc.PCErrorLoggers.Add(new PCErrorLogger()
               {
                   ErrorDate = DateTime.Now,
                   ErrorMessage = fe.Message,
                   ErrorSource = fe.Source
               });
               dc.SaveChanges();
               throw new System.FormatException();
           }
           catch (Exception q)
           {

               dc.PCErrorLoggers.Add(new PCErrorLogger()
               {
                   ErrorDate = DateTime.Now,
                   ErrorMessage = q.Message,
                   ErrorSource = q.Source
               });
               dc.SaveChanges();
               throw new Exception("Incorrect Format");
           }
           return true;
                

           //else
           //{
           //    //throw new Exception("Record not found");
           

       }

       public bool DeleteSubCat(string subcatid)
       {
           var query = (from subcat in datacontext.SubCategories
                        where subcat.SubCategoryID==subcatid
                        select subcat).First();
           datacontext.SubCategories.Remove(query);
           int res = datacontext.SaveChanges();
           if (res > 0)
           {
               return true;
           }
           else
           {
               return false;
           }
       }

       public List<Product> GetGadgets()
       {
           var query = (from prod in datacontext.Products
                        where prod.SubCategoryID == "SCatGad"
                        select prod).Take(3);
           return query.ToList();
       }

       public List<Product> GetAppliances()
       {
           var query = (from prod in datacontext.Products
                        where prod.SubCategoryID == "SCatApp"
                        select prod).Take(3);
           return query.ToList();
       }

       public List<Product> GetFourWheelers()
       {
           var query = (from prod in datacontext.Products
                        where prod.SubCategoryID == "SCatFW"
                        select prod).Take(3);
           return query.ToList();
       }

       public List<Product> GetTwoWheelers()
       {
           var query = (from prod in datacontext.Products
                        where prod.SubCategoryID == "SCatTW"
                        select prod).Take(3);
           return query.ToList();
       }

       public List<Product> GetOneProduct(string id)
       {
           var query = datacontext.Products.Where(p => p.ProductID == id);
           return query.ToList();
       }
    }
}
