// 定义一个三角型类，具有3个公开的属性（double）为三角形的3边的长度。使用属性的Set方法，要求该3个值均大于0。提供2公开的方法：
// bool IsTriAngle（）判断这3边能否构成一个三角形；
// double Area（） 求三角形的面积（如果不能构成三角形，返回值为-1）
// 输入三角形的3条边，用空格分隔。如果能构成三角形，直接输出三角形面积；否则输出-1。

// 样例 1：
// 3 4 5
// 6

// 样例2：
// 1 2 3
// -1

using System;
using System.Linq;

namespace test
{
  class TriAngle
  {
    private double[] sides = new double[3];
    public double[] Sides
    {
      // get => sides; set => sides = value; 本地正常oj报错
      get
      {
        return sides;
      }
      set
      {
        sides = value;
      }
    }

    // public bool IsTriAngle() => Sides[0] + Sides[1] > Sides[2] && Sides[0] + Sides[2] > Sides[1] && Sides[1] + Sides[2] > Sides[0]; 本地正常oj报错
    public bool IsTriAngle()
    {
      return Sides[0] + Sides[1] > Sides[2] && Sides[0] + Sides[2] > Sides[1] && Sides[1] + Sides[2] > Sides[0];
    }

    public double Area()
    {
      var s = Sides.Sum() / 2;
      return IsTriAngle() ? Math.Sqrt(s * (s - Sides[0]) * (s - Sides[1]) * (s - Sides[2])) : -1;
    }
  }
  class Program
  {
    static void Main(string[] args)
    {
      var input = Console.ReadLine().Split(' ').Select(x => double.Parse(x)).ToArray();
      var triAngle = new TriAngle();
      triAngle.Sides = input;
      Console.WriteLine(triAngle.Area());
    }
  }
}
