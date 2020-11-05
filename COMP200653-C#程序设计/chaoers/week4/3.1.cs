// 运动时，可以利用心率监测仪来查看心率是否处于安全范围内。其中最高心率=220-年龄；目标心率是最高心率的50%-85%；创建一个名称为HeartRates的类。这个类的的字段应该包含人的名字、出生年份和当前年份。类中还包含一个计算并返回年龄（以整年计算）的属性；一个计算并返回最高心率分方法；以及2个分别计算最低和最高目标心率的方法；编写程序，实例化HeartRates类，输入个人信息姓名，出生年月日（空格分隔）。并输出对象的信息，包括姓名，出生年份；年龄；最高心率，最低目标心率，最高目标心率（空格分隔）。

// 样例
// 张一 2000/01/01
// 张一 2000年 20岁 最高心率202 最低目标心率101 最高目标心率171

using System;

namespace test
{
    class HeartRates
    {
        public string name;
        public DateTime birthday;
        public int age;
        public HeartRates(string _name, string _bir)
        {
            name = _name;
            birthday = Convert.ToDateTime(_bir);
            age = (int) ((DateTime.Now - birthday).Days)/365;
        }
        public int maxRate()
        {
            return 220 - age + 1;
        }
        public int maxTarget()
        {
            return (int) (0.85 * maxRate());
        }
        public int minTarget()
        {
            return (int) (0.5 * maxRate());
        }
    }

    class Program
    {
        static void Main(string[] args)
        {
            var input = Console.ReadLine().Split(' ');
            var man = new HeartRates(input[0], input[1]);
            Console.WriteLine("{0} {1}年 {2}岁 最高心率{3} 最低目标心率{4} 最高目标心率{5}", man.name, man.birthday.Year, man.age, man.maxRate(), man.minTarget(), man.maxTarget());
        }
    }
}
