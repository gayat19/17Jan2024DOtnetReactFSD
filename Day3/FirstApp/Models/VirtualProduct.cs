using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FirstApp.Models
{
    public class VirtualProduct : Product
    {
        public string VirtualPlatform { get; set; }
        public VirtualProduct()
        {
            VirtualPlatform = string.Empty;
        }
        public VirtualProduct(int id, string? name, string? description, float price, int quantity, string? picture,string virtualPlatform):base(id,name,description,price,quantity,picture)
        {
            Id = id;
            Name = name ?? "";
            Description = description ?? "";
            Price = price;
            Quantity = quantity;
            Picture = picture ?? "";
        }
        public override string ToString()
        {
            return base.ToString()+ "\nVirtual Platform : \t" + VirtualPlatform; ;
        }
        public override bool Equals(Product? other)
        {
            return this.Name == other.Name && this.VirtualPlatform==((VirtualProduct)other).VirtualPlatform;
        }
    }
}
