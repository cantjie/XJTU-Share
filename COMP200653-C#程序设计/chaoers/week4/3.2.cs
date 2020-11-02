// 创建一个Date类，要求能输入以下格式的日期：
// 第一种：MM/YYYY 构造函数接收2个整数
// 第二种：June,1992 构造函数接收一个字符串和一个整数
// 当用户输入其出生年月时，能够计算出用户的年龄（向下取整）。当用户输入的日期无意义或未来时间，输出invalid。

// 样例1：
// 01/2000
// 20岁

// 样例2：
// 13/2000
// invalid

// 样例3：
// June,2020
// Invalid

using System;

namespace test
{   
    class Program
    {
        static void Main(string[] args)
        {
            var input = Console.ReadLine();
            try
            {
                var age = Convert.ToDateTime(input);
                if (age > DateTime.Now)
                {
                    throw new System.ArgumentException("future time");
                }
                Console.WriteLine("{0}岁", (int)((DateTime.Now - age).Days / 365));
            }
            catch
            {
                Console.WriteLine("invalid");
            }
        }
    }
}
