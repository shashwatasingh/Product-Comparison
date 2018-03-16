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
    public class CellPhoneDAL
    {
        ProductComparisonDataContext DataContext = new ProductComparisonDataContext();
        PCErrorLoggerEntities4 dc = new PCErrorLoggerEntities4();
        public bool InsertCellPhone(CellPhone cellobj)
        {

            try
            {
                DataContext.CellPhones.Add(cellobj);
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
        public List<CellPhone> GetCellPhone()
        {
            var query = from cp in DataContext.CellPhones
                        select cp;
            return query.ToList();
        }

        public List<CellPhone> GetOneCellPhone(string ID)
        {
            var query = DataContext.CellPhones.Where(c => c.ProductID == ID);
            return query.ToList();
        }

        public List<CellPhone> FetchCellForComparison(string id1, string id2, string id3, string id4)
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

                var query = DataContext.CellPhones.Where(strWhere);
                return query.ToList();
            }
            return null;
        }
       
        public List<CellPhone> GetThreeCellPhone()
        {
            var query = (from cp in DataContext.CellPhones
                        select cp).Take(3);
            return query.ToList();
        }

        public bool UpdateCellPhone(CellPhone cellobj)
        {
            try
            {
                CellPhone oldCell = (from cell in DataContext.CellPhones
                                     where cell.ProductID == cellobj.ProductID
                                     select cell).First();

                oldCell.ProductID = cellobj.ProductID;
                oldCell.ProductName = cellobj.ProductName;
                oldCell.Price = cellobj.Price;
                oldCell.BrandName = cellobj.BrandName;
                oldCell.Photo = cellobj.Photo;
                oldCell.CategoryID = cellobj.CategoryID;
                oldCell.SubCategoryID = cellobj.SubCategoryID;
                oldCell.Display = cellobj.Display;
                oldCell.OperatingSystem = cellobj.OperatingSystem;
                oldCell.Processor = cellobj.Processor;
                oldCell.TouchScreen = cellobj.TouchScreen;
                oldCell.ScreenSize = cellobj.ScreenSize;
                oldCell.StandByTime = cellobj.StandByTime;
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

        public bool DeleteCellPhone(string pID)
        {
            try
            {
                CellPhone cellObj = (from cell in DataContext.CellPhones
                                     where cell.ProductID == pID
                                     select cell).First();
                DataContext.CellPhones.Remove(cellObj);
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
        
        public List<CellPhone> GetFilteredCellPhones(string brand, string processor,string os, int screensize, int price, bool Touch)
        {
            string strWhere = string.Empty;
            if (brand != "Select Brand")
            {
                strWhere = "BrandName.Equals(\"" + brand + "\")";

            }

            if (os != "Select Operating System")
            {
                if (!string.IsNullOrEmpty(strWhere))
                {
                    strWhere += " And ";

                }
                strWhere += "OperatingSystem.Equals(\"" + os + "\")";

            }

            if (processor != "Select Processor")
            {
                if (!string.IsNullOrEmpty(strWhere))
                {
                    strWhere += " And ";

                }
                strWhere += "Processor.Equals(\"" + processor + "\")";

            }

            if (screensize != 0)
            {
                if (!string.IsNullOrEmpty(strWhere))
                {
                    strWhere += " And ";

                }
                if (screensize == 1)
                {
                    strWhere += "ScreenSize=3";
                }
                else if (screensize == 2)
                {
                    strWhere += "ScreenSize=3.5";
                }
                else if (screensize == 3)
                {
                    strWhere += "ScreenSize=4";
                }
                else if (screensize == 4)
                {
                    strWhere += "ScreenSize=4.5";
                }
                else if (screensize == 5)
                {
                    strWhere += "ScreenSize=5";
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
                var query = DataContext.CellPhones.Where(strWhere);
                query = query.Where(t => t.TouchScreen == Touch);
               

                if (query != null)
                {
                    return query.ToList();

                }
                else
                {
                    return GetCellPhone();  //default products..
                }

            }
            return GetCellPhone();
        }
    }
}
