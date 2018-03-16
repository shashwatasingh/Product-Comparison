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
    public class SuggestionOperations
    {

        ProductComparisonDataContext dataContext = new ProductComparisonDataContext();
        PCErrorLoggerEntities4 dc = new PCErrorLoggerEntities4();

        public void InsertSuggestion(Suggestion s)
        {
            try
            {
            dataContext.Suggestions.Add(s);

            
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

        public void ModifySuggestion(Suggestion s)
        {
            try
            {
                var x = from sug in dataContext.Suggestions
                        where sug.SuggestionID == s.SuggestionID
                        select sug;
                Suggestion oldSuggestion = x.First();


                oldSuggestion.RatingDesignCritic = s.RatingDesignCritic;
                oldSuggestion.RatingDesignUser = s.RatingDesignUser;
                oldSuggestion.RatingFeatureCritic = s.RatingFeatureUser;
                oldSuggestion.RatingPerformanceCritic = s.RatingPerformanceCritic;
                oldSuggestion.RatingPerformanceUser = s.RatingPerformanceUser;
                oldSuggestion.ProductID = s.ProductID;
                oldSuggestion.RatingFeatureUser = s.RatingFeatureUser;


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

        public List<Suggestion> FetchAllSuggestions()
        {
            var q = from sug in dataContext.Suggestions
                    select sug;

            return q.ToList();
        }
        public void DeleteSuggestion(string id)
        {
            var x = from sug in dataContext.Suggestions
                    where sug.SuggestionID == id
                    select sug;
            Suggestion oldSuggestion = x.First();
            dataContext.Suggestions.Remove(oldSuggestion);
            dataContext.SaveChanges();
        }

        public Suggestion GetProductSuggestion(string id)
        {
            var query = (from sug in dataContext.Suggestions
                         where sug.ProductID == id
                         select sug).First();
            return query;
        }
      
    }
}
