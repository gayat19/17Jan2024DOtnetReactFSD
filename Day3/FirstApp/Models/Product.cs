using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FirstApp.Models
{
    public class Product :IEquatable<Product>
    {
        string? picture;

        /// <summary>
        /// Default constructor
        /// </summary>
        public Product()
        {
            Name = string.Empty;
            Picture = string.Empty;
            Description = string.Empty;
        }
        /// <summary>
        /// Parameterized constructor to build the object
        /// </summary>
        /// <param name="id">Product ID in int</param>
        /// <param name="name">Product name as string</param>
        /// <param name="description">Product descrption as string</param>
        /// <param name="price">Price as float</param>
        /// <param name="quantity">Product Available quantity as integer</param>
        /// <param name="picture">Product image name with extension as string</param>
        public Product(int id, string? name, string? description, float price, int quantity, string? picture)
        {
            Id = id;
            Name = name ??"";
            Description = description??"";
            Price = price;
            Quantity = quantity;
            Picture = picture ?? "";
        }


        public int Id { get; set; }
        public string? Name { get; set; }
        public string? Description { get; set; }
        public float Price { get; set; }
        public int Quantity { get; set; }
        public string? Picture { get => picture; set => picture = "./images/" + value; }

        /// <summary>
        /// Returns the Product details like ID, Name, Price, Quantity and others
        /// </summary>
        /// <returns>String that is formatted for printing the product details</returns>
        public override string ToString()
        {
            return "Product Id : \t" + Id +
                "\nProduct Name : \t" + Name +
                "\nProduct Price : \t$" + Price +
                "\nProduct Description : \t" + Description +
                "\nQuantity in hand : \t" + Quantity +
                "\nImage Path : \t" + Picture;
        }

        public virtual bool Equals(Product? other)
        {
            return this.Name == other.Name;
        }
    }
}
