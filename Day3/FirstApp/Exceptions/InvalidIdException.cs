using System.Runtime.Serialization;

namespace FirstApp.Exceptions
{
    [Serializable]
    internal class InvalidIdException : Exception
    {
        private string message;
        public InvalidIdException()
        {
            message = "No product with the given ID";
        }

        public InvalidIdException(int id)
        {
            message = "No product with the given ID - "+id;
        }

        public override string Message => message;
    }
}