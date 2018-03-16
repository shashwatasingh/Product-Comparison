using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ProductComparisonEntities.Model
{
    [Table("Cameras")]
   public class Camera:Product
    {
        
        [MaxLength(40)]
        public string CameraType { get; set; } //point n shoot,dslr,camcorder
        [MaxLength(40)]
        public string Resolution { get; set; }
        [MaxLength(40)]
        public string ScreenSize { get; set; }
        [MaxLength(40)]
        public string Zoom { get; set; }

    }
}
