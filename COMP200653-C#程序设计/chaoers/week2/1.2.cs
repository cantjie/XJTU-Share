// 从键盘分别输入两个不为0的整数，分别输出这两个整数的和 差 积 商
// 注意商只保留整数位

// 如
// 输入：2 3
// 输出：5 -1 6 0

using System;
using System.Linq;

namespace test {
    class Program {
        static void Main (string[] args) {
            var input = Console.ReadLine ().Split (' ').Select (x => int.Parse (x)).ToArray (); // input = {2, 3}
            Console.WriteLine ("{0} {1} {2} {3}", input[0] + input[1], input[0] - input[1], input[0] * input[1], input[0] / input[1]);
        }
    }
}