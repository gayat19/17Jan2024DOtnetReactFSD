using FirstApp.Interfaces;
using FirstApp.Models;
using FirstApp.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FirstApp.Services
{
    public class ProductService : IProductAdminService, IProductUserService
    {
        readonly IRepository<int,Product> _productsRepository;
        public ProductService() 
        {
            _productsRepository = new ProductRepository();
        }
        public async Task<Product> AddProduct(Product product)
        {
            try
            {
                product =  _productsRepository.Add(product);
                return product;
            }
            catch (Exception e)
            {
                throw e; 
            }
        }

        public Task<ICollection<Product>> GetAllProducts()
        {
            throw new NotImplementedException();
        }

        public Task<Product> GetProductById(int id)
        {
            throw new NotImplementedException();
        }

        public Task<ICollection<Product>> GetProductsWithinRange(float min, float max)
        {
            throw new NotImplementedException();
        }

        public Task<Product> UpdateProductPrice(int id, float price)
        {
            throw new NotImplementedException();
        }

        public Task<Product> UpdateProductQuantity(int id, int quantity)
        {
            throw new NotImplementedException();
        }
    }
}
