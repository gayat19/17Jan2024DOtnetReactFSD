using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DesignPatternApp
{
    public class BuilderExample : IExampleBuilder
    {
        private  Example Example { get; set; }
        public BuilderExample()
        {
            Example = new Example();
        }
        public Example BuildConnection(string connectionString)
        {
            Example.Connection = connectionString;
            return Example;
        }

        public Example BuildName(string name)
        {
            Example.Name = name;
            return Example;
        }
    }
}
