using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ProductComparison.DAL;
using ProductComparisonEntities.Model;
using System.Data.Entity.Infrastructure;


namespace Product_Comparison.DAL
{
    public class UserOperations
    {
        ProductComparisonDataContext dataContext = new ProductComparisonDataContext();
        PCErrorLoggerEntities4 dc = new PCErrorLoggerEntities4();
        public void InsertUserProfile(UserProfile user)
        {
            try
            {
            dataContext.UserProfiles.Add(user);
           
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

        public void ModifyUserProfile(UserProfile s)
        {
            try
            {
                var x = from us in dataContext.UserProfiles
                        where us.UserID == s.UserID
                        select us;
                UserProfile oldUserProfile = x.First();


                oldUserProfile.UserName = s.UserName;
                oldUserProfile.State = s.State;
                oldUserProfile.Preference3 = s.Preference3;
                oldUserProfile.Preference2 = s.Preference2;
                oldUserProfile.Preference1 = s.Preference1;
                oldUserProfile.Gender = s.Gender;
                oldUserProfile.City = s.City;


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

        public List<UserProfile> FetchAllUserProfiles()
        {
            var q = from us in dataContext.UserProfiles
                    select us;

            return q.ToList();
        }
        public void DeleteUserProfile(string id)
        {
            var x = from us in dataContext.UserProfiles
                    where us.UserID == id
                    select us;
            UserProfile oldUserProfile = x.First();
            dataContext.UserProfiles.Remove(oldUserProfile);
            dataContext.SaveChanges();
        }

        public UserProfile FetchUserProfile(string id)
        {
            var q = (from us in dataContext.UserProfiles
                    where us.UserID==id
                    select us).First();

            return q;
        }

        
       

    }
}
