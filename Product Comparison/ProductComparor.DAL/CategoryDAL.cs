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
   public class CategoryDAL
    {
       ProductComparisonDataContext datacontext = new ProductComparisonDataContext();
       PCErrorLoggerEntities4 dc = new PCErrorLoggerEntities4();
       public bool Insert(Category cat)
       {
           try
           {
               datacontext.Categories.Add(cat);
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

       public bool Update(Category cat)
       {
           try
           {
               var query = datacontext.Categories.Find(cat.CategoryID);

               query.CategoryID = cat.CategoryID;
               query.CategoryName = cat.CategoryName;
               query.Description = cat.Description;
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
           

           //var query = datacontext.Categories.Where(c=> c.CategoryID == cat.CategoryID).First();
           //query.CategoryID = cat.CategoryName;
           //query.CategoryName = cat.CategoryName;
           //query.Description = cat.Description;
           //int res = datacontext.SaveChanges();
           //if (res > 0)
           //{
           //    return true;
           //}
           //else
           //{
           //    return false;
           //}
       }

       public bool DeleteCat(string catid)
       {
           var query = (from cat in datacontext.Categories
                        where cat.CategoryID==catid
                        select cat).First();
           datacontext.Categories.Remove(query);
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
       public List<Category> FetchCategories()
       {
           var query = from cat in datacontext.Categories
                      select cat;
           return query.ToList();
       }

   }
}

