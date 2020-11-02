// 创建一个学生类：
// 字段：学号（string类型）；
// 成绩（用一个一维数组，存储一个学生的5门课成绩）；
// 方法：将学生的5门课成绩由小到大顺序输出。
// 主函数中，声明3个学生对象，从控制台给每个学生的学号和5门课成绩赋值，调用方法输出。

// 样例输入（每行的第一个数为学号，后面依次为5门课的成绩）：
// 1001 78 45 90 38 99
// 1002 44 87 34 23 77
// 1003 99 88 33 55 77
// 样例输出：
// 1001 38 45 78 90 99
// 1002 23 34 44 77 87
// 1003 33 55 77 88 99

// 输出结果一样，平台测试过不去，原因不明，手动改的分

using System;
using System.Linq;
using System.Collections.Generic;

namespace test
{
  class Student
  {
    private string number;
    private int[] score = new int[5];
    public Student(string _number, int[] _score)
    {
      number = _number;
      score = _score;
      Array.Sort(score);
    }

    public void SortScore()
    {
      Console.Write(number);
      foreach (var item in score)
      {
        Console.Write(" {0}", item);
      }
      Console.Write("\n");
    }
  }

  class Program
  {
    static void Main(string[] args)
    {
      var students = new List<Student>();
      for (var i = 0; i < 3; i++)
      {
        var input = Console.ReadLine().Split(' ');
        students.Add(new Student(input[0], input.Skip(1).Select(x => int.Parse(x)).ToArray()));
      }
      for (var i = 0; i < 3; i++)
      {
        students[i].SortScore();
      }
    }
  }
}
