// 输入一个字符串s
// 输出 你好-s

// 如：
// 输入：交大
// 输出：你好-交大

using System;

namespace test {
    class Program {
        static void Main (string[] args) {

            var a = Console.ReadLine (); // a = "交大"
            Console.WriteLine ("你好-{0}", a);
        }
    }
}