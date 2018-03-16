using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
namespace ProductComparisonEntities.Model
{
    public class Report
    {        
        [Key,MaxLength(30)]
        public string ReportID { get; set; }
        
        [MaxLength(200)]
        public string FilePath { get; set; }


        public DateTime DateOfCreation { get; set; }

        [MaxLength(30)]
        public string UserID { get; set; }
        public virtual UserProfile UserProfile { get; set; }


    }
}
