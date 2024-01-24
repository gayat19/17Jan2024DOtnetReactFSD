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
        readonly IProductUserService _productUserService;
        public Program()
        {
            ProductService productService = new ProductService();
            _productAdminService = productService;
            _productUserService = productService;
        }
        async static Task Main(string[] args)
        {
            Program program = new Program();
            Product product = new VirtualProduct()
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

                if (result1 != null)
                    Console.WriteLine("Pouct Added");
                else
                    Console.WriteLine("Something went worng");
            }
            catch (ProductAlreadyPresentException pape)
            {
                Console.WriteLine(pape.Message);
            }
            try
            {
                var result = await program._productUserService.GetAllProducts();
                foreach (var item in result)
                {
                    Console.WriteLine(item);
                }
            }
            catch (NoProductsAvailableException npae)
            {
                Console.WriteLine(npae.Message);
            }

        }
    }
}
