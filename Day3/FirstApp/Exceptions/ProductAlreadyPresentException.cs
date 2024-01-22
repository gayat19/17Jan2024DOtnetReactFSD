using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FirstApp.Exceptions
{
    public class ProductAlreadyPresentException :Exception
    {
        private string _message;
        public ProductAlreadyPresentException()
        {
            _message = "Product already present. Try again.";
        }
        public override string Message => _message;
    }
}
