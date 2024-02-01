using FirstAPI.Models;
using Microsoft.EntityFrameworkCore;

namespace FirstAPI.Contexts
{
    public class RequestTarkerContext :DbContext
    {
        public RequestTarkerContext(DbContextOptions options):base(options)
        {
            
        }

        public DbSet<Employee> Employees { get; set; }
        public DbSet<Departmnet> Departments { get; set; }
        public DbSet<Request> Requests { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Request>()
                .HasKey(r => r.Id);

            modelBuilder.Entity<Request>()
                .HasOne(r => r.Issuer)
                .WithMany(r=>r.RaisedRequests)
                .HasForeignKey(r => r.Issuer_Id)
                .IsRequired();


            modelBuilder.Entity<Request>()
                .HasOne(r => r.Resolver)
                .WithMany(r => r.ResolvedRequests)
                .HasForeignKey(r => r.Resolver_Id);

            //Seeding data for testing purpose
            modelBuilder.Entity<Departmnet>().HasData(
                new Departmnet { DeparmentNumber=1,Name="IT"},
                new Departmnet { DeparmentNumber = 2, Name = "Admin" }
                );
            modelBuilder.Entity<Employee>().HasData(
                new Employee
                {
                    Id=101,
                    Name="Ramu",
                    DateOfBirth=new DateTime(),
                    Phone="9988776655",
                    Email="ramu@gmail.com",
                    Pic="./ramu.jpg",
                    DepartmentId=1
                }
                );
                

        }
    }
}
