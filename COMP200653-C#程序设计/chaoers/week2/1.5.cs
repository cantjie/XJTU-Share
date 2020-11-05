// 从键盘输入字符串（长度不超过8），将其译成密码再输出。规则：将原来的字母替换成其后的第3个字母。如字母a将被替换为d，A将被替换为D,Z将被替换为C（循环替换）。

// 样例
// Love
// Oryh

using System;
using System.Linq;

namespace test {
    class Program {
        static void Main (string[] args) {
            char[] input = Console.ReadLine ().ToCharArray ().Select (x => (char) ((int) x + 3)).ToArray (); // input = {'O', 'r', 'y', 'h'} 
            foreach (char x in input) {
                var i = x;
                if ((int) x - 3 >= (int)
                    'x' && (int) x - 3 <= (int)
                    'z') {
                    i = (char) ((int) x - 26);
                }
                if ((int) x - 3 >= (int)
                    'X' && (int) x - 3 <= (int)
                    'Z') {
                    i = (char) ((int) x - 26);
                }
                Console.Write ("{0}", i);
            }
        }
    }
}