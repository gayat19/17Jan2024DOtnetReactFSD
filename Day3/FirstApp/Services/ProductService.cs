using FirstApp.Exceptions;
using FirstApp.Interfaces;
using FirstApp.Models;
using FirstApp.Repository;
using System;
using System.Collections.Generic;
using System.Diagnostics;
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
            if (product.Quantity < 5)
                throw new LowProductQuantityException();
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

        public async Task<ICollection<Product>> GetAllProducts()
        {
            var result = _productsRepository.GetAll();
            if(result == null || result.Count==0)
            {
                throw new NoProductsAvailableException();
            }
            return result;
        }

        public async Task<Product> GetProductById(int id)
        {
            var result = _productsRepository.Get(id);
            if (result == null)
                throw new InvalidIdException(id);
            return result;
        }

        public async Task<ICollection<Product>> GetProductsWithinRange(float min, float max)
        {
            var result = await GetAllProducts();
            var rangeResult = result.Where(p=>p.Price > min && p.Price < max);
            if (rangeResult == null)
                throw new NoProductsAvailableException();
            return rangeResult.ToList();
        }

        public virtual async Task<Product> UpdateProductPrice(int id, float price)
        {
           var myProduct = await GetProductById(id);
            myProduct.Price = price;
            return _productsRepository.Update(myProduct);
        }

        public async Task<Product> UpdateProductQuantity(int id, int quantity)
        {
            var myProduct = await GetProductById(id);
            if (quantity < 5)
                throw new LowProductQuantityException();
            myProduct.Quantity = quantity;
            return _productsRepository.Update(myProduct);
        }
    }
}
