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
    public class MopedDAL
    {
        ProductComparisonDataContext dataContext = new ProductComparisonDataContext();
        PCErrorLoggerEntities4 dc = new PCErrorLoggerEntities4();
        public List<Moped> GetMopedDetails()
        {
            var query = from mopedObj in dataContext.Mopeds
                        select mopedObj;
            return query.ToList();
        }
        public bool Insert(Moped mopedObj)
        {
            try
            {
                dataContext.Mopeds.Add(mopedObj);
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

        public bool Update(Moped mopedObj)
        {
            try
            {
                var query = (from mopeds in dataContext.Mopeds
                             where mopeds.ProductID == mopedObj.ProductID
                             select mopeds).First();
                query.ProductID = mopedObj.ProductID;
                query.ProductName = mopedObj.ProductName;
                query.Price = mopedObj.Price;
                query.BrandName = mopedObj.BrandName;
                query.Photo = mopedObj.Photo;
                query.GroundClearance = mopedObj.GroundClearance;
                query.BodyType = mopedObj.BodyType;
                query.Mileage = mopedObj.Mileage;
                query.FuelTankCapacity = mopedObj.FuelTankCapacity;
                query.Gears = mopedObj.Gears;
                query.TubelessTyres = mopedObj.TubelessTyres;
                query.Weight = mopedObj.Weight;
                query.CategoryID = mopedObj.CategoryID;
                query.SubCategoryID = mopedObj.SubCategoryID;

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
                var query = (from mopeds in dataContext.Mopeds
                             where mopeds.ProductID == pid
                             select mopeds).First();
                dataContext.Mopeds.Remove(query);
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

        public List<Moped> GetThreeMopeds()
        {
            var query = (from moped in dataContext.Mopeds
                         select moped).Take(3);
            return query.ToList();
        }

        public List<Moped> GetOneMoped(string ID)
        {
            var query = dataContext.Mopeds.Where(mp => mp.ProductID == ID);
            return query.ToList();
        }

        public List<Moped> FetchMopedsForComparison(string id1, string id2, string id3, string id4)
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

                var mop = dataContext.Mopeds.Where(strWhere);
                return mop.ToList();
            }
            return null;
        }


        public List<Moped> GetFilteredMopeds(string brand, int price, bool Gears, bool Tubeless)
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
                    strWhere += "Price>=30000 And Price<40000";
                }
                else if (price == 2)
                {
                    strWhere += "Price>=40000 And Price<80000";
                }
                else if (price == 3)
                {
                    strWhere += "Price>=80000";
                }



            }

            if (strWhere != string.Empty)
            {
                var query = dataContext.Mopeds.Where(strWhere);
                query = query.Where(t => t.Gears == Gears);
                query = query.Where(t => t.TubelessTyres == Tubeless);

                if (query != null)
                {
                    return query.ToList();

                }
                else
                {
                    return GetMopedDetails();  //default products..
                }

            }
            return GetMopedDetails();
        }

    }
}


