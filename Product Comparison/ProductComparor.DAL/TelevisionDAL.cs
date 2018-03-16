using System;
using System.Collections.Generic;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ProductComparison.DAL;
using ProductComparisonEntities.Model;
using System.Linq.Dynamic;

namespace Product_Comparison.DAL
{
   public class TelevisionDAL
    {
        ProductComparisonDataContext dataContext = new ProductComparisonDataContext();
        PCErrorLoggerEntities4 dc = new PCErrorLoggerEntities4();
        public List<Television> GetTelevisionDetails()
        {
            var query = from televisionObj in dataContext.Televisions
                        select televisionObj;
            return query.ToList();
        }
        public List<Television> GetThreeTelevisionDetails()
        {
            var query = (from televisionObj in dataContext.Televisions
                        select televisionObj).Take(3);
            return query.ToList();
        }
        public List<Television> GetOneTelevision(string ID)
        {
            var query = dataContext.Televisions.Where(tv => tv.ProductID == ID);
            return query.ToList();
        }

        public List<Television> FetchTVForComparison(string id1, string id2, string id3, string id4)
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

                var query = dataContext.Televisions.Where(strWhere);
                return query.ToList();
            }
            return null;
        }

        public bool Insert(Television tvObj)
        {
            try
            {
                dataContext.Televisions.Add(tvObj);
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

        public bool Update(Television tvObj)
        {
            try
            {
                var query = (from televisions in dataContext.Televisions
                             where televisions.ProductID == tvObj.ProductID
                             select televisions).First();
                query.ProductID = tvObj.ProductID;
                query.ProductName = tvObj.ProductName;
                query.Price = tvObj.Price;
                query.BrandName = tvObj.BrandName;
                query.Photo = tvObj.Photo;
                query.DisplayType = tvObj.DisplayType;
                query.ScreenSize = tvObj.ScreenSize;
                query.HD = tvObj.HD;
                query.Resolution = tvObj.Resolution;
                query.USB = tvObj.USB;
                query.PowerConsumption = tvObj.PowerConsumption;
                query.NetWeight = tvObj.NetWeight;
                query.CategoryID = tvObj.CategoryID;
                query.SubCategoryID = tvObj.SubCategoryID;

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

        public bool Delete(string pid)
        {
            try
            {
                var query = (from televisions in dataContext.Televisions
                             where televisions.ProductID == pid
                             select televisions).First();
                dataContext.Televisions.Remove(query);
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

        }                                                                                                               //for now HD
        public List<Television> GetFilteredTelevision(string brand, string type ,int price, bool USB, bool HD)
        {
            string strWhere = string.Empty;
            if (brand != "Select Brand")
            {
                strWhere = "BrandName.Equals(\"" + brand + "\")";

            }

            if (type != "Select Display Type")
            {
                if (!string.IsNullOrEmpty(strWhere))
                {
                    strWhere += " And ";

                }
                strWhere += "DisplayType.Equals(\"" + type + "\")";

            }

            if (price != 0)
            {
                if (!string.IsNullOrEmpty(strWhere))
                {
                    strWhere += " And ";

                }
                if (price == 1)
                {
                    strWhere += "Price>=1000 And Price<10000";
                }
                else if (price == 2)
                {
                    strWhere += "Price>=10000 And Price<20000";
                }
                else if (price == 3)
                {
                    strWhere += "Price>=20000 And Price<30000";
                }
                else if (price == 4)
                {
                    strWhere += "Price>=30000";
                }



            }

            if (strWhere != string.Empty)
            {
                var query = dataContext.Televisions.Where(strWhere);
                query = query.Where(t => t.USB == USB);
                query = query.Where(t => t.HD == HD);

                if (query != null)
                {
                    return query.ToList();

                }
                else
                {
                    return GetTelevisionDetails();  //default products..
                }

            }
            return GetTelevisionDetails();
        }
    }
}
