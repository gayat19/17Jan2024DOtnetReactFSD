using FirstAPI.Models;

namespace FirstAPI.Interfaces
{
    public interface IRequestEmployeeService
    {
        public Task<Request> CreateRequest(Request request);
        public Task<IList<Request>> GetAllResuestByEmployee(int employeeId);
        public Task<Request> GetRequestStatus(int id);
        public Task<Request> DeleteRequest(int id);
    }
}
