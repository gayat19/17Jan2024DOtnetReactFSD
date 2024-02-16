using FirstAPI.Models;

namespace FirstAPI.Interfaces
{
    public interface IDepartmentService
    {
        public Task<List<Departmnet>> GettAllDepartments();
    }
}
