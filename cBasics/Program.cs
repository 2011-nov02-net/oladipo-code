using System;

namespace cBasics
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Please input a multi-word term:");
            string input = Console.ReadLine().ToUpper();
            string[] words = input.Split(' ');
            //words = ["central", "processing","unit"]
          foreach (var word in words)
        {
          Console.Write($"{word[0]}");
        }
        
        }
    }
}
