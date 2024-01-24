using FirstApp.Interfaces;
using FirstApp.Models;
using FirstApp.Services;

namespace ShoppingAppTest
{
    public class AdminServiceTest
    {
        IProductAdminService adminService;
        [SetUp]
        public void Setup()
        {
            adminService = new ProductService();
        }

        [Test]
        public async Task AddProductTest()
        {
            //arrange
            Product product = new VirtualProduct()
            {
                Name = "Test",
                Price = 10.4f,
                Quantity = 5,
                Picture = "Test.png",
                Description = "Blah blah blah"
            };
            //action
            var result = await adminService.AddProduct(product);
            //assert
            Assert.AreEqual(100, result.Id);
        }
    }
}