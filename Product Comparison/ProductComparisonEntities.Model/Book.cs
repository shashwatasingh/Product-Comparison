using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ProductComparisonEntities.Model
{
    [Table("Books")]
    public class Book : Product
    {
        [MaxLength(30)]
        public string Genre { get; set; }
        [MaxLength(30)]
        public string Author { get; set; }
        [MaxLength(30)]
        public string BindingType { get; set; }
        [MaxLength(30)]
        public string Publication { get; set; }
        [MaxLength(04)]
        public string PublicationYear { get; set; }
        [MaxLength(10)]
        public string Edition { get; set; }

    }
}
