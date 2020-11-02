// 所谓孪生素数指的是间隔为2 的相邻素数，就像孪生兄弟。最小的孪生素数是(3, 5)，在100 以内的孪生素数还有(3,5), (5,7), (11,13), (17,19), (29,31), (41,43), (59,61), (71,73)，总计有 8 组。现给定一个正整数number，要求编程计算出小于等于number的孪生素数的组数，请根据要求，完成getPrimeTwins方法。
// 注意：
// 一对孪生素数用括号括起来，中间用逗号隔开。
// 不同孪生素数间用“逗号+空格”隔开。
// 所有字符符号均用英文。

// 样例：
// 100
// (3,5), (5,7), (11,13), (17,19), (29,31), (41,43), (59,61), (71,73)

using System;

namespace test {
    class Program {
        static void Main (string[] args) {
            var num = int.Parse (Console.ReadLine ()); // num = 100

            var output = "";

            for (int i = 3; i <= num; i += 2) {
                if (prime (i) && prime (i + 2)) {
                    output += String.Format ("({0},{1}), ", i, i + 2); // output_0 = "(3,5), "
                }
            } // output = "(3,5), (5,7), (11,13), (17,19), (29,31), (41,43), (59,61), (71,73), "

            output = output.Substring (0, output.Length - 2); // output = "(3,5), (5,7), (11,13), (17,19), (29,31), (41,43), (59,61), (71,73)"

            Console.WriteLine (output);
        }

        static bool prime (int num) {
            for (int i = 2; i < Math.Sqrt (num) + 1; i++) {
                if (num % i == 0) {
                    return false;
                }
            }
            return true;
        }
    }
}