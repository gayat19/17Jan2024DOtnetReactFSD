using FirstAPI.Models.DTOs;


namespace FirstAPI.Interfaces
{
    public interface IUserService
    {
        public Task<LoginUserDTO> Login(LoginUserDTO user);
        public Task<LoginUserDTO> Register(RegisterUserDTO user);
    }
}
