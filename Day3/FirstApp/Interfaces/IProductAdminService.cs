using FirstApp.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FirstApp.Interfaces
{
    public interface IProductAdminService
    {
        Task<Product> AddProduct(Product product);
        Task<Product> UpdateProductPrice(int id, float price);
    }
}
