using System.ComponentModel.DataAnnotations;
using System.Text.Json.Serialization;

namespace FirstAPI.Models
{
    public class Departmnet
    {
        [Key]
        public int DeparmentNumber { get; set; }
        public string Name { get; set; }
        //[JsonIgnore]
       public ICollection<Employee>? Employees { get; set; }
    }
}
