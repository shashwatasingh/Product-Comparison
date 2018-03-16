using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ProductComparisonEntities.Model
{
    [Table("Televisions")]
     public class Television:Product
    {
        [MaxLength(15)]
        public string DisplayType { get; set; }
        public double ScreenSize { get; set; }
        public bool HD { get; set; }
        [MaxLength(10)]
        public string Resolution { get; set; }
        public double NetWeight { get; set; }
        public bool USB { get; set; }
        public double PowerConsumption { get; set; }
    }
}
