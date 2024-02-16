using FirstAPI.Contexts;
using FirstAPI.Interfaces;
using FirstAPI.Models;

namespace FirstAPI.Repositories
{
    public class DepartmentRepository : IRepository<int, Departmnet>
    {
        private readonly RequestTarkerContext _context;

        public DepartmentRepository(RequestTarkerContext context)
        {
            _context = context;
        }
        public Task<Departmnet> Add(Departmnet item)
        {
            throw new NotImplementedException();
        }

        public Task<Departmnet> Delete(int key)
        {
            throw new NotImplementedException();
        }

        public Task<Departmnet> GetAsync(int key)
        {
            throw new NotImplementedException();
        }

        public async Task<List<Departmnet>> GetAsync()
        {
            var departments = _context.Departments.ToList();
            return departments;
        }

        public Task<Departmnet> Update(Departmnet item)
        {
            throw new NotImplementedException();
        }
    }
}
