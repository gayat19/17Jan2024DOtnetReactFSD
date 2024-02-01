using System.Runtime.Serialization;

namespace FirstAPI.Exceptions
{
    [Serializable]
    internal class NoRequestRaisedException : Exception
    {
        public NoRequestRaisedException()
        {
        }

        public NoRequestRaisedException(string? message) : base(message)
        {
        }

        public NoRequestRaisedException(string? message, Exception? innerException) : base(message, innerException)
        {
        }

        protected NoRequestRaisedException(SerializationInfo info, StreamingContext context) : base(info, context)
        {
        }
    }
}