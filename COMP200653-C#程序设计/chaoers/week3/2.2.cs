// 闰年计算。程序输入一个正整数Y，以及另一个正整数N。计算从Y年开始后的第N个闰年是哪一年（如果Y本身是闰年，则Y之后的第一个闰年是Y）。

// 样例：
// 输入：
// 2005 3
// 输出：
// 2016

using System;
using System.Linq;

namespace test {
    class Program {
        static void Main (string[] args) {
            var input = Console.ReadLine ().Split (' ').Select (x => int.Parse (x.Trim ())).ToArray (); // input = {2005, 3}

            var i = 1;
            while (true) {
                // if (DateTime.IsLeapYear(input[0]++))
                if (input[0] % 4 == 0 && input[0] % 100 != 0 || input[0] % 400 == 0) {
                    if (input[1] <= i++) {
                        break;
                    }
                }
                input[0]++;
            } // input = {2016, 3}, i = 4
            Console.WriteLine (input[0]);
        }
    }
}