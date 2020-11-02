// 定义一个字母类，自己设计类中的字段和方法。方法要求：判断类中字段的值是大写字母还是小写字母。若是大写字母，方法返回该字母对应的小写字母；若小写，返回大写字母。若不是字母，返回“Error”。
// 要求：在main函数中，由用户输入一个字母，然后，声明一个字母类的对象，通过构造方法将用户输入的字母给对象中的字段赋值，然后调用对象中的方法，将用户输入的字母进行大小写转换。

// 样例1：
// A
// a

// 样例2：
// 1
// Error

using System;

namespace test
{
    class Program
    {
        static void Main(string[] args)
        {
            var input = Console.ReadLine().;
            if (Char.IsLetter(input[0]))
            {
                if (Char.IsUpper(input[0]))
                {
                    Console.WriteLine(Char.ToLower(input[0]));
                }
                else
                {
                    Console.WriteLine(Char.ToUpper(input[0]));
                }
            }
            else
            {
                Console.WriteLine("Error");
            }
        }
    }
}
