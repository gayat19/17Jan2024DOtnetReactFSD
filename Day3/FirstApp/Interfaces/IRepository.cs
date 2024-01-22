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
        /// <summary>
        /// Adds the given product object to the collection, if the product is not already present
        /// </summary>
        /// <param name="product">Object to be addes to the products collection</param>
        /// <returns>The product object that is added/Null if the product is duplicated</returns>
        /// <exception cref="ProductAlreadyPresentException"></exception>
        T? Add(T item);
        T? Get(K key);
        List<T>? GetAll();
        T? Update(T item);
        T? Delete(K key);
       
    }
}
