using FirstAPI.Contexts;
using FirstAPI.Interfaces;
using FirstAPI.Models;
using FirstAPI.Repositories;
using FirstAPI.Services;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
using Moq;

namespace RequestTraterTest
{
    public class ReuestEmployeeTest
    {
        RequestTarkerContext context;
        [SetUp]
        public void Setup()
        {
            var options = new DbContextOptionsBuilder<RequestTarkerContext>().UseInMemoryDatabase("dummyDatabase").Options;
            context = new RequestTarkerContext(options);
        }

        [Test]
        public async Task CanAddRequest()
        {
            //Arrange
            var mockRequestRepoLogger = new Mock<ILogger<RequestRepository>>();
            var mockRequestServiceLogger = new Mock<ILogger<RequestEmployeeService>>();

            IRepository<int,Employee> employeeRepo = new EmployeeRepository(context);
            IRepository<int,Request> requestRepo = new RequestRepository(context, mockRequestRepoLogger.Object);
            IRequestEmployeeService employeeService = new RequestEmployeeService(requestRepo, employeeRepo, mockRequestServiceLogger.Object);
            //Action
            var request = await employeeService.CreateRequest(new Request
            {
                RequestText="Laptop Issue - Not Booting",
                RequestType = "System Issue",
                Issuer_Id = 101,

            });
            //Assert
            Assert.AreEqual(1,request.Id);
        }
    }
}