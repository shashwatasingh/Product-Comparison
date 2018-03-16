using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ProductComparisonEntities.Model
{
    public class UserProfile
    {
        [Key, MaxLength(30)]
        public string UserID { get; set; }
        [MaxLength(30)]
        public string UserName { get; set; }
        //[MaxLength(60), Association("FirstPreference", "Preference1", "ProductID")]
        [ForeignKey("FirstPreference"), Column(Order = 0)]
        public string Preference1 { get; set; }
        [ForeignKey("SecondPreference"), Column(Order = 1)]
        public string Preference2 { get; set; }
        [ForeignKey("ThirdPreference"), Column(Order = 2)]
        public string Preference3 { get; set; }
        [MaxLength(60)]
        public string City { get; set; }
        [MaxLength(60)]
        public string State { get; set; }
        [MaxLength(60)]
        public string Gender { get; set; }
        
        public virtual Product FirstPreference { get; set; }
        public virtual Product SecondPreference { get; set; }
        public virtual Product ThirdPreference { get; set; }
        
        public virtual ICollection<Report> Report { get; set; }
    }
}
