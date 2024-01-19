using FirstApp.Interfaces;
using FirstApp.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FirstApp.Repository
{
    public class CustomerRepository : IRepository<int, Customer>
    {
        public Customer? Add(Customer item)
        {
            throw new NotImplementedException();
        }

        public Customer? Delete(int key)
        {
            throw new NotImplementedException();
        }

        public Customer? Get(int key)
        {
            throw new NotImplementedException();
        }

        public List<Customer>? GetAll()
        {
            throw new NotImplementedException();
        }

        public Customer? Update(Customer item)
        {
            throw new NotImplementedException();
        }
    }
}
