using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ProductComparisonEntities.Model;
using ProductComparison.DAL;
using System.Linq.Dynamic;
using System.Data.Entity.Infrastructure;

namespace Product_Comparison.DAL
{
    public class BookOperations
    {
        ProductComparisonDataContext dataContext = new ProductComparisonDataContext();
        PCErrorLoggerEntities4 dc = new PCErrorLoggerEntities4();
        public bool InsertBook(Book b)
        {
            try 
	        {	        
		dataContext.Books.Add(b);
            int res = dataContext.SaveChanges();
            
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

        public void ModifyBook(Book b)
        {
            try
            {
                var x = from bks in dataContext.Books
                        where bks.ProductID == b.ProductID
                        select bks;
                Book oldBook = x.First();


                oldBook.ProductName = b.ProductName;
                oldBook.Publication = b.Publication;
                oldBook.PublicationYear = b.PublicationYear;
                oldBook.SubCategoryID = b.SubCategoryID;
                oldBook.Author = b.Author;
                oldBook.BindingType = b.BindingType;
                oldBook.BrandName = b.BrandName;
                oldBook.CategoryID = b.CategoryID;
                oldBook.Edition = b.Edition;
                oldBook.Genre = b.Genre;
                oldBook.Photo = b.Photo;
                oldBook.Price = b.Price;


                dataContext.SaveChanges();
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
          
        }

        public List<Book> FetchAllBooks()
        {
            var q = from bks in dataContext.Books
                    select bks;

            return q.ToList();
        }
        public void DeleteBook(string id)
        {
            var x = from bks in dataContext.Books
                    where bks.ProductID == id
                    select bks;
            Book oldBook = x.First();
            dataContext.Books.Remove(oldBook);
            dataContext.SaveChanges();
        }

        public List<Book> GetOneBook(string ID)
        {
            var query = dataContext.Books.Where(c => c.ProductID == ID);
            return query.ToList();
        }

        public List<Book> FetchThreeBooks(string type)
        {
            var q = (from bks in dataContext.Books
                     where bks.Genre==type
                    select bks).Take(3);

            return q.ToList();
        }

        public List<Book> FetchBooksForComparison(string id1, string id2, string id3, string id4)
        {
            string strWhere;
            if (!string.IsNullOrEmpty(id1))
            {
                strWhere = "ProductID.Equals(\"" + id1 + "\")";
                if (!string.IsNullOrEmpty(id2))
                {
                    strWhere += " or ProductID.Equals(\"" + id2 + "\")";

                    if (!string.IsNullOrEmpty(id3))
                    {
                        strWhere += " or ProductID.Equals(\"" + id3 + "\")";

                        if (!string.IsNullOrEmpty(id4))
                        {
                            strWhere += " or ProductID.Equals(\"" + id4 + "\")";

                        }
                    }
                }

                var cars = dataContext.Books.Where(strWhere);
                return cars.ToList();
            }
            return null;
        }


        public List<Book> FetchGenreBooks(string type)
        {
            var q = from bks in dataContext.Books
                     where bks.Genre == type
                     select bks;

            return q.ToList();
        }
    }
}
