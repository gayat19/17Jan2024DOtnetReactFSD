using FirstApp.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FirstApp.Interfaces
{
    public interface IProductUserService
    {
        Task<Product> UpdateProductQuantity(int id, int quantity);
        Task<ICollection<Product>> GetAllProducts();
        Task<Product> GetProductById(int id);
        Task<ICollection<Product>> GetProductsWithinRange(float min, float max);
    }
}
