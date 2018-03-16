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
    public class AirConditionerDAL
    {
        ProductComparisonDataContext DataContext = new ProductComparisonDataContext();
        PCErrorLoggerEntities4 dc = new PCErrorLoggerEntities4();
        public bool InsertAirConditioner(AirConditioner ACobj) 
        {

            try
            {
                DataContext.AirConditioners.Add(ACobj);
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
        
        public List<AirConditioner> GetAirConditioner()
        {
            var query = from ac in DataContext.AirConditioners
                        select ac;
            return query.ToList();
        }

        public List<AirConditioner> GetOneAirConditioner(string ID)
        {
            var query = DataContext.AirConditioners.Where(c => c.ProductID == ID);
            return query.ToList();
        }

        public List<AirConditioner> GetThreeAirConditioner()
        {
            var query = (from ac in DataContext.AirConditioners
                        select ac).Take(3);
            return query.ToList();
        }

        public List<AirConditioner> FetchACForComparison(string id1, string id2, string id3, string id4)
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

                var query = DataContext.AirConditioners.Where(strWhere);
                return query.ToList();
            }
            return null;
        }


        public bool UpdateAirConditioner(AirConditioner acObj)
        {
            try
            {
                AirConditioner oldac = (from ac in DataContext.AirConditioners
                                        where ac.ProductID == acObj.ProductID
                                        select ac).First();

                oldac.ProductID = acObj.ProductID;
                oldac.ProductName = acObj.ProductName;
                oldac.Price = acObj.Price;
                oldac.BrandName = acObj.BrandName;
                oldac.Photo = acObj.Photo;
                oldac.CategoryID = acObj.CategoryID;
                oldac.SubCategoryID = acObj.SubCategoryID;
                oldac.Name = acObj.Name;
                oldac.Type = acObj.Type;
                oldac.DisplayPanelType = acObj.DisplayPanelType;
                oldac.Capacity = acObj.Capacity;
                oldac.Dimensions = acObj.Dimensions;
                oldac.PowerConsumption = acObj.PowerConsumption;
                oldac.PowerSupply = acObj.PowerSupply;
                oldac.DisplayPanel = acObj.DisplayPanel;
                oldac.NetWeight = acObj.NetWeight;
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
        public bool DeleteAirConditioner(string pID)
        {
            try
            {
                AirConditioner oldAC = (from ac in DataContext.AirConditioners
                                        where ac.ProductID == pID
                                        select ac).First();
                DataContext.AirConditioners.Remove(oldAC);
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

        public List<AirConditioner> GetFilteredAirConditioner(string brand, bool DisplayPanel, int price)
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
                    strWhere += "Price>=5000 And Price<10000";
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
                var query = DataContext.AirConditioners.Where(strWhere);
                query = query.Where(t => t.DisplayPanel == DisplayPanel);





                if (query != null)
                {
                    return query.ToList();

                }
                else
                {
                    return GetAirConditioner();  //default products..
                }

            }
            return GetAirConditioner();
        }
    }

}
