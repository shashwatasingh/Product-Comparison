using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ProductComparison.DAL;
using ProductComparisonEntities.Model;
using System.Data.Entity.Infrastructure;
using System.Linq.Dynamic;

namespace Product_Comparison.DAL
{
   public class MusicSystemDAL
    {
       ProductComparisonDataContext datacontext = new ProductComparisonDataContext();
       PCErrorLoggerEntities4 dc = new PCErrorLoggerEntities4();
       public bool Insert(MusicSystem music)
       {
           try
           {
               datacontext.MusicSystems.Add(music);
               int result = datacontext.SaveChanges();
               
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
       public bool Update(MusicSystem musicsystem)
       {
           var query1 = datacontext.MusicSystems.Find(musicsystem.ProductID);
           try
           {
              
                   query1.ProductID = musicsystem.ProductID;
                   query1.ProductName = musicsystem.ProductName;
                   query1.BrandName = musicsystem.BrandName;
                   query1.Price = musicsystem.Price;
                   query1.CategoryID = musicsystem.CategoryID;
                   query1.SubCategoryID = musicsystem.SubCategoryID;
                   query1.DimensionMainUnit = musicsystem.DimensionMainUnit;
                   query1.DimensionFrontSpeaker = musicsystem.DimensionFrontSpeaker;
                   query1.Bluetooth = musicsystem.Bluetooth;
                   query1.Radio = musicsystem.Radio;
                   query1.Recording = musicsystem.Recording;
                   query1.SurroundSound = musicsystem.SurroundSound;
                   query1.USB = musicsystem.USB;
                   query1.NetWeightMainUnit = musicsystem.NetWeightMainUnit;
                   query1.NetWeightWoofer = musicsystem.NetWeightWoofer;
                   query1.PowerConsumption = musicsystem.PowerConsumption;

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
       }
       public bool Delete(string pid)
       {
           try
           {
               var query = (from musicsystem in datacontext.MusicSystems
                            where musicsystem.ProductID == pid
                            select musicsystem).First();
               datacontext.MusicSystems.Remove(query);
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
           catch (DbUpdateException)
           {

              

               throw new Exception("Record not found");
           }
        
       }

       public List<MusicSystem> FetchMusicSystem()
       {
           var query = from musicsys in datacontext.MusicSystems
                       select musicsys;
           return query.ToList();

       }
       public List<MusicSystem> FetchThreeMusicSystem()
       {
           var query = (from musicsys in datacontext.MusicSystems
                       select musicsys).Take(3);
           return query.ToList();

       }
       public List<MusicSystem> GetOneMusicSystem(string ID)
       {
           var query = datacontext.MusicSystems.Where(ms => ms.ProductID == ID);
           return query.ToList();
       }

       public List<MusicSystem> FetchMusicSystemForComparison(string id1, string id2, string id3, string id4)
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

               var ms = datacontext.MusicSystems.Where(strWhere);
               return ms.ToList();
           }
           return null;
       }

                                        //display panel not present
       public List<MusicSystem> GetFilteredMusicSystem(string brand, int price, bool Radio, bool USB)
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
                   strWhere += "Price>=1000 And Price<10000";
               }
               else if (price == 2)
               {
                   strWhere += "Price>=10000 And Price<25000";
               }
               else if (price == 3)
               {
                   strWhere += "Price>=25000";
               }



           }

           if (strWhere != string.Empty)
           {
               var query = datacontext.MusicSystems.Where(strWhere);
               //query = query.Where(t => t.Bluetooth == Bluetooth);
               query = query.Where(t => t.Radio == Radio);
              // query = query.Where(t => t.Recording == Recording);
              // query = query.Where(t => t.SurroundSound == SurroundSound);
               query = query.Where(t => t.USB == USB);



               if (query != null)
               {
                   return query.ToList();

               }
               else
               {
                   return FetchMusicSystem();  //default products..
               }

           }
           return FetchMusicSystem();
       }
    }
}
