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
    public class TabletDAL
    {
        ProductComparisonDataContext DataContext = new ProductComparisonDataContext();
        PCErrorLoggerEntities4 dc = new PCErrorLoggerEntities4();
        public bool InsertTablet(Tablet Tabletobj)
        {

            try
            {
                DataContext.Tablets.Add(Tabletobj);
                int result = DataContext.SaveChanges();

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

        public List<Tablet> GetTablet()
        {
            var query = from tab in DataContext.Tablets
                        select tab;
            return query.ToList();
        }

        public List<Tablet> GetOneTablet(string ID)
        {
            var query = DataContext.Tablets.Where(c => c.ProductID == ID);
            return query.ToList();
        }

        public List<Tablet> GetThreeTablet()
        {
            var query = (from tab in DataContext.Tablets
                        select tab).Take(3);
            return query.ToList();
        }

        public bool UpdateTablet(Tablet Tabletobj)
        {
            try
            {
                Tablet oldTab = (from tab in DataContext.Tablets
                                 where tab.ProductID == Tabletobj.ProductID
                                 select tab).First();

                oldTab.ProductID = Tabletobj.ProductID;
                oldTab.ProductName = Tabletobj.ProductName;
                oldTab.Price = Tabletobj.Price;
                oldTab.BrandName = Tabletobj.BrandName;
                oldTab.Photo = Tabletobj.Photo;
                oldTab.CategoryID = Tabletobj.CategoryID;
                oldTab.SubCategoryID = Tabletobj.SubCategoryID;
                oldTab.Display = Tabletobj.Display;
                oldTab.OperatingSystem = Tabletobj.OperatingSystem;
                oldTab.Processor = Tabletobj.Processor;
                oldTab.TouchScreen = Tabletobj.TouchScreen;
                oldTab.ScreenSize = Tabletobj.ScreenSize;
                oldTab.StandByTime = Tabletobj.StandByTime;
                oldTab.WiFi = Tabletobj.WiFi;
                int result = DataContext.SaveChanges();
                
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

        public List<Tablet> FetchTabletForComparison(string id1, string id2, string id3, string id4)
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

                var query = DataContext.Tablets.Where(strWhere);
                return query.ToList();
            }
            return null;
        }
        public bool DeleteTablet(string pID) 
        {
            try
            {
                Tablet oldTab = (from tab in DataContext.Tablets
                                 where tab.ProductID == pID
                                 select tab).First();
                DataContext.Tablets.Remove(oldTab);
                int result = DataContext.SaveChanges();
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
                throw new DbUpdateException("Enter proper Primary key");
            }
        }
        public List<Tablet> GetFilteredTablet(string brand, string os, bool wifi, int screensize, int price)
        {
            string strWhere = string.Empty;
            if (brand != "Select Brand")
            {
                strWhere = "BrandName.Equals(\"" + brand + "\")";

            }

            if (os != "Select OS")
            {
                if (!string.IsNullOrEmpty(strWhere))
                {
                    strWhere += " And ";

                }
                strWhere += "OperatingSystem.Equals(\"" + os + "\")";

            }

            if (screensize != 0)
            {
                if (!string.IsNullOrEmpty(strWhere))
                {
                    strWhere += " And ";

                }
                if (screensize == 1)
                {
                    strWhere += "ScreenSize=7";
                }
                else if (screensize == 2)
                {
                    strWhere += "ScreenSize=9";
                }
                else if (screensize == 3)
                {
                    strWhere += "ScreenSize=10";
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
                var query = DataContext.Tablets.Where(strWhere);
                query = query.Where(t => t.WiFi == wifi);





                if (query != null)
                {
                    return query.ToList();

                }
                else
                {
                    return GetTablet();  //default products..
                }

            }
            return GetTablet();
        }
    }
}
