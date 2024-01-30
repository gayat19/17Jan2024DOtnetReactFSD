using FirstApp.Interfaces;
using FirstApp.Models;
using FirstApp.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ShoppingAppTest
{
    public class UserProductServiceTest
    {
        IProductUserService userService;
        IProductAdminService adminService;
        [SetUp]
        public async Task Setup()
        {
            ProductService productService = new ProductService();
            adminService = productService;
            userService = productService;
            Product product = new VirtualProduct()
            {
                Name = "Test",
                Price = 10.4f,
                Quantity = 5,
                Picture = "Test.png",
                Description = "Blah blah blah"
            };
            //action
           await adminService.AddProduct(product);

        }

        [Test]
        public async Task UpdateProductQuantityTest()
        {
            //Action
            var result = await userService.UpdateProductQuantity(101, 6);
            //Assert
            Assert.AreEqual(6, result.Quantity);
        }
    }
}
