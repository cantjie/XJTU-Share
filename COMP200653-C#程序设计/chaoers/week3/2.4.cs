// 若三个正整数a,b,c满足 a^2+b^2=c^2，则它们是一组勾股数。
// 编写程序，求给定区间[m,n]中的勾股数的数量(设一组勾股数满足a<b<c)。例如[1,10]中的勾股数有(3,4,5)和(6,8,10)，则[1,10]中勾股数的数量为2.
// 输入：正整数m,n,    m,n>0.
// 输出：[m,n]中的勾股数的数量

// 样例：
// 1 100
// 52

using System;
using System.Linq;

namespace test {
    class Program {
        static void Main (string[] args) {
            var input = Console.ReadLine ().Split (' ').Select (x => int.Parse (x.Trim ())).ToArray (); // input = {1, 100}

            var num = 0;
            for (int i = input[0]; i <= input[1] - 2; i++) {
                for (int j = i + 1; j <= input[1] - 1; j++) {
                    for (int k = j + 1; k <= input[1]; k++) {
                        if (i * i + j * j == k * k) {
                            num++;
                        }
                    }
                }
            } // num = 52

            Console.WriteLine (num);
        }
    }
}