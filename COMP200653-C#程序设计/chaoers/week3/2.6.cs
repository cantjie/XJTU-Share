// 程序通过用户输入一个字符串（长度不超过30），由A、B、C、D、E五个字母组成，例如：ACBEEBBAD。用户再输入一个字符，只能是A、B、C、D、E其中之一，然后再输入一个要插入的位置。程序会将这个字符插入到字符串的指定位置前（第一个字符位置为0，第二个字符位置为1，依此类推），然后消除连续出现的三个相同的字符，直到没有连续三个相同的字符为止。

// 样例：
// 输入格式：
// ACBEEBBAD
// E 3(注：中间空格隔开)
// 输出格式：
// ACAD
// 注释：（1）以上示例表示：在位置3插入E后，结果是：ACBEEEBBAD，消除连续的三个E，结果是：ACBBBAD再次消除连续三个B，结果是：ACAD。

using System;
using System.Linq;
using System.Text.RegularExpressions;

namespace test {
    class Program {
        static void Main (string[] args) {
            var str = Console.ReadLine (); // str = "ACBEEBBAD"
            var ins = Console.ReadLine ().Split (' ').ToArray (); // ins = {"E", "3"}

            str = str.Insert (int.Parse (ins[1]) + 1, ins[0]); // str = "ACBEEEBBAD"
            // int i = 0;
            // int k = 0;
            // char j = str[0];
            // str = "ACBEEEBBADD";
            // i:     0123456789
            // j:      ACBE E BA
            // k:        012010
            // str.Remove(i - 2, 3);

            string regExp = @"(\w)\1{2}";
            while (true) {
                MatchCollection matchList = Regex.Matches (str, regExp); // matchList_0 = {{"EEE"}}, matchList_1 = {{"BBB"}}
                if (matchList.Count == 0) {
                    break;
                }
                foreach (Match match in matchList) {
                    str = Regex.Replace (str, match.ToString (), ""); // str_0 = "ACBBBAD", str_1 = "ACAD"
                }
            } // str = "ACAD"

            Console.WriteLine (str);
        }
    }
}