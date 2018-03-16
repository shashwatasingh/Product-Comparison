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
    public class CameraDAL
    {
        ProductComparisonDataContext DataContext = new ProductComparisonDataContext();
        PCErrorLoggerEntities4 dc = new PCErrorLoggerEntities4();
        public bool InsertCamera(Camera Cameraobj)
        {

            try
            {
                DataContext.Cameras.Add(Cameraobj);
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

        public List<Camera> GetCamera()
        {
            var query = from cam in DataContext.Cameras
                        select cam;
            return query.ToList();
        }

        public List<Camera> GetOneCamera(string ID)
        {
            var query = DataContext.Cameras.Where(c => c.ProductID == ID);
            return query.ToList();
        }

        public List<Camera> GetThreeCamera()
        {
            var query = (from cam in DataContext.Cameras
                        select cam).Take(3);
            return query.ToList();
        }

        public List<Camera> FetchCameraForComparison(string id1, string id2, string id3, string id4)
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

                var query = DataContext.Cameras.Where(strWhere);
                return query.ToList();
            }
            return null;
        }
        public bool UpdateCamera(Camera cameraobj)
        {
            try
            {
                Camera oldcam = (from cam in DataContext.Cameras
                                 where cam.ProductID == cameraobj.ProductID
                                 select cam).First();

                oldcam.ProductID = cameraobj.ProductID;
                oldcam.ProductName = cameraobj.ProductName;
                oldcam.Price = cameraobj.Price;
                oldcam.BrandName = cameraobj.BrandName;
                oldcam.Photo = cameraobj.Photo;
                oldcam.CategoryID = cameraobj.CategoryID;
                oldcam.SubCategoryID = cameraobj.SubCategoryID;
                oldcam.CameraType = cameraobj.CameraType;
                oldcam.Resolution = cameraobj.Resolution;
                oldcam.ScreenSize = cameraobj.ScreenSize;
                oldcam.Zoom = cameraobj.Zoom;
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
        public bool DeleteCamera(string pID)
        {
            try
            {
                Camera oldCam = (from cam in DataContext.Cameras
                                 where cam.ProductID == pID
                                 select cam).First();
                DataContext.Cameras.Remove(oldCam);
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
        public List<Camera> GetFilteredCamera(string brand, string type, int price)
        {
            string strWhere = string.Empty;
            if (brand != "Select Brand")
            {
                strWhere = "BrandName.Equals(\"" + brand + "\")";

            }

            if (type!="Choose Type")
            {
                if (!string.IsNullOrEmpty(strWhere))
                {
                    strWhere += " And ";

                }
                strWhere += "CameraType.Equals(\"" + type + "\")";

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
                var query = DataContext.Cameras.Where(strWhere);
               





                if (query != null)
                {
                    return query.ToList();

                }
                else
                {
                    return GetCamera();  //default products..
                    
                }

            }
            return GetCamera();
        }
    }
}
