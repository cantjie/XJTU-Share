// 在一行里输入6个整数，输出最大的一个整数

// 如
// 输入：2 1 3 4 5 6
// 输出：6

using System;
using System.Linq;

namespace test {
    class Program {
        static void Main (string[] args) {
            var input = Console.ReadLine ().Split (' ').Select (x => int.Parse (x)).ToArray (); // input = {2, 1, 3, 4. 5. 6}
            Array.Sort (input); // 升序排列数组 input = {1, 2, 3, 4. 5. 6}
            Console.WriteLine ("{0}", input[input.Length - 1]);
        }
    }
}