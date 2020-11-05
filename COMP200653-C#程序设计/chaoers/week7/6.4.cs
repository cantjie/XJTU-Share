// 雇员与经理。经理是管理公司的一种特殊雇员。经理拥有普通雇员的所有特征，同时还能得到公司发给的特殊津贴。

// 假设雇员类（Employee）包含姓名、工作部门和基本工资三个字段及有三个参数的构造方法以及显示3个字段内容的Show（）方法。

// 经理类（Manager）是雇员类的派生类，新增了特殊津贴字段，以及含有4个参数的构造方法，用覆盖（new）方式写Show()方法，显示4个字段的内容。

using System;

namespace test
{
    class Program
    {
        static void Main(string[] args)
        {
            var employee = new Employee("a", "b", 1000);
            employee.Show();
            var manager = new Manager("a", "b", 1000, 500);
            manager.Show();
        }
    }

    class Employee
    {
        public string Name { get; set; }
        public string Department { get; set; }
        public int Price { get; set; }
        public Employee(string name, string department, int price)
        {
            Name = name;
            Department = department;
            Price = price;
        }
        public void Show()
        {
            Console.WriteLine("{0} {1} {2}", Name, Department, Price);
        }
    }

    class Manager : Employee
    {
        public int Allowance { get; set; }
        public Manager(string name, string department, int price, int allowance) : base(name, department, price)
        {
            Allowance = allowance;
        }
        public new void Show()
        {
            Console.WriteLine("{0} {1} {2} {3}", Name, Department, Price, Allowance);
        }
    }
}
