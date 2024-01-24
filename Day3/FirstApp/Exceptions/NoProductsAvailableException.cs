using System.Runtime.Serialization;

namespace FirstApp.Exceptions
{
    [Serializable]
    internal class NoProductsAvailableException : Exception
    {
        string _message;
        public NoProductsAvailableException()
        {
            _message = "NO products availabe";
        }

        public override string Message => _message;
    }
}