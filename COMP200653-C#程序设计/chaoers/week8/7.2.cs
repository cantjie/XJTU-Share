// 本例是一个综合案例，用抽象和多态的方法，根据4类不同员工类型分别进行工资的计算，各类员工工资计算方法如下：

// 1.固定工：每周工资一样，与工作时间长短无关，由SalariedEmployee类实现；

// 2.计时工：按时计酬，超过40小时算加班工资，由HourlyEmplyee类实现；

// 3.雇佣员工：按销售百分比例计算，由CommissionEmployee类实现；

// 4.底薪雇佣员工：在底薪之上增加销售百分比。在本期内，公司准备对底薪雇佣员工升薪10%，由BasePlusCommissionEmployee类实现。

//    用抽象基类Employee表示员工，这个类派生出SalariedEmployee、HourlyEmplyee和CommissionEmployee类，CommissionEmployee类派生出BasePlusCommissionEmployee类。【电子教材第九章例9-3】

//    在Employee类中添加新的字段birthDate表示员工的生日。birthDate的数据类型为DateTime结构体类型（C#自带），假设工资每月处理一次。创建Employee数组，存储不同类型员工对象的引用。可以循环输出每种类型员工的姓名和工资。如果本月是员工的生日，则工资增加100元。请参照课本习题题目描述，本题编译通过即可。

// 注：DateTime dt=new DateTime(2000,12,21)

using System;

namespace test
{
    class Program
    {
        static void Main(string[] args)
        {
            var employees = new Employee[5];
            for (int i = 0; i < 5; i++)
            {
                Console.WriteLine("{0} {1}", employees[i].Name, employees[i].BirthDate.Month == DateTime.Now.Month ? employees[i].Price + 100 : employees[i].Price);
            }
        }
    }

    abstract class Employee
    {
        public string Name { get; set; }
        public string Department { get; set; }
        public DateTime BirthDate { get; set; }
        public Employee(string name, string department, DateTime birthDate)
        {
            Name = name;
            Department = department;
            BirthDate = birthDate;
        }
        public abstract double Price { get; set; }
    }

    class SalariedEmployee : Employee
    {
        public SalariedEmployee(string name, string department, DateTime birthDate) : base(name, department, birthDate){}
        public override double Price { get; set; }
    }

    class HourlyEmplyee : Employee
    {
        public double WorkTime { get; set; }
        public HourlyEmplyee(string name, string department, DateTime birthDate, double workTime) : base(name, department, birthDate) 
        {
            WorkTime = workTime;
        }
        public override double Price { get { return Price; } set { Price = WorkTime >= 40 ? WorkTime + (WorkTime - 40) * 2 : WorkTime; } }
    }
    class CommissionEmployee : Employee
    {
        public double Sales { get; set; }
        public CommissionEmployee(string name, string department, DateTime birthDate, double sales) : base(name, department, birthDate)
        {
            Sales = sales;
        }
        public override double Price { get { return Price; } set { Price = 0.5 * Sales; } }
    }
    class BasePlusCommissionEmployee : CommissionEmployee
    {
        public BasePlusCommissionEmployee(string name, string department, DateTime birthDate, double sales) : base(name, department, birthDate, sales){}
        public override double Price { get { return Price; } set { Price = (0.4 * Sales + 10)*1.1; } }
    }
}

