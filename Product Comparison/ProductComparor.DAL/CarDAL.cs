using System;
using System.Collections.Generic;
using System.Data.Entity.Infrastructure;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ProductComparison.DAL;
using ProductComparisonEntities.Model;
using System.Linq.Dynamic;

namespace Product_Comparison.DAL
{
    public class CarDAL
    {
        ProductComparisonDataContext dataContext = new ProductComparisonDataContext();
        PCErrorLoggerEntities4 dc = new PCErrorLoggerEntities4();
        public List<Car> GetCarDetails() 
        {
            var query = from carObj in dataContext.Cars
                        select carObj;
            return query.ToList();
        }

        public List<Car> GetOneCar(string ID)
        {
            var query = dataContext.Cars.Where(c => c.ProductID == ID);
            return query.ToList();
        }

        public List<Car> FetchCarsForComparison(string id1, string id2, string id3, string id4)
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

                var cars = dataContext.Cars.Where(strWhere);
                return cars.ToList();
            }
            return null;
        }

        public bool Insert(Car carObj){
            try
               {
                   dataContext.Cars.Add(carObj);
                   int result = dataContext.SaveChanges();
                   
                    
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
           
           public bool Update(Car carObj)
           {
               try
               {
                   
                   var query = (from cars in dataContext.Cars
                                where cars.ProductID == carObj.ProductID
                                select cars).First();
                       query.ProductID = carObj.ProductID;
                       query.ProductName = carObj.ProductName;
                       query.Price = carObj.Price;
                       query.BrandName = carObj.BrandName;
                       query.Photo = carObj.Photo;
                       query.CarType = carObj.CarType;
                       query.Mileage = carObj.Mileage;
                       query.Model = carObj.Model;
                       query.CategoryID = carObj.CategoryID;
                       query.SubCategoryID = carObj.SubCategoryID;  
                       
                       int result = dataContext.SaveChanges();
                      
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
          
            public bool Delete(string pid)
           {
               try
               {
                   var query = (from cars in dataContext.Cars
                                where cars.ProductID == pid
                                select cars).First();
                   dataContext.Cars.Remove(query);
                   int result = dataContext.SaveChanges();
                   if (result > 0)
                   {
                       return true;
                   }
                   else
                   {
                       
                       return false;
                   }
               }
               catch (DbUpdateException)
               {
                   throw new DbUpdateException("Please enter valid Foreign keys");
               }

           }


            public List<Car> GetFilteredCars(string brand, int mileage, int price)
            {
                string strWhere = string.Empty;
                if (brand != "Select Brand")
                {
                    strWhere = "BrandName.Equals(\"" + brand + "\")";

                }

                if (mileage != 0)
                {
                    if (!string.IsNullOrEmpty(strWhere))
                    {
                        strWhere += " And ";

                    }
                    if (mileage == 1)
                    {
                        strWhere += "Mileage>=0 And Mileage<5";
                    }
                    else if (mileage == 2)
                    {
                        strWhere += "Mileage>=5 And Mileage<10";
                    }
                    else if (mileage == 3)
                    {
                        strWhere += "Mileage>=10";
                    }



                }
                if (price != 0)
                {
                    if (!string.IsNullOrEmpty(strWhere))
                    {
                        strWhere += " And ";

                    }
                    if (price == 1)
                    {
                        strWhere += "Price>=500000 And Price<1000000";
                    }
                    else if (price == 2)
                    {
                        strWhere += "Price>=1000000 And Price<2000000";
                    }
                    else if (price == 3)
                    {
                        strWhere += "Price>=2000000 And Price<5000000";
                    }
                    else if (price == 4)
                    {
                        strWhere += "Price>=5000000 And Price<10000000";
                    }
                    else if (price == 5)
                    {
                        strWhere += "Price>=10000000";
                    }


                }

                if (strWhere != string.Empty)
                {
                    var query = dataContext.Cars.Where(strWhere);
                    

                    if (query != null)
                    {
                        return query.ToList();

                    }
                    else
                    {
                        return GetCarDetails();  //default products..
                    }

                }
                return GetCarDetails();
            }

    }
}
