using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;

namespace ProductComparisonEntities.Model
{
   public class Product
    {
        [Key, MaxLength(30)]
        public string ProductID { get; set; }
        [MaxLength(40)]
        public string ProductName { get; set; }
        public double Price { get; set; }
        [MaxLength(40)]
        public string BrandName { get; set; }
        [MaxLength(100)]
        public string Photo { get; set; }

        public string CategoryID { get; set; }
        public string SubCategoryID { get; set; }
        public virtual SubCategory SubCategory { get; set; }
        public virtual Category Category { get; set; }
    }
}
