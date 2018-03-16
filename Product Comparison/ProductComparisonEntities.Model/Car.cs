using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ProductComparisonEntities.Model
{
    [Table("Cars")]
    public class Car : Product
    {
        [MaxLength(20)]
        public string CarType { get; set; }
        public double Mileage { get; set; }
        [MaxLength(20)]
        public string Model { get; set; }
    }
}
