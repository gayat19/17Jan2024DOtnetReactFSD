using FirstApp.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FirstApp.Interfaces
{
    public interface IRepository<K,T>
    {
        T? Add(T item);
        T? Get(K key);
        List<T>? GetAll();
        T? Update(T item);
        T? Delete(K key);
       
    }
}
