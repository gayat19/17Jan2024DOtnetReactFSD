using FirstApp.Exceptions;
using FirstApp.Interfaces;
using FirstApp.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FirstApp.Repository
{
    public class ProductRepository : IRepository<int,Product>
    {
        List<Product> products;
        public ProductRepository()
        {
            products = new List<Product>();
        }
        /// <summary>
        /// Returns the Id for the next product that has tobe added
        /// </summary>
        /// <returns>Id as integer</returns>
        int GenerateID()
        {
            if(products.Count == 0)
                return 101;
            int id = products[products.Count - 1].Id;
            return ++id;
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="product"></param>
        /// <returns></returns>
        /// <exception cref="ProductAlreadyPresentException"></exception>
        public Product? Add(Product product)
        {
            product.Id = GenerateID();
            if(products.Contains(product))
            {
                throw new ProductAlreadyPresentException();
            }
            products.Add(product);
            return product;
        }

        public Product? Delete(int id)
        {
           var product = Get(id); 
            if(product != null) 
            { 
                products.Remove(product);
                return product;
            }
            Console.WriteLine("No product with the given id is present tobe removed");
            return null;
        }

        public Product? Get(int id)
        {
            var product = products.SingleOrDefault(p=>p.Id == id);
            return product;
        }

        public List<Product> GetAll()
        {
            if(products.Count == 0)
            {
                Console.WriteLine("No products available at present");
                return null;
            }
            return products;
        }

        public Product? Update(Product product)
        {
            var myproduct = Get(product.Id);
            if (myproduct != null)
            {
                myproduct = mapProduct(product);
                return myproduct;
            }
            Console.WriteLine("No product with the given id is present to be updated");
            return null;
        }

        Product mapProduct(Product product)
        {
            Product myproduct = new Product();
            myproduct.Id = product.Id;
            myproduct.Name = product.Name;
            myproduct.Description = product.Description;
            myproduct.Price = product.Price;
            myproduct.Quantity = product.Quantity;
            myproduct.Picture = product.Picture;
            return myproduct;
        }
    }
}
