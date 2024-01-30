using FirstApp.Exceptions;
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
        [TestCase(100)]
        [TestCase(101)]
        [TestCase(102)]
        public async Task AddProductTest(int id)
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
            Assert.AreEqual(id, result.Id);
        }

        [Test]
        [TestCase(3)]
        [TestCase(4)]
        [TestCase(5)]
        public async Task AddProductExceptionTest(int qty)
        {
            //arrange
            Product product = new VirtualProduct()
            {
                Name = "Test",
                Price = 10.4f,
                Quantity = qty,
                Picture = "Test.png",
                Description = "Blah blah blah"
            };
            //action
            //var result = await adminService.AddProduct(product);
            //assert
            Assert.ThrowsAsync<LowProductQuantityException>(async ()=>await adminService.AddProduct(product));
        }
        [Test]
        [TestCase(3,12.3f)]

        public async Task UpdateProductPriceTest(int id,float price)
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
            product = await adminService.AddProduct(product);
            //action
            var result = await adminService.UpdateProductPrice(product.Id, 12.3f);
            //assert
            Assert.AreEqual(price, result.Price);
        }
    }
}