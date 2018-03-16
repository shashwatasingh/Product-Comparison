using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ProductComparison.DAL;
using ProductComparisonEntities.Model;

namespace Product_Comparison.DAL
{
    public class CategoryOperations
    {
        ProductComparisonDataContext dataContext = new ProductComparisonDataContext();

        public bool InsertCategory(Category c)
        {
            dataContext.Categories.Add(c);

            if (dataContext.SaveChanges()>0)
            {
                return true;
            }
            else
            {
                return false;
            }

        }
    }
}
