// 利用一维数组求解问题。读入若干（1-15个）整数（一行输入，空格分隔），每个数在10-100之间的整数包括10和100。在读入每个数时，确认这个数的有效性（在10到100之间），并且若它和之前读入的数不一样，就把它存储到数组中，无效的数不存储。读完所有数之后，仅显示用户输入的不同的数值。

// 样例1：
// 输入:
// -9 -9 0 34 99 99 99 34 34 34
// 输出
// 34 99

using System;
using System.Linq;

namespace test
{
  class Program
  {
    static void Main(string[] args)
    {
      var input = Console.ReadLine().Split(' ').ToArray().Distinct().Select(x => int.Parse(x)).Where(x => x >= 10 && x <= 100).ToArray();
      var str = "";
      foreach (var item in input)
      {
        str += String.Format("{0} ", item);
      }
      Console.WriteLine(str.Substring(0, str.Length - 1));
    }
  }
}
