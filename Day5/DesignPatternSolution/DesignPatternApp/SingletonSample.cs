using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DesignPatternApp
{
    public class SingletonSample
    {
        static SingletonSample instance;
        public string Name { get; set; }
        private SingletonSample() 
        { 
            
        }
        public static SingletonSample GetInstance()
        {
            if( instance == null)
            {
                instance = new SingletonSample();
            }
            return instance;
        }
    }
}
