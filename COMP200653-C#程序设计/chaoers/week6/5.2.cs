// 定义一个时间类：成员有3个属性（包括对应的私有字段）:年、月、日。属性要判断年>0,12>=月份>0,日期：>0并要在所在月份天数之内。一个构造方法，在构造方法中给属性赋值。在主类中program中,定义一个方法，方法的两个参数就是时间类的对象，方法的作用是，比较第一个参数（时间）和第二个参数（时间）的早晚，如果第一个时间早，返回1，相等返回0，小于返回-1.在主函数main（）中调用该方法。

// 测试用例1：
// 2008/12/5 2019/12/31
// 1
// 测试用例2：
// 2019/12/5 2018/12/31
// -1

using System;
using System.Linq;

namespace test
{
  class Program
  {
    static void Main(string[] args)
    {
      var input = Console.ReadLine().Split(' ').Select(x => Convert.ToDateTime(x)).ToArray();
      Console.WriteLine("{0}", input[0]==input[1] ? 0 : input[0]<input[1]? 1 : -1);
    }
  }
}
