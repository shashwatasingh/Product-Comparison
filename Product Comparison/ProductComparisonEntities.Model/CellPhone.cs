using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ProductComparisonEntities.Model
{
    [Table("CellPhones")]
    public class CellPhone : Product
    {
        [MaxLength(40)]
        public string Display { get; set; }
        [MaxLength(40)]
        public string OperatingSystem { get; set; }
        [MaxLength(40)]
        public string Processor { get; set; }
        public bool TouchScreen { get; set; }
        public double ScreenSize { get; set; }
        public double StandByTime { get; set; }

    }
}
