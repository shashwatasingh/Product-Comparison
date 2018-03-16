using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ProductComparisonEntities.Model
{
    [Table("AirConditioners")]
    public class AirConditioner : Product
    {
        [MaxLength(30)]
        public string Name { get; set; }
        [MaxLength(20)]
        public string Type { get; set; }
        public bool DisplayPanel { get; set; }
        [MaxLength(20)]
        public string DisplayPanelType { get; set; }
        [MaxLength(20)]
        public string Capacity { get; set; }
        [MaxLength(10)]
        public string Dimensions { get; set; }
        public double NetWeight { get; set; }
        public double PowerConsumption { get; set; }
        [MaxLength(10)]
        public string PowerSupply { get; set; }
    }

}
