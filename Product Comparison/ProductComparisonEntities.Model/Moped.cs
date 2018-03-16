using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProductComparisonEntities.Model
{
    [Table("Mopeds")]
    public class Moped : Product
    {
        public double Mileage { get; set; }
        [MaxLength(20)]
        public string BodyType { get; set; }
        public int GroundClearance { get; set; }
        public int FuelTankCapacity { get; set; }
        public bool Gears { get; set; }
        public bool TubelessTyres { get; set; }
        public double Weight { get; set; }
    }
}
