using FirstAPI.Contexts;
using FirstAPI.Interfaces;
using FirstAPI.Models;
using FirstAPI.Repositories;
using FirstAPI.Services;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;
using Microsoft.OpenApi.Models;
using System.Text;
using System.Text.Json.Serialization;

namespace FirstAPI
{
    public class Program
    {
        public static void Main(string[] args)
        {
            var builder = WebApplication.CreateBuilder(args);

            // Add services to the container.

            builder.Services.AddControllers().AddJsonOptions(opts =>
            {
                opts.JsonSerializerOptions.ReferenceHandler = ReferenceHandler.IgnoreCycles;
                opts.JsonSerializerOptions.WriteIndented = true;
            });
            // Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
            builder.Services.AddEndpointsApiExplorer();
            builder.Services.AddSwaggerGen(opt =>
                {
                    opt.SwaggerDoc("v1", new OpenApiInfo { Title = "MyAPI", Version = "v1" });
                    opt.AddSecurityDefinition("Bearer", new OpenApiSecurityScheme
                    {
                        In = ParameterLocation.Header,
                        Description = "Please enter token",
                        Name = "Authorization",
                        Type = SecuritySchemeType.Http,
                        BearerFormat = "JWT",
                        Scheme = "bearer"
                    });

                    opt.AddSecurityRequirement(new OpenApiSecurityRequirement
                    {
                        {
                            new OpenApiSecurityScheme
                            {
                                Reference = new OpenApiReference
                                {
                                    Type=ReferenceType.SecurityScheme,
                                    Id="Bearer"
                                }
                            },
                            new string[]{}
                        }
                    });
                });
            builder.Services.AddAuthentication(JwtBearerDefaults.AuthenticationScheme)
                .AddJwtBearer(options =>
                {
                    options.TokenValidationParameters = new TokenValidationParameters
                    {
                        ValidateIssuerSigningKey = true,
                        IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(builder.Configuration["SecretKey"])),
                        ValidateIssuer = false,
                        ValidateAudience = false
                    };
                });

            builder.Services.AddCors(options =>
            {
                options.AddPolicy("ReactPolicy", opts =>
                {
                    opts.WithOrigins("http://localhost:3000","null").AllowAnyMethod().AllowAnyHeader();
                });
            });

            #region contexts
            builder.Services.AddDbContext<RequestTarkerContext>(opts =>
            {
                opts.UseSqlServer(builder.Configuration.GetConnectionString("requestTrackerConnection"));
            });
            #endregion

            #region RepositoryInjection
            builder.Services.AddScoped<IRepository<int,Employee>,EmployeeRepository>();
            builder.Services.AddScoped<IRepository<int,Request>,RequestRepository>();
            builder.Services.AddScoped<IRepository<string, User>, UserRepository>();
            builder.Services.AddScoped<IRepository<int, Departmnet>, DepartmentRepository>();
            #endregion


            #region ServiceInjection
            builder.Services.AddScoped<IEmployeeUserService, EmployeeService>();
            builder.Services.AddScoped<IEmployeeAdminService, EmployeeService>();
            builder.Services.AddScoped<IRequestEmployeeService, RequestEmployeeService>();
            builder.Services.AddScoped<IUserService,USerService >();
            builder.Services.AddScoped<ITokenService,TokenService>();
            builder.Services.AddScoped<IDepartmentService, DepartmnetService>();
            #endregion


            var app = builder.Build();

            // Configure the HTTP request pipeline.
            if (app.Environment.IsDevelopment())
            {
                app.UseSwagger();
                app.UseSwaggerUI();
            }

            app.UseCors("ReactPolicy");

            app.UseAuthentication();
            app.UseAuthorization();


            app.MapControllers();

            app.Run();
        }
    }
}
