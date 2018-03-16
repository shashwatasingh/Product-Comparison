using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ProductComparisonEntities.Model;
using ProductComparison.DAL;
using System.Data.Entity.Infrastructure;
using System.Linq.Dynamic;

namespace Product_Comparison.DAL
{
    public class MotorBikeDAL
    {
        ProductComparisonDataContext dataContext = new ProductComparisonDataContext();
        PCErrorLoggerEntities4 dc = new PCErrorLoggerEntities4();
        public List<MoterBike> GetMotorBikeDetails()
        {
            var query = from motorBikeObj in dataContext.MoterBikes
                        select motorBikeObj;
            return query.ToList();
        }

        public bool Insert(MoterBike motorBikeObj)
        {
            try
            {
                dataContext.MoterBikes.Add(motorBikeObj);
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

        public bool Update(MoterBike motorBikeObj)
        {
            try
            {
                var query = (from motorBikes in dataContext.MoterBikes
                             where motorBikes.ProductID == motorBikeObj.ProductID
                             select motorBikes).First();
                query.ProductID = motorBikeObj.ProductID;
                query.ProductName = motorBikeObj.ProductName;
                query.Price = motorBikeObj.Price;
                query.BrandName = motorBikeObj.BrandName;
                query.Photo = motorBikeObj.Photo;
                query.GroundClearance = motorBikeObj.GroundClearance;
                query.EngineCapacity = motorBikeObj.EngineCapacity;
                query.Mileage = motorBikeObj.Mileage;
                query.NoOfGears = motorBikeObj.NoOfGears;
                query.TubelessTyres = motorBikeObj.TubelessTyres;
                query.Weight = motorBikeObj.Weight;
                query.CategoryID = motorBikeObj.CategoryID;
                query.SubCategoryID = motorBikeObj.SubCategoryID;

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
                var query = (from motorBikes in dataContext.MoterBikes
                             where motorBikes.ProductID == pid
                             select motorBikes).First();
                dataContext.MoterBikes.Remove(query);
                int result = dataContext.SaveChanges();
                if (result > 0)
                {
                    return true;
                }
                else
                {
                    //throw new DbUpdateException("Please enter valid Foreign keys");
                    return false;
                }
            }
            catch (DbUpdateException)
            {
                throw new DbUpdateException("Please enter valid Foreign keys");
            }
        }

        public List<MoterBike> GetThreeMotorBikes()
        {
            var query = (from motorBike in dataContext.MoterBikes
                         select motorBike).Take(3);
            return query.ToList();
        }

        public List<MoterBike> FetchMotorBikeForComparison(string id1, string id2, string id3, string id4)
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

                var mot = dataContext.MoterBikes.Where(strWhere);
                return mot.ToList();
            }
            return null;
        }


        public List<MoterBike> GetOneMotorBike(string ID)
        {
            var query = dataContext.MoterBikes.Where(mb => mb.ProductID == ID);
            return query.ToList();
        }


        public List<MoterBike> GetFilteredMotorBikes(string brand, int price,bool Tubeless)
        {
            string strWhere = string.Empty;
            if (brand != "Select Brand")
            {
                strWhere = "BrandName.Equals(\"" + brand + "\")";

            }

           

            if (price != 0)
            {
                if (!string.IsNullOrEmpty(strWhere))
                {
                    strWhere += " And ";

                }
                if (price == 1)
                {
                    strWhere += "Price>=30000 And Price<50000";
                }
                else if (price == 2)
                {
                    strWhere += "Price>=50000 And Price<90000";
                }
                else if (price == 3)
                {
                    strWhere += "Price>=90000";
                }



            }

            if (strWhere != string.Empty)
            {
                var query = dataContext.MoterBikes.Where(strWhere);
                query = query.Where(t => t.TubelessTyres == Tubeless);
               

                if (query != null)
                {
                    return query.ToList();

                }
                else
                {
                    return GetMotorBikeDetails();  //default products..
                }

            }
            return GetMotorBikeDetails();
        }

    }
}
