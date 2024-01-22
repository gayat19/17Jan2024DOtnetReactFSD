using System;
using FirstApp.Exceptions;
using FirstApp.Interfaces;
using FirstApp.Models;
using FirstApp.Repository;
using FirstApp.Services;

namespace FirstApp
{
    internal class Program
    {
        readonly IProductAdminService _productAdminService;
        public Program()
        {
            _productAdminService = new ProductService();
        }
        async static Task Main(string[] args)
        {
            Program program = new Program();
            Product product = new Product()
            {
                Name = "Test",
                Price = 10.4f,
                Quantity = 5,
                Picture = "Test.png",
                Description = "Blah blah blah"
            };
            try
            {
                var result1 = await program._productAdminService.AddProduct(product);
                var result2 = await program._productAdminService.AddProduct(product);
                Console.WriteLine(result1);
            }
            catch (ProductAlreadyPresentException pape)
            {
                Console.WriteLine(pape.Message);
            }

        }
    }
}
