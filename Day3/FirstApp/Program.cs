using System;
using FirstApp.Models;
using FirstApp.Repository;

namespace FirstApp
{
    internal class Program
    {
      
        static void Main(string[] args)
        {
           ProductRepository repository = new ProductRepository();
            repository.Get(10);
        }
    }
}
