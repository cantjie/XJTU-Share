// 创建一个类，类中有3个公有的方法。
// 这3个方法分别为：求int类型数的绝对值、求float类型的绝对值、求double类型的绝对值。（利用方法的重载实现）
// 在主方法中测验。

using System;
using System.Linq;

namespace test
{
  static class AbsNum
  {
    static public AbsNum(int num)
    {
      return Math.Abs(num)
    }
    static public AbsNum(float num)
    {
      return Math.Abs(num)
    }
    static public AbsNum(double num)
    {
      return Math.Abs(num)
    }
  }
  class Program
  {
    static void Main(string[] args)
    {
      Console.ReadLine("int:{0}, float:{1}, double:{2},", AbsNum(1), AbsNum(1.1F), AbsNum(1.1D));
    }
  }
}
