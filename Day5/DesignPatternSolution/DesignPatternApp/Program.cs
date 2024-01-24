namespace DesignPatternApp
{
    internal class Program
    {
        static void Main(string[] args)
        {
            //SingletonSample ss1 = SingletonSample.GetInstance();
            //ss1.Name = "Test";
            //SingletonSample ss2 = SingletonSample.GetInstance();
            //Console.WriteLine(ss2.Name);
            IExampleBuilder example = new BuilderExample();
            Example obj = example.BuildConnection("New Connectioon");
            Console.WriteLine(obj.Connection);
        }
    }
}
