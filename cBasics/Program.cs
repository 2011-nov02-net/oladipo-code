using System;

namespace cBasics
{
    class Program
    {
        static void Main(string[] args)
        {
            // ask for input from user
            Console.WriteLine("Please input a multi-word term:");
            //convert input into capital letters and save as a variable
            string input = Console.ReadLine().ToUpper();
            //convert input vairable into an array of strings
            string[] words = input.Split(' ');//e.g words = ["CENTRAL", "PROCESSING","UNIT"]
            //for each word in the array, write out the first letter concatinated
          foreach (var word in words)
        {
          Console.Write($"{word[0]}");
        }
        
        }
    }
}
