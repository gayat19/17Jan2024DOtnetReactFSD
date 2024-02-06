using FirstAPI.Exceptions;
using FirstAPI.Interfaces;
using FirstAPI.Mappers;
using FirstAPI.Models;
using FirstAPI.Models.DTOs;
using System.Security.Cryptography;
using System.Text;

namespace FirstAPI.Services
{
    public class USerService : IUserService
    {
        private readonly IRepository<int, Employee> _employeeRepository;
        private readonly IRepository<string, User> _userRepository;
        private readonly ILogger<USerService> _logger;

        public USerService(IRepository<int,Employee> employeeRepository,
                            IRepository<string,User> userRepository,
                            ILogger<USerService> logger)
        {
            _employeeRepository = employeeRepository;
            _userRepository = userRepository;
            _logger = logger;

        }

        public async Task<LoginUserDTO> Login(LoginUserDTO user)
        {
            var myUSer = await _userRepository.GetAsync(user.Username);
            if (myUSer == null)
            {
                throw new InvlidUuserException();
            }
            var userPassword = GetPasswordEncrypted(user.Password,myUSer.Key);
            var checkPasswordMatch = ComparePasswords(myUSer.Password,userPassword);
            if(checkPasswordMatch)
            {
                user.Password = "";
                user.Role= myUSer.Role;
                return user;
            }
            throw new InvlidUuserException();
        }

        private bool ComparePasswords(byte[] password, byte[] userPassword)
        {
            for (int i = 0; i < password.Length; i++)
            {
                if (password[i] != userPassword[i])
                    return false;
            }
            return true;
        }

        private byte[] GetPasswordEncrypted(string password, byte[] key)
        {
            HMACSHA512 hmac = new HMACSHA512(key);
            var userpassword = hmac.ComputeHash(Encoding.UTF8.GetBytes(password));
            return userpassword;
        }

        public async Task<LoginUserDTO> Register(RegisterUserDTO user)
        {
            User myuser = new RegisterToUser(user).GetUser();
            myuser = await _userRepository.Add(myuser);
            Employee employee = new RegisterToEmployee(user).GetEmployee();
            employee = await _employeeRepository.Add(employee);
            LoginUserDTO result = new LoginUserDTO
            {
                Username = myuser.Username,
                Role = myuser.Role,
            };
            return result;

        }
    }
}
