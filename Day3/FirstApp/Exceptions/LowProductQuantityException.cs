using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FirstApp.Exceptions
{
    public class LowProductQuantityException : Exception
    {
        public override string Message => "Product Quantity should be high";
    }
}
