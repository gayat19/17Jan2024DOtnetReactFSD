using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DesignPatternApp
{
    public interface IExampleBuilder 
    {
        public Example BuildName(string name);
        public Example BuildConnection(string connectionString);
    }
}
