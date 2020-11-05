// 某城市最高的楼只有一部电梯。该电梯和一般电梯不同的是它依照输入楼层数的先后次序运行。电梯最初在0层。运行完一个输入序列后就停止在该楼层，不返回0层。编写程序计算电梯运行一个序列的时间。每次都假设电梯在0层开始，无论上一次运行到几层。电梯每上1层需要6秒。每下1层需要4秒。如在某层停留，无论上下人多少，均停留5秒。
// 输入：楼层的值大于等于1，小于100 ,N=0表示结束输入。
// 输出：计算每个序列电梯运行的时间。

// 输入：
// 2 1 0
// 输出：
// 26

using System;
using System.Linq;

namespace test {
    class Program {
        static void Main (string[] args) {
            var input = Console.ReadLine ().Split (' ').Select (x => int.Parse (x.Trim ())).ToArray (); // input = {2, 1, 0}

            var time = input[0] * 6 + 5; // time = 17
            for (int i = 1; i < input.Length - 1; i++) {
                time += (input[i] - input[i - 1] > 0 ? (input[i] - input[i - 1]) * 6 : (input[i - 1] - input[i]) * 4) + 5; // time_1 = 26
            } // time = 26

            Console.WriteLine (time);
        }
    }
}