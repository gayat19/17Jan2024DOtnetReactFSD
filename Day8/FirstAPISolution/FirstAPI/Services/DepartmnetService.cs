using FirstAPI.Interfaces;
using FirstAPI.Models;

namespace FirstAPI.Services
{
    public class DepartmnetService : IDepartmentService
    {
        private readonly IRepository<int, Departmnet> _repository;

        public DepartmnetService(IRepository<int,Departmnet> repository)
        {
            _repository = repository;
        }
        public async Task<List<Departmnet>> GettAllDepartments()
        {
            return await _repository.GetAsync();
        }
    }
}
