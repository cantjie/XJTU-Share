// 定义一个三角型类，具有3个公开的字段（double）为三角形的3边的长度。提供2公开的方法：
// bool IsTriAngle（）判断这3边能否构成一个三角形；
// double Area（） 求三角形的面积（如果不能构成三角形，返回值为-1）
// 输入三角形的3条边，用空格分隔。如果能构成三角形，直接输出三角形面积；否则输出-1。

// 样例 1：
// 3 4 5
// 6

// 样例2：
// 1 2 3
// -1

using System;
using System.Linq;

namespace test
{   
    class Program
    {

        static void Main(string[] args)
        {
            var input = Console.ReadLine().Split(' ').Select(x => int.Parse(x)).ToArray();
            if(input[0] + input[1] > input[2] && input[0] + input[2] > input[1] && input[1] + input[2] > input[0])
            {
                var s = input.Sum()/2;
                Console.WriteLine(Math.Sqrt(s * (s - input[0]) * (s - input[1]) * (s - input[2])));
            }
            else
            {
                Console.WriteLine(-1);
            }
        }
    }
}
