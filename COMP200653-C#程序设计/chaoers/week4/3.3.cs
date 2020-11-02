// 定义并实现一个公民类Citizen，该类包括的特征信息有：身份证号Id、姓名Name、性别Gender、年龄Age、籍贯Birthplace、家庭住址Familyaddress等字段以及构造方法、输出公民出生年月信息方法Print，要求能够对该类对象进行初始化、输出操作。

// 样例如下：
// 610110199802242154 zhangsan m 20 shannxi xian
// 1998年02月24日

using System;

namespace test
{   
    class Program
    {
        static void Main(string[] args)
        {
            var input = Console.ReadLine().Split(' ');
            Console.WriteLine("{0}年{1}月{2}日", input[0].Substring(6, 4), input[0].Substring(10, 2), input[0].Substring(12, 2));
        }
    }
}
