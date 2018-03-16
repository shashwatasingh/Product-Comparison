using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ProductComparisonEntities.Model
{
    [Table("Tablets")]
   public class Tablet:Product
    {
        [MaxLength(40)]
        public string OperatingSystem { get; set; }
        public double ScreenSize { get; set; }
        [MaxLength(40)]
        public string Processor { get; set; }
        [MaxLength(40)]
        public string Display { get; set; }
        [MaxLength(40)]
        public string StandByTime { get; set; }
        public bool TouchScreen { get; set; }
        public bool WiFi { get; set; }
    }
}
