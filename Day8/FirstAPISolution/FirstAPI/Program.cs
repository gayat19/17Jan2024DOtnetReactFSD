using FirstAPI.Contexts;
using FirstAPI.Interfaces;
using FirstAPI.Models;
using FirstAPI.Repositories;
using FirstAPI.Services;
using Microsoft.EntityFrameworkCore;

namespace FirstAPI
{
    public class Program
    {
        public static void Main(string[] args)
        {
            var builder = WebApplication.CreateBuilder(args);

            // Add services to the container.

            builder.Services.AddControllers();
            // Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
            builder.Services.AddEndpointsApiExplorer();
            builder.Services.AddSwaggerGen();

            #region contexts
            builder.Services.AddDbContext<RequestTarkerContext>(opts =>
            {
                opts.UseSqlServer(builder.Configuration.GetConnectionString("requestTrackerConnection"));
            });
            #endregion

            #region RepositoryInjection
            builder.Services.AddScoped<IRepository<int,Employee>,EmployeeRepository>();
            builder.Services.AddScoped<IRepository<int,Request>,RequestRepository>();
            #endregion


            #region ServiceInjection
            builder.Services.AddScoped<IEmployeeUserService, EmployeeService>();
            builder.Services.AddScoped<IEmployeeAdminService, EmployeeService>();
            builder.Services.AddScoped<IRequestEmployeeService, RequestEmployeeService>();
            #endregion


            var app = builder.Build();

            // Configure the HTTP request pipeline.
            if (app.Environment.IsDevelopment())
            {
                app.UseSwagger();
                app.UseSwaggerUI();
            }

            app.UseAuthorization();


            app.MapControllers();

            app.Run();
        }
    }
}
