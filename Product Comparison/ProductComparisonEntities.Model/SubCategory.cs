using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;

namespace ProductComparisonEntities.Model
{
    public class SubCategory
    {
        [Key, MaxLength(30)]
        public string SubCategoryID { get; set; }
        [MaxLength(40)]
        public string SubCategoryName { get; set; }
        [MaxLength(200)]
        public string Description { get; set; }

        public string CategoryID { get; set; }
        public virtual Category Category { get; set; }
    }
}
