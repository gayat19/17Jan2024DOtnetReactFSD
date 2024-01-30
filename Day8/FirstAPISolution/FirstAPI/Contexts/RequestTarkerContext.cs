using FirstAPI.Models;
using Microsoft.EntityFrameworkCore;

namespace FirstAPI.Contexts
{
    public class RequestTarkerContext :DbContext
    {
        public RequestTarkerContext()
        {
            
        }
        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseSqlServer(@"Data source=DESKTOP-1C1EU5R\SQLSERVER2019G3;user id=sa;password=P@ssw0rd;Initial catalog=dbRequestTraker");
        }
        public DbSet<Employee> Employees { get; set; }
        public DbSet<Departmnet> Departments { get; set; }
    }
}
