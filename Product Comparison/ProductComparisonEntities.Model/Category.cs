using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;

namespace ProductComparisonEntities.Model
{
    public class Category
    {
        [Key,MaxLength(30)]
        public string CategoryID { get; set; }
        [MaxLength(40)]
        public string CategoryName { get; set; }
        [MaxLength(100)]
        public string Description { get; set; }
        public virtual ICollection<SubCategory> SubCategory { get; set; }
    }
}
