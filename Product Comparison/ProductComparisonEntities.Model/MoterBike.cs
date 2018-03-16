using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ProductComparisonEntities.Model
{
    [Table("MotorBikes")]
    public class MoterBike : Product
    {
        public double Mileage { get; set; }
        public double EngineCapacity { get; set; }
        public int NoOfGears { get; set; }
        public bool TubelessTyres { get; set; }
        public double Weight { get; set; }
        public int GroundClearance { get; set; }
    }
}
