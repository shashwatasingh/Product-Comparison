using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using System.ComponentModel.DataAnnotations;

namespace ProductComparisonEntities.Model
{
    public class Suggestion
    {
        [Key,MaxLength(30)]
        public string SuggestionID { get; set; }
       
        public int Hits { get; set; }
        
        public int RatingFeatureCritic { get; set; }
        public int RatingPerformanceCritic { get; set; }
        public int RatingDesignCritic { get; set; }
        
        public int RatingDesignUser { get; set; }
        public int RatingPerformanceUser { get; set; }
        public int RatingFeatureUser { get; set; }

        public string ProductID { get; set; }
        public virtual Product Product { get; set; }

        
    }
}
