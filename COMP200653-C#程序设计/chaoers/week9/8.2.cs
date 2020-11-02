// 对计算两个整数整除的程序（电子教材第10章10-1的例题）加入异常处理机制。分别捕获除零异常、输入格式不正确异常、其它所有异常。获得前两种异常请重新输入正确数据继续运算。遇到其它异常，抛出异常信息，并不再输入。

using System;

namespace test
{
    class Program
    {
        static void Main(string[] args)
        {
            Division();
        }
        static public void Division()
        {
            try
            {
                int a = int.Parse(Console.ReadLine());
                int b = int.Parse(Console.ReadLine());
                Console.WriteLine(a / b);
            }
            catch (DivideByZeroException)
            {
                Console.WriteLine("零异常,请重新输入");
                Division();
            }
            catch (FormatException)
            {
                Console.WriteLine("输入格式不正确异常,请重新输入");
                Division();
            }
            catch
            {
                Console.WriteLine("error");
            }
        }
    }
}
