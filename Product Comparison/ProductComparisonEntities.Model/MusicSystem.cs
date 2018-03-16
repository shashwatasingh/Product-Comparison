using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ProductComparisonEntities.Model
{
    [Table("MusicSystems")]
     public class MusicSystem:Product
    {
        [MaxLength(30)]
        public string DimensionMainUnit { get; set; }
        [MaxLength(30)]
        public string DimensionFrontSpeaker { get; set; }
        public bool Bluetooth { get; set; }
        public bool Radio { get; set; }
        public bool USB { get; set; }
        public bool Recording { get; set; }
        public bool SurroundSound { get; set; }
        public double NetWeightMainUnit { get; set; }
        public double NetWeightWoofer { get; set; }
        public double PowerConsumption { get; set; }
    }
}
